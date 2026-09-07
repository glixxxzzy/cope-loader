"use strict";
const express = require("express");
const path = require("path");
const fs = require("fs");
const crypto = require("crypto");

const protect = require("./lib/protect");
const kv = require("./lib/kv");
const { buildLoader, buildHttpGate, buildLoadstring } = require("./lib/loader");

const CONFIG_PATH = path.join(__dirname, "config.json");
const SCRIPT_PATH = process.env.SCRIPT_PATH || path.join(__dirname, "scripts", "main.luau");

const config = (() => {
	try {
		return JSON.parse(fs.readFileSync(CONFIG_PATH, "utf8"));
	} catch {
		return {};
	}
})();

const REDEEM_LIMIT_PER_MIN = Number(
	process.env.REDEEM_RATE_LIMIT || config.redeemRateLimit || 10
);
const ADMIN_SESSION_SECONDS = Number(process.env.ADMIN_SESSION_SECONDS || 30 * 24 * 60 * 60);

// --------------------------------------------------------------------------
// Script payload cache (re-reads on mtime change when the file changes on disk)
// --------------------------------------------------------------------------
let scriptCache = { bytes: Buffer.alloc(0), mtime: 0 };
function getScriptBytes() {
	try {
		const st = fs.statSync(SCRIPT_PATH);
		if (st.mtimeMs !== scriptCache.mtime) {
			scriptCache = { bytes: fs.readFileSync(SCRIPT_PATH), mtime: st.mtimeMs };
		}
	} catch {
		scriptCache = { bytes: Buffer.alloc(0), mtime: 0 };
	}
	return scriptCache.bytes;
}

function sha256(text) {
	return crypto.createHash("sha256").update(text, "utf8").digest("hex");
}

async function isValidAdmin(pw) {
	let stored = await kv.getAdminHash();
	if (!stored && process.env.ADMIN_PASSWORD) {
		stored = sha256(process.env.ADMIN_PASSWORD);
		await kv.setAdminHash(stored);
	}
	if (!stored) return false;
	const incoming = sha256(pw || "");
	const a = Buffer.from(incoming, "hex");
	const b = Buffer.from(stored, "hex");
	return a.length === b.length && crypto.timingSafeEqual(a, b);
}

async function isAdmin(req) {
	const sid = req.cookies && req.cookies.sid;
	if (!sid) return false;
	return kv.sessionValid(sid);
}

function cookieParser(req, _res, next) {
	const raw = req.headers.cookie || "";
	const out = {};
	for (const part of raw.split(";")) {
		const idx = part.indexOf("=");
		if (idx > -1)
			out[part.slice(0, idx).trim()] = decodeURIComponent(part.slice(idx + 1).trim());
	}
	req.cookies = out;
	next();
}

function asIso(ts) {
	return ts ? new Date(ts).toISOString() : null;
}

// Wrap async handlers so rejections become 500s instead of hanging the request.
function h(fn) {
	return (req, res) => {
		Promise.resolve(fn(req, res)).catch((err) => {
			console.error("[loader] handler error:", err && err.message);
			if (!res.headersSent) res.status(500).json({ error: "internal error" });
			else res.end();
		});
	};
}

// --------------------------------------------------------------------------
const app = express();
app.disable("x-powered-by");
app.use(express.json({ limit: "2mb" }));
app.use(cookieParser);

app.use((req, res, next) => {
	res.setHeader("X-Content-Type-Options", "nosniff");
	res.setHeader("Referrer-Policy", "no-referrer");
	next();
});

// ---- Public (used only by the loader snippet inside the executor) ---------
// Redeem a key: server validates it and returns the packed payload + seed.
app.post(
	"/api/redeem",
	h(async (req, res) => {
		const ip = req.headers["x-forwarded-for"] || req.ip || req.socket.remoteAddress || "0";
		if (!(await kv.redeemAllowed(ip, REDEEM_LIMIT_PER_MIN))) {
			return res.status(429).json({ ok: false, error: "Too many attempts - slow down." });
		}
		const { key } = req.body || {};
		if (!key || typeof key !== "string" || key.length > 64) {
			return res.status(400).json({ ok: false, error: "Invalid request." });
		}
		const k = key.trim();
		const row = await kv.findByKey(k);
		if (!row || row.revoked) {
			return res.status(404).json({ ok: false, error: "Invalid or revoked key." });
		}
		if (row.expires) {
			const expMs = new Date(row.expires).getTime();
			if (Number.isFinite(expMs) && Date.now() > expMs) {
				return res.status(403).json({ ok: false, error: "This key has expired." });
			}
		}
		await kv.bumpUse(k);

		const bytes = getScriptBytes();
		if (bytes.length === 0) {
			return res
				.status(500)
				.json({ ok: false, error: "No protected script uploaded yet (scripts/main.luau missing)." });
		}

		const seed = protect.seedFromToken(protect.randomToken());
		const packed = protect.pack(bytes.toString("utf8"), seed);
		res.json({
			ok: true,
			blob: protect.blobToString(packed),
			seed,
			size: bytes.length,
		});
	})
);

// The one-liner endpoint the seller's buyers loadstring. Everything it
// returns is a packed, self-decoding chunk of CSV bytes - browsing the URL
// never reveals readable source. With no key it returns the packed key-gate
// bootstrap (which collects the key in-game); with a valid key it returns the
// packed payload chunk. Error responses are erroring chunks so loadstring
// still compiles and the buyer sees an actual message instead of silence.
function scriptStatusChunk(msg) {
	return (
		"-- CopE Loader: " + msg +
		"\nerror(\"CopE Loader: " + String(msg).replace(/"/g, "") + "\")"
	);
}

function packChunk(source) {
	const seed = protect.seedFromToken(protect.randomToken());
	const packed = protect.pack(source, seed);
	return buildLoadstring(protect.blobToString(packed), seed);
}

app.get(
	"/api/script",
	h(async (req, res) => {
		res.setHeader("Cache-Control", "no-store");

		const ip = req.headers["x-forwarded-for"] || req.ip || req.socket.remoteAddress || "0";
		if (!(await kv.redeemAllowed(ip, REDEEM_LIMIT_PER_MIN))) {
			return res
				.status(429)
				.type("text/plain")
				.send(scriptStatusChunk("too many requests - slow down"));
		}

		const key = typeof req.query.key === "string" ? req.query.key.trim() : "";
		if (!key) {
			return res
				.status(200)
				.type("application/octet-stream")
				.set("Content-Disposition", 'attachment; filename="c.dat"')
				.send(packChunk(buildHttpGate(getBaseUrl(req))));
		}

		if (key.length > 64) {
			return res.status(400).type("text/plain").send(scriptStatusChunk("invalid request"));
		}
		const row = await kv.findByKey(key);
		if (!row || row.revoked) {
			return res.status(403).type("text/plain").send(scriptStatusChunk("invalid or revoked key"));
		}
		if (row.expires) {
			const expMs = new Date(row.expires).getTime();
			if (Number.isFinite(expMs) && Date.now() > expMs) {
				return res
					.status(403)
					.type("text/plain")
					.send(scriptStatusChunk("this key has expired"));
			}
		}
		await kv.bumpUse(key);

		const bytes = getScriptBytes();
		if (bytes.length === 0) {
			return res
				.status(500)
				.type("text/plain")
				.send(scriptStatusChunk("no script uploaded yet"));
		}
		res
			.status(200)
			.type("application/octet-stream")
			.set("Content-Disposition", 'attachment; filename="lib.dat"')
			.send(packChunk(bytes.toString("utf8")));
	})
);

// ---- Admin auth -----------------------------------------------------------
app.post(
	"/api/admin/login",
	h(async (req, res) => {
		const { password, remember } = req.body || {};
		if (!(await isValidAdmin(password))) {
			return res.status(401).json({ ok: false, error: "Wrong password" });
		}
		const sid = kv.randomId(24);
		const ttl = remember ? ADMIN_SESSION_SECONDS : 8 * 60 * 60;
		await kv.sessionCreate(sid, ttl);
		const isHttps = String(req.headers["x-forwarded-proto"] || "").split(",")[0].trim() === "https";
		res.cookie("sid", sid, {
			httpOnly: true,
			secure: isHttps,
			sameSite: "lax",
			path: "/",
			maxAge: ttl * 1000,
		});
		res.json({ ok: true });
	})
);

app.post(
	"/api/admin/logout",
	h(async (req, res) => {
		const sid = req.cookies && req.cookies.sid;
		if (sid) await kv.sessionDestroy(sid);
		res.clearCookie("sid", { path: "/", httpOnly: true, secure: true, sameSite: "lax" });
		res.json({ ok: true });
	})
);

function requireAdmin(req, res, next) {
	isAdmin(req).then(
		(ok) => (ok ? next() : res.status(401).json({ ok: false, error: "Not signed in" })),
		(next)
	);
}

// ---- Admin: key management -------------------------------------------------
app.get("/api/admin/keys", requireAdmin, h(async (_req, res) => {
	res.json({ keys: await kv.listKeys() });
}));

app.post("/api/admin/keys", requireAdmin, h(async (req, res) => {
	let { count, note, expiresIn } = req.body || {};
	count = Math.min(Math.max(parseInt(count, 10) || 1, 1), 100);
	note = String(note || "").slice(0, 120);
	let expires = null;
	if (expiresIn && typeof expiresIn === "string") {
		const match = /^(\d+)([dhw])$/.exec(expiresIn);
		if (match) {
			const mult = match[2] === "h" ? 3600e3 : match[2] === "d" ? 86400e3 : 6048e5;
			expires = asIso(Date.now() + parseInt(match[1], 10) * mult);
		}
	}
	const created = asIso(Date.now());
	const createdKeys = [];
	for (let i = 0; i < count; i++) {
		let k = "";
		do {
			k = protect.generateKey();
		} while (await kv.findByKey(k));
		await kv.insertKey(k, note, created, expires);
		createdKeys.push({ key: k, note, expires });
	}
	res.json({ ok: true, keys: createdKeys });
}));

app.post("/api/admin/keys/:id/revoke", requireAdmin, h(async (req, res) => {
	const row = await kv.findByKey(req.params.id);
	if (!row) return res.status(404).json({ ok: false, error: "not found" });
	const target = !row.revoked;
	await kv.setRevoked(req.params.id, target);
	res.json({ ok: true, revoked: target });
}));

app.delete("/api/admin/keys/:id", requireAdmin, h(async (req, res) => {
	await kv.deleteKey(req.params.id);
	res.json({ ok: true });
}));

// Resolve the public base URL once, the same way for every loader build.
function getBaseUrl(req) {
	return (
		process.env.PUBLIC_BASE_URL ||
		config.publicBaseUrl ||
		`${req.protocol}://${req.get("host")}`
	).replace(/\/$/, "");
}

// Build the single-loader snippet for one key - the seller sends THIS to the
// buyer instead of any website link. The key is baked in: it validates and
// runs silently.
app.get("/api/admin/keys/:id/loader", requireAdmin, h(async (req, res) => {
	const row = await kv.findByKey(req.params.id);
	if (!row) return res.status(404).json({ ok: false, error: "not found" });
	res.json({
		ok: true,
		loader: buildLoader(getBaseUrl(req), row.key),
		baseUrl: getBaseUrl(req),
	});
}));

// Generic loader - no baked key. Running it opens the key-entry page styled
// like the hub; the buyer's key is collected in-game and validated on the
// server before the payload is fetched.
app.get("/api/admin/loader/generic", requireAdmin, h(async (_req, res) => {
	res.json({
		ok: true,
		loader: buildLoader(getBaseUrl(_req)),
		baseUrl: getBaseUrl(_req),
		keyed: false,
	});
}));

// Generic one-liner - no baked key. The buyer runs it, the key page appears
// in-game, and on submit it fetches /api/script?key=... itself.
app.get("/api/admin/oneline", requireAdmin, h(async (req, res) => {
	const base = getBaseUrl(req);
	res.json({ ok: true, line: `loadstring(game:HttpGet("${base}/api/script"))()`, baseUrl: base });
}));

// Per-key one-liner - the key rides in the URL, so running it unlocks and runs
// silently.
app.get("/api/admin/keys/:id/oneline", requireAdmin, h(async (req, res) => {
	const row = await kv.findByKey(req.params.id);
	if (!row) return res.status(404).json({ ok: false, error: "not found" });
	const base = getBaseUrl(req);
	res.json({
		ok: true,
		line: `loadstring(game:HttpGet("${base}/api/script?key=${row.key}"))()`,
		baseUrl: base,
		keyed: true,
	});
}));

// Convert a Luau script into a self-contained loadstring. The script is packed
// with the same Park-Miller + XOR cipher and the packed bytes ride inside the
// snippet, so the output needs no server and no key.
app.post("/api/admin/convert", requireAdmin, h(async (req, res) => {
	const { script, file } = req.body || {};
	const src = file ? getScriptBytes().toString("utf8") : String(script || "");
	if (!src.trim()) {
		return res.status(400).json({ ok: false, error: "Nothing to convert - paste a script first." });
	}
	if (Buffer.byteLength(src, "utf8") > 600 * 1024) {
		return res.status(400).json({ ok: false, error: "Script too large (max 600 KB)." });
	}
	if (src.includes("\0")) {
		return res.status(400).json({ ok: false, error: "Script contains null bytes." });
	}
	const seed = protect.seedFromToken(protect.randomToken());
	const packed = protect.pack(src, seed);
	const csv = protect.blobToString(packed);
	res.json({
		ok: true,
		snippet: buildLoadstring(csv, seed),
		seed,
		size: src.length,
		blobChars: csv.length,
	});
}));

app.get("/api/admin/stats", requireAdmin, h(async (_req, res) => {
	const list = await kv.listKeys();
	res.json({
		total: list.length,
		active: list.filter((r) => !r.revoked).length,
		uses: list.reduce((s, r) => s + (Number(r.uses) || 0), 0),
		payloadBytes: getScriptBytes().length,
	});
}));

// ---- Admin first-run password setup ----------------------------------------
app.get("/api/admin/setup", h(async (_req, res) => {
	res.json({ needed: !(await kv.getAdminHash()) });
}));

app.post("/api/admin/setup", h(async (req, res) => {
	if (await kv.getAdminHash()) return res.status(400).json({ ok: false, error: "already set" });
	const { password } = req.body || {};
	if (!password || String(password).length < 8) {
		return res.status(400).json({ ok: false, error: "Password must be at least 8 characters" });
	}
	await kv.setAdminHash(sha256(String(password)));
	res.json({ ok: true });
}));

// ---- Health ----------------------------------------------------------------
app.get("/api/status", h(async (_req, res) => {
	res.json({ ok: true, name: "CopE Loader", adminNeeded: !(await kv.getAdminHash()), persistent: kv.isPersistent() });
}));

// ---- Homepage: admin only (this site has no public buyer page) -------------
app.get("/", (_req, res) => res.redirect("/admin"));
app.get("/admin", (_req, res) => res.sendFile(path.join(__dirname, "public", "admin.html")));

// ---- Static ----------------------------------------------------------------
app.use(express.static(path.join(__dirname, "public")));

// 404
app.use((_req, res) => res.status(404).json({ error: "not found" }));

module.exports = app;