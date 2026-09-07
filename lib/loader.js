"use strict";
const { loaderIdent } = require("./protect");

// Builds the Luau chunk the seller sends to a buyer. The snippet carries the
// buyer's key and, when run in the executor, POSTs it to /api/redeem - the
// server validates the key and hands back the packed payload + seed. The
// snippet then regenerates the Park-Miller keystream, XORs the bytes back to
// source and execs it. A bad, expired or revoked key gets a server error and
// the script refuses to run.
function buildLoader(baseUrl, key) {
	const http = loaderIdent();
	const blb = loaderIdent();
	const res = loaderIdent();
	const body = loaderIdent();
	const buf = loaderIdent();
	const lcg = loaderIdent();
	const byte = loaderIdent();
	const parsed = loaderIdent();
	const src = loaderIdent();
	const fn = loaderIdent();
	const url = loaderIdent();
	const kk = loaderIdent();
	const fetchFn = loaderIdent();
	const json = loaderIdent();

	return [
		"-- CopE Loader - key-gated build. Paste into your executor.",
		"local " + http + ' = game:GetService("HttpService")',
		"local " + url + ' = "' + baseUrl + '"',
		"local " + kk + ' = "' + key + '"',
		"",
		"local function " + fetchFn + "()",
		"	local out = false",
		"	local " + json + " = " + http + ":JSONEncode({ key = " + kk + " })",
		"	pcall(function()",
		"		local r = request and request({ Url = " + url + ' .. "/api/redeem", Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = ' + json + " })",
		"		if type(r) == " + '"' + "table" + '"' + " and r.Body then",
		"			out = " + http + ":JSONDecode(r.Body)",
		"		elseif type(r) == " + '"' + "string" + '"' + " then",
		"			out = " + http + ":JSONDecode(r)",
		"		end",
		"	end)",
		"	if out == false then",
		"		pcall(function()",
		"			local resp = " + http + ':PostAsync(' + url + ' .. "/api/redeem", ' + json + ', Enum.HttpContentType.ApplicationJson)',
		"			out = " + http + ":JSONDecode(resp)",
		"		end)",
		"	end",
		"	return out",
		"end",
		"",
		"local " + res + " = " + fetchFn + "()",
		"local " + blb + " = nil",
		"if type(" + res + ") == " + '"' + "table" + '"' + " then",
		"	if " + res + ".ok == true and " + res + ".blob then",
		"		" + blb + " = " + res + ".blob",
		"	end",
		"end",
		"if " + blb + " == nil then",
		"	error(" + '"' + "CopE Loader: key rejected or server unreachable - check your key" + '"' + ")",
		"end",
		"local " + lcg + " = (" + res + " and type(" + res + ") == " + '"' + "table" + '"' + " and " + res + '["seed"]) or 1',
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