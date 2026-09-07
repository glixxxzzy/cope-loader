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

	// 3. generate keys
	r = await fetch(BASE + "/api/admin/keys", {
		method: "POST",
		headers: { "Content-Type": "application/json", Cookie: "sid=" + sid },
		body: JSON.stringify({ count: 1, note: "test buyer", expiresIn: "" }),
	});
	d = await r.json();
	check("key generated", d.ok === true && d.keys.length === 1);
	const key = d.keys[0].key;
	console.log("key:", key);

	// 4. redeem with bad key
	r = await fetch(BASE + "/api/redeem", {
		method: "POST",
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({ key: "KEY-NOPE" }),
	});
	d = await r.json();
	check("bad key rejected", !d.ok);

	// 5. redeem with good key
	r = await fetch(BASE + "/api/redeem", {
		method: "POST",
		headers: { "Content-Type": "application/json" },
		body: JSON.stringify({ key }),
	});
	d = await r.json();
	check("good key redeemed", d.ok === true && !!d.loader && !!d.ttlSeconds);
	const tv = (d.loader.match(/\/api\/claim\?token=" \.\. ([A-Za-z0-9_]+)/) || [])[1];
	const token = tv ? (d.loader.match(new RegExp('local ' + tv + ' = "([0-9a-f]+)"')) || [])[1] : null;
	check("token embedded in loader", !!token, tv || "no token var");

	// 6. claim
	r = await fetch(BASE + "/api/claim?token=" + token);
	d = await r.json();
	check("claim returns packed blob", !!d.blob && !!d.seed);
	const src = fs.readFileSync("scripts/main.luau", "utf8");
	const back = protect.unpack(d.blob, d.seed);
	check("blob unpacks to exact payload", back === src, back.length + " vs " + src.length);

	// 7. second claim must fail (single-use)
	r = await fetch(BASE + "/api/claim?token=" + token);
	check("second claim rejected (409)", r.status === 409);

	// 8. admin session required for admin endpoints
	r = await fetch(BASE + "/api/admin/keys");
	check("admin without session blocked (401)", r.status === 401);

	// 9. no admin access to payload without token
	r = await fetch(BASE + "/scripts/main.luau");
	check("payload not directly served (404)", r.status === 404);
}

main().catch((e) => {
	console.error("ERROR", e);
	process.exit(1);
});