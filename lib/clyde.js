"use strict";
// Runtime Clyde obfuscation for the admin "Update" button.
//
// scripts/obfuscate.mjs covers the CLI workflow (scripts/main.luau ->
// scripts/main.obf.luau) and stays as the build-time/CI entry. This module is
// the in-process path: it takes a Luau source STRING, runs Clyde over it and
// returns the obfuscated source so the admin can paste new code into the
// website and immediately ship it as the served payload.
//
// On cloud serverless (Vercel) Clyde is not bundled, so obfuscateSource
// reports { ok:false, error } and the caller falls back to serving the
// plaintext copy rather than breaking the load.

const { execFileSync } = require("child_process");
const fs = require("fs");
const os = require("os");
const path = require("path");

function clydeCli() {
	const base = process.env.CLYDE_PATH || path.join(os.tmpdir(), "opencode", "clyde");
	const cli = path.join(base, "dist", "cli", "obfuscate.js");
	return fs.existsSync(cli) ? cli : null;
}

// obfuscate(script) -> { ok, out? | error }
function obfuscate(source) {
	const cli = clydeCli();
	if (!cli) {
		return {
			ok: false,
			error:
				"Clyde is not installed on this server (expected at CLYDE_PATH or %TEMP%/opencode/clyde). " +
				"The script was saved as plaintext - it will load, but won't be obfuscated this time.",
		};
	}
	const src = String(source || "");
	if (!src.trim()) return { ok: false, error: "Nothing to obfuscate." };

	const tag = Date.now() + "-" + Math.random().toString(36).slice(2, 8);
	const inFile = path.join(os.tmpdir(), "cope-clyde-" + tag + ".luau");
	const outFile = inFile + ".out.luau";
	try {
		fs.writeFileSync(inFile, src, "utf8");
		execFileSync(
			"node",
			[cli, inFile, "--encode-strings", "--scramble", "--one-line", "--output", outFile],
			{ encoding: "utf8", timeout: 120000, stdio: ["ignore", "pipe", "pipe"] }
		);
		const out = fs.readFileSync(outFile, "utf8");
		if (!out.trim()) return { ok: false, error: "Clyde produced empty output." };
		return { ok: true, out };
	} catch (e) {
		const detail = (e && e.stderr && String(e.stderr).trim()) || (e && e.message) || String(e);
		return {
			ok: false,
			error: "Clyde obfuscation failed: " + String(detail).slice(0, 400),
		};
	} finally {
		try {
			fs.unlinkSync(inFile);
		} catch {}
		try {
			fs.unlinkSync(outFile);
		} catch {}
	}
}

module.exports = { obfuscate, clydeCli };