"use strict";
const { loaderIdent } = require("./protect");

// Builds the Luau chunk the buyer copies into their executor. It fetches the
// packed payload from the claim endpoint (valid + unclaimed token required),
// regenerates the keystream with the same Park-Miller LCG used server-side,
// XORs the bytes back to source, and execs it.
function buildLoader(baseUrl, token, seed, ttlSeconds) {
	const http = loaderIdent();
	const blb = loaderIdent();
	const tk = loaderIdent();
	const resp = loaderIdent();
	const body = loaderIdent();
	const buf = loaderIdent();
	const lcg = loaderIdent();
	const str = loaderIdent();
	const byte = loaderIdent();
	const lst = loaderIdent();
	const parsed = loaderIdent();
	const src = loaderIdent();
	const fn = loaderIdent();
	const url = loaderIdent();

	return [
		"-- CopE Loader -- paste into your executor, key-gated build",
		"local " + http + ' = game:GetService("HttpService")',
		"local " + url + ' = "' + baseUrl + '"',
		"local " + tk + ' = "' + token + '"',
		"",
		"local function " + resp + "()",
		"	local out = nil",
		"	pcall(function()",
		"		local r = request and request({ Url = " + url + ' .. "/api/claim?token=" .. ' + tk + ', Method = "GET" })',
		"		if type(r) == " + '"' + "table" + '"' + " and r.Body then",
		"			out = " + http + ":JSONDecode(r.Body)",
		"		elseif type(r) == " + '"' + "string" + '"' + " then",
		"			out = " + http + ":JSONDecode(r)",
		"		end",
		"	end)",
		"	return out",
		"end",
		"",
		"local " + blb + " = nil",
		"local res = " + resp + "()",
		"if not res or not res.blob then",
		"	error(" + '"' + "CopE Loader: claim failed - token invalid, used, or expired" + '"' + ")",
		"end",
		blb + " = res[" + '"' + "blob" + '"]',
		"local " + lcg + " = res[" + '"' + "seed" + '"] or 1',
		"",
		"local function " + byte + "(a)",
		"	a = (a * 16807) % 2147483647",
		"	if a == 0 then a = 12345 end",
		"	return a, a % 256",
		"end",
		"",
		"local " + parsed + " = string.split(" + blb + ', ",")',
		"local " + buf + " = {}",
		"for i = 1, #" + parsed + " do",
		"	local na, k = " + byte + "(" + lcg + ")",
		"	" + lcg + " = na",
		"	local v = tonumber(" + parsed + "[i])",
		"	" + buf + "[i] = string.char(bit32.bxor(v, k))",
		"end",
		"local " + src + " = table.concat(" + buf + ")",
		"",
		"local " + fn + " = loadstring(" + src + ")",
		"if not " + fn + " then",
		"	error(" + '"' + "CopE Loader: payload failed to compile - suspicious, do not run again" + '"' + ")",
		"end",
		"(" + fn + ")()",
		"return true",
	].join("\n");
}

module.exports = { buildLoader };