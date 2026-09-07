import { createRequire } from "module";
const require = createRequire(import.meta.url);
const protect = require("./lib/protect");
import fsMod from "node:fs";
const fs = fsMod;

const BASE = "http://127.0.0.1:3300";

const check = (name, cond, extra) => {
	console.log((cond ? "PASS" : "FAIL") + " - " + name + (extra ? " | " + extra : ""));
	if (!cond) process.exitCode = 1;
};

async function main() {
	// 1. setup admin
	let r = await fetch(BASE + "/api/admin/setup");
	let d = await r.json();
	check("setup reports needed", d.needed === true);

	r = await fetch(BASE + "/api/status");
	d = await r.json();
	check("status reports persistence flag", typeof d.persistent === "boolean");

	r = await fetch(BASE + "/api/admin/setup", {
		method: "POST",
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({ password: "testpass123" }),
	});
	d = await r.json();
	check("admin password created", d.ok === true);

	// 2. login
	r = await fetch(BASE + "/api/admin/login", {
		method: "POST",
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({ password: "testpass123" }),
	});
	const sid = (r.headers.get("set-cookie") || "").match(/sid=([^;]+)/)?.[1];
	d = await r.json();
	check("admin login", d.ok === true && !!sid);

	// 3. homepage has no public buyer page - admin only
	r = await fetch(BASE + "/");
	check("homepage redirects to /admin", r.redirected && r.url.endsWith("/admin"));

	// 4. generate a key
	r = await fetch(BASE + "/api/admin/keys", {
		method: "POST",
		headers: { "Content-Type": "application/json", Cookie: "sid=" + sid },
		body: JSON.stringify({ count: 1, note: "buyer one", expiresIn: "" }),
	});
	d = await r.json();
	check("key generated", d.ok === true && d.keys.length === 1);
	const key = d.keys[0].key;
	console.log("key:", key);

	// 5. redeem with bad key
	r = await fetch(BASE + "/api/redeem", {
		method: "POST",
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({ key: "KEY-NOPE" }),
	});
	d = await r.json();
	check("bad key rejected", !d.ok);

	// 6. redeem with good key -> packed payload comes straight back
	r = await fetch(BASE + "/api/redeem", {
		method: "POST",
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({ key }),
	});
	d = await r.json();
	check("good key redeemed", d.ok === true && !!d.blob && !!d.seed);
	const src = fs.readFileSync("scripts/main.luau", "utf8");
	const back = protect.unpack(d.blob, d.seed);
	check("blob unpacks to exact payload", back === src, back.length + " vs " + src.length);

	// 7. same key can redeem again (unlimited re-issue)
	const prevBlob = d.blob;
	r = await fetch(BASE + "/api/redeem", {
		method: "POST",
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({ key }),
	});
	d = await r.json();
	check("same key redeems again", d.ok === true && d.blob !== prevBlob);

	// 8. revoke the key -> every copy of the loader dies instantly
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

	// 9. un-revoke (keep the key usable for the rest of the test)
	await fetch(BASE + "/api/admin/keys/" + encodeURIComponent(key) + "/revoke", {
		method: "POST",
		headers: { Cookie: "sid=" + sid },
	});

	// 10. admin builds the single-loader snippet for a key
	r = await fetch(BASE + "/api/admin/keys/" + encodeURIComponent(key) + "/loader", {
		headers: { Cookie: "sid=" + sid },
	});
	d = await r.json();
	check("loader generated for key", d.ok === true && !!d.loader);
	check("loader embeds the key", d.loader.includes(key));
	check("loader calls /api/redeem", d.loader.includes("/api/redeem"));

	// 10b. generic key-page loader (no baked key)
	r = await fetch(BASE + "/api/admin/loader/generic", { headers: { Cookie: "sid=" + sid } });
	d = await r.json();
	check("generic loader generated", d.ok === true && !!d.loader);
	check("generic loader shows a key page", d.loader.includes("Unlock"));
	check("generic loader embeds no key", !d.loader.includes("KEY-"));
	check("generic loader still calls /api/redeem", d.loader.includes("/api/redeem"));

	// 10c. convert pasted script -> standalone loadstring build
	r = await fetch(BASE + "/api/admin/convert", {
		method: "POST",
		headers: { "Content-Type": "application/json", Cookie: "sid=" + sid },
		body: JSON.stringify({ script: "print('hi')\nfor i = 1, 5 do print(i) end\n" }),
	});
	d = await r.json();
	check("convert returns a snippet", d.ok === true && !!d.snippet);
	check("convert snippet uses loadstring", d.snippet.includes("loadstring"));

	// 10d. convert scripts/main.luau from file
	r = await fetch(BASE + "/api/admin/convert", {
		method: "POST",
		headers: { "Content-Type": "application/json", Cookie: "sid=" + sid },
		body: JSON.stringify({ file: true }),
	});
	d = await r.json();
	check("convert from file works", d.ok === true && !!d.snippet);

	// 11. admin session required for admin endpoints
	r = await fetch(BASE + "/api/admin/keys");
	check("admin without session blocked (401)", r.status === 401);

	// 12. no admin access to payload without a valid key
	r = await fetch(BASE + "/scripts/main.luau");
	check("payload not directly served (404)", r.status === 404);

	// 13. one-liner endpoint: no key -> key-gate bootstrap (valid Luau, no plaintext)
	r = await fetch(BASE + "/api/script");
	const gate = await r.text();
	check("one-liner gate served", r.status === 200 && /^-- CopE Loader - one-liner key gate/.test(gate));
	check("one-liner gate shows key page", gate.includes("CopELoaderGate") && gate.includes("Unlock"));
	check("one-liner gate fetches url by key", gate.includes("/api/script?key="));
	check("one-liner gate carries no plaintext payload", !gate.includes("Open Egg"));

	// 14. one-liner endpoint: valid key -> packed standalone build, never plaintext
	r = await fetch(BASE + "/api/script?key=" + encodeURIComponent(key));
	const packedChunk = await r.text();
	check("one-liner packed chunk served", r.status === 200 && packedChunk.includes("loadstring(table.concat"));
	check("one-liner packed chunk hides the source", !packedChunk.includes("Open Egg"));

	// 15. one-liner endpoint: bad key -> erroring chunk with a message
	r = await fetch(BASE + "/api/script?key=KEY-NOPE");
	d = { text: await r.text() };
	check("one-liner bad key rejected", r.status === 403 && d.text.includes("invalid or revoked key"));

	// 16. admin one-liner helpers
	r = await fetch(BASE + "/api/admin/oneline", { headers: { Cookie: "sid=" + sid } });
	d = await r.json();
	check("generic one-liner returned", d.ok === true && /^loadstring\(game:HttpGet\("/.test(d.line));
	check("generic one-liner has no key", !d.line.includes("?key="));

	r = await fetch(BASE + "/api/admin/keys/" + encodeURIComponent(key) + "/oneline", { headers: { Cookie: "sid=" + sid } });
	d = await r.json();
	check("per-key one-liner returned", d.ok === true && d.line.includes("/api/script?key=" + encodeURIComponent(key)));
}

main().catch((e) => {
	console.error("ERROR", e);
	process.exit(1);
});