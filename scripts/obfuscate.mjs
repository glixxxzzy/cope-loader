import { execFileSync } from "node:child_process";
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const ROOT = path.join(__dirname, "..");
const SRC = path.join(ROOT, "scripts", "main.luau");
const OUT = path.join(ROOT, "scripts", "main.obf.luau");

function clydePath() {
	const arg = process.argv.indexOf("--clyde");
	if (arg > -1 && process.argv[arg + 1]) return process.argv[arg + 1];
	if (process.env.CLYDE_PATH) return process.env.CLYDE_PATH;
	return path.join(process.env.TEMP || "", "opencode", "clyde");
}

const clyde = path.join(clydePath(), "dist", "cli", "obfuscate.js");
if (!fs.existsSync(clyde)) {
	console.error("[obfuscate] Clyde not found at " + clyde);
	console.error("[obfuscate] clone + build once: git clone https://github.com/sfr-development/Clyde-Luau-Obfuscator.git && cd it && npm install && npm run build");
	process.exit(1);
}
if (!fs.existsSync(SRC)) {
	console.error("[obfuscate] missing " + SRC);
	process.exit(1);
}

const out = execFileSync("node", [clyde, SRC, "--encode-strings", "--scramble", "--one-line", "--output", OUT], {
	encoding: "utf8",
});

const before = fs.statSync(SRC).size;
const after = fs.statSync(OUT).size;
console.log(`[obfuscate] ${SRC} (${before} b) -> ${OUT} (${after} b)`);
console.log(`[obfuscate] ratio ${(after / before).toFixed(2)}x`);

// Regression guard: readable markers from the original source must not
// survive into the shipped payload.
const obf = fs.readFileSync(OUT, "utf8");
const leaked = ["Cope Hub v5", "--[[", "print("].filter((m) => obf.includes(m));
if (leaked.length > 0) {
	console.error("[obfuscate] FAIL: readable markers leaked into output: " + leaked.join(", "));
	process.exit(1);
}