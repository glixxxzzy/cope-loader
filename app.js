"use strict";
const express = require("express");
const path = require("path");
const fs = require("fs");
const crypto = require("crypto");

const protect = require("./lib/protect");
const kv = require("./lib/kv");
const clyde = require("./lib/clyde");
const { buildLoader, buildHttpGate, buildLoadstring, buildPartsBootstrap } = require("./lib/loader");
const obfuscate = require("./lib/obfuscate");

const CONFIG_PATH = path.join(__dirname, "config.json");

const config = (() => {
	try {
		return JSON.parse(fs.readFileSync(CONFIG_PATH, "utf8"));
	} catch {
		return {};
	}
})();

function resolveScriptPath() {
	const override = process.env.SCRIPT_PATH;
	if (override) return override;
	const base = path.join(__dirname, "scripts");
	const obf = path.join(base, "main.obf.luau");
	if (config.obfuscatePayload !== false && fs.existsSync(obf)) return obf;
	return path.join(base, "main.luau");
}

const PART_COUNT = Math.min(Math.max(Number(process.env.PART_COUNT || config.parts || 4), 2), 8);
const PART_TTL_SECONDS = Number(process.env.PART_TTL_SECONDS || config.partTtlSeconds || 120);

const REDEEM_LIMIT_PER_MIN = Number(
	process.env.REDEEM_RATE_LIMIT || config.redeemRateLimit || 10
);
const ADMIN_SESSION_SECONDS = Number(process.env.ADMIN_SESSION_SECONDS || 30 * 24 * 60 * 60);

// ---- GitHub OAuth (the only admin login) ------------------------------------
// Admin access is granted by signing in with GitHub. An account is allowed only
// when its login appears in GITHUB_ALLOWED_USERS (or its numeric id in
// GITHUB_ALLOWED_IDS). Everyone else is rejected, no password involved.
const GH_AUTHORIZE_BASE = String(process.env.GITHUB_AUTHORIZE_BASE || "https://github.com").replace(/\/+$/, "");
const GH_TOKEN_BASE = String(process.env.GITHUB_TOKEN_BASE || "https://github.com").replace(/\/+$/, "");
const GH_API_BASE = String(process.env.GITHUB_API_BASE || "https://api.github.com").replace(/\/+$/, "");
const GH_CLIENT_ID = process.env.GITHUB_CLIENT_ID || "";
const GH_CLIENT_SECRET = process.env.GITHUB_CLIENT_SECRET || "";

function authConfigured() {
	return !!(GH_CLIENT_ID && GH_CLIENT_SECRET && (process.env.GITHUB_ALLOWED_USERS || process.env.GITHUB_ALLOWED_IDS));
}

function ghCallbackUrl(req) {
	if (process.env.PUBLIC_BASE_URL) {
		return process.env.PUBLIC_BASE_URL.replace(/\/+$/, "") + "/auth/github/callback";
	}
	const proto = String(req.headers["x-forwarded-proto"] || "").split(",")[0].trim() || (req.secure ? "https" : "http");
	return proto + "://" + (req.headers.host || "localhost") + "/auth/github/callback";
}

function ghAllowedUser(user) {
	if (!user || !user.login) return false;
	const logins = String(process.env.GITHUB_ALLOWED_USERS || "")
		.split(",")
		.map((s) => s.trim().toLowerCase())
		.filter(Boolean);
	const ids = String(process.env.GITHUB_ALLOWED_IDS || "")
		.split(",")
		.map((s) => s.trim())
		.filter(Boolean);
	return (
		logins.includes(String(user.login).toLowerCase()) ||
		(ids.length > 0 && ids.includes(String(user.id)))
	);
}

async function ghExchangeCode(code, redirectUri) {
	const r = await fetch(GH_TOKEN_BASE + "/login/oauth/access_token", {
		method: "POST",
		headers: { "Content-Type": "application/json", Accept: "application/json" },
		body: JSON.stringify({
			client_id: GH_CLIENT_ID,
			client_secret: GH_CLIENT_SECRET,
			code,
			redirect_uri: redirectUri,
		}),
	});
	if (!r.ok) return null;
	const d = await r.json();
	return d.access_token || null;
}

async function ghFetchUser(token) {
	const r = await fetch(GH_API_BASE + "/user", {
		headers: {
			Authorization: "Bearer " + token,
			Accept: "application/vnd.github+json",
			"User-Agent": "cope-loader",
		},
	});
	if (!r.ok) return null;
	return r.json();
}

function secureMode(req) {
	return String(req.headers["x-forwarded-proto"] || "").split(",")[0].trim() === "https" || req.secure;
}

function attachCookie(res, req, name, value, maxAgeSeconds) {
	res.cookie(name, value, {
		httpOnly: true,
		secure: secureMode(req),
		sameSite: "strict",
		path: "/",
		maxAge: maxAgeSeconds * 1000,
	});
}

function ghMessagePage(kind, title, body) {
	const accent = kind === "ok" ? "#188038" : kind === "deny" ? "#d93025" : "#1a73e8";
	return `<!doctype html>
<html lang="en">
<head><meta charset="utf-8"/><meta name="viewport" content="width=device-width,initial-scale=1"/><title>${title}</title></head>
<body style="margin:0;min-height:100vh;background:#fff;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:0 24px;text-align:center;color:#3c4043;font-family:Arial,Helvetica,sans-serif">
<div style="width:56px;height:6px;border-radius:3px;background:${accent};margin-bottom:24px"></div>
<h1 style="font-size:22px;font-weight:400;color:#202124;margin:0 0 12px">${title}</h1>
<p style="font-size:15px;color:#5f6368;margin:0;line-height:1.7">${body}</p>
<p style="margin-top:30px"><a href="/copehubontop-mavi" style="color:#1a73e8;text-decoration:none;font-size:14px">Back to sign in</a></p>
</body>
</html>`;
}

// --------------------------------------------------------------------------
// Script payload cache. The served path re-resolves on every read so the admin
// "Update script" flow (writes scripts/main.luau, regenerates/removes
// main.obf.luau) is picked up immediately, without a server restart. The body
// is only re-read when the resolved path or its mtime changes.
// --------------------------------------------------------------------------
let scriptCache = { path: null, bytes: Buffer.alloc(0), mtime: 0 };
function getScriptBytes() {
	try {
		const p = resolveScriptPath();
		const st = fs.statSync(p);
		if (p !== scriptCache.path || st.mtimeMs !== scriptCache.mtime) {
			scriptCache = { path: p, bytes: fs.readFileSync(p), mtime: st.mtimeMs };
		}
	} catch {
		scriptCache = { path: null, bytes: Buffer.alloc(0), mtime: 0 };
	}
	return scriptCache.bytes;
}

function scriptStatus() {
	const p = resolveScriptPath();
	const obf = path.join(__dirname, "scripts", "main.obf.luau");
	const main = path.join(__dirname, "scripts", "main.luau");
	let size = 0;
	let mtime = null;
	try {
		const st = fs.statSync(p);
		size = st.size;
		mtime = asIso(st.mtimeMs);
	} catch {}
	return {
		servedPath: p,
		servedIsObfuscated: p === obf,
		size,
		mtime,
		mainPresent: fs.existsSync(main),
		obfPresent: fs.existsSync(obf),
		obfuscateEnabled: config.obfuscatePayload !== false,
	};
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

function dayKey(d = new Date()) {
	return d.toISOString().slice(0, 10);
}

async function recordStat(kind) {
	await kv.statsHit(dayKey(), kind);
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
	res.setHeader("X-Frame-Options", "DENY");
	res.setHeader("X-XSS-Protection", "0");
	res.setHeader(
		"Strict-Transport-Security",
		"max-age=31536000; includeSubDomains; preload"
	);
	res.setHeader("Permissions-Policy", "camera=(), microphone=(), geolocation=()");
	res.setHeader(
		"Content-Security-Policy",
		"default-src 'none'; script-src 'self'; style-src 'self' 'unsafe-inline'; img-src 'self' https://*.roblox.com; connect-src 'self'; base-uri 'none'; form-action 'self'; frame-ancestors 'none'"
	);
	next();
});

// Defend against Cross-Site Request Forgery on every state-changing admin
// endpoint: if a browser sends an Origin header it must match the site's own
// origin, otherwise the request is dropped (SameSite=Strict is the other
// layer). Requests without an Origin header (curl, loaders) pass through.
app.use("/api/admin", (req, res, next) => {
	if (req.method === "GET" || req.method === "HEAD") return next();
	const o = req.headers.origin;
	if (o) {
		const proto = String(req.headers["x-forwarded-proto"] || "").split(",")[0].trim() || (req.secure ? "https" : "http");
		const expected = proto + "://" + (req.headers.host || "");
		if (o !== expected) {
			return res.status(403).json({ ok: false, error: "Cross-origin requests are forbidden." });
		}
	}
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
			await recordStat("reject");
			return res.status(400).json({ ok: false, error: "Invalid request." });
		}
		const k = key.trim();
		if ((await kv.getFlag("kill_switch")) === "1") {
			await recordStat("reject");
			return res.status(403).json({ ok: false, error: "This script has been disabled by its owner." });
		}
		const row = await kv.findByKey(k);
		if (!row || row.revoked) {
			await recordStat("reject");
			return res.status(404).json({ ok: false, error: "Invalid or revoked key." });
		}
		if (row.expires) {
			const expMs = new Date(row.expires).getTime();
			if (Number.isFinite(expMs) && Date.now() > expMs) {
				await recordStat("reject");
				return res.status(403).json({ ok: false, error: "This key has expired." });
			}
		}
		await kv.bumpUse(k);
		await recordStat("redeem");

		const bytes = getScriptBytes();
		if (bytes.length === 0) {
			await recordStat("reject");
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

// Pack a Luau chunk into a self-decoding loadstring (the on-wire obfuscation:
// every response is opaque packed bytes). Layer 3 source obfuscation is applied
// upstream - the payload is main.obf.luau and the parts bootstrap is built from
// the pre-obfuscated fetcher.obf.luau template - so no Clyde work happens here.
function packChunk(source) {
	const seed = protect.seedFromToken(protect.randomToken());
	const packed = protect.pack(source, seed);
	return buildLoadstring(protect.blobToString(packed), seed);
}

// Split the payload into N non-overlapping byte parts (boundary-safe UTF-8
// splits so reassembly is byte-identical to the original file).
function splitBytes(buf, n) {
	const parts = [];
	if (n <= 1 || buf.length === 0) {
		parts.push(buf);
		return parts;
	}
	const size = Math.ceil(buf.length / n);
	for (let i = 0; i < n; i++) {
		parts.push(buf.subarray(i * size, Math.min(buf.length, (i + 1) * size)));
	}
	return parts.filter((p) => p.length > 0);
}

// Random per-part seed, minted per session and stored server-side (never
// derivable from the token), so a captured part URL decrypts nothing without
// the stored seed list.
function randomPartSeed() {
	return protect.seedFromToken(protect.randomToken());
}

// Materialize the split, per-part packed CSV bundles for a freshly minted
// one-time delivery session. Random seeds are persisted under `token`.
async function makePartSession(token, count) {
	const parts = splitBytes(getScriptBytes(), count);
	const seeds = parts.map(randomPartSeed);
	await kv.partSessionCreate(token, JSON.stringify(seeds), PART_TTL_SECONDS);
	return parts.map((part, i) => ({
		index: i + 1,
		seed: seeds[i],
		packed: protect.pack(part.toString("utf8"), seeds[i]),
		bytes: part.length,
	}));
}

async function getStoredPartSeeds(token) {
	const raw = await kv.partSessionGet(token);
	if (!raw) return null;
	return JSON.parse(raw);
}

// Returns true when the request came from a real web browser. The executor's
// game:HttpGet goes through Roblox's HTTP stack and never sends a browser UA,
// so this blocks "open the URL in Chrome and download the code" while the
// loader keeps working. It is anti-browser, not anti-hacker.
function isBrowser(req) {
	const ua = String(req.headers["user-agent"] || "").toLowerCase();
	return ua.startsWith("mozilla");
}

app.get(
	"/api/script",
	h(async (req, res) => {
		res.setHeader("Cache-Control", "no-store");

		// Browsing the URL directly must show nothing and download nothing.
		if (isBrowser(req)) {
			return res.status(404).type("text/plain").send("not found");
		}

		const ip = req.headers["x-forwarded-for"] || req.ip || req.socket.remoteAddress || "0";
		if (!(await kv.redeemAllowed(ip, REDEEM_LIMIT_PER_MIN))) {
			await recordStat("reject");
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
			await recordStat("reject");
			return res.status(400).type("text/plain").send(scriptStatusChunk("invalid request"));
		}
		if ((await kv.getFlag("kill_switch")) === "1") {
			await recordStat("reject");
			return res
				.status(403)
				.type("text/plain")
				.send(scriptStatusChunk("this script has been disabled by its owner"));
		}
		const row = await kv.findByKey(key);
		if (!row || row.revoked) {
			await recordStat("reject");
			return res.status(403).type("text/plain").send(scriptStatusChunk("invalid or revoked key"));
		}
		if (row.expires) {
			const expMs = new Date(row.expires).getTime();
			if (Number.isFinite(expMs) && Date.now() > expMs) {
				await recordStat("reject");
				return res
					.status(403)
					.type("text/plain")
					.send(scriptStatusChunk("this key has expired"));
			}
		}
		await kv.bumpUse(key);
		await recordStat("redeem");

		const bytes = getScriptBytes();
		if (bytes.length === 0) {
			await recordStat("reject");
			return res
				.status(500)
				.type("text/plain")
				.send(scriptStatusChunk("no script uploaded yet"));
		}

		// One-time delivery session: a fresh token, and the payload split into
		// PART_COUNT separately-packed parts. The returned bootstrap fetches
		// each part from /api/part inside the token's short TTL, so no single
		// HTTP response ever contains the whole script. When the pre-obfuscated
		// fetcher template is available (Layer 3), the bootstrap logic is that
		// scramble; otherwise it falls back to the plaintext parts fetcher.
		const token = kv.randomId(24);
		try {
			const parts = await makePartSession(token, PART_COUNT);
			const cfg = {
				token,
				base: getBaseUrl(req),
				count: parts.length,
				seeds: parts.map((p) => p.seed),
				key,
			};
			const templatePath = path.join(__dirname, "scripts", "fetcher.obf.luau");
			const l3Bootstrap =
				config.obfuscateChunks !== false
					? await obfuscate.assembleFetcherChunk(cfg, templatePath)
					: null;
			const bootstrap = l3Bootstrap || buildPartsBootstrap(cfg);
			res
				.status(200)
				.type("application/octet-stream")
				.set("Content-Disposition", 'attachment; filename="lib.dat"')
				.send(packChunk(bootstrap));
		} catch {
			// parts table missing (fresh db) -> fall back to the old single chunk
			return res
				.status(200)
				.type("application/octet-stream")
				.set("Content-Disposition", 'attachment; filename="lib.dat"')
				.send(packChunk(bytes.toString("utf8")));
		}
	})
);

// One payload part of a one-time session. The token only needs to exist and
// be unexpired; a part URL is useless on its own because each part carries a
// token-derived keystream and re-building the source requires the matching
// seed from the bootstrap that minted the session.
app.get(
	"/api/part",
	h(async (req, res) => {
		res.setHeader("Cache-Control", "no-store");

		if (isBrowser(req)) {
			return res.status(404).type("text/plain").send("not found");
		}

		const token = typeof req.query.t === "string" ? req.query.t : "";
		const index = parseInt(req.query.i, 10);
		if (!token || !Number.isFinite(index) || index < 1) {
			return res.status(400).type("text/plain").send("bad request");
		}
		const seeds = await getStoredPartSeeds(token);
		if (!seeds) {
			return res.status(403).type("text/plain").send("session expired");
		}

		const bytes = getScriptBytes();
		if (bytes.length === 0) {
			return res.status(500).type("text/plain").send("no script yet");
		}
		const parts = splitBytes(bytes, PART_COUNT);
		const part = parts[index - 1];
		if (!part || part.length === 0) {
			return res.status(404).type("text/plain").send("no such part");
		}

		const seed = seeds[index - 1];
		if (!Number.isFinite(seed)) {
			return res.status(404).type("text/plain").send("no such part");
		}
		const packed = protect.pack(part.toString("utf8"), seed);
		res
			.status(200)
			.type("application/octet-stream")
			.set("Content-Disposition", `attachment; filename="p${index}.dat"`)
			.send(protect.blobToString(packed));
	})
);

// ---- Admin auth (GitHub OAuth only — no passwords) -------------------------
function clientIp(req) {
	return (
		(req.headers["x-forwarded-for"] || "")
			.split(",")[0]
			.trim() ||
		req.ip ||
		req.socket.remoteAddress ||
		"0"
	);
}

app.get("/auth/github", h(async (req, res) => {
	res.setHeader("Cache-Control", "no-store");
	if (!authConfigured()) {
		return res
			.status(200)
			.set("Content-Type", "text/html")
			.send(
				ghMessagePage(
					"info",
					"GitHub sign-in isn't configured yet",
					"Set <b>GITHUB_CLIENT_ID</b>, <b>GITHUB_CLIENT_SECRET</b> and <b>GITHUB_ALLOWED_USERS</b> in the platform environment first. Until then no one — including you — can sign in."
				)
			);
	}
	const ip = clientIp(req);
	if (!(await kv.redeemAllowed(ip, 30))) {
		return res.status(429).set("Content-Type", "text/html").send(ghMessagePage("deny", "Too many attempts", "Slow down and try signing in again in a minute."));
	}
	const state = kv.randomId(16);
	attachCookie(res, req, "gh_state", state, 600);
	const params = new URLSearchParams({
		client_id: GH_CLIENT_ID,
		redirect_uri: ghCallbackUrl(req),
		state,
		scope: "",
	});
	return res.redirect(GH_AUTHORIZE_BASE + "/login/oauth/authorize?" + params.toString());
}));

app.get("/auth/github/callback", h(async (req, res) => {
	res.setHeader("Cache-Control", "no-store");
	const code = String(req.query.code || "");
	const state = String(req.query.state || "");
	const prev = req.cookies && req.cookies.gh_state;
	const clearState = () =>
		res.clearCookie("gh_state", { path: "/", httpOnly: true, secure: secureMode(req), sameSite: "strict" });

	if (!authConfigured()) {
		return res.status(200).set("Content-Type", "text/html").send(
			ghMessagePage("info", "Authentication isn't configured", "GitHub sign-in isn't set up yet, so this login was refused.")
		);
	}
	if (req.query.error) {
		clearState();
		return res.status(400).set("Content-Type", "text/html").send(ghMessagePage("info", "Sign-in cancelled", "You closed the GitHub window or denied access. No problem — nothing changed."));
	}
	if (!code || !state || !prev || state !== prev) {
		clearState();
		return res.status(400).set("Content-Type", "text/html").send(ghMessagePage("deny", "Sign-in failed", "The login request didn't match what we started. Please try again."));
	}
	const ip = clientIp(req);
	if (!(await kv.redeemAllowed(ip, 30))) {
		clearState();
		return res.status(429).set("Content-Type", "text/html").send(ghMessagePage("deny", "Too many attempts", "Please wait a minute and try again."));
	}

	let token = null;
	try {
		token = await ghExchangeCode(code, ghCallbackUrl(req));
	} catch (err) {
		console.error("[github] token exchange failed:", err && err.message);
	}
	if (!token) {
		clearState();
		return res.status(401).set("Content-Type", "text/html").send(ghMessagePage("deny", "GitHub rejected the login", "The authorization code was refused. Please try signing in again."));
	}

	let user = null;
	try {
		user = await ghFetchUser(token);
	} catch (err) {
		console.error("[github] user fetch failed:", err && err.message);
	}
	clearState();
	if (!user) {
		return res.status(502).set("Content-Type", "text/html").send(ghMessagePage("deny", "GitHub is unreachable", "Couldn't fetch your profile right now. Try again in a minute."));
	}
	if (!ghAllowedUser(user)) {
		console.warn("[github] denied sign-in for login=" + (user.login || "?") + " id=" + (user.id || "?"));
		return res.status(403).set("Content-Type", "text/html").send(
			ghMessagePage("deny", "Access denied", "This GitHub account (<b>" + escHtml(user.login) + "</b>) is not authorized to use the CopE console. Only the owner's account can sign in.")
		);
	}

	const sid = kv.randomId(24);
	await kv.sessionCreate(sid, ADMIN_SESSION_SECONDS);
	attachCookie(res, req, "sid", sid, ADMIN_SESSION_SECONDS);
	return res.redirect("/copehubontop-mavi");
}));

app.post(
	"/api/admin/logout",
	h(async (req, res) => {
		const sid = req.cookies && req.cookies.sid;
		if (sid) await kv.sessionDestroy(sid);
		res.clearCookie("sid", { path: "/", httpOnly: true, secure: secureMode(req), sameSite: "strict" });
		res.clearCookie("gh_state", { path: "/", httpOnly: true, secure: secureMode(req), sameSite: "strict" });
		res.json({ ok: true });
	})
);

function requireAdmin(req, res, next) {
	res.setHeader("Cache-Control", "no-store");
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
	let { count, note, expiresIn, type } = req.body || {};
	count = Math.min(Math.max(parseInt(count, 10) || 1, 1), 100);
	note = String(note || "").replace(/[\x00-\x1F\x7F]/g, "").slice(0, 120);
	let expires = null;
	if (expiresIn && typeof expiresIn === "string") {
		const match = /^(\d+)([dhw])$/.exec(expiresIn);
		if (match) {
			const mult = match[2] === "h" ? 3600e3 : match[2] === "d" ? 86400e3 : 6048e5;
			expires = asIso(Date.now() + parseInt(match[1], 10) * mult);
		}
	}
	type = String(type || "").toLowerCase();
	if (!["temporary", "daylocked", "lifetime"].includes(type)) {
		type = expires ? "daylocked" : "temporary";
	}
	if (type === "lifetime") expires = null;
	const created = asIso(Date.now());
	const createdKeys = [];
	for (let i = 0; i < count; i++) {
		let k = "";
		do {
			k = protect.generateKey();
		} while (await kv.findByKey(k));
		await kv.insertKey(k, note, created, expires, type);
		createdKeys.push({ key: k, note, expires, type });
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

// Add time to a key: extends the existing expiry (starts from now if the key
// has no expiry or already expired). Body: { amount: <int>, unit: "h"|"d"|"w" }.
app.post("/api/admin/keys/:id/extend", requireAdmin, h(async (req, res) => {
	const row = await kv.findByKey(req.params.id);
	if (!row) return res.status(404).json({ ok: false, error: "not found" });

	// mirror the generate-form expiry parsing (1h/1d/1w style, but any positive int)
	let { amount, unit } = req.body || {};
	amount = parseInt(amount, 10);
	unit = String(unit || "d");
	if (!Number.isFinite(amount) || amount < 1 || amount > 36500) {
		return res.status(400).json({ ok: false, error: "amount must be between 1 and 36500" });
	}
	const mult = unit === "h" ? 3600e3 : unit === "d" ? 86400e3 : unit === "w" ? 6048e5 : null;
	if (!mult) {
		return res.status(400).json({ ok: false, error: "unit must be h, d or w" });
	}
	const base = row.expires && Date.parse(row.expires) > Date.now()
		? Date.parse(row.expires)
		: Date.now();
	const expires = asIso(base + amount * mult);
	await kv.setExpires(req.params.id, expires);
	res.json({ ok: true, key: row.key, expires });
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

// ---- Script management: paste an updated script in the admin, save it, and
// (when Clyde is available) obfuscate it so the next loader load ships the new
// version. Both files are written atomically (temp + rename) so a crash can
// never leave a half-written payload. The payload cache re-resolves the served
// file on every read, so this takes effect for the very next redemption.
const MAX_SCRIPT_BYTES = Number(process.env.MAX_SCRIPT_KB || 600) * 1024;

function atomicWrite(target, content) {
	const tmp = target + ".tmp-" + process.pid + "-" + Date.now();
	fs.writeFileSync(tmp, content, "utf8");
	fs.renameSync(tmp, target);
}

app.get("/api/admin/script", requireAdmin, h(async (_req, res) => {
	res.json({ ok: true, status: scriptStatus() });
}));

app.post("/api/admin/script", requireAdmin, h(async (req, res) => {
	const script = req.body && typeof req.body.script === "string" ? req.body.script : "";
	if (!script.trim()) {
		return res.status(400).json({ ok: false, error: "Paste a script first." });
	}
	if (Buffer.byteLength(script, "utf8") > MAX_SCRIPT_BYTES) {
		return res.status(400).json({
			ok: false,
			error: "Script too large (max " + Math.round(MAX_SCRIPT_BYTES / 1024) + " KB).",
		});
	}
	if (script.includes("\0")) {
		return res.status(400).json({ ok: false, error: "Script contains null bytes." });
	}

	const mainPath = path.join(__dirname, "scripts", "main.luau");
	const obfPath = path.join(__dirname, "scripts", "main.obf.luau");
	atomicWrite(mainPath, script);

	let obfuscated = false;
	let clydeError = null;
	if (config.obfuscatePayload !== false) {
		const r = clyde.obfuscate(script);
		if (r.ok) {
			atomicWrite(obfPath, r.out);
			obfuscated = true;
		} else {
			clydeError = r.error || "Clyde unavailable";
			// Fall back to the plaintext copy so the served payload is the NEW
			// script, not a stale obfuscated one.
			try {
				fs.unlinkSync(obfPath);
			} catch {}
		}
	}

	res.json({ ok: true, obfuscated, clydeError, status: scriptStatus() });
}));

// The readable source the admin edits (the obfuscated copy is unreadable by
// design - only main.luau, what was last saved, is recoverable).
app.get("/api/admin/script/source", requireAdmin, h(async (_req, res) => {
	const p = path.join(__dirname, "scripts", "main.luau");
	if (!fs.existsSync(p)) {
		return res
			.status(404)
			.json({ ok: false, error: "No editable script saved yet - paste one below and Update." });
	}
	try {
		const src = fs.readFileSync(p, "utf8");
		if (Buffer.byteLength(src, "utf8") > 2 * 1024 * 1024) {
			return res.status(400).json({ ok: false, error: "Source too large to load into the editor." });
		}
		res.json({ ok: true, script: src, bytes: Buffer.byteLength(src, "utf8") });
	} catch {
		res.status(500).json({ ok: false, error: "Could not read scripts/main.luau." });
	}
}));

app.get("/api/admin/stats", requireAdmin, h(async (_req, res) => {
	const list = await kv.listKeys();
	const dayStats = await kv.statsAll();
	const today = dayKey();
	const todayRow = dayStats.find((d) => d.day === today) || { redeems: 0, rejects: 0 };
	const totalR = dayStats.reduce((s, d) => s + Number(d.redeems || 0), 0);
	const totalJ = dayStats.reduce((s, d) => s + Number(d.rejects || 0), 0);
	res.json({
		total: list.length,
		active: list.filter((r) => !r.revoked).length,
		uses: list.reduce((s, r) => s + (Number(r.uses) || 0), 0),
		payloadBytes: getScriptBytes().length,
		killSwitch: (await kv.getFlag("kill_switch")) === "1",
		dayStats,
		todayRedeems: todayRow.redeems,
		todayRejects: todayRow.rejects,
		rejectRate:
			totalR + totalJ > 0 ? Math.round((totalJ / (totalR + totalJ)) * 1000) / 10 : 0,
		rejectRateToday:
			todayRow.redeems + todayRow.rejects > 0
				? Math.round((todayRow.rejects / (todayRow.redeems + todayRow.rejects)) * 1000) / 10
				: 0,
	});
}));

// ---- Kill switch ------------------------------------------------------------
// One-click "stop everything": while on, /api/redeem and keyed /api/script
// requests are refused until the toggle is flipped back. All existing keys stay
// valid - execution is merely paused, not revoked.
app.post("/api/admin/killswitch", requireAdmin, h(async (req, res) => {
	const enabled = !!(req.body && req.body.enabled);
	await kv.setFlag("kill_switch", enabled ? "1" : "0");
	res.json({ ok: true, enabled });
}));

// ---- Admin config (API key, IP whitelist) -----------------------------------
app.get("/api/admin/config", requireAdmin, h(async (_req, res) => {
	res.json({
		ok: true,
		killSwitch: (await kv.getFlag("kill_switch")) === "1",
		apiKey: (await kv.getFlag("api_key")) || null,
		ipWhitelist: (await kv.getFlag("api_whitelist")) || "",
	});
}));

app.post("/api/admin/config", requireAdmin, h(async (req, res) => {
	const b = req.body || {};
	if (b.action === "api-key") {
		const apiKey = crypto.randomBytes(26).toString("hex");
		await kv.setFlag("api_key", apiKey);
		return res.json({ ok: true, apiKey });
	}
	if (typeof b.ipWhitelist === "string") {
		const cleaned = b.ipWhitelist
			.split(/[\s,;]+/)
			.map((s) => s.trim())
			.filter((s) => /^[\w.:%*-]+$/.test(s))
			.join("\n");
		await kv.setFlag("api_whitelist", cleaned);
		return res.json({ ok: true, ipWhitelist: cleaned });
	}
	return res.status(400).json({ ok: false, error: "Unknown configuration action." });
}));

// ---- External key-check API -------------------------------------------------
// Luarmor-style HTTP API for third parties (Sellix webhooks, panels, bots).
// Authenticated with `Authorization: Bearer <52-char API key>` AND the
// caller's IP must be on the whitelist. When the whitelist is empty the API is
// DISABLED entirely (fail-closed): no IP means nothing can pass.
const API_LIMIT_PER_MIN = 120;

function normIp(ip) {
	ip = String(ip || "");
	if (ip === "::1" || ip === "::ffff:127.0.0.1") return "127.0.0.1";
	const v4 = /^::ffff:(\d+\.\d+\.\d+\.\d+)$/.exec(ip);
	return v4 ? v4[1] : ip;
}

// "ok" -> caller authorized; "disabled" -> whitelist empty (fail closed);
// anything else -> missing/wrong credentials.
async function apiAuthed(req) {
	const auth = String(req.headers.authorization || "");
	const token = auth.replace(/^Bearer\s+/i, "").trim();
	const cfg = await kv.getFlag("api_key");
	if (!cfg || !token) return "denied";
	const a = Buffer.from(token, "ascii");
	const b = Buffer.from(cfg, "ascii");
	if (a.length !== b.length || !crypto.timingSafeEqual(a, b)) return "denied";
	const wl = String(((await kv.getFlag("api_whitelist")) || ""))
		.split(/[\s,;]+/)
		.map((s) => s.trim())
		.filter(Boolean);
	if (wl.length === 0) return "disabled";
	return wl.includes(normIp(clientIp(req))) ? "ok" : "denied";
}

function apiAuth(req, res, next) {
	res.setHeader("Cache-Control", "no-store");
	apiAuthed(req).then(
		(v) => {
			if (v === "ok") return next();
			if (v === "disabled") {
				return res
					.status(403)
					.json({ error: "api_disabled", detail: "The IP whitelist is empty — add at least one IP in the admin console to enable the API." });
			}
			return res.status(401).json({ error: "unauthorized" });
		},
		() => res.status(500).json({ error: "internal error" })
	);
}

async function apiRate(req, res, next) {
	if (await kv.redeemAllowed(clientIp(req), API_LIMIT_PER_MIN)) return next();
	res.status(429).json({ error: "rate limited" });
}

// Check a key: what a Sellix webhook or a buyer-facing panel asks.
app.get("/api/v1/key/:key", apiAuth, apiRate, h(async (req, res) => {
	const k = String(req.params.key || "").slice(0, 64).trim();
	const row = await kv.findByKey(k);
	if (!row) return res.status(404).json({ error: "not found", key: k });
	const expired = row.expires ? new Date(row.expires).getTime() < Date.now() : false;
	res.json({
		key: row.key,
		valid: !row.revoked && !expired,
		revoked: !!row.revoked,
		expired,
		expires: row.expires,
		type: row.type || "temporary",
		uses: row.uses,
		last_use: row.last_use,
	});
}));

app.post("/api/v1/key/:key/revoke", apiAuth, apiRate, h(async (req, res) => {
	const k = String(req.params.key || "").slice(0, 64).trim();
	const row = await kv.findByKey(k);
	if (!row) return res.status(404).json({ error: "not found" });
	const target = !(req.body && req.body.revoked === false);
	await kv.setRevoked(k, target);
	res.json({ ok: true, key: k, revoked: target });
}));

app.post("/api/v1/key/:key/extend", apiAuth, apiRate, h(async (req, res) => {
	const k = String(req.params.key || "").slice(0, 64).trim();
	const row = await kv.findByKey(k);
	if (!row) return res.status(404).json({ error: "not found" });
	let { amount, unit } = req.body || {};
	amount = parseInt(amount, 10);
	unit = String(unit || "d");
	if (!Number.isFinite(amount) || amount < 1 || amount > 36500) {
		return res.status(400).json({ error: "amount invalid" });
	}
	const mult = unit === "h" ? 3600e3 : unit === "d" ? 86400e3 : unit === "w" ? 6048e5 : 0;
	if (!mult) return res.status(400).json({ error: "unit must be h, d or w" });
	const base = row.expires && Date.parse(row.expires) > Date.now() ? Date.parse(row.expires) : Date.now();
	const expires = asIso(base + amount * mult);
	await kv.setExpires(k, expires);
	res.json({ ok: true, key: k, expires });
}));

// ---- Telemetry ---------------------------------------------------------------
// POST /api/telemetry — fire-and-forget from the executor-side loader.
// No auth (executors don't carry cookies); rate-limited per IP; browser
// requests are rejected; payload is validated and stored.
const TELEMETRY_LIMIT_PER_MIN = Number(process.env.TELEMETRY_RATE_LIMIT || config.telemetryRateLimit || 30);

app.post("/api/telemetry", h(async (req, res) => {
	if (isBrowser(req)) {
		return res.status(404).json({ ok: false, error: "not found" });
	}
	const ip = clientIp(req);
	if (!(await kv.redeemAllowed(ip, TELEMETRY_LIMIT_PER_MIN))) {
		return res.status(429).json({ ok: false, error: "rate limited" });
	}
	const { username, userId, executor, key } = req.body || {};
	const safeName = String(username || "").replace(/[^\w\-\s.]/g, "").slice(0, 64);
	const safeUid = String(userId || "").replace(/[^\d\-]/g, "").slice(0, 32);
	const safeExec = String(executor || "").replace(/[^\w\-\s.#]/g, "").slice(0, 64);
	const safeKey = String(key || "").replace(/[^\w\-]/g, "").slice(0, 64);
	if (!safeName && !safeUid) {
		return res.status(400).json({ ok: false, error: "invalid payload" });
	}
	await kv.addTelemetry({
		time: new Date().toISOString(),
		username: safeName,
		userId: safeUid,
		executor: safeExec,
		key: safeKey,
	});
	res.json({ ok: true });
}));

// GET /api/admin/telemetry — admin-only list of execution logs.
app.get("/api/admin/telemetry", requireAdmin, h(async (req, res) => {
	const limit = Math.min(Math.max(parseInt(req.query.limit, 10) || 200, 1), 1000);
	const rows = await kv.listTelemetry(limit);
	res.json({ ok: true, telemetry: rows, total: await kv.telemetryCount() });
}));

// ---- Health ----------------------------------------------------------------
app.get("/api/status", h(async (_req, res) => {
	res.set("Cache-Control", "no-store").json({
		ok: true,
		name: "CopE Loader",
		auth: "github",
		authConfigured: authConfigured(),
		persistent: kv.isPersistent(),
	});
}));

// ---- Homepage: Google-style 404 ----------------------------------------
// The visible site is a 404; the admin lives on the covert path. This renders
// the exact Google "not found" error screen (white page, Google wordmark,
// "404. That's an error.") and echoes the requested path like Google does.
function escHtml(s) {
	return String(s).replace(/[&<>"']/g, (c) => (
		{ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]
	));
}

function google404Html(path) {
	return `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<title>404 Not Found</title>
</head>
<body style="margin:0;min-height:100vh;background:#fff;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:0 24px;text-align:center;color:#777;font-family:Arial,Helvetica,sans-serif">
<div style="font-size:30px;font-weight:500;letter-spacing:-1px;user-select:none">
<span style="color:#4285F4">G</span><span style="color:#EA4335">o</span><span style="color:#FBBC05">o</span><span style="color:#4285F4">g</span><span style="color:#34A853">l</span><span style="color:#EA4335">e</span>
</div>
<p style="font-size:26px;font-weight:400;color:#777;margin:36px 0 16px">404. That's an error.</p>
<p style="font-size:18px;color:#777;margin:0;line-height:1.7">The requested URL <b style="font-weight:400">"${path}"</b> was not found on this server.</p>
<p style="font-size:18px;color:#777;margin:10px 0 0">That's all we know.</p>
</body>
</html>`;
}

function sendGoogle404(req, res) {
	res.status(404).set("Content-Type", "text/html").send(google404Html(escHtml(req.originalUrl || "/")));
}

app.get("/", (req, res) => sendGoogle404(req, res));

app.get("/copehubontop-mavi", (_req, res) =>
	res.setHeader("Cache-Control", "no-store").sendFile(path.join(__dirname, "_private", "admin.html"))
);

// ---- Static ----------------------------------------------------------------
// admin.html lives in _private/ (not public/) so Vercel's edge file serving and
// express.static can never expose it under its literal name.
app.use(express.static(path.join(__dirname, "public")));

// Keep scrapers/bots away from the admin path; the root is already a 404 so
// anything a crawler finds should look like a parked domain.
app.get("/robots.txt", (_req, res) => {
	res.set("Content-Type", "text/plain").send("User-agent: *\nDisallow: /\n");
});

// 404: APIs stay JSON (executors/scripts parse them), anything else is a page
app.use((req, res) => {
	if (req.path.startsWith("/api/")) return res.status(404).json({ error: "not found" });
	sendGoogle404(req, res);
});

module.exports = app;