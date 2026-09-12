import { createRequire } from "module";
const require = createRequire(import.meta.url);
const protect = require("./lib/protect");
import fsMod from "node:fs";
const fs = fsMod;
import http from "node:http";
import { spawn } from "node:child_process";

const BASE = "http://127.0.0.1:3300";
const MOCK_PORT = 4010;

const check = (name, cond, extra) => {
	console.log((cond ? "PASS" : "FAIL") + " - " + name + (extra ? " | " + extra : ""));
	if (!cond) process.exitCode = 1;
};

function mockJson(res, obj, status = 200) {
	res.writeHead(status, { "Content-Type": "application/json" });
	res.end(JSON.stringify(obj));
}

// A tiny stand-in for GitHub's OAuth endpoints so the whole login flow can be
// exercised without real GitHub credentials.
function startMock() {
	const server = http.createServer((req, res) => {
		const u = new URL(req.url, "http://127.0.0.1:" + MOCK_PORT);
		if (req.method === "POST" && u.pathname === "/login/oauth/access_token") {
			let b = "";
			req.on("data", (c) => (b += c));
			req.on("end", () => {
				let code = "";
				try {
					code = JSON.parse(b).code || "";
				} catch {}
				if (code === "good") return mockJson(res, { access_token: "tok_owner" });
				if (code === "intruder") return mockJson(res, { access_token: "tok_intruder" });
				return mockJson(res, { error: "bad_verification_code" }, 400);
			});
			return;
		}
		if (req.method === "GET" && u.pathname === "/api/user") {
			const auth = req.headers.authorization || "";
			if (auth === "Bearer tok_owner") return mockJson(res, { login: "cope-owner", id: 101 });
			if (auth === "Bearer tok_intruder") return mockJson(res, { login: "attacker", id: 202 });
			return mockJson(res, { message: "Bad credentials" }, 401);
		}
		return mockJson(res, { message: "not found" }, 404);
	});
	return new Promise((resolve) => server.listen(MOCK_PORT, "127.0.0.1", () => resolve(server)));
}

// Send a request and get status + headers + body without following redirects
// (needed to catch Set-Cookie on the 302 from the OAuth callback).
function raw(method, url, { headers = {}, body } = {}) {
	return new Promise((resolve, reject) => {
		const u = new URL(url);
		const opt = {
			method,
			hostname: u.hostname,
			port: u.port,
			path: u.pathname + u.search,
			headers,
		};
		const req = http.request(opt, (res) => {
			let data = "";
			res.on("data", (c) => (data += c));
			res.on("end", () => resolve({ status: res.statusCode, headers: res.headers, body: data }));
		});
		req.on("error", reject);
		if (body) req.write(body);
		req.end();
	});
}

async function waitReady(url, ms) {
	const end = Date.now() + ms;
	while (Date.now() < end) {
		try {
			const r = await fetch(url);
			if (r.ok) return true;
		} catch {}
		await new Promise((r) => setTimeout(r, 250));
	}
	return false;
}

function cookieVal(header, name) {
	if (!header) return null;
	if (Array.isArray(header)) header = header.join("\n");
	const m = header.split(/[;\n]\s*/).find((c) => c.startsWith(name + "="));
	return m ? m.slice(name.length + 1) : null;
}

let child = null;
let mock = null;

async function main() {
	// ---- spin up the mock GitHub provider and the app server --------------
	mock = await startMock();
	const env = {
		...process.env,
		PORT: "3300",
		REDEEM_RATE_LIMIT: "1000",
		GITHUB_CLIENT_ID: "test-client",
		GITHUB_CLIENT_SECRET: "test-secret",
		GITHUB_ALLOWED_USERS: "cope-owner",
		GITHUB_AUTHORIZE_BASE: "http://127.0.0.1:" + MOCK_PORT,
		GITHUB_TOKEN_BASE: "http://127.0.0.1:" + MOCK_PORT,
		GITHUB_API_BASE: "http://127.0.0.1:" + MOCK_PORT + "/api",
	};
	delete env.DATABASE_URL; // force the in-memory store for a fresh state
	child = spawn(process.execPath, ["server.js"], { env, stdio: "ignore" });

	if (!(await waitReady(BASE + "/api/status", 8000))) {
		throw new Error("app server did not start in time");
	}

	// ---- 1. homepage + admin path -----------------------------------------
	let r = await fetch(BASE + "/");
	check("homepage returns 404", r.status === 404);

	r = await fetch(BASE + "/copehubontop-mavi");
	check("admin page served at covert path", r.status === 200);

	// ---- 2. status now reports GitHub auth --------------------------------
	let d = await (await fetch(BASE + "/api/status")).json();
	check("status reports persistence flag", typeof d.persistent === "boolean");
	check("status reports github auth mode", d.auth === "github");
	check("status reports oauth configured", d.authConfigured === true);

	// ---- 3. legacy password endpoints are gone ----------------------------
	r = await fetch(BASE + "/api/admin/setup");
	check("password setup endpoint removed (404)", r.status === 404);
	r = await fetch(BASE + "/api/admin/login", {
		method: "POST",
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({ password: "testpass123" }),
	});
	check("password login endpoint removed (404)", r.status === 404);

	// ---- 4. anonymous admin API is locked down ----------------------------
	r = await fetch(BASE + "/api/admin/keys");
	check("admin without session blocked (401)", r.status === 401);

	// ---- 5. GitHub OAuth flow ---------------------------------------------
	r = await fetch(BASE + "/auth/github", { redirect: "manual" });
	const startHeaders = r.headers.get("set-cookie") || "";
	const ghState = cookieVal(startHeaders, "gh_state");
	check(
		"authorize redirect issued",
		r.status === 302 &&
			(r.headers.get("location") || "").includes("client_id=test-client") &&
			(r.headers.get("location") || "").includes("state=")
	);
	check("state cookie set", !!ghState);

	// wrong state -> refused, no session
	let cb = await raw("GET", BASE + "/auth/github/callback?code=good&state=WRONG", {
		headers: { Cookie: "gh_state=" + ghState },
	});
	check("callback with wrong state refused (400)", cb.status === 400);

	// no state cookie at all -> refused
	cb = await raw("GET", BASE + "/auth/github/callback?code=good&state=whatever");
	check("callback without state cookie refused (400)", cb.status === 400);

	// login screen can be cancelled cleanly
	cb = await raw("GET", BASE + "/auth/github/callback?error=access_denied&state=" + ghState, {
		headers: { Cookie: "gh_state=" + ghState },
	});
	check("cancelled login handled (400, no session)", cb.status === 400 && !cookieVal(cb.headers["set-cookie"] || "", "sid"));

	// an intruder's github account must NOT gain access
	let r2 = await fetch(BASE + "/auth/github", { redirect: "manual" });
	const intruderState = cookieVal(r2.headers.get("set-cookie") || "", "gh_state");
	cb = await raw("GET", BASE + "/auth/github/callback?code=intruder&state=" + intruderState, {
		headers: { Cookie: "gh_state=" + intruderState },
	});
	check("non-allowlisted github account denied (403, no session)", cb.status === 403 && !cookieVal(cb.headers["set-cookie"] || "", "sid"));

	// a broken authorization code is refused
	let r3 = await fetch(BASE + "/auth/github", { redirect: "manual" });
	const badState = cookieVal(r3.headers.get("set-cookie") || "", "gh_state");
	cb = await raw("GET", BASE + "/auth/github/callback?code=broken&state=" + badState, {
		headers: { Cookie: "gh_state=" + badState },
	});
	check("rejected authorization code refused (401)", cb.status === 401);

	// the real owner signs in and gets a session cookie
	let r4 = await fetch(BASE + "/auth/github", { redirect: "manual" });
	const goodState = cookieVal(r4.headers.get("set-cookie") || "", "gh_state");
	cb = await raw("GET", BASE + "/auth/github/callback?code=good&state=" + goodState, {
		headers: { Cookie: "gh_state=" + goodState },
	});
	const sid = cookieVal(cb.headers["set-cookie"] || "", "sid");
	check(
		"allowlisted owner signed in (302 + session cookie)",
		cb.status === 302 && cb.headers.location && cb.headers.location.endsWith("/copehubontop-mavi") && !!sid
	);

	// ---- 6. CSRF origin guard ---------------------------------------------
	r = await fetch(BASE + "/api/admin/keys", {
		method: "POST",
		headers: { "Content-Type": "application/json", Cookie: "sid=" + sid, Origin: "https://evil.example" },
		body: JSON.stringify({ count: 1 }),
	});
	check("cross-origin admin POST refused (403)", r.status === 403);

	// ---- 7. external API is fail-closed when the whitelist is empty --------
	d = await (await fetch(BASE + "/api/admin/config", {
		method: "POST",
		headers: { "Content-Type": "application/json", Cookie: "sid=" + sid },
		body: JSON.stringify({ action: "api-key" }),
	})).json();
	const apiKey = d.apiKey;
	check("api key regenerated (52 chars)", d.ok === true && /^[0-9a-f]{52}$/.test(apiKey));

	r = await fetch(BASE + "/api/v1/key/WHOEVER", { headers: { Authorization: "Bearer " + apiKey } });
	d = await r.json();
	check("external API disabled with empty whitelist (403)", r.status === 403 && d.error === "api_disabled");

	d = await (await fetch(BASE + "/api/admin/config", {
		method: "POST",
		headers: { "Content-Type": "application/json", Cookie: "sid=" + sid },
		body: JSON.stringify({ ipWhitelist: "127.0.0.1" }),
	})).json();
	check("whitelist saved", d.ok === true);

	r = await fetch(BASE + "/api/v1/key/WHOEVER", { headers: { Authorization: "Bearer " + apiKey } });
	check("whitelisted key-check reaches the DB (404, not 403)", r.status === 404);

	r = await fetch(BASE + "/api/v1/key/WHOEVER");
	check("external API without bearer refused (401)", r.status === 401);
	r = await fetch(BASE + "/api/v1/key/WHOEVER", { headers: { Authorization: "Bearer wrongkey" } });
	check("external API with wrong bearer refused (401)", r.status === 401);

	// ---- 8. owner session works -------------------------------------------
	r = await fetch(BASE + "/api/admin/keys", { headers: { Cookie: "sid=" + sid } });
	check("admin with github session allowed (200)", r.status === 200);

	// ---- 9. generate a key (browser-style origin allowed) ------------------
	r = await fetch(BASE + "/api/admin/keys", {
		method: "POST",
		headers: { "Content-Type": "application/json", Cookie: "sid=" + sid, Origin: BASE },
		body: JSON.stringify({ count: 1, note: "buyer one", expiresIn: "" }),
	});
	d = await r.json();
	check("key generated (matching origin passes)", d.ok === true && d.keys.length === 1);
	const key = d.keys[0].key;
	console.log("key:", key);

	// 10. redeem with bad key
	r = await fetch(BASE + "/api/redeem", {
		method: "POST",
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({ key: "KEY-NOPE" }),
	});
	d = await r.json();
	check("bad key rejected", !d.ok);

	// 11. redeem with good key -> packed payload comes straight back
	r = await fetch(BASE + "/api/redeem", {
		method: "POST",
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({ key }),
	});
	d = await r.json();
	check("good key redeemed", d.ok === true && !!d.blob && !!d.seed);
	const cfg = JSON.parse(fs.readFileSync("config.json", "utf8"));
	const obfOn = cfg.obfuscatePayload !== false && fs.existsSync("scripts/main.obf.luau");
	const src = fs.readFileSync(obfOn ? "scripts/main.obf.luau" : "scripts/main.luau", "utf8");
	const back = protect.unpack(d.blob, d.seed);
	check("blob unpacks to the served payload (obfuscated)", back === src, back.length + " vs " + src.length);
	check("served payload hides readable source", obfOn ? !back.includes("Cope Hub v5") && !back.includes("--[[") && !back.includes("print(") : true);

	// 12. same key can redeem again (unlimited re-issue)
	const prevBlob = d.blob;
	r = await fetch(BASE + "/api/redeem", {
		method: "POST",
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({ key }),
	});
	d = await r.json();
	check("same key redeems again", d.ok === true && d.blob !== prevBlob);

	// 13. revoke the key -> every copy of the loader dies instantly
	r = await fetch(BASE + "/api/admin/keys/" + encodeURIComponent(key) + "/revoke", {
		method: "POST",
		headers: { Cookie: "sid=" + sid },
	});
	d = await r.json();
	check("key revoked", d.ok === true && d.revoked === true);
	r = await fetch(BASE + "/api/redeem", {
		method: "POST",
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({ key }),
	});
	check("revoked key rejected", !r.ok);

	// 14. un-revoke (keep the key usable for the rest of the test)
	await fetch(BASE + "/api/admin/keys/" + encodeURIComponent(key) + "/revoke", {
		method: "POST",
		headers: { Cookie: "sid=" + sid },
	});

	// 15. admin builds the single-loader snippet for a key
	r = await fetch(BASE + "/api/admin/keys/" + encodeURIComponent(key) + "/loader", {
		headers: { Cookie: "sid=" + sid },
	});
	d = await r.json();
	check("loader generated for key", d.ok === true && !!d.loader);
	check("loader embeds the key", d.loader.includes(key));
	check("loader calls /api/redeem", d.loader.includes("/api/redeem"));

	// 15b. generic key-page loader (no baked key)
	r = await fetch(BASE + "/api/admin/loader/generic", { headers: { Cookie: "sid=" + sid } });
	d = await r.json();
	check("generic loader generated", d.ok === true && !!d.loader);
	check("generic loader shows a key page", d.loader.includes("Unlock"));
	check("generic loader embeds no key", !d.loader.includes("KEY-"));
	check("generic loader still calls /api/redeem", d.loader.includes("/api/redeem"));

	// 15c. convert pasted script -> standalone loadstring build
	r = await fetch(BASE + "/api/admin/convert", {
		method: "POST",
		headers: { "Content-Type": "application/json", Cookie: "sid=" + sid },
		body: JSON.stringify({ script: "print('hi')\nfor i = 1, 5 do print(i) end\n" }),
	});
	d = await r.json();
	check("convert returns a snippet", d.ok === true && !!d.snippet);
	check("convert snippet uses loadstring", d.snippet.includes("loadstring"));

	// 15d. convert scripts/main.luau from file
	r = await fetch(BASE + "/api/admin/convert", {
		method: "POST",
		headers: { "Content-Type": "application/json", Cookie: "sid=" + sid },
		body: JSON.stringify({ file: true }),
	});
	d = await r.json();
	check("convert from file works", d.ok === true && !!d.snippet);

	// 16. no admin access to payload without a valid key
	r = await fetch(BASE + "/scripts/main.luau");
	check("payload not directly served (404)", r.status === 404);

	// 17. one-liner endpoint: no key -> packed key-gate chunk (no readable source)
	r = await fetch(BASE + "/api/script");
	const gate = await r.text();
	check("one-liner gate served", r.status === 200 && /^-- CopE Loader - standalone loadstring build/.test(gate));
	const gCsv = gate.match(/string\.split\("([^"]*)", ","\)/s);
	const gSeed = gate.match(/local \w+ = (\d+)/);
	const gateBack = gCsv && gSeed ? protect.unpack(gCsv[1], Number(gSeed[1])) : "";
	check("one-liner gate unpacks to the key page", gateBack.includes("CopELoaderGate") && gateBack.includes("/api/script?key="));
	check("one-liner gate hides its own source", !gate.includes("CopELoaderGate") && !gate.includes("local function"));
	check("one-liner gate hides the payload", !gate.includes("Open Egg"));

	// 18. one-liner endpoint: valid key -> multi-part bootstrap, never plaintext
	r = await fetch(BASE + "/api/script?key=" + encodeURIComponent(key));
	const packedChunk = await r.text();
	check("one-liner packed chunk served", r.status === 200 && packedChunk.includes("loadstring(table.concat"));
	check("one-liner never embeds the whole payload", !packedChunk.includes(src) && packedChunk.length < src.length / 2);

	// unpack the bootstrap chunk, then emulate the executor: fetch each part
	// with the session token and reassemble the obfuscated payload.
	const pCsv = packedChunk.match(/string\.split\("([^"]*)", ","\)/s);
	const pSeed = packedChunk.match(/local \w+ = (\d+)/);
	const bootstrap = pCsv && pSeed ? protect.unpack(pCsv[1], Number(pSeed[1])) : "";
	check("bootstrap unpacks to a parts fetcher", /COPE_FETCH\(|api\/part/.test(bootstrap));

	// Parse the bootstrap. Two shapes are accepted:
	//   Layer 3 (obfuscated template) : local _src = COPE_FETCH("<token>", {s1,s2,..}, N, "<base>")
	//   Layer 2 (plaintext fetcher)   : local T="<hex>" / seeds table + count
	const tMatch3 = bootstrap.match(/COPE_FETCH\(\s*"([0-9a-f]+)"\s*,\s*\{([^}]*)\}\s*,\s*(\d+)/);
	const tMatch2 =
		bootstrap.match(/local \w+ = "([0-9a-f]+)"/) &&
		bootstrap.match(/local \w+ = (\d+)/);
	if (tMatch3) {
		const token = tMatch3[1];
		const seeds3 = tMatch3[2].split(",").map((s) => Number(s.trim()));
		const partCount3 = Number(tMatch3[3]);
		check("bootstrap carries session token and part count", !!token && partCount3 >= 2);
		check("part count matches config", partCount3 === (JSON.parse(fs.readFileSync("config.json", "utf8")).parts || 4));
		check("bootstrap embeds per-part seeds", seeds3.length === partCount3 && seeds3.every((n) => Number.isFinite(n)));
		check("bootstrap logic hides readable fetch code (Layer 3)", !bootstrap.includes("/api/part?t=") && !bootstrap.includes('"api/part'));

		const reassembled = [];
		for (let i = 1; i <= partCount3; i++) {
			const pr = await fetch(BASE + "/api/part?t=" + token + "&i=" + i);
			const partCsv = await pr.text();
			check("part " + i + " served", pr.status === 200 && partCsv.split(",").length > 100);
			const embeddedSeed = seeds3[i - 1];
			check("part has a stored seed", Number.isFinite(embeddedSeed));
			reassembled.push(protect.unpack(partCsv, embeddedSeed));
		}
		const fullBack = reassembled.join("");
		check("multi-part reassembly equals the obfuscated payload", fullBack === src, fullBack.length + " vs " + src.length);
	} else if (tMatch2) {
		const partCount = Number(tMatch2[2]);
		const seedLines = [...bootstrap.matchAll(/\[\d+\]\s*=\s*(-?\d+)[\s,]*/g)];
		const seedList = seedLines.map((m) => Number(m[1]));
		check("bootstrap embeds per-part seeds", seedList.length === partCount && seedList.every((n) => Number.isFinite(n)));
		const reassembled = [];
		for (let i = 1; i <= partCount; i++) {
			const pr = await fetch(BASE + "/api/part?t=" + tMatch2[1] + "&i=" + i);
			const partCsv = await pr.text();
			check("part " + i + " served", pr.status === 200 && partCsv.split(",").length > 100);
			const embeddedSeed = seedList[i - 1];
			check("part has a stored seed", Number.isFinite(embeddedSeed));
			reassembled.push(protect.unpack(partCsv, embeddedSeed));
		}
		const fullBack = reassembled.join("");
		check("multi-part reassembly equals the obfuscated payload", fullBack === src, fullBack.length + " vs " + src.length);
	} else {
		check("bootstrap carries session token and part count", false);
	}
	check("one-liner packed chunk hides the source", !packedChunk.includes("Open Egg"));
	check("one-liner packed chunk hides readable fetcher logic", !packedChunk.includes("/api/part?t="));

	// 19. one-liner endpoint: bad key -> erroring chunk with a message
	r = await fetch(BASE + "/api/script?key=KEY-NOPE");
	d = { text: await r.text() };
	check("one-liner bad key rejected", r.status === 403 && d.text.includes("invalid or revoked key"));

	// 20. admin one-liner helpers
	r = await fetch(BASE + "/api/admin/oneline", { headers: { Cookie: "sid=" + sid } });
	d = await r.json();
	check("generic one-liner returned", d.ok === true && /^loadstring\(game:HttpGet\("/.test(d.line));
	check("generic one-liner has no key", !d.line.includes("?key="));

	r = await fetch(BASE + "/api/admin/keys/" + encodeURIComponent(key) + "/oneline", { headers: { Cookie: "sid=" + sid } });
	d = await r.json();
	check("per-key one-liner returned", d.ok === true && d.line.includes("/api/script?key=" + encodeURIComponent(key)));

	// 21. telemetry endpoint - fire-and-forget logs an execution
	r = await fetch(BASE + "/api/telemetry", {
		method: "POST",
		headers: { "Content-Type": "application/json", "User-Agent": "Roblox:Executor/1.0" },
		body: JSON.stringify({ username: "TestUser", userId: "12345", executor: "Synapse X", key }),
	});
	d = await r.json();
	check("telemetry accepted", d.ok === true);

	// 22. telemetry shows up in the admin log
	r = await fetch(BASE + "/api/admin/telemetry", { headers: { Cookie: "sid=" + sid } });
	d = await r.json();
	const foundTele = (d.telemetry || []).find((t) => t.username === "TestUser");
	check("telemetry logged (username)", !!foundTele && foundTele.user_id === "12345");
	check("telemetry logged (executor)", !!foundTele && foundTele.executor === "Synapse X");
	check("telemetry total reported", typeof d.total === "number" && d.total >= 1);

	// 23. telemetry rejects browser UAs (no log spam from Chrome)
	r = await fetch(BASE + "/api/telemetry", {
		method: "POST",
		headers: { "Content-Type": "application/json", "User-Agent": "Mozilla/5.0 (Windows NT 10.0)" },
		body: JSON.stringify({ username: "BrowserBot", userId: "999", executor: "Chrome", key: "x" }),
	});
	check("telemetry rejects browser UA", r.status === 404);

	// 24. keyed loader chunk embeds the telemetry beacon
	r = await fetch(BASE + "/api/admin/keys/" + encodeURIComponent(key) + "/loader", { headers: { Cookie: "sid=" + sid } });
	d = await r.json();
	check("keyed loader embeds telemetry beacon", d.ok === true && d.loader.includes("/api/telemetry"));
	check("keyed loader embeds username collection", d.ok === true && d.loader.includes(".LocalPlayer"));
}

main()
	.catch((e) => {
		console.error("ERROR", e);
		process.exitCode = 1;
	})
	.finally(() => {
		if (child) child.kill();
		if (mock) mock.close();
	});