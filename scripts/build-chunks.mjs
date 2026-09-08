import { lex } from "file:///C:/Users/munna/AppData/Local/Temp/opencode/clyde/dist/lexer/Lexer.js";
import { parse } from "file:///C:/Users/munna/AppData/Local/Temp/opencode/clyde/dist/parser/Parser.js";
import { obfuscate } from "file:///C:/Users/munna/AppData/Local/Temp/opencode/clyde/dist/obfuscator/Obfuscator.js";
import { encodeStrings } from "file:///C:/Users/munna/AppData/Local/Temp/opencode/clyde/dist/obfuscator/StringEncoder.js";
import { scrambleControlFlow } from "file:///C:/Users/munna/AppData/Local/Temp/opencode/clyde/dist/obfuscator/ControlFlowScrambler.js";
import { printChunk } from "file:///C:/Users/munna/AppData/Local/Temp/opencode/clyde/dist/obfuscator/Printer.js";
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

function obf(src) {
	const { tokens, errors } = lex(src);
	if (errors.length > 0) throw new Error("lex: " + JSON.stringify(errors));
	let ast = parse(tokens);
	ast = encodeStrings(ast, { enabled: true });
	ast = scrambleControlFlow(ast, { enabled: true });
	return printChunk(obfuscate(ast, { renameLocals: true, preserveGlobals: true }));
}

// The heart of the multi-part fetch + unpack. Exposed as a GLOBAL named
// function so the serve-time wrapper can pass per-session values into it
// while the derived-client control flow stays Clyde-scrambled. Reads:
//   arg1 = session token, arg2 = seeds table, arg3 = part count, arg4 = base url
// Returns the fully reassembled source string.
const FETCHER_LOGIC = [
  "COPE_FETCH = function(token, seeds, count, base)",
  "  local result = {}",
  "  for i = 1, count do",
  '    local ok, body = pcall(function() return game:HttpGet(base .. "/api/part?t=" .. token .. "&i=" .. i) end)',
  "    if not ok or type(body) ~= \"string\" or body == \"\" then",
  '      pcall(function() body = game:GetService("HttpService"):GetAsync(base .. "/api/part?t=" .. token .. "&i=" .. i) end)',
  "    end",
  '    if type(body) ~= "string" or body == "" then error("CopE Loader: part fetch failed") end',
  "    local lcg = seeds[i]",
  "    local buf = {}",
  "    local n = 0",
  "    for byte in string.gmatch(body, \"%d+\") do",
  "      n = n + 1",
  "      lcg = (lcg * 16807) % 2147483647",
  "      if lcg == 0 then lcg = 12345 end",
  "      buf[n] = string.char(bit32.bxor(tonumber(byte), lcg % 256))",
  "    end",
  "    result[i] = table.concat(buf)",
  "  end",
  "  return table.concat(result)",
  "end",
  "COPE_FETCH = COPE_FETCH",
].join("\n");

// Gate logic for the no-key one-liner: shows the in-game key page, then on
// submit fetches /api/script?key=... and loadstrings the returned chunk.
// base is passed in so this template stays deploy-agnostic.
function buildTemplates(outDir) {
	const fetcher = obf(FETCHER_LOGIC);
	fs.writeFileSync(path.join(outDir, "fetcher.obf.luau"), fetcher, "utf8");
	console.log("[chunks] fetcher.obf.luau", fetcher.length, "bytes");
	return { fetcher };
}

const outDir = process.argv[2] || path.join(__dirname, "..", "scripts");
buildTemplates(outDir);
