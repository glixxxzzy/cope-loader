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

	// 3. homepage has no public buyer page - plain 404
	r = await fetch(BASE + "/");
	check("homepage returns 404", r.status === 404);

	// 3b. admin page is hidden under a non-descript path
	r = await fetch(BASE + "/copehubontop-mavi");
	check("admin page served at covert path", r.status === 200);

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
	const cfg = JSON.parse(fs.readFileSync("config.json", "utf8"));
	const obfOn = cfg.obfuscatePayload !== false && fs.existsSync("scripts/main.obf.luau");
	const src = fs.readFileSync(obfOn ? "scripts/main.obf.luau" : "scripts/main.luau", "utf8");
	const back = protect.unpack(d.blob, d.seed);
	check("blob unpacks to the served payload (obfuscated)", back === src, back.length + " vs " + src.length);
	check("served payload hides readable source", obfOn ? !back.includes("Cope Hub v5") && !back.includes("--[[") && !back.includes("print(") : true);

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

	// 13. one-liner endpoint: no key -> packed key-gate chunk (no readable source)
	r = await fetch(BASE + "/api/script");
	const gate = await r.text();
	check("one-liner gate served", r.status === 200 && /^-- CopE Loader - standalone loadstring build/.test(gate));
	const gCsv = gate.match(/string\.split\("([^"]*)", ","\)/s);
	const gSeed = gate.match(/local \w+ = (\d+)/);
	const gateBack = gCsv && gSeed ? protect.unpack(gCsv[1], Number(gSeed[1])) : "";
	check("one-liner gate unpacks to the key page", gateBack.includes("CopELoaderGate") && gateBack.includes("/api/script?key="));
	check("one-liner gate hides its own source", !gate.includes("CopELoaderGate") && !gate.includes("local function"));
	check("one-liner gate hides the payload", !gate.includes("Open Egg"));

	// 14. one-liner endpoint: valid key -> multi-part bootstrap, never plaintext
	r = await fetch(BASE + "/api/script?key=" + encodeURIComponent(key));
	const packedChunk = await r.text();
	check("one-liner packed chunk served", r.status === 200 && packedChunk.includes("loadstring(table.concat"));
	check("one-liner never embeds the whole payload", !packedChunk.includes(src) && packedChunk.length < src.length / 2);

	// unpack the bootstrap chunk, then emulate the executor: fetch each part
	// with the session token and reassemble the obfuscated payload.
	const pCsv = packedChunk.match(/string\.split\("([^"]*)", ","\)/s);
	const pSeed = packedChunk.match(/local \w+ = (\d+)/);
	const bootstrap = pCsv && pSeed ? protect.unpack(pCsv[1], Number(pSeed[1])) : "";
	check("bootstrap unpacks to the parts fetcher", bootstrap.includes("/api/part?t="));

	const tMatch = bootstrap.match(/local \w+ = "([0-9a-f]+)"/);
	const nMatch = bootstrap.match(/local \w+ = (\d+)/);
	check("bootstrap carries session token and part count", !!tMatch && !!nMatch);
	const partCount = nMatch ? Number(nMatch[1]) : 0;
	check("part count matches config", partCount === (JSON.parse(fs.readFileSync("config.json", "utf8")).parts || 4));

	// harvest the per-part seeds that the bootstrap embeds
	const seedLines = [...bootstrap.matchAll(/\[\d+\]\s*=\s*(-?\d+)[\s,]*/g)];
	const seedList = seedLines.map((m) => Number(m[1]));
	check("bootstrap embeds per-part seeds", seedList.length === partCount && seedList.every((n) => Number.isFinite(n)));

	const reassembled = [];
	for (let i = 1; i <= partCount; i++) {
		const pr = await fetch(BASE + "/api/part?t=" + tMatch[1] + "&i=" + i);
		const partCsv = await pr.text();
		check("part " + i + " served", pr.status === 200 && partCsv.split(",").length > 100);
		const embeddedSeed = seedList[i - 1];
		check("part has a stored seed", Number.isFinite(embeddedSeed));
		reassembled.push(protect.unpack(partCsv, embeddedSeed));
	}
	const fullBack = reassembled.join("");
	check("multi-part reassembly equals the obfuscated payload", fullBack === src, fullBack.length + " vs " + src.length);
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