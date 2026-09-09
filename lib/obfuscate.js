"use strict";
// Layer 3: pre-obfuscated multi-part fetcher bootstrap.
//
// The parts bootstrap (the Luau that fetches each payload part and XOR-decrypts
// it) is generated ONCE at build time by `npm run build-chunks`, which runs
// Clyde (string-encode + control-flow-scramble + local rename) over the fixed
// fetch/unpack logic and writes scripts/fetcher.obf.luau (committed to the repo).
//
// At serve time we never re-run Clyde - we just append a tiny plaintext wrapper
// that injects the per-session values (token, seeds, count, base) into the
// pre-obfuscated template. The heavy decryption logic therefore ships as
// opaque, scrambled code, while the only readable line is a request of opaque
// integers/strings. This keeps Layer 3 fully functional on Vercel (no 600 KB
// toolchain needed at runtime) while hiding the parts-fetch/decrypt logic.
//
// If the committed template is missing or unusable, assembleFetcherChunk returns
// null and the caller falls back to the plaintext parts fetcher (buildPartsBootstrap),
// so the loader can never break because an obfuscation artifact went away.

const fs = require("fs");
const path = require("path");

let fetcherTemplate = null; // cached contents of scripts/fetcher.obf.luau

// Build a serve-time multi-part bootstrap from the pre-obfuscated fetcher
// template plus the per-session call. cfg = { token, seeds, count, base, key }.
// Returns a Luau source string, or null if the template is unavailable.
async function assembleFetcherChunk(cfg, templatePath) {
	if (!cfg || !templatePath) return null;
	if (typeof cfg.token !== "string" || !cfg.token) return null;
	if (!fs.existsSync(templatePath)) return null;
	if (fetcherTemplate === null) {
		try {
			fetcherTemplate = fs.readFileSync(templatePath, "utf8");
		} catch {
			fetcherTemplate = "";
		}
	}
	if (!fetcherTemplate) return null;

	const base = String(cfg.base || "").replace(/\/+$/, "");
	const seeds = (cfg.seeds || []).map((s) => {
		const n = Number(s);
		return Number.isFinite(n) ? n : 0;
	});
	const count = Math.max(2, Number(cfg.count || seeds.length) || 0);

	const source =
		fetcherTemplate +
		"\nlocal _src = COPE_FETCH(" +
		JSON.stringify(String(cfg.token)) +
		", {" +
		seeds.join(",") +
		"}, " +
		count +
		", " +
		JSON.stringify(base) +
		")\n" +
		"local _f = loadstring(_src)\n" +
		'if not _f then error("CopE Loader: payload failed to compile - do not run again") end\n' +
		(() => {
			const { buildTelemetryChunk } = require("./loader");
			return buildTelemetryChunk(base, cfg.key || "") + "\n";
		})() +
		"local _ok, _err = pcall(_f)\n" +
		'if not _ok then error("CopE Loader payload error: " .. tostring(_err)) end\n' +
		"return _ok";
	return source;
}

module.exports = { assembleFetcherChunk };
