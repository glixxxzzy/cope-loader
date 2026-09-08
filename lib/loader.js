"use strict";
const { loaderIdent } = require("./protect");

// JSON.stringify produces a double-quoted ASCII string that is a valid Luau
// string literal, so constants can be dropped straight into the generated
// chunk without hand-escaping quotes.
const S = (s) => JSON.stringify(String(s));

function ids(n) {
	const out = [];
	for (let i = 0; i < n; i++) out.push(loaderIdent());
	return out;
}

// Shared key-entry page, styled after the hub's own UI (same theme colors,
// Gotham fonts, gradient stroke). @UI_FN@ is the local name of the gate
// function and @RUN@ is its parameter: a callback run(key) -> ok, source.
// Both the paste-able loader and the one-liner HTTP gate embed this same UI;
// only the `run` callback differs.
const GATE_UI = [
	"local function @UI_FN@(@RUN@)",
	'\tlocal gui = Instance.new("ScreenGui")',
	'\tgui.Name = "CopELoaderGate"',
	"\tgui.ResetOnSpawn = false",
	"\tgui.IgnoreGuiInset = true",
	"\tgui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling",
	"\tgui.DisplayOrder = 1000",
	"\tlocal okH, hui = pcall(function() return getgenv and getgenv().gethui and getgenv().gethui() end)",
	'\tif okH and type(hui) == "userdata" then',
	"\t\tgui.Parent = hui",
	'\telseif game:GetService("CoreGui") then',
	'\t\tgui.Parent = game:GetService("CoreGui")',
	"\telse",
	'\t\tgui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")',
	"\tend",
	"",
	"\tlocal function C(name, props)",
	"\t\tlocal i = Instance.new(name)",
	"\t\tfor k, v in pairs(props) do",
	'\t\t\tif k ~= "Parent" then i[k] = v end',
	"\t\tend",
	"\t\ti.Parent = props.Parent",
	"\t\treturn i",
	"\tend",
	'\tlocal function Corner(r, p) return C("UICorner", { CornerRadius = UDim.new(0, r), Parent = p }) end',
	'\tlocal function Stroke(c, t, th, p) return C("UIStroke", { Color = c, Transparency = t, Thickness = th, ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = p }) end',
	"",
	"\tlocal ACCENT = Color3.fromRGB(139, 92, 246)",
	"\tlocal ACCENT2 = Color3.fromRGB(34, 211, 238)",
	"\tlocal TEXT = Color3.fromRGB(248, 248, 255)",
	"\tlocal SUB = Color3.fromRGB(166, 166, 196)",
	"\tlocal FAILC = Color3.fromRGB(248, 113, 113)",
	"\tlocal OKC = Color3.fromRGB(52, 211, 153)",
	"",
	'\tlocal shade = C("Frame", {',
	"\t\tSize = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(0, 0, 0),",
	"\t\tBackgroundTransparency = 0.45, BorderSizePixel = 0, Parent = gui,",
	"\t})",
	"",
	'\tlocal card = C("Frame", {',
	'\t\tName = "Gate", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),',
	"\t\tSize = UDim2.new(0, 384, 0, 274), BackgroundColor3 = Color3.fromRGB(11, 11, 19),",
	"\t\tBorderSizePixel = 0, ClipsDescendants = true, Parent = gui,",
	"\t})",
	"\tCorner(16, card)",
	'\tC("UIGradient", { Color = ColorSequence.new(Color3.fromRGB(11, 11, 19), Color3.fromRGB(27, 27, 52)), Rotation = 115, Parent = card })',
	"\tlocal cardStroke = Stroke(Color3.fromRGB(70, 70, 108), 0.1, 1.5, card)",
	'\tC("UIGradient", {',
	"\t\tColor = ColorSequence.new {",
	"\t\t\tColorSequenceKeypoint.new(0, ACCENT),",
	"\t\t\tColorSequenceKeypoint.new(0.5, ACCENT2),",
	"\t\t\tColorSequenceKeypoint.new(1, ACCENT),",
	"\t\t},",
	"\t\tRotation = 35, Parent = cardStroke,",
	"\t})",
	"",
	'\tlocal title = C("TextLabel", {',
	"\t\tSize = UDim2.new(1, 0, 0, 26), Position = UDim2.new(0, 0, 0, 20),",
	'\t\tBackgroundTransparency = 1, Font = Enum.Font.GothamBlack, TextSize = 18,',
	'\t\tTextColor3 = TEXT, Text = "CopE Loader", Parent = card,',
	"\t})",
	'\tlocal sub = C("TextLabel", {',
	"\t\tSize = UDim2.new(1, 0, 0, 18), Position = UDim2.new(0, 0, 0, 49),",
	'\t\tBackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 11.5,',
	'\t\tTextColor3 = SUB, Text = "Enter your key to unlock the script", Parent = card,',
	"\t})",
	'\tC("Frame", {',
	"\t\tSize = UDim2.fromOffset(140, 2), Position = UDim2.new(0.5, -70, 0, 76),",
	"\t\tBackgroundColor3 = ACCENT, BorderSizePixel = 0, Parent = card,",
	"\t})",
	"",
	'\tlocal close = C("TextButton", {',
	"\t\tSize = UDim2.fromOffset(30, 30), Position = UDim2.new(1, -42, 0, 14),",
	'\t\tBackgroundTransparency = 1, BorderSizePixel = 0, Font = Enum.Font.GothamBold,',
	'\t\tTextSize = 16, TextColor3 = SUB, Text = "x", AutoButtonColor = false, Parent = card,',
	"\t})",
	"\tclose.MouseEnter:Connect(function() close.TextColor3 = FAILC end)",
	"\tclose.MouseLeave:Connect(function() close.TextColor3 = SUB end)",
	"",
	'\tlocal box = C("TextBox", {',
	'\t\tName = "Key", Size = UDim2.new(1, -40, 0, 40), Position = UDim2.new(0, 20, 0, 92),',
	"\t\tBackgroundColor3 = Color3.fromRGB(38, 38, 60), BorderSizePixel = 0,",
	"\t\tFont = Enum.Font.GothamMedium, TextSize = 13, TextColor3 = TEXT,",
	"\t\tPlaceholderColor3 = Color3.fromRGB(120, 120, 150), PlaceholderText = \"Type your key here\",",
	"\t\tTextXAlignment = Enum.TextXAlignment.Left, ClearTextOnFocus = false, Parent = card,",
	"\t})",
	"\tCorner(9, box)",
	"\tStroke(Color3.fromRGB(70, 70, 108), 0.2, 1, box)",
	'\tC("UIPadding", { PaddingLeft = UDim.new(0, 14), PaddingRight = UDim.new(0, 10), Parent = box })',
	"",
	'\tlocal status = C("TextLabel", {',
	"\t\tSize = UDim2.new(1, -24, 0, 18), Position = UDim2.new(0, 12, 0, 140),",
	'\t\tBackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 11.5,',
	'\t\tTextColor3 = SUB, Text = "", Parent = card,',
	"\t})",
	"",
	'\tlocal btn = C("TextButton", {',
	"\t\tSize = UDim2.new(1, -40, 0, 42), Position = UDim2.new(0, 20, 0, 164),",
	"\t\tBackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0,",
	"\t\tAutoButtonColor = false, Parent = card,",
	"\t})",
	"\tCorner(10, btn)",
	'\tC("UIGradient", {',
	"\t\tColor = ColorSequence.new(ACCENT, ACCENT2), Rotation = 110, Parent = btn,",
	"\t})",
	'\tlocal btnTxt = C("TextLabel", {',
	"\t\tSize = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamBold,",
	'\t\tTextSize = 13, TextColor3 = Color3.fromRGB(8, 10, 22), Text = "Unlock", Parent = btn,',
	"\t})",
	'\tlocal ov = C("Frame", {',
	"\t\tSize = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(1, 1, 1),",
	"\t\tBackgroundTransparency = 1, BorderSizePixel = 0, Parent = btn,",
	"\t})",
	"\tCorner(10, ov)",
	"\tbtn.MouseEnter:Connect(function() ov.BackgroundTransparency = 0.86 end)",
	"\tbtn.MouseLeave:Connect(function() ov.BackgroundTransparency = 1 end)",
	"",
	'\tC("TextLabel", {',
	"\t\tSize = UDim2.new(1, 0, 0, 16), Position = UDim2.new(0, 0, 1, -22),",
	'\t\tBackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 10.5,',
	'\t\tTextColor3 = SUB, Text = "CopE Loader - key is verified on the server", Parent = card,',
	"\t})",
	"",
	"\tlocal busy = false",
	'\tlocal function trim(s) return (s or ""):match("^%s*(.-)%s*$") or "" end',
	"\tlocal function setStatus(t, isOk)",
	"\t\tstatus.Text = t",
	"\t\tstatus.TextColor3 = isOk and OKC or FAILC",
	"\tend",
	"\tlocal function submit()",
	"\t\tif busy then return end",
	"\t\tlocal v = trim(box.Text)",
	'\t\tif v == "" then',
	"\t\t\tsetStatus(\"Type your key to continue\", false)",
	"\t\t\tpcall(function() box:CaptureFocus() end)",
	"\t\t\treturn",
	"\t\tend",
	"\t\tbusy = true",
	'\t\tbtnTxt.Text = "Verifying..."',
	"\t\tlocal ok, src = @RUN@(v)",
	"\t\tif not ok then",
	"\t\t\tbusy = false",
	'\t\t\tbtnTxt.Text = "Unlock"',
	"\t\t\tsetStatus(tostring(src), false)",
	"\t\t\treturn",
	"\t\tend",
	'\t\tsetStatus("Key accepted - starting...", true)',
	"\t\tlocal fn = loadstring(src)",
	"\t\tif not fn then",
	"\t\t\tbusy = false",
	'\t\t\tbtnTxt.Text = "Unlock"',
	"\t\t\tsetStatus(\"Payload failed to compile - do not run again\", false)",
	"\t\t\treturn",
	"\t\tend",
	"\t\tlocal ok2, err = pcall(fn)",
	"\t\tif ok2 then",
	"\t\t\tpcall(function() gui:Destroy() end)",
	"\t\telse",
	"\t\t\tbusy = false",
	'\t\t\tbtnTxt.Text = "Unlock"',
	'\t\t\tsetStatus("Script crashed: " .. tostring(err), false)',
	"\t\tend",
	"\tend",
	"",
	"\tbtn.Activated:Connect(submit)",
	"\tbox.FocusLost:Connect(function(enter)",
	"\t\tif enter then submit() end",
	"\tend)",
	"\tclose.MouseButton1Click:Connect(function()",
	"\t\tpcall(function() gui:Destroy() end)",
	"\tend)",
	"\tpcall(function() box:CaptureFocus() end)",
	"end",
];

function gateUiChunk(uiFnName, runArg) {
	return GATE_UI.join("\n")
		.split("@UI_FN@").join(uiFnName)
		.split("@RUN@").join(runArg);
}

// Builds the Luau chunk the seller sends to a buyer.
//   baseUrl  - where the CopE Loader API is hosted
//   key      - if given, the key is baked in and the script validates +
//              runs silently (one-click loader). If omitted, a key-entry
//              page styled like the hub itself is shown first, and the key
//              is collected in-game before anything runs.
// Within the snippet run(key) POSTs to /api/redeem: the server validates the
// key and returns the packed payload + seed, the snippet regenerates the
// Park-Miller keystream, XORs the bytes back to source and execs it.
function buildLoader(baseUrl, key) {
	baseUrl = String(baseUrl || "").replace(/\/+$/, "");

	const [
		http, fetchFn, json, runFn, res, blb, lcg, byteFn,
		parsed, buf, src, ok, fn, good, ui, gateRun,
	] = ids(16);

	return [
		"-- CopE Loader - key-gated build. Paste into your executor.",
		"local " + http + ' = game:GetService("HttpService")',
		"local " + json + ' = "' + baseUrl + '"',
		"",
		"local function " + fetchFn + "(kk)",
		"\tlocal out = false",
		"\tlocal body = " + http + ":JSONEncode({ key = kk })",
		"\tpcall(function()",
		"\t\tlocal r = request and request({ Url = " + json + ' .. "/api/redeem", Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = body })',
		'\t\tif type(r) == "table" and r.Body then',
		"\t\t\tout = " + http + ":JSONDecode(r.Body)",
		'\t\telseif type(r) == "string" then',
		"\t\t\tout = " + http + ":JSONDecode(r)",
		"\t\tend",
		"\tend)",
		"\tif out == false then",
		"\t\tpcall(function()",
		"\t\t\tlocal resp = " + http + ":PostAsync(" + json + ' .. "/api/redeem", body, Enum.HttpContentType.ApplicationJson)',
		"\t\t\tout = " + http + ":JSONDecode(resp)",
		"\t\tend)",
		"\tend",
		"\treturn out",
		"end",
		"",
		// run(key) -> ok, source; ok=false carries a readable error message.
		"local function " + runFn + "(kk)",
		"\tlocal " + res + " = " + fetchFn + "(kk)",
		"\tlocal " + blb + " = nil",
		'\tif type(' + res + ') == "table" then',
		"\t\tif " + res + ".ok == true and " + res + ".blob then",
		"\t\t\t" + blb + " = " + res + ".blob",
		"\t\tend",
		"\tend",
		"\tif " + blb + ' == nil then',
		"\t\tlocal msg = (" + res + ' and type(' + res + ') == "table" and ' + res + ".error) or \"key rejected or server unreachable\"",
		"\t\treturn nil, msg",
		"\tend",
		"\tlocal " + lcg + " = (" + res + ' and type(' + res + ') == "table" and ' + res + '.seed) or 1',
		"\tlocal function " + byteFn + "(a)",
		"\t\ta = (a * 16807) % 2147483647",
		"\t\tif a == 0 then a = 12345 end",
		"\t\treturn a, a % 256",
		"\tend",
		"\tlocal " + parsed + ' = string.split(' + blb + ', ",")',
		"\tlocal " + buf + " = {}",
		"\tfor i = 1, #" + parsed + " do",
		"\t\tlocal na, k = " + byteFn + "(" + lcg + ")",
		"\t\t" + lcg + " = na",
		"\t\t" + buf + "[i] = string.char(bit32.bxor(tonumber(" + parsed + "[i]) or 0, k))",
		"\tend",
		"\treturn true, table.concat(" + buf + ")",
		"end",
		"",
	].concat(
		key
			? [ // ------------------------------------------------------- one-click
				"local " + ok + ", " + src + " = " + runFn + "(" + S(key) + ")",
				"if not " + ok + " then",
				"\terror(\"CopE Loader: \" .. tostring(" + src + "))",
				"end",
				"local " + fn + " = loadstring(" + src + ")",
				"if not " + fn + " then",
				"\terror(\"CopE Loader: payload failed to compile - suspicious, do not run again\")",
				"end",
			buildTelemetryChunk(baseUrl, key),
			"local " + good + " = pcall(" + fn + ")",
			"return " + good + "",
		]
		: [ // ---------------------------------------------- key-entry page
			gateUiChunk(ui, gateRun),
			"",
			ui + "(" + runFn + ")",
			"\nreturn nil",
		]
	).join("\n") + "";
}

// The one-liner bootstrap served by GET /api/script (no key in the URL):
// loadstring(game:HttpGet(".../api/script"))(). It shows the same key page;
// on submit it re-fetches .../api/script?key=<key> and loadstrings whatever
// the server returns - which is a packed, self-decoding chunk, never the
// plaintext script.
function buildHttpGate(baseUrl) {
	baseUrl = String(baseUrl || "").replace(/\/+$/, "");
	const ui = loaderIdent();
	const run = loaderIdent();
	return [
		"-- CopE Loader - one-liner key gate. Paste into your executor.",
		"local " + run + " = function(kk)",
		"\tlocal url = " + S(baseUrl) + ' .. "/api/script?key=" .. kk',
		"\tlocal okF, body = pcall(function() return game:HttpGet(url) end)",
		"\tif not okF or type(body) ~= " + '"' + "string" + '"' + " or body == " + '""' + " then",
		"\t\tpcall(function() body = game:GetService(\"HttpService\"):GetAsync(url) end)",
		"\tend",
		'\tif type(body) ~= "string" or body == "" then',
		'\t\treturn nil, "CopE Loader: could not fetch the script - check your connection"',
		"\tend",
		"\treturn true, body",
		"end",
		"",
		gateUiChunk(ui, run),
		"",
		ui + "(" + run + ")",
		"return nil",
	].join("\n");
}

// Standalone, self-contained loadstring build: the script is packed with the
// same Park-Miller + XOR cipher and the packed blob rides inside the chunk,
// so it needs no server and no key. Served by /api/script on a valid key, and
// by the site's offline "convert" feature. `seed` selects the keystream so two
// builds are never identical.
function buildLoadstring(csv, seed) {
	const a = loaderIdent();
	const s = loaderIdent();
	const b = loaderIdent();
	const f = loaderIdent();
	return [
		"-- CopE Loader - standalone loadstring build (no server required)",
		"local " + a + " = string.split(" + JSON.stringify(String(csv)) + ', ",")',
		"local " + s + " = " + seed,
		"local " + b + " = {}",
		"for i = 1, #" + a + " do",
		"\t" + s + " = (" + s + " * 16807) % 2147483647",
		"\tif " + s + " == 0 then " + s + " = 12345 end",
		"\t" + b + "[i] = string.char(bit32.bxor(tonumber(" + a + "[i]) or 0, " + s + " % 256))",
		"end",
		"local " + f + " = loadstring(table.concat(" + b + "))",
		"if not " + f + " then",
		"\terror(\"CopE Loader: standalone build failed to compile\")",
		"end",
		"(" + f + ")()",
		"return true",
	].join("\n");
}

// Keyed one-liner payload bootstrap. Unlike the single-chunk buildLoadstring,
// the server returns THIS when a valid key is used: a small Luau stub that
// fetches the real payload in N separately-packed parts from one-time session
// URLs (/api/part?t=TOKEN&i=N). A single HTTP response therefore never
// contains the whole script; every part must be gathered inside the executor,
// inside the token's short TTL, and each part uses its own seed. `cfg` carries
// { token, base, count, seeds } where seeds[i] unlocks part i+1.
function buildPartsBootstrap(cfg) {
	const base = String(cfg.base || "").replace(/\/+$/, "");
	const [
		tk, url, body, oks, bd, idx, partCsv,
		ps, part, pbuf, fi, lcgS, byteFn, nxt, kv, source,
		combined, fn, good,
	] = ids(19);

	return [
		"-- CopE Loader - keyed payload bootstrap (multi-part session)",
		"local " + tk + " = " + JSON.stringify(String(cfg.token)),
		"local " + url + " = " + JSON.stringify(base),
		"local " + idx + " = {}",
		"local " + ps + " = " + Number(cfg.count),
		"local " + kv + " = {}",
	].concat(
		(cfg.seeds || []).map((s, i) =>
			"\t" + kv + "[" + (i + 1) + "] = " + Number(s)
		)
	).concat([
		"",
		"for " + fi + " = 1, " + ps + " do",
		"\tlocal " + body + ' = ""',
		"\tlocal " + oks + ", " + bd + " = pcall(function() return game:HttpGet(" + url + ' .. "/api/part?t=" .. ' + tk + ' .. "&i=" .. ' + fi + ") end)",
		"\tif " + oks + " and type(" + bd + ') == "string" and ' + bd + ' ~= "" then',
		"\t\t" + body + " = " + bd,
		"\tend",
		'\tif ' + body + ' == "" then',
		"\t\tpcall(function()",
		"\t\t\tlocal hs = game:GetService(\"HttpService\")",
		'\t\t\t' + body + " = hs:GetAsync(" + url + ' .. "/api/part?t=" .. ' + tk + ' .. "&i=" .. ' + fi + ")",
		"\t\tend)",
		"\tend",
		"\tlocal " + lcgS + " = " + kv + "[" + fi + "]",
		"\tlocal function " + byteFn + "(a)",
		"\t\ta = (a * 16807) % 2147483647",
		"\t\tif a == 0 then a = 12345 end",
		"\t\treturn a, a % 256",
		"\tend",
		"\tlocal " + partCsv + ' = string.split(' + body + ', ",")',
		"\tlocal " + pbuf + " = {}",
		"\tfor i = 1, #" + partCsv + " do",
		"\t\tlocal na, k = " + byteFn + "(" + lcgS + ")",
		"\t\t" + lcgS + " = na",
		"\t\t" + pbuf + "[i] = string.char(bit32.bxor(tonumber(" + partCsv + "[i]) or 0, k))",
		"\tend",
		"\t" + idx + "[" + fi + "] = table.concat(" + pbuf + ")",
		"end",
		"",
		"local " + source + " = table.concat(" + idx + ")",
		"local " + fn + " = loadstring(" + source + ")",
		"if not " + fn + " then",
		"\terror(\"CopE Loader: payload failed to compile - suspicious, do not run again\")",
		"end",
		buildTelemetryChunk(base, cfg.key),
		"local " + good + " = pcall(" + fn + ")",
		"return " + good + "",
	]).join("\n");
}

// Fire-and-forget telemetry: reports username, userId, executor, and key to
// /api/telemetry the moment the payload runs. Wrapped in pcall+spawn so it
// never blocks or crashes the script even if the environment is unusual.
function buildTelemetryChunk(baseUrl, key) {
	baseUrl = String(baseUrl || "").replace(/\/+$/, "");
	const [
		plrs, lp, nm, uid, ex, body, g,
	] = ids(7);

	return [
		"-- telemetry beacon (fire-and-forget)",
		"spawn(function()",
		"pcall(function()",
		"local " + plrs + ' = game:GetService("Players")',
		"local " + lp + " = " + plrs + " and " + plrs + ".LocalPlayer",
		"local " + nm + " = " + lp + " and " + lp + ".Name or \"\"",
		"local " + uid + " = tostring((" + lp + " and " + lp + ".UserId) or 0)",
		"local " + ex + ' = "Unknown"',
		"pcall(function() " + ex + " = identifyexecutor() end)",
		"if type(" + ex + ') ~= "string" or ' + ex + ' == "" then ' + ex + ' = "Unknown" end',
		"if " + ex + ' == "Unknown" then',
		"  pcall(function() " + ex + " = getgenv().ExecutorName end)",
		"  if type(" + ex + ') ~= "string" or ' + ex + ' == "" then ' + ex + ' = "Unknown" end',
		"end",
		"if " + ex + ' == "Unknown" then',
		"  local " + g + " = getgenv and getgenv()",
		"  if " + g + " then",
		"    if " + g + ".Synapse then " + ex + ' = "Synapse"',
		"    elseif " + g + ".Fluxus then " + ex + ' = "Fluxus"',
		"    elseif " + g + ".Krnl then " + ex + ' = "Krnl"',
		"    elseif " + g + ".ProtoSmasher then " + ex + ' = "ProtoSmasher"',
		"    elseif " + g + ".ScriptWare then " + ex + ' = "ScriptWare"',
		"    end",
		"  end",
		"end",
		"local " + body + " = game:GetService(\"HttpService\"):JSONEncode({",
		"\tusername = " + nm + ",",
		"\tuserId = " + uid + ",",
		"\texecutor = " + ex + ",",
		"\tkey = " + S(key || "") + ",",
		"})",
		"pcall(function()",
		"\tgame:GetService(\"HttpService\"):PostAsync(" + S(baseUrl) + ' .. "/api/telemetry", ' + body + ", Enum.HttpContentType.ApplicationJson, false)",
		"end)",
		"pcall(function()",
		"\tif type(request) == \"function\" then",
		"\t\trequest({ Url = " + S(baseUrl) + ' .. "/api/telemetry", Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = ' + body + " })",
		"\tend",
		"end)",
		"end)",
		"end)",
	].join("\n");
}

module.exports = { buildLoader, buildHttpGate, buildLoadstring, buildPartsBootstrap, buildTelemetryChunk };