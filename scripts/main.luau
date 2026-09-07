--[[
	Cope Hub v5 — PSX copy (place 102676685387099)
	Custom animated UI (no library): drifting aurora background, gradient sweeps,
	ripple clicks, sliding pages. K or a rebindable hotkey toggles it.
	Tabs: Farm / Eggs / Collect / Delete / Boosts / Webhook / Stats / Performance / Settings
	Floating stats widget pinned above the game's Hoverboard button.

	Threading model (anti-cheat trap on WorldCmds.HasArea):
	- The main thread builds ALL UI and never touches the game Library module.
	- Every game Library call (Save.Get, HasArea, WorldCmds, Network) runs in
	  task.spawn workers, which are immune to the capability strip.
	- Workers hand plain data back through State for the main thread UI loop.
]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local Prev = getgenv().AreaFarm
if Prev and type(Prev._stop) == "function" then
	pcall(Prev._stop)
end

local AreaFarm = {
	Config = {
		AutoFarm = false, TargetArea = nil, World = nil,
		MaxDistance = 0, FireDelay = 0.05, LeaveOnBreak = true,
		AutoEggs = false, EggKey = nil, EggAmount = 3, SkipAnim = true, HatchDelay = 0.8,
		EggStay = false,
		MultiTargets = 3, FarmAllArea = false,
		StrongestOnly = false,
		SafeFireRate = 100,
		AutoOrbs = false, AutoBags = false, MagnetOrbs = false, MagnetBags = false,
		WebhookURL = "", WebhookEnabled = false,
		BoostKey = "Triple Coins", BoostAmount = 1, BoostUseAmount = 1,
		AutoDeleteExclusives = false, AutoOpenExclusive = false, ExclusiveOpenDelay = 1,
		AutoDeleteFilter = false, DeleteRarities = {}, KeepVariants = {},
		ProtectHugeTitanic = true,
		AutoTradeHuges = false, TradeTarget = "",
		PerfNoShadows = false, PerfTextures = false, PerfParticles = false, PerfHidePlayers = false,
		HideOrbs = false, HideLootbags = false, HideBreakables = false, HideBreakFx = true,
		DebrisSweep = true, DebrisSweepSecs = 20, KillIdleTracker = true,
		MemGuard = true, MemGuardMb = 2600, MemRejoinHours = 0, StabilityV = 0,
		LeakGuard = true, LeakPurgeSecs = 30, NoRejoin = true,
		BgMode = false, BgAuto = false, BgFpsCap = 30, BgRender3D = true,
		AntiAFK = true, AutoRejoin = true, HotkeyName = "RightShift", DisablePopups = false,
		AutoBestArea = true, AutoWorldProgress = false, AutoCompleteGame = false,
		ACGResumeFarm = nil,
		AutoGifts = false,
		PotionKeepStock = 10, PotionDiamondFloor = 100000, PotionKeepBoosts = { "Triple Coins" }, PotionAutoUse = true,
		AutoEnchant = false, EnchantDesired = {}, EnchantBatch = 10, EnchantDiamondFloor = 0, EnchantSkipLocked = true,
		DarkMatterKey = nil, AutoDarkMatter = false, DMAutoSkip = true, DMDiamondFloor = 5000000,
		AutoOpenGifts = false, GiftKey = nil,
		GiftDeleteNormal = true, GiftDeleteGolden = false, GiftDeleteRainbow = false,
		GiftBatchEnabled = false, GiftBatchMinutes = 15, GiftBatchCount = 25,
		DiamondPackIndex = nil, AutoDiamondPacks = false, DiamondPackInterval = 5,
		DiamondPackCap = 0, DiamondPackReservePct = 0, DiamondPackTarget = 0,
		AutoGolden = false, AutoRainbow = false, MachineDiamondFloor = 0,
		AutoIndex = false, IndexWorlds = {}, IndexHatchAmount = 3, IndexUseMachines = true,
		IndexForceSkipDM = true, IndexDiamondFloor = 0, IndexEggCap = 0, IndexEggPatience = 600,
		IndexHatchDelay = 1.2, IndexGoldenEggs = true,
		KickAlert = true, TradeJournal = false,
		AutoSaveSettings = true,
		Accent1 = "8B5CF6", Accent2 = "22D3EE",
		UIBgStyle = "Aurora", UIBgPreset = "Midnight", UIBgIntensity = 100,
		UIAnimSpeed = 100, UIMotion = true, UIScale = 100, UIBlur = false,
			PerfPostFX = false, PerfMaxMode = false,
	},
	Stats = { Coins = 0, Damage = 0, Eggs = 0, Orbs = 0, Bags = 0, Huges = 0, Deleted = 0, ExEggsOpened = 0, EnchantRolls = 0, EnchantDone = 0, DMMade = 0, GiftsOpened = 0, GoldenMade = 0, RainbowMade = 0, IndexNew = 0 },
	State = {
		Ready = false, DataVersion = 0, AppliedVersion = 0, PendingData = nil,
		SwitchingWorld = false, OpenEggConns = nil, OpenEggDisabled = false,
		NotifyQueue = {}, EggErrorShown = false, LastSig = nil,
		WebhookHooked = false, HatchesSeen = 0, BoostBusy = false, DeleteScanning = false,
		DeleteQueue = {}, DeleteBusy = false, PetAddedHooked = false,
		BlockingHuges = {},
		ExclusivePaused = false,
		TradeBusy = false, TradeId = nil, TradeResult = nil, TradeStatus = "idle", TradeHooks = false,
		TradesDone = 0,
		DMBusy = false, DMPets = nil, DMPetsVersion = 0, DMPetsApplied = -1, DMSig = nil,
		GiftTrashIds = nil, GiftNote = "idle", GiftList = nil, GiftListVersion = 0, GiftListApplied = -1, GiftBusy = false, GiftErrShown = false,
		-- Timed batch opener: GiftDeleteArmed lets a one-off / batch run use the
		-- auto-delete pipeline without flipping the user's "Auto Open Gifts" toggle.
		GiftDeleteArmed = false, GiftBatchNote = "off", GiftBatchRuns = 0,
		GiftBatchNextAt = 0, GiftBatchLastAt = 0, GiftBatchMinsUsed = 0,
		GoldenBusy = false, RainbowBusy = false, GoldenNote = "idle", RainbowNote = "idle",
		GoldenErrShown = false, RainbowErrShown = false, GoldenIdleNotified = false, RainbowIdleNotified = false,
		MachineBrokeNotified = false,
		IndexBusy = false, IndexNote = "off", IndexEgg = nil, IndexWorld = nil,
		IndexTargets = nil, IndexTotal = 0, IndexCollection = nil, IndexHave = 0,
		IndexNeedIds = nil, IndexNoProtect = false, IndexFullNotified = false,
		IndexKeepUids = nil, IndexKeepAt = 0, IndexKeepBusy = false,
		IndexGoldenActive = false,
		OctupleWarned = false,
		DMIdleNotified = false, DMFullNotified = false, DMBrokeNotified = false, DMErrShown = false,
		UIVisible = false, DiaStart = nil,
		RebindWaiting = false, LastIdleSpoof = nil, RejoinedOnce = false,
	},
	Library = nil, Window = nil, Gen = 0,
}
local Config, Stats, State = AreaFarm.Config, AreaFarm.Stats, AreaFarm.State
local myGen = AreaFarm.Gen
getgenv().AreaFarm = AreaFarm
-- Build stamp. Three tabs silently ran a stale copy of this file once and it
-- cost most of a debugging session, so every load says what it is. Read
-- getgenv().AreaFarmBuild from anywhere to see which build a tab is on.
AreaFarm.BUILD = "2026-09-02-stability"
getgenv().AreaFarmBuild = AreaFarm.BUILD

-- ------------------------------------------------------------------
-- Settings persistence (survives reload / rejoin)
-- ------------------------------------------------------------------
local SAVE_KEYS = {
	"AutoFarm", "TargetArea", "World", "MaxDistance", "FireDelay", "LeaveOnBreak",
	"AutoEggs", "EggKey", "EggAmount", "SkipAnim", "HatchDelay", "EggStay",
	"AutoOrbs", "AutoBags", "MagnetOrbs", "MagnetBags",
	"MultiTargets",
	"FarmAllArea",
	"StrongestOnly",
	"SafeFireRate",
	"WebhookURL", "WebhookEnabled",
	"BoostKey", "BoostAmount", "BoostUseAmount",
	"AutoDeleteExclusives", "AutoOpenExclusive", "ExclusiveOpenDelay",
	"AutoDeleteFilter", "DeleteRarities", "KeepVariants", "ProtectHugeTitanic",
	"AutoTradeHuges", "TradeTarget",
	"PerfNoShadows", "PerfTextures", "PerfParticles", "PerfHidePlayers", "PerfPostFX", "PerfMaxMode",
	"HideOrbs", "HideLootbags", "HideBreakables", "HideBreakFx",
	"DebrisSweep", "DebrisSweepSecs", "KillIdleTracker",
	"MemGuard", "MemGuardMb", "MemRejoinHours", "StabilityV",
	"LeakGuard", "LeakPurgeSecs", "NoRejoin",
	"BgMode", "BgAuto", "BgFpsCap", "BgRender3D",
	"AntiAFK", "AutoRejoin", "HotkeyName", "DisablePopups",
	"AutoBestArea", "AutoWorldProgress", "AutoCompleteGame",
	"AutoGifts",
	"PotionKeepStock", "PotionDiamondFloor", "PotionKeepBoosts", "PotionAutoUse",
	"AutoEnchant", "EnchantDesired", "EnchantBatch", "EnchantDiamondFloor", "EnchantSkipLocked",
	"DarkMatterKey", "AutoDarkMatter", "DMAutoSkip", "DMDiamondFloor",
	"AutoOpenGifts", "GiftKey",
	"GiftDeleteNormal", "GiftDeleteGolden", "GiftDeleteRainbow",
	"GiftBatchEnabled", "GiftBatchMinutes", "GiftBatchCount",
	"DiamondPackIndex", "AutoDiamondPacks", "DiamondPackInterval",
	"DiamondPackCap", "DiamondPackReservePct", "DiamondPackTarget",
	"AutoGolden", "AutoRainbow", "MachineDiamondFloor",
	"AutoIndex", "IndexWorlds", "IndexHatchAmount", "IndexUseMachines", "IndexForceSkipDM",
	"IndexDiamondFloor", "IndexEggCap", "IndexEggPatience", "IndexHatchDelay", "IndexGoldenEggs",
	"KickAlert", "TradeJournal",
	"AutoSaveSettings",
	"Accent1", "Accent2",
	"UIBgStyle", "UIBgPreset", "UIBgIntensity", "UIAnimSpeed", "UIMotion", "UIScale", "UIBlur",
}
AreaFarm.SAVE_PATH = "CopeHub_config_" .. Players.LocalPlayer.Name .. ".json"

local function configSnapshotTable()
	local t = {}
	for _, k in ipairs(SAVE_KEYS) do t[k] = Config[k] end
	return t
end

local function configSnapshot()
	local ok, s = pcall(function()
		return json.encode(configSnapshotTable())
	end)
	return ok and s or ""
end

if isfile and isfile(AreaFarm.SAVE_PATH) then
	pcall(function()
		local okData, data = json.decodeSafe(readfile(AreaFarm.SAVE_PATH))
		if okData and type(data) == "table" then
			for _, k in ipairs(SAVE_KEYS) do
				local cur, saved = Config[k], data[k]
				if saved ~= nil and (cur == nil or type(cur) == type(saved)) then
					Config[k] = saved
				end
			end
			-- Migration: the single "delete normal-variant exclusives" gift toggle was
			-- split into one toggle per variant. Carry an old save's choice over to the
			-- Normal toggle so nobody's existing setting silently flips.
			if type(data.GiftDeleteNormalExclusives) == "boolean" and data.GiftDeleteNormal == nil then
				Config.GiftDeleteNormal = data.GiftDeleteNormalExclusives
			end
			-- Migration: the overnight-stability switches are safety features, not
			-- preferences, and a save written before they existed can carry a stale
			-- false for them. Force them on once, then stamp the save so a later
			-- deliberate "off" is respected.
			--   v1 -> v3: Leak Guard arrived. The ceiling also had to be re-picked,
			--   because the figure this guard watches (the sum of the per-tag
			--   memory counters) is not what Windows charges the process. A healthy
			--   client reads ~1,400 MB there while committing ~3,200 MB, and that
			--   commit never comes back once it has ballooned -- so the ceiling has
			--   to fire early, not generously. 2,600 leaves ~1,200 MB of headroom
			--   over a leak-free client and still catches real growth.
			--   v3 -> v4: every automatic rejoin is off. A teleport is the single
			--   most memory-hungry thing a client ever does -- it loads the place a
			--   second time before it lets the first copy go -- so on a machine with
			--   no headroom left it is not a rescue, it is the moment the process
			--   dies. Three tabs were lost that way in front of me. Worse, Anti-AFK
			--   fired Idled on every tab at roughly the same minute, so all of them
			--   teleported together every ~20 minutes all night. Memory pressure is
			--   now answered in place (see _memReclaim) and Idled only reports.
			if data.StabilityV ~= 4 then
				Config.DebrisSweep = true
				Config.KillIdleTracker = true
				Config.MemGuard = true
				Config.LeakGuard = true
				Config.NoRejoin = true
				Config.MemRejoinHours = 0
				local mb = tonumber(Config.MemGuardMb) or 0
				if mb < 2000 or mb > 3000 then Config.MemGuardMb = 2600 end
				Config.StabilityV = 4
			end
		end
	end)
end
State.LastSavedSnapshot = configSnapshot()

function AreaFarm.SaveSettings(force)
	local snap = configSnapshot()
	if not force and snap == State.LastSavedSnapshot then return false end
	State.LastSavedSnapshot = snap
	local ok = pcall(function() writefile(AreaFarm.SAVE_PATH, snap) end)
	if ok then AreaFarm._lastSavedAt = os.time() end
	return ok
end

-- Server-verified diamond prices (shop display + live Buy Boost test)
AreaFarm.BOOSTS = {
	{ key = "Triple Coins", price = 10000, duration = "20 min" },
	{ key = "Triple Damage", price = 15000, duration = "30 min" },
	{ key = "Super Lucky", price = 20000, duration = "20 min" },
	{ key = "Ultra Lucky", price = 25000, duration = "15 min" },
}

local function pushNotify(title, content, icon)
	table.insert(State.NotifyQueue, { Title = title, Content = content, Icon = icon or "info" })
end

local SUFFIX = { "", "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc" }
-- The six rarities of the real PSX "Auto Delete (Eggs)" panel, in panel order
local PSX_RARITIES = { "Basic", "Rare", "Epic", "Legendary", "Mythical", "Exclusive" }
-- Enchant "desired" targets = every droppable power tier TITLE (canDrop == true),
-- verified live from Library.Directory.Powers. The auto-enchant worker matches a
-- pet's live power titles against the user's picks, so this list only drives the
-- dropdown; correctness comes from the live directory lookup at match time.
local ENCHANT_TITLES = {
	"Coins I", "Coins II", "Coins III", "Coins IV", "Coins V",
	"Diamonds I", "Diamonds II", "Diamonds III", "Diamonds IV", "Diamonds V",
	"Strength I", "Strength II", "Strength III", "Strength IV", "Strength V",
	"Rainbow Coins I", "Rainbow Coins II", "Rainbow Coins III", "Rainbow Coins IV", "Rainbow Coins V",
	"Fantasy Coins I", "Fantasy Coins II", "Fantasy Coins III", "Fantasy Coins IV", "Fantasy Coins V",
	"Tech Coins I", "Tech Coins II", "Tech Coins III", "Tech Coins IV", "Tech Coins V",
	"Agility I", "Agility II", "Agility III",
	"Chest Breaker I", "Chest Breaker II", "Chest Breaker III",
	"Magnet", "Charm", "Royalty", "Glittering", "Teamwork", "Super Teamwork",
}
local function abbrev(n)
	n = math.floor(tonumber(n) or 0)
	if n < 1000 then return tostring(n) end
	local i, x = 1, n
	while x >= 1000 and i < #SUFFIX do
		x /= 1000
		i += 1
	end
	return string.format("%.2f%s", x, SUFFIX[i])
end

local function commas(n)
	local s = tostring(math.floor(tonumber(n) or 0))
	local out = s:reverse():gsub("(%d%d%d)", "%1,"):reverse()
	return (out:gsub("^,", ""))
end

local function timeStr(secs)
	secs = math.max(0, math.floor(tonumber(secs) or 0))
	if secs >= 3600 then
		return string.format("%dh %dm", secs // 3600, (secs % 3600) // 60)
	end
	if secs >= 60 then
		return string.format("%dm %ds", secs // 60, secs % 60)
	end
	return secs .. "s"
end

local function getRoot()
	local char = Players.LocalPlayer.Character
	return char and char:FindFirstChild("HumanoidRootPart")
end

local function things()
	local t = workspace:FindFirstChild("__THINGS")
	return t
end

-- Coin data lives in _Attr Value children (ID_Attr/Health_Attr/Area_Attr) in
-- this build, unlike the plain GetAttribute copy this hub was first written
-- for. Read the Value child first, then fall back to a real attribute.
local function coinAttr(coin, name)
	if not coin then return nil end
	local v = coin:FindFirstChild(name .. "_Attr")
	if v then return v.Value end
	local ok, val = pcall(function() return coin:GetAttribute(name) end)
	if ok then return val end
	return nil
end

local function _stopAll()
	if AreaFarm._stop then pcall(AreaFarm._stop) end
end

-- Register the live-reload teardown as early as possible. Real runs the
-- PREVIOUS build's cleanup in that build's own environment, so this reaches
-- its AreaFarm table even though every build has its own copy — without it,
-- reloads never killed the previous build's loops and a session that reloads
-- several times ends up with N stacked farm workers fighting over the pets
-- (observed: six farm loops alive at once, one still on coins from a world
-- two reloads ago). Gen is per-copy, so nothing else could ever reach them.
local __ok, __ST = pcall(function() return STATE end)
if __ok and type(__ST) == "table" and type(__ST.onCleanup) == "function" then
	__ST.onCleanup(_stopAll)
end

AreaFarm._stop = function()
	AreaFarm.Gen += 1
	local conns = State.OpenEggConns
	if conns then
		for _, c in ipairs(conns) do
			pcall(function() c:Enable() end)
		end
	end
	State.OpenEggConns = nil
	State.OpenEggDisabled = false
	pcall(function() AreaFarm.SaveSettings(true) end)
	pcall(function() if AreaFarm._perfRestoreAll then AreaFarm._perfRestoreAll() end end)
	pcall(function() if AreaFarm._bfxRestore then AreaFarm._bfxRestore() end end)
	-- Put the game's own AddDebris back. The replacement is strictly better, but
	-- once Gen bumps nothing is left to purge its buckets, so leaving a foreign
	-- function installed with no owner is worse than handing the leak back.
	pcall(function() if AreaFarm._leakRestore then AreaFarm._leakRestore() end end)
	-- Background Mode holds the renderer off and the frame cap down. Neither is
	-- part of the DataModel, so a reload that did not undo them would leave a
	-- black screen and no way in the UI to get the picture back.
	pcall(function() if AreaFarm._bgApply then AreaFarm._bgApply(false) end end)
	pcall(function() if AreaFarm._setAntiAFK then AreaFarm._setAntiAFK(false) end end)
	pcall(function() if AreaFarm._setDisablePopups then AreaFarm._setDisablePopups(false) end end)
	if AreaFarm.Window then
		pcall(function() AreaFarm.Window:Destroy() end)
		AreaFarm.Window = nil
	end
	pcall(function() if AreaFarm._destroyUI then AreaFarm._destroyUI() end end)
end

-- ========================================================================
-- WORKERS (all game Library access lives below this line)
-- ========================================================================

-- Data bootstrap + refresher: unlocked areas, enterable worlds, current-world eggs
task.spawn(function()
	local ok, Library = pcall(function()
		return require(ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"))
	end)
	if not ok then
		State.PendingData = {
			Areas = {}, Worlds = {}, Eggs = {}, World = nil, DefaultArea = nil,
		}
		State.DataVersion += 1
		State.Ready = true
		return
	end
	AreaFarm.Library = Library

	local function gather()
		local out = { Areas = {}, Worlds = {}, Eggs = {}, World = nil, DefaultArea = nil }
		pcall(function()
			local data = Library.Save.Get()
			local unlocked = data and data.AreasUnlocked or {}
			local Areas = Library.Directory.Areas
			local cur = Library.WorldCmds.Get()
			out.World = cur
			local list = {}
			for _, name in ipairs(unlocked) do
				local dir = Areas[name]
				-- skip shops: they have no breakables and would idle the farm
				if dir and not dir.isShop and not dir.hidden then
					table.insert(list, { name = name, id = tonumber(dir.id) or 0, world = dir.world })
				end
			end
			table.sort(list, function(a, b) return a.id < b.id end)
			for _, e in ipairs(list) do table.insert(out.Areas, e.name) end
			for i = #list, 1, -1 do
				if list[i].world == cur then
					out.DefaultArea = list[i].name
					break
				end
			end
			if not out.DefaultArea and #out.Areas > 0 then
				out.DefaultArea = out.Areas[#out.Areas]
			end
			local wlist = {}
			for name, wd in pairs(Library.Directory.Worlds) do
				if not wd.disabled and Library.WorldCmds.HasAccess(name) then
					table.insert(wlist, { name = name, order = wd.worldOrder or 99 })
				end
			end
			table.sort(wlist, function(a, b)
				if a.order ~= b.order then return a.order < b.order end
				return a.name < b.name
			end)
			for _, w in ipairs(wlist) do table.insert(out.Worlds, w.name) end
			if cur and not table.find(out.Worlds, cur) then
				table.insert(out.Worlds, 1, cur)
			end
			local eggs = {}
			for _, m in ipairs(Library.WorldCmds.GetAllEggs()) do
				local id = m:GetAttribute("ID")
				local dir = id and Library.Directory.Eggs[id]
				if dir and dir.hatchable and not dir.disabled then
					table.insert(eggs, {
						key = id, name = dir.displayName or id,
						cost = tonumber(dir.cost) or 0, currency = dir.currency or "",
					})
				end
			end
			table.sort(eggs, function(a, b) return a.cost < b.cost end)
			out.Eggs = eggs
			out.Diamonds = tonumber(data.Diamonds) or 0
			if State.DiaStart == nil then State.DiaStart = out.Diamonds end
			local bi = data.BoostsInventory or {}
			out.BoostInv = {}
			for _, b in ipairs(AreaFarm.BOOSTS or {}) do
				out.BoostInv[b.key] = tonumber(bi[b.key]) or 0
			end
			out.BoostsActive = {}
			for k, v in pairs(data.Boosts or {}) do
				out.BoostsActive[k] = tonumber(v) or 0
			end
			-- one-time import of the game's own auto-delete flags (native panel parity)
			if not State.NativeDeleteRead then
				State.NativeDeleteRead = true
				local ad = data.AutoDelete or {}
				local imp = {}
				for _, r in ipairs(PSX_RARITIES) do
					imp[r] = ad[r] == true
				end
				State.NativeDeleteImport = imp
			end
		end)
		State.PendingData = out
		State.DataVersion += 1
	end

	gather()
	State.Ready = true
	while AreaFarm.Gen == myGen do
		task.wait(3)
		gather()
	end
end)

-- World switcher: farm target area's world wins; otherwise manual dropdown choice
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	local lastFailAt, lastFailWorld = 0, nil
	while AreaFarm.Gen == myGen do
		task.wait(1)
		if not State.SwitchingWorld then
			local cur = nil
			pcall(function() cur = Library.WorldCmds.Get() end)
			-- Only the progression modes (Auto Complete Game / World
			-- Progression) may teleport the player. Anywhere else the hub
			-- FOLLOWS the player instead: manual travels through the game's
			-- own world system win, and the world dropdown is kept in sync.
			if not (Config.AutoCompleteGame == true or Config.AutoWorldProgress == true) then
				if cur and Config.World ~= cur then
					Config.World = cur
				end
				continue
			end
			local desired = nil
			if Config.AutoFarm and Config.TargetArea then
				local a = Library.Directory.Areas[Config.TargetArea]
				if a then desired = a.world end
			end
			if not desired then desired = Config.World end
			if desired and cur and desired ~= cur and Library.Directory.Worlds[desired] then
				State.SwitchingWorld = true
				pushNotify("Cope Hub", "Switching world: " .. tostring(cur) .. " -> " .. desired, "globe")
				local ok, res = pcall(function() return Library.WorldCmds.Load(desired) end)
				State.SwitchingWorld = false
				if ok and res == true then
					lastFailAt, lastFailWorld = 0, nil
				else
					-- server rejected the world (usually a missing required
					-- area): explain once, then back off instead of spamming
					if lastFailWorld ~= desired or os.clock() - lastFailAt > 10 then
						local wd = Library.Directory.Worlds[desired]
						local req = wd and wd.requiredArea
						pushNotify("Cope Hub", "Can't enter " .. desired
							.. (req and (' — needs the "' .. req .. '" area') or ""), "triangle-alert")
					end
					lastFailAt, lastFailWorld = os.clock(), desired
					task.wait(2)
				end
			end
		end
	end
end)

-- Area-center teleport: the game rejects break actions made too far from the
-- coin, so when a progression mode (Auto Complete Game / World Progression /
-- Auto Best Area) is driving the target area, ride every area change to the
-- centre of that area. The centre is the midpoint of the area's coins — the
-- game exposes no area-position data, but the coins all live in the area.
local function areaCenter(Library, areaName)
	local T = things()
	local Coins = T and T:FindFirstChild("Coins")
	if not Coins then return nil end
	local sx, sy, sz, n = 0, 0, 0, 0
	for _, coin in ipairs(Coins:GetChildren()) do
		if coinAttr(coin, "Area") == areaName then
			local pos = coin:FindFirstChild("POS")
			if pos then
				sx += pos.Position.X
				sy += pos.Position.Y
				sz += pos.Position.Z
				n += 1
			end
		end
	end
	if n == 0 then return nil end
	return Vector3.new(sx / n, sy / n, sz / n)
end

-- In the ordered Auto-Complete-Game route there is no Config.TargetArea (the
-- route drives worlds/areas itself), so the fallback for "which area am I in"
-- is the coin closest to the character.
local function areaOfNearestCoin()
	local T = things()
	local Coins = T and T:FindFirstChild("Coins")
	local root = getRoot()
	if not Coins or not root then return nil end
	local rp = root.Position
	local bestArea, bestD = nil, math.huge
	for _, coin in ipairs(Coins:GetChildren()) do
		local pos = coin:FindFirstChild("POS")
		if pos then
			local d = (pos.Position - rp).Magnitude
			if d < bestD then
				local v = coinAttr(coin, "Area")
				if v then bestArea = tostring(v) bestD = d end
			end
		end
	end
	return bestArea
end

task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	local lastArea, lastWorld, lastModeOn, lastTpAt = nil, nil, false, 0
	while AreaFarm.Gen == myGen do
		task.wait(0.5)
		local modeOn = Config.AutoCompleteGame == true
			or Config.AutoWorldProgress == true
			or Config.AutoBestArea == true
		local cur = nil
		pcall(function() cur = Library.WorldCmds.Get() end)
		local target = Config.TargetArea or areaOfNearestCoin()
		if modeOn and target and not State.SwitchingWorld then
			-- identity compare + cooldown: teleport only when the area/world
			-- actually changed (or a mode was just switched on), and never
			-- more often than once per 1.5s. This is immune to the target
			-- flickering between two areas while coins respawn.
			local areaChanged = target ~= lastArea
			local worldChanged = cur and cur ~= lastWorld
			local modeTurnedOn = modeOn and not lastModeOn
			if (areaChanged or worldChanged or modeTurnedOn)
				and os.clock() - lastTpAt >= 1.5 then
				local center = areaCenter(Library, target)
				local root = getRoot()
				if center and root then
					pcall(function()
						root.CFrame = CFrame.new(center.X, center.Y + 4, center.Z)
					end)
					pushNotify("Cope Hub", "Teleported to " .. target, "globe")
					lastTpAt = os.clock()
				end
				lastArea, lastWorld = target, cur
			end
		end
		lastModeOn = modeOn
	end
end)

-- Coin farming: parallel multi-target breaker.
-- Pets are split into slots, one slot per breakable; every tick fires attacks
-- for ALL active targets at once. Broken coins free their pets and a fresh
-- target is joined the same tick, so there is no serial downtime.
local farmBlacklist = {}

local function farmEquippedPets(Library)
	local out = {}
	pcall(function()
		local data = Library.Save.Get()
		for uid in pairs(data.PetsEquipped or {}) do table.insert(out, uid) end
	end)
	return out
end

local function farmPetsOnCoin(coin, uidSet)
	local found = {}
	local petsFolder = coin:FindFirstChild("Pets")
	if petsFolder then
		for _, pf in ipairs(petsFolder:GetChildren()) do
			local uid = pf:GetAttribute("ID") or pf.Name
			if uidSet[uid] then table.insert(found, uid) end
		end
	end
	if #found > 0 then return found end
	-- This build never populates a coin's Pets folder: joined pets live as
	-- Parts in workspace.__THINGS.Pets (named by uid) that the game parks
	-- around the coin's rim once they arrive. Detect them by position.
	pcall(function()
		local T = things()
		local Pets = T and T:FindFirstChild("Pets")
		if not Pets then return end
		local center = coin:FindFirstChild("Coin")
		local anchor = center or coin:FindFirstChild("POS")
		if not anchor then return end
		local ap = anchor.Position
		local radius = 4.5
		if center and center:IsA("BasePart") then
			local sx, sz = center.Size.X, center.Size.Z
			radius = math.max(math.max(sx, sz) / 2 * 1.1 + 3.5, 4.5)
		end
		local thresh = radius + 4
		for _, p in ipairs(Pets:GetChildren()) do
			if p:IsA("BasePart") and uidSet[p.Name] then
				if (p.Position - ap).Magnitude <= thresh then
					table.insert(found, p.Name)
				end
			end
		end
	end)
	return found
end

local function farmJoinPets(Library, cid, uids)
	-- Match the reference hub exactly: bare Invoke with no CFrame pin.
	-- The earlier per-frame CFrame pin caused the visible pet twitch and
	-- blocked farmStep for 0.3s per coin — capping concurrency to ~5-6.
	-- The game's own follower moves pets to the coin rim; the server reads
	-- a lagged position, so the follower's live frame is already enough.
	local res = nil
	pcall(function() res = Library.Network.Invoke("Join Coin mmm", cid, uids) end)
	if type(res) == "table" then
		local accepted = {}
		for _, uid in ipairs(uids) do
			if res[uid] == true then table.insert(accepted, uid) end
		end
		return accepted
	end
	-- One brief pause + retry for the first-time-follow case
	task.wait(0.1)
	res = nil
	pcall(function() res = Library.Network.Invoke("Join Coin mmm", cid, uids) end)
	if type(res) ~= "table" then return nil end
	local accepted = {}
	for _, uid in ipairs(uids) do
		if res[uid] == true then table.insert(accepted, uid) end
	end
	return accepted
end

-- Leaves every breakable carrying one of our equipped pets. The game keeps
-- firing Farm Coin for joined pets on its own, so turning Auto Farm off is
-- not enough — pets must be explicitly left or attacks continue forever.
AreaFarm._farmLeaveAll = function(Library)
	pcall(function()
		local data = Library.Save.Get()
		if not data then return end
		local mine = {}
		for uid in pairs(data.PetsEquipped or {}) do mine[uid] = true end
		if next(mine) == nil then return end
		local T = things()
		local Coins = T and T:FindFirstChild("Coins")
		if not Coins then return end
		for _, coin in ipairs(Coins:GetChildren()) do
			local found = farmPetsOnCoin(coin, mine)
			if #found > 0 then
				local leave = {}
				for _, uid in ipairs(found) do leave[uid] = true end
				pcall(function() Library.Network.Invoke("Leave Coin mmm", coinAttr(coin, "ID") or coin.Name, leave) end)
			end
		end
	end)
end

local function farmStep(Library, S)
	if not Config.AutoFarm then
		-- one-shot sweep per off-period: unjoin everything so the game's own
		-- animation loop stops attacking on our behalf (also runs at boot)
		if not State.FarmSwept then
			State.FarmSwept = true
			S.targets = {}
			AreaFarm._farmLeaveAll(Library)
		end
		task.wait(0.25)
		return
	end
	State.FarmSwept = nil
	if State.SwitchingWorld then S.targets = {} task.wait(0.5) return end
	local target = Config.TargetArea
	if not target then task.wait(0.25) return end
	local areaDir = Library.Directory.Areas[target]
	if not areaDir then task.wait(0.5) return end
	local cur = nil
	pcall(function() cur = Library.WorldCmds.Get() end)
	if cur ~= areaDir.world then S.targets = {} task.wait(1) return end
	local root = getRoot()
	if not root then task.wait(0.5) return end
	local pos = root.Position
	local T = things()
	local Coins = T and T:FindFirstChild("Coins")
	if not Coins then task.wait(0.5) return end

	local now = os.clock()

	-- reap finished / vanished targets and free their pets
	for cid, t in pairs(S.targets) do
		local gone = t.coin.Parent == nil
		local dead = (coinAttr(t.coin, "Health") or 0) <= 0
		if gone or dead then
			Stats.Coins += 1
			Stats.Damage += t.joinHealth
			if Config.LeaveOnBreak then
				local leave = {}
				for _, uid in ipairs(t.pets) do leave[uid] = true end
				pcall(function() Library.Network.Invoke("Leave Coin mmm", cid, leave) end)
			end
			S.targets[cid] = nil
		end
	end

	-- attacks run in their own background coroutine (see the worker spawn
	-- below) so firing never stalls while this tick does joint top-ups, which
	-- previously parked every pet for 0.45s+ per coin change.

	local equipped = farmEquippedPets(Library)
	if #equipped == 0 then task.wait(0.5) return end
	local activeCount, busy = 0, {}
	for cid, t in pairs(S.targets) do
		activeCount += 1
		for _, uid in ipairs(t.pets) do busy[uid] = true end
	end

	-- top up empty slots with new nearby targets
	local allMode = Config.FarmAllArea == true
	local maxSlots = allMode and math.huge or math.max(1, tonumber(Config.MultiTargets) or 3)
	local perSlot = allMode and 1 or math.max(1, math.floor(#equipped / maxSlots))
	if activeCount < maxSlots then
		local pool = {}
		for _, uid in ipairs(equipped) do
			if not busy[uid] then table.insert(pool, uid) end
		end
		local cands = {}
		for _, coin in ipairs(Coins:GetChildren()) do
			local cid = coinAttr(coin, "ID") or coin.Name
			local bl = farmBlacklist[cid]
			if bl and bl < now then farmBlacklist[cid] = nil bl = nil end
			if not bl and not S.targets[cid] and coinAttr(coin, "Area") == target then
				local health = coinAttr(coin, "Health") or 0
				if health > 0 then
					local POS = coin:FindFirstChild("POS")
					local d = POS and (POS.Position - pos).Magnitude or 0
					if allMode or Config.MaxDistance <= 0 or d <= Config.MaxDistance then
						table.insert(cands, { coin = coin, id = cid, d = d, health = health })
					end
				end
			end
		end
		-- whole-area mode: cheapest coins first for max breaks/sec,
		-- otherwise nearest first to cut travel time
		table.sort(cands, function(a, b)
			if allMode then
				return a.health < b.health
			end
			return a.d < b.d
		end)
		-- strongest-only: skip the weak coin tiers, farm only the top health tier
		if Config.StrongestOnly ~= false and #cands > 1 then
			local maxH = 0
			for _, c in ipairs(cands) do
				if c.health > maxH then maxH = c.health end
			end
			local strong = {}
			for _, c in ipairs(cands) do
				if c.health >= maxH - 1 then table.insert(strong, c) end
			end
			cands = strong
		end
		for _, c in ipairs(cands) do
			if activeCount >= maxSlots or #pool == 0 then break end
			local take = {}
			while #take < perSlot and #pool > 0 do
				table.insert(take, table.remove(pool))
			end
			if #take == 0 then break end
			local takeSet = {}
			for _, uid in ipairs(take) do takeSet[uid] = true end
			local already = farmPetsOnCoin(c.coin, takeSet)
			local onMap = {}
			for _, uid in ipairs(already) do onMap[uid] = true end
			local needJoin = {}
			for _, uid in ipairs(take) do
				if not onMap[uid] then table.insert(needJoin, uid) end
			end
			local accepted = already
			if #needJoin > 0 then
				local newly = farmJoinPets(Library, c.id, needJoin)
				if newly == nil then accepted = nil
				else
					for _, uid in ipairs(newly) do table.insert(accepted, uid) end
				end
			end
			if accepted == nil or #accepted == 0 then
				-- short cooldown only: transient rejections (pet still clearing
				-- a previous coin, server catching up) resolve in a second or
				-- two, so never park this coin for a minute
				farmBlacklist[c.id] = now + 2
				for _, uid in ipairs(take) do table.insert(pool, uid) end
			else
				S.targets[c.id] = {
					coin = c.coin, pets = accepted,
					joinHealth = coinAttr(c.coin, "Health") or 0,
				}
				activeCount += 1
			end
		end
		-- leftover pets when slots are full: dump them onto the nearest active target
		if #pool > 0 and activeCount > 0 and now - (S.lastDump or 0) > 1 then
			S.lastDump = now
			local ncid, nd = nil, math.huge
			for cid, t in pairs(S.targets) do
				local POS = t.coin:FindFirstChild("POS")
				local d = POS and (POS.Position - pos).Magnitude or math.huge
				if d < nd then ncid = cid nd = d end
			end
			if ncid then
				local extra = farmJoinPets(Library, ncid, pool)
				if extra then
					local have = {}
					for _, uid in ipairs(S.targets[ncid].pets) do have[uid] = true end
					for _, uid in ipairs(extra) do
						if not have[uid] then
							have[uid] = true
							table.insert(S.targets[ncid].pets, uid)
						end
					end
				end
			end
		end
	end

	task.wait(0.06)

end

local farmS = nil

task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	local S = { targets = {}, lastDump = 0 }
	farmS = S
	AreaFarm._farmS = S
	farmBlacklist = {}
	while AreaFarm.Gen == myGen do
		local ok, err = pcall(farmStep, Library, S)
		if not ok then
			warn("[AreaFarm] farm error: " .. tostring(err))
			task.wait(1)
		end
	end
end)

-- Dedicated attack stream: keeps firing every active target at the
-- SafeFireRate cap no matter what the farm tick is doing (reaping, top-ups,
-- dump pins). Before this, every join pin parked all pets for 0.3-0.45s and
-- fires simply stopped during that window — the "sending pets is slow" cost.
task.spawn(function()
	while AreaFarm.Gen == myGen do
		local S = farmS
		if S then
			local rateCap = math.max(20, math.min(600, tonumber(Config.SafeFireRate) or 90))
			S.attackTimers = S.attackTimers or {}
			local attackCount = 0
			for cid, t in pairs(S.targets) do attackCount += #t.pets end
			local now = os.clock()
			local period = math.max(0.02, attackCount / rateCap)
			if attackCount > 0 then
				pcall(function()
					local Library = AreaFarm.Library
					if not Library then return end
					for cid, t in pairs(S.targets) do
						for _, uid in ipairs(t.pets) do
							if now >= (S.attackTimers[uid] or 0) then
								Library.Network.Fire("Farm Coin mmm", cid, uid)
								S.attackTimers[uid] = now + period
							end
						end
					end
				end)
				task.wait(math.max(math.max(0.008, Config.FireDelay), period / 2))
			else
				task.wait(0.05)
			end
		else
			task.wait(0.5)
		end
	end
end)

-- Egg hatching
local function applySkipAnim(Library)
		local ok, sig = pcall(function() return Library.Network.Fired("openegggg") end)
	if not ok then return end
	if Config.SkipAnim and not State.OpenEggDisabled then
		local okc, conns = pcall(getconnections, sig)
		if okc then
			State.OpenEggConns = conns
			for _, c in ipairs(conns) do
				pcall(function() c:Disable() end)
			end
			State.OpenEggDisabled = true
		end
	elseif not Config.SkipAnim and State.OpenEggDisabled then
		for _, c in ipairs(State.OpenEggConns or {}) do
			pcall(function() c:Enable() end)
		end
		State.OpenEggDisabled = false
		State.OpenEggConns = nil
	end
end

-- Stand spot for an egg: 4 studs out on whichever side the player is already
-- approaching from (falls back to the egg's authored front when far away or
-- directly overhead), facing the egg's center.
local function eggStandCFrame(Center, root)
	local from = root and root.Position or (Center.Position + Center.CFrame.LookVector * 4)
	local flat = Vector3.new(from.X - Center.Position.X, 0, from.Z - Center.Position.Z)
	local dir = Center.CFrame.LookVector
	if flat.Magnitude >= 0.5 and flat.Magnitude <= 60 then
		dir = flat.Unit
	end
	local standPos = Center.Position + dir * 4 + Vector3.new(0, 3, 0)
	local facePos = Vector3.new(Center.Position.X, standPos.Y, Center.Position.Z)
	return CFrame.lookAt(standPos, facePos)
end

-- "Buy Egg" takes (eggId, triple, octuple) and the two flags are mutually
-- exclusive — the game's own egg prompt sends (v == 2) and (v == 3) from a
-- "Buy 1 / Buy 3 / Buy 8" message. Buy 8 is a paid unlock, and the prompt only
-- offers it when save.OwnsOctupleEggs is set, so ask for 8 only when it's owned.
local function eggBuyFlags(n)
	return n == 3, n == 8
end

local function eggAmountAllowed(save, n)
	if n == 8 and not (save and save.OwnsOctupleEggs) then return 3 end
	return (n == 3 or n == 8) and n or 1
end

local function eggStep(Library)
	applySkipAnim(Library)
	-- The index drives its own hatching (its own egg order, its own teleports),
	-- so the plain egg farm stands down while it runs. Skip-anim above still
	-- applies, otherwise the index would sit through every hatch cutscene.
	if Config.AutoIndex then task.wait(0.25) return end
	if not Config.AutoEggs then task.wait(0.25) return end
	if State.SwitchingWorld then
		State._WasSwitching = true
		task.wait(0.5) return
	end
	if State._WasSwitching then
		State._WasSwitching = false
		State.EggTpDone = nil -- new world: allow one fresh teleport
	end
	local key = Config.EggKey
	if not key then task.wait(0.5) return end
	if Config.EggStay then
		-- one teleport per egg selection / world, not every hatch cycle
		local model0 = nil
		pcall(function()
			for _, m in ipairs(Library.WorldCmds.GetAllEggs()) do
				if m:GetAttribute("ID") == key then model0 = m break end
			end
		end)
		local Center0 = model0 and model0:FindFirstChild("Center")
		if Center0 then
			local sig = key .. "@" .. math.floor(Center0.Position.X / 4) .. "_" .. math.floor(Center0.Position.Z / 4)
			if State.EggTpDone ~= sig then
				State.EggTpDone = sig
				local root0 = getRoot()
				if root0 then pcall(function() root0.CFrame = eggStandCFrame(Center0, root0) end) end
			end
		end
	end
	local model = nil
	pcall(function()
		for _, m in ipairs(Library.WorldCmds.GetAllEggs()) do
			if m:GetAttribute("ID") == key then
				model = m
				break
			end
		end
	end)
	if not model then task.wait(0.5) return end
	local amount = eggAmountAllowed(Library.Save.Get(), tonumber(Config.EggAmount) or 1)
	if amount ~= Config.EggAmount and not State.OctupleWarned then
		State.OctupleWarned = true
		pushNotify("Cope Hub", "You don't own the x8 hatch unlock — using x3 instead", "triangle-alert")
	end
	local triple, octuple = eggBuyFlags(amount)
	local ok, err
	pcall(function() ok, err = Library.Network.Invoke("Egg: Buy Egg", key, triple, octuple) end)
	if ok then
		Stats.Eggs += amount
		State.EggErrorShown = false
	else
		if not State.EggErrorShown then
			State.EggErrorShown = true
			pushNotify("Cope Hub", "Egg buy failed: " .. tostring(err), "triangle-alert")
		end
	end
	task.wait(math.max(0.8, Config.HatchDelay))
end

task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		local ok, err = pcall(eggStep, Library)
		if not ok then
			warn("[AreaFarm] egg error: " .. tostring(err))
			task.wait(1)
		end
	end
end)

-- Auto Open Exclusive Eggs: buys the exclusive egg (Diamonds) and lets the
-- hatch land. Pauses while a Huge is held in inventory (auto trade / manual
-- transfer), then resumes once it's gone.
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		if Config.AutoOpenExclusive and not State.ExclusivePaused then
			pcall(function()
				local save = Library.Save.Get()
				if not save then return end
				local key = Config.EggKey
				if type(key) == "string" and key ~= "" then
					local dir = Library.Directory.Eggs[key]
					if not (dir and dir.hatchable and not dir.disabled) then
						State.ExclusivePaused = true
						return
					end
					local cost = tonumber(dir.cost) or 0
					local bal = tonumber(save[dir.currency]) or 0
					if bal < cost then
						State.ExclusivePaused = true
						return
					end
					local ok, err = Library.Network.Invoke("Egg: Buy Egg", key, false, false)
					if ok then
						Stats.ExEggsOpened += 1
						State.ExclusivePaused = false
					else
						local e = tostring(err or "")
						if string.find(e, "not found") or string.find(e, "coin") or string.find(e, "Diamond") then
							State.ExclusivePaused = true
						end
					end
				end
			end)
			task.wait(math.max(0.8, Config.ExclusiveOpenDelay))
		else
			task.wait(0.5)
		end
	end
end)

-- ========================================================================
-- Dark Matter machine: bulk-convert Rainbow pets to Dark Matter.
-- Batch of up to 7 (native max), pay 7500 Diamonds to convert, then skip the
-- timer for 1,000,000 Diamonds per slot, then redeem instantly.
-- ========================================================================
local DMSkipCost = 1000000
local DMConvertCost = 7500

local function dmEligible(pId, p, dir)
	if not p.r or p.g or p.dm then return false end
	if p.l then return false end -- locked can't convert
	if not dir then return false end
	if dir.isPremium or dir.isGift then return false end
	local r = tostring(dir.rarity)
	if r == "Event" or r == "Exclusive" then return false end
	return true
end

-- Server clock (absolute OS time) used to tell whether a queue slot is ready.
local function dmNow(Library)
	local t = 0
	pcall(function() t = Library.Network.Invoke("Get OSTime") end)
	return tonumber(t) or 0
end

-- Walk the whole DM queue once: redeem any slot whose timer is up (free), and
-- — only when Auto Skip is on and Diamonds stay above the floor — pay to skip a
-- still-running slot then redeem it. Returns how many slots were redeemed.
-- forceSkip / floorOverride let the Index feature pay off a timer immediately
-- without the user having to arm the standalone Dark Matter toggle.
local function dmProcessQueue(Library, forceSkip, floorOverride)
	local save = Library.Save.Get()
	if not save then return 0 end
	local now = dmNow(Library)
	local redeemed = 0
	for slot, entry in pairs(save.DarkMatterQueue or {}) do
		local sid = tostring(slot)
		local diamonds = tonumber(save.Diamonds) or 0
		local floor = tonumber(floorOverride or Config.DMDiamondFloor) or 0
		local ready = entry and entry.readyTime and (tonumber(entry.readyTime) - now <= 1)
		if not ready and (Config.DMAutoSkip or forceSkip) and (diamonds - DMSkipCost) >= floor then
			pcall(function() return Library.Network.Invoke("Prompt Dark Matter Skip", sid, "Diamonds") end)
			State.DMMoneySpent = (State.DMMoneySpent or 0) + DMSkipCost
			task.wait(0.08)
			ready = true
		end
		if ready then
			pcall(function() return Library.Network.Invoke("Redeem Dark Matter Pet", sid) end)
			redeemed = redeemed + 1
			task.wait(0.08)
			save = Library.Save.Get() or save
		end
	end
	return redeemed
end

-- One batch = collect up to 7 uids of the chosen pet (same hardcore flag),
-- convert, then skip + redeem via dmProcessQueue.
local function dmStep(Library)
	local save = Library.Save.Get()
	if not save then return end

	-- Clear any ready/skippable slots first (leftovers or prior batches).
	dmProcessQueue(Library)

	if not Config.DarkMatterKey or not Config.AutoDarkMatter then return end
	save = Library.Save.Get()
	if not save then return end
	local balanced = tonumber(save.Diamonds) or 0
	local key = Config.DarkMatterKey

	-- Collect eligible uids of the chosen pet, non-hardcore preferred.
	local uids = {}
	local hcUids = {}
	for _, p in pairs(save.Pets) do
		if tostring(p.id) == key and dmEligible(key, p, Library.Directory.Pets[p.id]) then
			if p.hc then table.insert(hcUids, p.uid) else table.insert(uids, p.uid) end
		end
	end
	if #uids == 0 then uids = hcUids end
	if #uids == 0 then
		if not State.DMIdleNotified then
			State.DMIdleNotified = true
			pushNotify("Cope Hub", "No more Rainbow '" .. tostring(key) .. "' left to convert to Dark Matter", "sparkles")
		end
		return
	end

	-- Respect concurrent queue slots; if full and skipping is off, wait for timers.
	local slots = tonumber(save.DarkMatterSlots) or 6
	local used = 0
	for _ in pairs(save.DarkMatterQueue or {}) do used = used + 1 end
	if used >= slots then return end

	-- One pet per batch (1:1 conversion — each Rainbow becomes its own Dark Matter pet).
	local batchCount = 1
	local batch = { uids[1] }

	if tonumber(save.MaxSlots) and #save.Pets + 1 > tonumber(save.MaxSlots) then
		if not State.DMFullNotified then
			State.DMFullNotified = true
			pushNotify("Cope Hub", "Inventory full — clear slots for DM pets", "triangle-alert")
		end
		return
	end

	-- Afford the convert (+ the skip when Auto Skip is on) and stay above the floor.
	local floor = tonumber(Config.DMDiamondFloor) or 0
	local needed = DMConvertCost + (Config.DMAutoSkip and DMSkipCost or 0)
	if balanced - needed < floor then
		if not State.DMBrokeNotified then
			State.DMBrokeNotified = true
			pushNotify("Cope Hub", Config.DMAutoSkip
				and "Diamonds near your floor — pausing DM skips to protect your balance"
				or "Not enough Diamonds to convert to Dark Matter", "triangle-alert")
		end
		return
	end
	State.DMBrokeNotified = false
	State.DMFullNotified = false

	local ok, err = Library.Network.Invoke("Convert To Dark Matter", batch)
	if not ok then
		if not State.DMErrShown then
			State.DMErrShown = true
			pushNotify("Cope Hub", "Convert failed: " .. tostring(err or "unknown"), "triangle-alert")
		end
		return
	end
	State.DMErrShown = false
	State.DMIdleNotified = false
	State.DMMoneySpent = (State.DMMoneySpent or 0) + DMConvertCost
	Stats.DMMade += batchCount
	task.wait(0.2)

	-- Skip (if enabled) + redeem the freshly-created slot(s).
	dmProcessQueue(Library)
end

AreaFarm._dmStep = dmStep

-- DM worker: one batch per pass while the toggle is on.
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		if Config.AutoDarkMatter and not State.DMBusy then
			State.DMBusy = true
			pcall(dmStep, Library)
			State.DMBusy = false
		end
		task.wait(0.2)
	end
end)

-- DM pet list scan: eligible rainbow pets grouped by id, for the dropdown.
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		task.wait(3)
		local sig = ""
		local groups = {}
		pcall(function()
			local save = Library.Save.Get()
			if not save then return end
			local byId = {}
			for _, p in pairs(save.Pets) do
				local dir = Library.Directory.Pets[p.id]
				if dmEligible(p.id, p, dir) then
					local k = tostring(p.id)
					local g = byId[k]
					if not g then
						g = { id = k, name = dir and dir.name or k, count = 0 }
						byId[k] = g
						table.insert(groups, g)
					end
					g.count += 1
				end
			end
			table.sort(groups, function(a, b) return a.count > b.count end)
			for _, g in ipairs(groups) do sig = sig .. "|" .. g.id .. ":" .. g.count end
		end)
		if sig ~= State.DMSig then
			State.DMSig = sig
			State.DMPets = groups
			State.DMPetsVersion += 1
		end
	end
end)

-- ========================================================================
-- GOLDEN / RAINBOW MACHINES — 100%-chance conversions only.
-- Both machines take N pets that share one pet id and one hardcore flag, and
-- the top row of their odds table is a guaranteed success. We only ever feed a
-- full-size batch, so there is no gambling and no pets burned on a failed roll.
-- This build serves the odds via "Get Golden Machine Info" /
-- "Get Rainbow Machine Info" (no hardcore split), where the chance == 100 row
-- is the guaranteed full batch.
-- ========================================================================

local function machineOdds(Library, kind, hc)
	-- This build serves machine tables over an info remote rather than exposing
	-- them on Library.Shared. The returned table is array-indexed batches
	-- 1..N where N (chance == 100) is the guaranteed full-size batch.
	local remote = (kind == "rainbow") and "Get Rainbow Machine Info" or "Get Golden Machine Info"
	local info = nil
	pcall(function() info = Library.Network.Invoke(remote) end)
	if type(info) ~= "table" then return nil end
	local best = nil
	for i, row in pairs(info) do
		if type(row) == "table" and tonumber(row.chance or 0) >= 100 then
			best = i
		end
	end
	if best then
		-- return a 1..best array mirroring the old Shared table shape
		local arr = {}
		for i = 1, best do arr[i] = info[i] end
		return arr
	end
	return info
end

-- Mirrors the game's own machine filters (Golden Machine / Rainbow Machine
-- LocalScripts): no premium, gift, Event or Exclusive pets, nothing locked,
-- nothing already Rainbow or Dark Matter. The Golden machine wants plain
-- pets; the Rainbow machine wants pets that are already Golden.
local function machineEligible(dir, pet, kind)
	if not dir then return false end
	if dir.isPremium or dir.isGift then return false end
	local rarity = tostring(dir.rarity)
	if rarity == "Event" or rarity == "Exclusive" then return false end
	if pet.l or pet.r or pet.dm then return false end
	if kind == "rainbow" then return pet.g == true end
	return not pet.g
end

-- Buckets eligible pets by (pet id, hardcore) and keeps only the buckets that
-- can fill a whole guaranteed batch. Biggest bucket first.
local function machineGroups(Library, kind)
	local out = {}
	local save = Library.Save.Get()
	if not save then return out end
	local buckets = {}
	for _, pet in pairs(save.Pets or {}) do
		local dir = Library.Directory.Pets[tostring(pet.id)]
		if machineEligible(dir, pet, kind) then
			local hc = pet.hc and true or false
			local key = tostring(pet.id) .. "|" .. (hc and "1" or "0")
			local b = buckets[key]
			if not b then
				b = { id = tostring(pet.id), hc = hc, uids = {} }
				buckets[key] = b
				table.insert(out, b)
			end
			table.insert(b.uids, tostring(pet.uid))
		end
	end
	local ready = {}
	for _, b in ipairs(out) do
		local odds = machineOdds(Library, kind, b.hc)
		local need = odds and #odds or 6
		if odds and #b.uids >= need then
			b.need = need
			b.cost = tonumber(odds[need].cost) or 0
			table.insert(ready, b)
		end
	end
	table.sort(ready, function(a, c) return #a.uids > #c.uids end)
	return ready
end

-- One guaranteed batch per call.
local function machineStep(Library, kind)
	local isRainbow = (kind == "rainbow")
	local noteKey = isRainbow and "RainbowNote" or "GoldenNote"
	local idleKey = isRainbow and "RainbowIdleNotified" or "GoldenIdleNotified"
	local errKey = isRainbow and "RainbowErrShown" or "GoldenErrShown"
	local remote = isRainbow and "Use Rainbow Machine" or "Use Golden Machine"
	local label = isRainbow and "Rainbow" or "Golden"

	local groups = machineGroups(Library, kind)
	if #groups == 0 then
		State[noteKey] = isRainbow and "need 6 Golden of one pet" or "need 6 Normal of one pet"
		if not State[idleKey] then
			State[idleKey] = true
			pushNotify("Cope Hub", isRainbow
				and "No 6-of-a-kind Golden pets left to make a Rainbow"
				or "No 6-of-a-kind plain pets left to make a Golden", "sparkles")
		end
		return "idle"
	end

	local g = groups[1]
	local save = Library.Save.Get()
	local diamonds = tonumber(save and save.Diamonds) or 0
	local floor = tonumber(Config.MachineDiamondFloor) or 0
	if diamonds - g.cost < floor then
		State[noteKey] = "Diamonds at your floor"
		if not State.MachineBrokeNotified then
			State.MachineBrokeNotified = true
			pushNotify("Cope Hub", "Diamonds near your floor — pausing the Golden/Rainbow machines", "triangle-alert")
		end
		return "broke"
	end
	State.MachineBrokeNotified = false

	local batch = {}
	for i = 1, g.need do batch[i] = g.uids[i] end
	local ok, err
	local callOk, callErr = pcall(function() ok, err = Library.Network.Invoke(remote, batch) end)
	if not callOk then ok, err = false, callErr end
	if not ok then
		State[noteKey] = "failed: " .. tostring(err or "unknown")
		if not State[errKey] then
			State[errKey] = true
			pushNotify("Cope Hub", label .. " machine failed: " .. tostring(err or "unknown"), "triangle-alert")
		end
		return "err"
	end

	State[errKey] = false
	State[idleKey] = false
	local dir = Library.Directory.Pets[g.id]
	local petName = dir and tostring(dir.name) or g.id
	if isRainbow then Stats.RainbowMade += 1 else Stats.GoldenMade += 1 end
	State[noteKey] = string.format("made %s%s %s", g.hc and "Hardcore " or "", label, petName)
	return "ran"
end

AreaFarm._machineStep = machineStep

-- Machine workers: one guaranteed batch per pass while the toggle is on.
-- Golden feeds Rainbow, so running both together chains 36 plain pets into
-- one Rainbow without any manual steps.
for _, machineKind in ipairs({ "golden", "rainbow" }) do
	task.spawn(function()
		while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
		local Library = AreaFarm.Library
		if not Library then return end
		local cfgKey = (machineKind == "rainbow") and "AutoRainbow" or "AutoGolden"
		local busyKey = (machineKind == "rainbow") and "RainbowBusy" or "GoldenBusy"
		while AreaFarm.Gen == myGen do
			if Config[cfgKey] and not State[busyKey] then
				State[busyKey] = true
				local status = "idle"
				pcall(function() status = machineStep(Library, machineKind) end)
				State[busyKey] = false
				task.wait(status == "ran" and 0.15 or 2)
			else
				task.wait(0.4)
			end
		end
	end)
end

-- ========================================================================
-- INDEX — completes the game's pet Collection, egg by egg.
--
-- The Collection is server-authoritative: an entry only appears once you have
-- actually owned that pet in that variant, so this walks the eggs of the
-- worlds you pick, cheapest first, teleports in front of each one and hatches
-- it until every entry that egg can supply is registered.
--
-- What counts is the game's own list, Shared.GetAllCollectablePets(): a pet
-- that drops from a non-golden egg is worth four entries (Normal, Golden,
-- Rainbow, Dark Matter), an Exclusive pet is worth Normal only, and Event
-- pets are not collectable at all. Entry keys are "<petId>-<variant>" with
-- 1 = Normal, 2 = Golden, 3 = Rainbow, 4 = Dark Matter — exactly how
-- save.Collection stores them.
--
-- Golden and Rainbow essentially never drop on their own, so the index feeds
-- the machines instead: 6 plain of one pet -> Golden, 6 Golden -> Rainbow.
-- Dark Matter has no drop at all, so every Rainbow of a pet whose Dark Matter
-- entry is still missing gets converted and its timer paid off on the spot.
-- While the index runs, exactly those pets are held back from the auto-delete
-- pipeline — otherwise the filter eats the feedstock before it can be used.
-- ========================================================================

-- Hardcore-only drops don't exist for a normal save, so they must not be
-- counted as owed entries. Mirrors Shared.Functions.GetPetEgg.
local function indexIsHardcore(Library)
	local hc = false
	pcall(function()
		local v = Library.Shared and Library.Shared.Variables
		if type(v) == "table" and v.IsHardcore ~= nil then
			hc = v.IsHardcore == true
			return
		end
		v = Library.Variables
		if type(v) == "table" then hc = v.IsHardcore == true end
	end)
	return hc
end

-- Every "<petId>-<variant>" the game considers collectable. Static, so cached.
local function indexTargets(Library)
	if State.IndexTargets then return State.IndexTargets end
	local set, n = {}, 0
	local ok = pcall(function()
		for _, e in ipairs(Library.Shared.GetAllCollectablePets()) do
			local v = e.isDarkMatter and 4 or (e.isRainbow and 3 or (e.isGolden and 2 or 1))
			set[tostring(e.petId) .. "-" .. v] = true
			n += 1
		end
	end)
	if not ok or n == 0 then return nil end
	State.IndexTargets, State.IndexTotal = set, n
	return set
end

-- What we already own, as a set. Also counts newly-registered entries so the
-- toggle can show real progress, and watches inventory headroom: if we get
-- close to full, feedstock protection is dropped rather than wedging the hub.
local function indexCollection(Library)
	local prev = State.IndexCollection
	local set, n = {}, 0
	pcall(function()
		local save = Library.Save.Get()
		if not save then return end
		for _, k in ipairs(save.Collection or {}) do
			local key = tostring(k)
			if not set[key] then
				set[key] = true
				n += 1
				if prev and not prev[key] and Config.AutoIndex then Stats.IndexNew += 1 end
			end
		end
		local pets, maxSlots = 0, tonumber(save.MaxSlots) or 0
		for _ in pairs(save.Pets or {}) do pets += 1 end
		local tight = maxSlots > 0 and pets > (maxSlots - 60)
		if tight and not State.IndexNoProtect and Config.AutoIndex then
			if not State.IndexFullNotified then
				State.IndexFullNotified = true
				pushNotify("Cope Hub", "Inventory nearly full — Index stopped holding feedstock back from auto-delete", "triangle-alert")
			end
		elseif not tight then
			State.IndexFullNotified = false
		end
		State.IndexNoProtect = tight
	end)
	State.IndexCollection = set
	State.IndexHave = n
	return set
end

-- Pets this egg can actually drop for us (weight > 0, and hardcore-gated drops
-- only on a hardcore save). drops entries are {petId, weight, hardcoreOnly}.
local function indexEggPets(Library, eggId, hardcore)
	local ids, seen = {}, {}
	local dir = Library.Directory.Eggs[eggId]
	if not dir or type(dir.drops) ~= "table" then return ids end
	for _, drop in ipairs(dir.drops) do
		local id = tostring(drop[1])
		if (tonumber(drop[2]) or 0) > 0 and (not drop[3] or hardcore) and not seen[id] then
			seen[id] = true
			table.insert(ids, id)
		end
	end
	return ids
end

-- What an egg still owes: need[petId][variant] = true, plus the total count.
local function indexEggMissing(Library, eggId, targets, coll, hardcore)
	local need, total = {}, 0
	for _, id in ipairs(indexEggPets(Library, eggId, hardcore)) do
		local e = nil
		for v = 1, 4 do
			local key = id .. "-" .. v
			if targets[key] and not coll[key] then
				e = e or {}
				e[v] = true
				total += 1
			end
		end
		if e then need[id] = e end
	end
	return need, total
end

-- Hatchable eggs standing in the world we are in, cheapest first. Only plain
-- eggs are work units, because only they own Collection entries: the game's own
-- pet -> egg lookup (Shared.Functions.GetPetEgg) skips isGolden eggs, so a
-- golden egg never owes an entry of its own. What it is instead is a second
-- source for its plain twin's entries, one variant up — a golden egg hatches the
-- Golden copy outright (verified live: 8 of 8 hatches from a golden egg came
-- back g=true, 8 of 8 from the plain twin beside it came back Normal) — so it is
-- attached to that twin rather than listed separately. Its drops field is a
-- string naming the egg whose drop table it shares, which is how the pair is
-- matched: same pets, same weights.
--
-- wantAreaSet, when given, restricts the plain work-eggs to those whose directory
-- area is in the set — the Area-based index only touches the eggs of the areas
-- you picked. The golden map is still built from every egg in the world so an
-- in-area plain egg can always find its golden twin, wherever that twin sits.
local function indexWorldEggs(Library, hardcore, wantAreaSet)
	local eggs, golden = {}, {}
	pcall(function()
		for _, m in ipairs(Library.WorldCmds.GetAllEggs()) do
			local id = m:GetAttribute("ID")
			local dir = id and Library.Directory.Eggs[id]
			-- The game writes Unlocked=false on an egg it is gating behind an
			-- area, a prior egg or a paid pass; it leaves it unset when nothing
			-- gates it, so only an explicit false means hands off.
			if dir and dir.hatchable and not dir.disabled and m:GetAttribute("Unlocked") ~= false then
				local base = tonumber(hardcore and dir.hardcoreCost or dir.cost) or tonumber(dir.cost) or 0
				local row = {
					key = tostring(id),
					name = tostring(dir.displayName or id),
					cost = base,
					currency = tostring(dir.currency or ""),
					area = dir.area and tostring(dir.area) or nil,
				}
				if dir.isGolden then
					local twin = type(dir.drops) == "string" and dir.drops or dir.eggRequired
					if twin and twin ~= "" then golden[tostring(twin)] = row end
				elseif not wantAreaSet or (row.area and wantAreaSet[row.area]) then
					table.insert(eggs, row)
				end
			end
		end
	end)
	for _, egg in ipairs(eggs) do
		egg.golden = golden[egg.key]
	end
	table.sort(eggs, function(a, b)
		if a.cost ~= b.cost then return a.cost < b.cost end
		return a.key < b.key
	end)
	return eggs
end
AreaFarm._indexWorldEggs = indexWorldEggs

-- Stand in front of an egg so the server's distance check on "Buy Egg" passes.
local function indexTeleport(Library, eggId)
	if State.SwitchingWorld then return false, "world is switching" end
	local model = nil
	pcall(function()
		for _, m in ipairs(Library.WorldCmds.GetAllEggs()) do
			if tostring(m:GetAttribute("ID")) == tostring(eggId) then model = m break end
		end
	end)
	if not model then return false, "egg not in this world" end
	local Center = model:FindFirstChild("Center")
	if not Center then return false, "egg has no Center part" end
	local root = getRoot()
	if not root then return false, "no character" end
	local ok = pcall(function() root.CFrame = eggStandCFrame(Center, root) end)
	return ok, (not ok) and "teleport failed" or nil
end

-- One guaranteed machine batch for one specific pet. Same 100%-only rule as the
-- standalone machine feature: a batch is only ever sent at full size, so no pet
-- is ever burned on a failed roll. Returns true only when a batch actually ran.
local function indexMachineFor(Library, kind, petId)
	local save = Library.Save.Get()
	if not save then return false, "no save" end
	local buckets = { [false] = {}, [true] = {} }
	for _, pet in pairs(save.Pets or {}) do
		if tostring(pet.id) == tostring(petId)
			and machineEligible(Library.Directory.Pets[tostring(pet.id)], pet, kind) then
			table.insert(buckets[pet.hc and true or false], tostring(pet.uid))
		end
	end
	for _, hc in ipairs({ false, true }) do
		local uids = buckets[hc]
		local odds = machineOdds(Library, kind, hc)
		local need = odds and #odds or 6
		if odds and #uids >= need then
			local cost = tonumber(odds[need].cost) or 0
			if (tonumber(save.Diamonds) or 0) - cost < (tonumber(Config.IndexDiamondFloor) or 0) then
				return false, "diamonds"
			end
			local batch = {}
			for i = 1, need do batch[i] = uids[i] end
			local ok, err
			pcall(function()
				ok, err = Library.Network.Invoke(
					(kind == "rainbow") and "Use Rainbow Machine" or "Use Golden Machine", batch)
			end)
			if not ok then return false, tostring(err or "machine failed") end
			if kind == "rainbow" then Stats.RainbowMade += 1 else Stats.GoldenMade += 1 end
			return true, nil
		end
	end
	return false, nil -- not enough feedstock yet; nothing went wrong
end

-- A Rainbow is convertible regardless of whether it still carries the golden
-- flag, so this is deliberately looser than the standalone dmEligible.
local function indexDMEligible(dir, pet)
	if not pet.r or pet.dm or pet.l then return false end
	if not dir or dir.isPremium or dir.isGift then return false end
	local r = tostring(dir.rarity)
	return r ~= "Event" and r ~= "Exclusive"
end

-- Turn one Rainbow of this pet into Dark Matter and pay off the machine timer,
-- so the variant registers now instead of hours from now. If the skip can't be
-- afforded the slot is simply left to finish on its own — dmProcessQueue
-- redeems it for free on a later pass.
local function indexDMFor(Library, petId)
	local save = Library.Save.Get()
	if not save then return false, "no save" end
	-- Spend the copy the keep-set is already holding for this pet, and a normal
	-- copy before a hardcore one. Converting the held Rainbow rather than some
	-- duplicate keeps the converter and the delete filter pointed at the same pet,
	-- so auto-delete can't take the copy this was about to use.
	local uid, best = nil, -1
	local held = State.IndexKeepUids or {}
	for _, pet in pairs(save.Pets or {}) do
		if tostring(pet.id) == tostring(petId)
			and indexDMEligible(Library.Directory.Pets[tostring(pet.id)], pet) then
			local score = (held[tostring(pet.uid)] and 2 or 0) + (pet.hc and 0 or 1)
			if score > best then
				uid, best = tostring(pet.uid), score
			end
		end
	end
	if not uid then return false, nil end
	local floor = tonumber(Config.IndexDiamondFloor) or 0
	local used, slots = 0, tonumber(save.DarkMatterSlots) or 6
	for _ in pairs(save.DarkMatterQueue or {}) do used += 1 end
	if used >= slots then
		dmProcessQueue(Library, Config.IndexForceSkipDM ~= false, floor)
		return false, "DM queue full"
	end
	if (tonumber(save.Diamonds) or 0) - DMConvertCost < floor then return false, "diamonds" end
	local ok, err
	pcall(function() ok, err = Library.Network.Invoke("Convert To Dark Matter", { uid }) end)
	if not ok then return false, tostring(err or "convert failed") end
	Stats.DMMade += 1
	State.IndexKeepAt = 0 -- the held Rainbow is spent; re-decide what to protect
	task.wait(0.2)
	dmProcessQueue(Library, Config.IndexForceSkipDM ~= false, floor)
	return true, nil
end

-- Protection carve-out, read by the auto-delete pipeline. Only ever active
-- while the Index toggle is on: a Rainbow is the sole route to a Dark Matter
-- entry, and plain/Golden copies of the pets the current egg still owes are the
-- machines' feedstock, so all three have to outlive the delete filter.
--
-- This is a keep-SET, not a per-pet predicate, and that distinction is the whole
-- point. A predicate can only answer "could a pet of this kind ever be useful",
-- which protects every duplicate forever and slowly fills the inventory. A set
-- built from the whole save can also count and compare, so a pet is held only
-- while the entry it feeds is genuinely still missing and only up to the number
-- the machines can actually consume. Everything already registered in the
-- Collection, and every copy past one guaranteed batch, goes back to auto-delete.
local function indexBuildKeep(Library)
	local keep = {}
	local prevKeep = State.IndexKeepUids or {}
	local save = Library.Save.Get()
	local targets, coll = indexTargets(Library), indexCollection(Library)
	if not (save and targets and coll) then
		State.IndexKeepUids, State.IndexKeepAt = keep, os.clock()
		return keep
	end
	local needIds = State.IndexNeedIds or {}
	local function owed(id, v)
		local k = id .. "-" .. v
		return targets[k] == true and coll[k] ~= true
	end

	-- Guaranteed batch size per (machine, hardcore) — 6 Normal, 10 Hardcore.
	local batchCache = {}
	local function batchSize(kind, hc)
		local ck = kind .. (hc and "1" or "0")
		if batchCache[ck] == nil then
			local odds = machineOdds(Library, kind, hc)
			batchCache[ck] = (odds and #odds) or 6
		end
		return batchCache[ck]
	end

	local pets = {}
	for _, pet in pairs(save.Pets or {}) do table.insert(pets, pet) end
	local useMachines = Config.IndexUseMachines ~= false

	-- A conversion already ticking in the Dark Matter machine will register the
	-- variant by itself, so that pet's Rainbows stop being special the moment one
	-- goes into a slot. Queue entries carry petId + readyTime.
	local dmInFlight = {}
	for _, entry in pairs(save.DarkMatterQueue or {}) do
		if type(entry) == "table" and entry.petId then dmInFlight[tostring(entry.petId)] = true end
	end

	-- Pass 1: Rainbows. Exactly one per pet id is held, and only while that pet's
	-- Dark Matter entry is still missing — the first Rainbow you get is feedstock
	-- for the converter, every later one of the same pet is a duplicate and goes
	-- to auto-delete like anything else.
	--
	-- "First" is the oldest copy: `idt` is the game's own obtained-order counter,
	-- the tie-breaker its PetOrderBest/PetOrderParty sorts on. The choice is also
	-- sticky — a uid already held keeps its place — because otherwise a rebuild
	-- could move protection onto a different copy and let the delete sweep take
	-- the one it had just spared.
	local rainbowKept = {}
	local rbBest = {}
	for _, pet in ipairs(pets) do
		if pet.r and not pet.dm and not pet.l then
			local id = tostring(pet.id)
			if owed(id, 4) and not dmInFlight[id] then
				local uid = tostring(pet.uid)
				local idt = tonumber(pet.idt) or math.huge
				local cur = rbBest[id]
				if not cur then
					rbBest[id] = { uid = uid, idt = idt }
				else
					local heldNow, heldCur = prevKeep[uid] == true, prevKeep[cur.uid] == true
					if heldNow ~= heldCur then
						if heldNow then rbBest[id] = { uid = uid, idt = idt } end
					elseif idt < cur.idt then
						rbBest[id] = { uid = uid, idt = idt }
					end
				end
			end
		end
	end
	for id, best in pairs(rbBest) do
		rainbowKept[id] = true
		keep[best.uid] = true
	end

	-- Downstream, "is variant 4 taken care of" means either a Rainbow held back
	-- for it or one already converting, so neither needs more Goldens made.
	local dmCovered = {}
	for id in pairs(rainbowKept) do dmCovered[id] = true end
	for id in pairs(dmInFlight) do dmCovered[id] = true end

	-- Pass 2: Goldens, the Rainbow machine's feedstock. Wanted while variant 3 is
	-- missing, or while 4 is missing and nothing is already covering it. Capped at
	-- one batch per (pet id, hardcore) bucket.
	local goldKept = {}
	if useMachines then
		for _, pet in ipairs(pets) do
			if pet.g and not pet.r and not pet.dm and not pet.l then
				local id, hc = tostring(pet.id), pet.hc and true or false
				local bk = id .. "|" .. (hc and "1" or "0")
				local wanted = owed(id, 3) or (owed(id, 4) and not dmCovered[id])
				if wanted and (goldKept[bk] or 0) < batchSize("rainbow", hc) then
					goldKept[bk] = (goldKept[bk] or 0) + 1
					keep[tostring(pet.uid)] = true
				end
			end
		end
	end

	-- Pass 3: plain copies, the Golden machine's feedstock. Only for pets the egg
	-- being worked still owes, only while a further Golden is actually wanted,
	-- and capped at one batch per bucket. Suspended entirely while the index is
	-- hatching a golden egg: Goldens then arrive whole from the egg, so hoarding
	-- six Normals to fuse into one is inventory spent on nothing.
	if useMachines and not State.IndexGoldenActive then
		local plainKept = {}
		for _, pet in ipairs(pets) do
			if not pet.g and not pet.r and not pet.dm and not pet.l then
				local id, hc = tostring(pet.id), pet.hc and true or false
				local bk = id .. "|" .. (hc and "1" or "0")
				local moreGold = (owed(id, 3) or (owed(id, 4) and not dmCovered[id]))
					and (goldKept[bk] or 0) < batchSize("rainbow", hc)
				local wanted = needIds[id] and (owed(id, 2) or moreGold)
				if wanted and (plainKept[bk] or 0) < batchSize("golden", hc) then
					plainKept[bk] = (plainKept[bk] or 0) + 1
					keep[tostring(pet.uid)] = true
				end
			end
		end
	end

	State.IndexKeepUids, State.IndexKeepAt = keep, os.clock()
	return keep
end
AreaFarm._indexBuildKeep = indexBuildKeep

-- How long a keep-set is trusted before it is rebuilt. Short enough that a pet
-- stops being protected within a second of its entry registering, long enough
-- that a full-inventory delete sweep doesn't rebuild it once per pet.
local INDEX_KEEP_TTL = 0.75

local function indexProtected(pet)
	if not Config.AutoIndex or State.IndexNoProtect then return false end
	if pet.dm then return false end
	local keep = State.IndexKeepUids
	if not keep or (os.clock() - (State.IndexKeepAt or 0)) > INDEX_KEEP_TTL then
		local Library = AreaFarm.Library
		if Library and not State.IndexKeepBusy then
			State.IndexKeepBusy = true
			local ok, res = pcall(indexBuildKeep, Library)
			State.IndexKeepBusy = false
			if ok and type(res) == "table" then keep = res end
		end
	end
	if type(keep) ~= "table" then return false end
	return keep[tostring(pet.uid)] == true
end
AreaFarm._indexProtected = indexProtected

-- Worlds the user picked for the index, resolved against the game's own data:
-- only worlds that exist, aren't disabled, and we can actually enter. Returned in
-- the game's own world order (Directory.Worlds[name].worldOrder). You pick the
-- worlds you want completed; the index visits each and works every egg in it.
local function indexSelectedWorlds(Library)
	local want = {}
	for k, v in pairs(Config.IndexWorlds or {}) do
		if type(v) == "string" then want[v] = true elseif v == true then want[tostring(k)] = true end
	end
	local list = {}
	pcall(function()
		local Worlds = Library.Directory.Worlds
		local wl = {}
		for name, wd in pairs(Worlds) do
			if want[name] and not wd.disabled then
				local access = false
				pcall(function() access = Library.WorldCmds.HasAccess(name) == true end)
				if access then
					table.insert(wl, { name = name, order = tonumber(wd.worldOrder) or 99 })
				end
			end
		end
		table.sort(wl, function(a, b)
			if a.order ~= b.order then return a.order < b.order end
			return a.name < b.name
		end)
		for _, w in ipairs(wl) do table.insert(list, w.name) end
	end)
	return list
end

-- Every "<petId>-<variant>" still owed by the eggs of the given worlds, and the
-- count. This is the completeness measure for a World-based selection: the union
-- over each egg in the world (its area maps to Areas[area].world) of the variants
-- it can complete, restricted to what the game marks collectable and we don't
-- already own. Used for the progress read-out.
local function indexWorldsOwed(Library, worldSet, hardcore)
	local targets, coll = indexTargets(Library), indexCollection(Library)
	if not (targets and coll) then return nil end
	local owed, have, total = 0, 0, 0
	local seenKey = {}
	pcall(function()
		local Areas = Library.Directory.Areas
		for id, dir in pairs(Library.Directory.Eggs) do
			if dir and dir.hatchable and not dir.disabled and not dir.isGolden and dir.area then
				local a = Areas[tostring(dir.area)]
				local w = a and tostring(a.world or "") or nil
				if w and worldSet[w] then
					for _, pid in ipairs(indexEggPets(Library, tostring(id), hardcore)) do
						for v = 1, 4 do
							local key = pid .. "-" .. v
							if targets[key] and not seenKey[key] then
								seenKey[key] = true
								total += 1
								if coll[key] then have += 1 else owed += 1 end
							end
						end
					end
				end
			end
		end
	end)
	return { owed = owed, have = have, total = total }
end
AreaFarm._indexWorldsOwed = indexWorldsOwed

local function indexEnterWorld(Library, world)
	local cur = nil
	pcall(function() cur = Library.WorldCmds.Get() end)
	if cur == world then return true, nil end
	local access = false
	pcall(function() access = Library.WorldCmds.HasAccess(world) == true end)
	if not access then return false, "no access" end
	State.SwitchingWorld = true
	local ok, res = pcall(function() return Library.WorldCmds.Load(world) end)
	State.SwitchingWorld = false
	if not (ok and res == true) then return false, "world refused" end
	task.wait(1.5)
	return true, nil
end

-- Spend what we already hold before buying more eggs: convert Rainbows whose
-- Dark Matter entry is missing, then run the Rainbow machine, then the Golden
-- machine. Note the machines are driven by the entries still owed DOWNSTREAM —
-- once a pet's Golden entry is registered we keep making Goldens anyway,
-- because six of them are what the Rainbow machine needs.
local function indexSpendHeld(Library, need)
	local worked = false
	for id, miss in pairs(need) do
		if not (AreaFarm.Gen == myGen and Config.AutoIndex) then return worked end
		if miss[4] then
			local guard = 0
			while guard < 8 and indexDMFor(Library, id) do
				worked, guard = true, guard + 1
				task.wait(0.15)
			end
		end
		if Config.IndexUseMachines ~= false then
			for _, step in ipairs({ { "rainbow", miss[3] or miss[4] }, { "golden", miss[2] or miss[3] or miss[4] } }) do
				if step[2] then
					local guard = 0
					while guard < 12 and indexMachineFor(Library, step[1], id) do
						worked, guard = true, guard + 1
						task.wait(0.15)
					end
				end
			end
		end
	end
	return worked
end

-- Work one egg until it owes the Collection nothing, or until it stops paying
-- out. Returns "done" | "stalled" | "broke" | "skip" | "stop".
local function indexWorkEgg(Library, egg, hardcore)
	local targets = indexTargets(Library)
	if not targets then return "stop" end
	local hatches, sinceProgress = 0, 0
	local cap = math.max(0, tonumber(Config.IndexEggCap) or 0)
	local patience = math.max(0, tonumber(Config.IndexEggPatience) or 600)
	local floor = tonumber(Config.IndexDiamondFloor) or 0
	State.IndexEgg = egg.name
	State.IndexGoldenActive = false
	while AreaFarm.Gen == myGen and Config.AutoIndex do
		local coll = indexCollection(Library)
		local need, total = indexEggMissing(Library, egg.key, targets, coll, hardcore)
		local ids = {}
		for id in pairs(need) do ids[id] = true end
		State.IndexNeedIds = ids
		if total == 0 then
			State.IndexNote = egg.name .. ": complete"
			State.IndexGoldenActive = false
			return "done"
		end
		State.IndexNote = string.format("%s — %d entr%s left", egg.name, total, total == 1 and "y" or "ies")

		-- redeem anything the Dark Matter machine has already finished
		local queued = false
		pcall(function()
			local s = Library.Save.Get()
			for _ in pairs(s and s.DarkMatterQueue or {}) do queued = true break end
		end)
		if queued then pcall(dmProcessQueue, Library, Config.IndexForceSkipDM ~= false, floor) end

		if indexSpendHeld(Library, need) then
			task.wait(0.25)
			continue
		end

		local save = Library.Save.Get()
		-- Hatch amount is per-iteration: the x8 unlock can be bought mid-run, and
		-- eggAmountAllowed quietly drops back to x3 when it isn't owned.
		local amount = eggAmountAllowed(save, tonumber(Config.IndexHatchAmount) or 3)
		if amount ~= (tonumber(Config.IndexHatchAmount) or 3) and not State.OctupleWarned then
			State.OctupleWarned = true
			pushNotify("Cope Hub", "You don't own the x8 hatch unlock — indexing with x3 instead", "triangle-alert")
		end
		-- Which of the pair to buy from. The Collection records exactly the
		-- variant that hatched and never a lesser one, so a Normal entry can only
		-- ever be filled by the plain egg — while any is owed, that is where the
		-- money goes. Once none are, everything left is Golden or above, and the
		-- golden twin becomes the cheaper route despite costing ~9x per hatch: it
		-- hands over the Golden copy directly instead of six plain duplicates and
		-- a Golden-machine payment for it.
		local wantsNormal = false
		for _, e in pairs(need) do
			if e[1] then wantsNormal = true break end
		end
		local src = egg
		if egg.golden and not wantsNormal and Config.IndexGoldenEggs ~= false then
			local g = egg.golden
			-- Take the golden route as long as a single golden hatch is affordable;
			-- the batch is trimmed to the wallet just below.
			if (tonumber(save and save[g.currency]) or 0) >= g.cost then src = g end
		end
		State.IndexGoldenActive = src ~= egg
		if src ~= egg then
			State.IndexNote = string.format("%s — %d entr%s left, hatching golden", egg.name, total, total == 1 and "y" or "ies")
		end

		-- Trim the batch to what the wallet can actually cover. The index only needs
		-- the right pets to drop, not bulk, so when a full x8/x3 batch is out of
		-- reach but a smaller one isn't, hatch the smaller one instead of abandoning
		-- the egg. Without this a cheap egg that still owes a variant gets skipped
		-- purely for want of 8x its price, and the worker just hops egg to egg
		-- hatching nothing. If not even one hatch is affordable, amount falls to 1
		-- and the affordability check below reports a truthful "broke".
		do
			local bal = tonumber(save and save[src.currency]) or 0
			local pick = nil
			for _, sz in ipairs({ 8, 3, 1 }) do
				if sz <= amount and bal >= src.cost * sz then pick = sz break end
			end
			amount = pick or 1
		end
		local triple, octuple = eggBuyFlags(amount)

		local tok, terr = indexTeleport(Library, src.key)
		if not tok then
			if src ~= egg then
				-- The twin isn't really standing in this world; drop it and let the
				-- next lap of the loop fall back to the plain egg.
				egg.golden, State.IndexGoldenActive = nil, false
				task.wait(0.25)
				continue
			end
			State.IndexNote = egg.name .. ": " .. tostring(terr)
			return (terr == "egg not in this world") and "skip" or "stalled"
		end
		local cost = src.cost * amount
		if (tonumber(save and save[src.currency]) or 0) < cost then
			if src ~= egg then
				State.IndexGoldenActive = false
				task.wait(0.25)
				continue
			end
			State.IndexNote = string.format("%s — need %s %s", src.name, abbrev(cost), src.currency)
			return "broke"
		end
		local bok, berr
		pcall(function() bok, berr = Library.Network.Invoke("Egg: Buy Egg", src.key, triple, octuple) end)
		if bok then
			Stats.Eggs += amount
			hatches += amount
			sinceProgress += amount
		else
			local e = tostring(berr or "unknown")
			if string.find(e, "too quickly") then
				task.wait(1.5)
			elseif string.find(e, "too far") then
				indexTeleport(Library, src.key)
				task.wait(0.5)
			elseif string.find(e, "afford") or string.find(e, "enough") then
				if src ~= egg then
					State.IndexGoldenActive = false
					task.wait(0.25)
					continue
				end
				State.IndexNote = src.name .. ": " .. e
				return "broke"
			else
				State.IndexNote = src.name .. ": " .. e
				return "stalled"
			end
		end
		task.wait(math.max(1.2, tonumber(Config.IndexHatchDelay) or 1.2))
		local _, after = indexEggMissing(Library, egg.key, targets, indexCollection(Library), hardcore)
		if after < total then sinceProgress = 0 end
		-- New pets and possibly new Collection entries: the keep-set is stale, so
		-- expire it rather than letting anything just registered stay protected.
		State.IndexKeepAt = 0
		State.IndexHatched = hatches
		if cap > 0 and hatches >= cap then
			State.IndexNote = egg.name .. ": hatch cap reached"
			return "stalled"
		end
		if patience > 0 and sinceProgress >= patience then
			State.IndexNote = string.format("%s: no new entries in %d hatches", egg.name, patience)
			return "stalled"
		end
	end
	return "stop"
end

AreaFarm._indexWorkEgg = indexWorkEgg

-- Index worker: walk the selected WORLDS, in the game's own world order. Each
-- world is entered once, then every hatchable egg in it is worked cheapest first,
-- each until it owes the Collection nothing. An egg that runs out of money or
-- patience is left behind and retried on the next lap, so the pass never wedges on
-- a single unaffordable egg, and every variant of every pet in the chosen worlds
-- is chased across laps until the whole selection is complete.
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		if not Config.AutoIndex then
			if State.IndexBusy or State.IndexNote ~= "off" then
				State.IndexBusy, State.IndexNote = false, "off"
				State.IndexEgg, State.IndexWorld, State.IndexNeedIds = nil, nil, nil
				State.IndexKeepUids, State.IndexKeepAt = nil, 0
				State.IndexFullNotified = false
			end
			task.wait(0.6)
			continue
		end
		State.IndexBusy = true
		local ok, err = pcall(function()
			local hardcore = indexIsHardcore(Library)
			local worlds = indexSelectedWorlds(Library)
			if #worlds == 0 then
				State.IndexNote = "pick at least one world"
				task.wait(2)
				return
			end
			local newAtLapStart = Stats.IndexNew
			-- The set of selected worlds, for the idle read-out.
			local worldSet = {}
			for _, w in ipairs(worlds) do worldSet[w] = true end
			for _, world in ipairs(worlds) do
				if not (AreaFarm.Gen == myGen and Config.AutoIndex) then return end
				State.IndexWorld = world
				local wok, werr = indexEnterWorld(Library, world)
				if not wok then
					State.IndexNote = world .. ": " .. tostring(werr)
					task.wait(1.5)
					continue
				end
				local eggs = indexWorldEggs(Library, hardcore)
				if #eggs == 0 then
					State.IndexNote = world .. ": no hatchable eggs"
					task.wait(1.5)
					continue
				end
				for _, egg in ipairs(eggs) do
					if not (AreaFarm.Gen == myGen and Config.AutoIndex) then return end
					local sok, status = pcall(indexWorkEgg, Library, egg, hardcore)
					if not sok then
						State.IndexNote = egg.name .. ": " .. tostring(status)
						status = "stalled"
					end
					if status == "stop" then return end
					task.wait(0.2)
				end
			end
			local progressed = Stats.IndexNew > newAtLapStart
			State.IndexEgg, State.IndexNeedIds = nil, nil
			if not progressed then
				-- Nothing moved on a whole lap: either the selected worlds are
				-- complete or every remaining egg is priced out. Idle rather than
				-- spin, and let the next lap pick it up once coins recover.
				local owed = indexWorldsOwed(Library, worldSet, hardcore)
				local left = owed and owed.owed or 0
				State.IndexNote = (left == 0) and "selected worlds complete"
					or string.format("waiting — %d entries need more coins", left)
				task.wait(10)
			end
		end)
		State.IndexBusy = false
		if not ok then
			State.IndexNote = "error: " .. tostring(err)
			task.wait(3)
		else
			task.wait(0.4)
		end
	end
end)

-- Manual one-shot teleport in front of the selected egg.
-- Touches WorldCmds, so callers must run it on a worker thread (task.spawn).
AreaFarm._teleportToEgg = function()
	local Library = AreaFarm.Library
	if not Library then return false, "Library not ready" end
	local key = Config.EggKey
	if not key then return false, "no egg selected" end
	if State.SwitchingWorld then return false, "world is switching" end
	local model = nil
	pcall(function()
		for _, m in ipairs(Library.WorldCmds.GetAllEggs()) do
			if m:GetAttribute("ID") == key then
				model = m
				break
			end
		end
	end)
	if not model then return false, "egg not found in this world" end
	local Center = model:FindFirstChild("Center")
	if not Center then return false, "egg has no Center part" end
	local char = Players.LocalPlayer.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then return false, "no character" end
	root.CFrame = eggStandCFrame(Center, root)
	return true, nil
end

-- Orbs: remote claim (batches of 5) and/or magnet teleport
local function orbStep(Library)
	if not (Config.AutoOrbs or Config.MagnetOrbs) then task.wait(0.25) return end
	if State.SwitchingWorld then task.wait(0.5) return end
	local root = getRoot()
	if not root then task.wait(0.5) return end
	local pos = root.Position
	local T = things()
	local Orbs = T and T:FindFirstChild("Orbs")
	if not Orbs then task.wait(0.5) return end
	local children = Orbs:GetChildren()
	if Config.AutoOrbs then
		local batch = {}
		for _, o in ipairs(children) do
			if #batch >= 10 then break end
			if o:IsA("BasePart") then
				local d = (o.Position - pos).Magnitude
				if Config.MaxDistance <= 0 or d <= Config.MaxDistance then
					table.insert(batch, o.Name)
				end
			end
		end
		if #batch > 0 then
			pcall(function() Library.Network.Fire("Claim Orbs", batch) end)
			Stats.Orbs += #batch
		end
	end
	if Config.MagnetOrbs then
		local movedAll = 0
		pcall(function()
			for _, o in ipairs(children) do
				if o:IsA("BasePart") then
					local d = (o.Position - pos).Magnitude
					if (Config.MaxDistance <= 0 or d <= Config.MaxDistance) and d > 3 then
						o.CFrame = CFrame.new(pos + Vector3.new((math.random() - 0.5) * 4, 1.5 + math.random(), (math.random() - 0.5) * 4))
						movedAll += 1
						if movedAll >= 400 then break end
					end
				end
			end
		end)
		if movedAll > 0 and not Config.AutoOrbs then
			Stats.Orbs += movedAll
		end
	end
	task.wait(Config.MagnetOrbs and 0.1 or 0.25)
end

task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		local ok, err = pcall(orbStep, Library)
		if not ok then
			warn("[AreaFarm] orb error: " .. tostring(err))
			task.wait(1)
		end
	end
end)

-- Lootbags: remote collect and/or magnet teleport to feet
local function bagStep(Library)
	if not (Config.AutoBags or Config.MagnetBags) then task.wait(0.25) return end
	if State.SwitchingWorld then task.wait(0.5) return end
	local root = getRoot()
	if not root then task.wait(0.5) return end
	local pos = root.Position
	local T = things()
	local Bags = T and T:FindFirstChild("Lootbags")
	if not Bags then task.wait(0.5) return end
	local acted = 0
	for _, bag in ipairs(Bags:GetChildren()) do
		if acted >= 15 then break end
		if bag:IsA("BasePart") then
			local d = (bag.Position - pos).Magnitude
			if Config.MaxDistance <= 0 or d <= Config.MaxDistance then
				if Config.AutoBags then
					local id = coinAttr(bag, "ID")
					if id then
						pcall(function() Library.Network.Fire("Collect Lootbag", id, bag.Position) end)
						Stats.Bags += 1
						acted += 1
					end
				elseif Config.MagnetBags and coinAttr(bag, "ReadyForCollection") then
					pcall(function() bag.CFrame = CFrame.new(pos + Vector3.new(0, -2.5, 0)) end)
					Stats.Bags += 1
					acted += 1
				end
			end
		end
	end
	task.wait(0.4)
end

task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		local ok, err = pcall(bagStep, Library)
		if not ok then
			warn("[AreaFarm] bag error: " .. tostring(err))
			task.wait(1)
		end
	end
end)

-- ========================================================================
-- HUGE-HATCH WEBHOOK
-- ========================================================================

local function isDiscordWebhook(url)
	return url:find("^https://discord%.com/api/webhooks/") ~= nil
		or url:find("^https://discordapp%.com/api/webhooks/") ~= nil
end

local function fmtChance(c)
	if type(c) ~= "number" or c <= 0 then return nil end
	local s = string.format("%.8f", c):gsub("0+$", ""):gsub("%.$", "")
	local oneIn = math.floor(100 / c + 0.5)
	local extra = ""
	if oneIn >= 1 and oneIn <= 1e12 then extra = " (1 in " .. string.format("%.12g", oneIn) .. ")" end
	return s .. "%" .. extra
end

local function petImageURL(pet)
	local thumb = tostring(pet.thumbnail or "")
	local id = thumb:match("%d+")
	if not id then return nil end
	return "https://www.roblox.com/asset-thumbnail/image?assetId=" .. id .. "&width=420&height=420&format=png"
end

local function petFullName(pet, h)
	local n = tostring(pet.name or h.id)
	if h.dm then return "Dark Matter " .. n end
	if h.r then return "Rainbow " .. n end
	if h.g then return "Golden " .. n end
	return n
end

AreaFarm._sendWebhook = function(url, embeds)
	url = tostring(url or "")
	if url == "" then return false, "no URL set" end
	if not isDiscordWebhook(url) then
		return false, "not a Discord webhook URL"
	end
	local ok, res = pcall(function()
		return request({
			Url = url,
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json" },
			Body = HttpService:JSONEncode({ username = "Cope Hub", embeds = embeds }),
		})
	end)
	if not ok then return false, tostring(res) end
	local code = tonumber(res.StatusCode) or tonumber(res.status) or tonumber(res.code) or 0
	if code == 200 or code == 204 then return true end
	return false, "HTTP " .. tostring(code)
end

-- Called by the Open Egg listener on every hatch; sends embeds for any Huge in the batch
AreaFarm._processHatch = function(eggName, pets)
	if type(pets) ~= "table" then return end
	local Library = AreaFarm.Library
	if not Library then return end
	State.HatchesSeen = (State.HatchesSeen or 0) + 1
	local eggDir = Library.Directory.Eggs[tostring(eggName)]
	local embeds = {}
	for _, h in ipairs(pets) do
		local pet = Library.Directory.Pets[tostring(h.id)]
		if pet and pet.huge then
			Stats.Huges += 1
			local chance = nil
			if eggDir and type(eggDir.drops) == "table" then
				for _, d in ipairs(eggDir.drops) do
					if tostring(d[1]) == tostring(h.id) then
						chance = tonumber(d[2])
						break
					end
				end
			end
			local fields = {
				{ name = "Pet", value = petFullName(pet, h), inline = true },
				{ name = "Chance", value = fmtChance(chance) or "Unknown", inline = true },
				{ name = "Egg", value = tostring(eggName), inline = true },
				{ name = "Hatched By", value = Players.LocalPlayer.Name, inline = true },
				{ name = "Rarity", value = tostring(pet.rarity or "?"), inline = true },
			}
			if tonumber(h.s) then
				table.insert(fields, { name = "Strength", value = abbrev(tonumber(h.s)), inline = true })
			end
			local embed = {
				title = "HUGE HATCHED!",
				color = 0xFFB300,
				fields = fields,
				footer = { text = "Cope Hub" },
				timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
			}
			local img = petImageURL(pet)
			if img then embed.thumbnail = { url = img } end
			table.insert(embeds, embed)
		end
	end
	if #embeds == 0 then return end
	pushNotify("Cope Hub", "HUGE hatched! " .. (Config.WebhookEnabled and "Webhook sent." or "(webhook off)"), "sparkles")
	if Config.WebhookEnabled then
		task.spawn(function()
			local ok, err = AreaFarm._sendWebhook(Config.WebhookURL, embeds)
			if not ok then
				pushNotify("Cope Hub", "Webhook failed: " .. tostring(err), "triangle-alert")
			end
		end)
	end
end

-- Open Egg listener (worker thread — Library access)
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	local conn = nil
	while AreaFarm.Gen == myGen and not conn do
	local ok, sig = pcall(function() return Library.Network.Fired("openegggg") end)
		if ok and sig then
			conn = sig:Connect(function(eggName, pets)
				pcall(function() AreaFarm._processHatch(eggName, pets) end)
			end)
			State.WebhookHooked = true
		else
			task.wait(1)
		end
	end
	while AreaFarm.Gen == myGen do task.wait(1) end
	if conn then pcall(function() conn:Disconnect() end) end
end)

-- Test embed (used by the UI button)
AreaFarm._testWebhook = function()
	local embed = {
		title = "HUGE HATCHED! (TEST)",
		color = 0xFFB300,
		thumbnail = { url = "https://www.roblox.com/asset-thumbnail/image?assetId=7385712900&width=420&height=420&format=png" },
		fields = {
			{ name = "Pet", value = "Huge Cat (sample)", inline = true },
			{ name = "Chance", value = "2% (1 in 50)", inline = true },
			{ name = "Egg", value = "Exclusive Egg 1", inline = true },
			{ name = "Hatched By", value = Players.LocalPlayer.Name, inline = true },
			{ name = "Rarity", value = "Exclusive", inline = true },
		},
		footer = { text = "Area Farm Hub — test" },
		timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
	}
	return AreaFarm._sendWebhook(Config.WebhookURL, { embed })
end

-- ========================================================================
-- BOOSTS (buy with diamonds / activate from inventory)
-- ========================================================================

-- Bulk buy, reality-checked. The game's "Buy Boost" acks EVERY call instantly and
-- truthy, then silently de-dupes/coalesces: fire a burst and only ~1-9 of 10
-- actually debit; sustain volume and the server soft-bans further buys for minutes.
-- So we VERIFY against the diamond balance (and boost inventory) after each batch
-- and keep topping up until the target count is genuinely committed. "Bought N" is
-- therefore always a true count, never an ack count.
AreaFarm._buyBoosts = function(key, amount, onProgress, opts)
	opts = opts or {}
	local Library = AreaFarm.Library
	if not Library then return 0, "Library not ready" end
	if amount <= 0 then return 0 end
	local price = 10000
	for _, b in ipairs(AreaFarm.BOOSTS) do
		if b.key == key then price = b.price or 10000 break end
	end
	local floor_ = opts.floor

	local lastSave, wantSave
	lastSave, wantSave = pcall(function() return Library.Save.Get() end)
	if not lastSave or not wantSave then return 0, "save not ready" end
	local startInv = tonumber(wantSave.BoostsInventory and wantSave.BoostsInventory[key]) or 0
	local balance0 = tonumber(wantSave.Diamonds)
	if not balance0 then return 0, "no diamond balance" end

	-- Estimate diamond drift from farming so income doesn't look like purchases.
	local drift = 0
	do
		task.wait(2)
		local s2 = nil
		pcall(function() s2 = Library.Save.Get() end)
		if s2 and tonumber(s2.Diamonds) then drift = (tonumber(s2.Diamonds) - balance0) / 2 end
	end

	local realized, attempts, frozenBatchn = 0, 0, 0
	local lastBal = balance0
	local t0 = os.clock()
	local deadline = t0 + (opts.timeout or 150)
	local GAP = 0.30
	local err

	local function reconcile()
		local s = nil
		pcall(function() s = Library.Save.Get() end)
		if not s then return end
		local invN = s.BoostsInventory and tonumber(s.BoostsInventory[key])
		if invN then realized = math.max(realized, invN - startInv) end
		local bal = tonumber(s.Diamonds)
		if bal then
			local balReal = math.floor((balance0 - bal + drift * (os.clock() - t0)) / price + 0.5)
			if balReal > 0 then realized = math.max(realized, balReal) end
			lastBal = bal
		end
	end

	local BATCH = 10
	while realized < amount and attempts < amount * 2 and os.clock() < deadline do
		local toFire = math.min(BATCH, math.max(1, amount - realized))
		for i = 1, toFire do
			pcall(function() Library.Network.Invoke("Buy Boost", key) end)
			attempts += 1
			if attempts >= amount * 2 then break end
			task.wait(GAP)
		end
		task.wait(3.5)
		reconcile()
		if os.clock() < deadline and realized >= amount then break end
		if onProgress then onProgress(math.min(realized, amount), amount) end
		-- Adaptive backing off: if commits look lossy, slow the cadence.
		if attempts >= 8 and realized / attempts < 0.5 then
			GAP = math.min(GAP + 0.06, 0.6)
		end
		-- Detect the server's silent freeze (no commits AND no spend across batches).
		if realized < 1 and attempts >= BATCH and frozenBatchn == 0 then
			frozenBatchn = attempts
		end
		if frozenBatchn > 0 and attempts == frozenBatchn + BATCH and realized < 1 then
			err = "server is throttling boost buys — take a 60s break, then retry"
			break
		end
		if floor_ then
			local bal = tonumber(lastBal)
			if bal and bal - (amount - realized) * price < floor_ then
				err = "diamond floor hit before the goal was met"
				break
			end
		end
	end
	task.wait(2.5)
	reconcile()
	if floor_ then
		local bal = tonumber(lastBal)
		if bal and bal < floor_ then err = err or "diamond floor hit" end
	end
	if not err and realized < amount then
		err = string.format("bought %d/%d — rest rejected by the server, run again", realized, amount)
	end
	if onProgress then onProgress(math.min(realized, amount), amount) end
	return realized, err
end

AreaFarm._activateBoosts = function(key, amount)
	local Library = AreaFarm.Library
	if not Library then return 0 end
	for i = 1, amount do
		pcall(function() Library.Network.Fire("Activate Boost", key) end)
	end
	return amount
end

-- ========================================================================
-- AUTO ENCHANT
-- Enchants a batch of eligible pets "at the same time", repeatedly, until
-- each one rolls a desired enchant. Enchanting REPLACES a pet's existing
-- powers with one random power and costs Diamonds (10k normal / 500k
-- hardcore per pet), so this can burn a lot of Diamonds chasing a rare tier
-- — the Diamond Floor guard is the brake.
--
-- Concurrency mirrors _buyBoosts: the native UI only ever sends <=3 uids per
-- "Enchant Pets" invoke, so we chunk the batch into groups of 3 and fire the
-- chunks concurrently. That guarantees server compatibility regardless of any
-- per-invoke cap, while still hitting ~10 pets in one wave.
-- ========================================================================

-- pet is eligible exactly as the game's own Enchant Pets panel decides:
-- dir.isPremium / isGift are DIRECTORY fields, plus the rarity blocklist.
local function isEnchantEligible(Library, pet)
	local dir = Library.Directory.Pets[pet.id]
	if not dir then return false end
	if dir.isPremium or dir.isGift then return false end
	local r = dir.rarity
	if r == "Mythical" or r == "Exclusive" then return false end
	return true
end

-- true if any of the pet's live power tier titles is in the desired set
local function petHasDesired(Library, pet, desiredSet)
	if not pet then return false end
	for _, pr in ipairs(pet.powers or {}) do
		local P = Library.Directory.Powers[pr[1]]
		local ti = P and P.tiers and P.tiers[pr[2]]
		if ti and desiredSet[ti.title] then return true end
	end
	return false
end

-- Build the current working pool: eligible pets that still lack a desired
-- enchant, minus locked (optional) and minus uids the server keeps rejecting.
local function enchantPool(Library, desiredSet)
	local data = Library.Save.Get()
	if not data then return nil, 0 end
	State.EnchantFails = State.EnchantFails or {}
	local pool, total = {}, 0
	for _, pet in pairs(data.Pets or {}) do
		if isEnchantEligible(Library, pet) then
			total += 1
			if (not Config.EnchantSkipLocked or not pet.l)
				and (State.EnchantFails[tostring(pet.uid)] or 0) < 3
				and not petHasDesired(Library, pet, desiredSet) then
				table.insert(pool, pet)
			end
		end
	end
	return pool, total, tonumber(data.Diamonds) or 0
end

-- One enchant wave. Returns a status string plus (attempted, reachedDesired).
AreaFarm._enchantOnce = function(Library, desired)
	Library = Library or AreaFarm.Library
	if not Library then return "no library" end
	desired = desired or Config.EnchantDesired or {}
	local desiredSet = {}
	for _, t in ipairs(desired) do desiredSet[t] = true end
	if not next(desiredSet) then State.EnchantNote = "no desired enchant picked"; return "no desired" end

	local pool, totalEligible, dia = enchantPool(Library, desiredSet)
	if not pool then State.EnchantNote = "no save"; return "no save" end
	if #pool == 0 then
		State.EnchantNote = (totalEligible > 0)
			and string.format("all %d eligible pet(s) have a desired enchant", totalEligible)
			or "no eligible pets to enchant"
		return "done"
	end

	local costN = tonumber(Library.Network.Invoke("Get Enchant Pets Info"))
		or tonumber(Library.Shared.EnchantCost) or 10000
	local costHC = tonumber(Library.Shared.EnchantHardcoreCost) or costN
	local floor = math.max(0, tonumber(Config.EnchantDiamondFloor) or 0)
	local batchN = math.clamp(math.floor(tonumber(Config.EnchantBatch) or 10), 1, 30)

	-- pick up to batchN pets we can afford without dropping below the floor
	local budget = (floor > 0) and (dia - floor) or math.huge
	local sel = {}
	for _, pet in ipairs(pool) do
		if #sel >= batchN then break end
		local c = pet.hc and costHC or costN
		if budget - c >= 0 then
			budget -= c
			table.insert(sel, pet)
		end
	end
	if #sel == 0 then
		State.EnchantNote = string.format("paused: Diamonds %s at/near floor %s", commas(dia), commas(floor))
		return "floor"
	end

	-- this title rolls one pet per Invoke, single uid. Fire the whole batch
	-- back-to-back with no pacing: each Invoke blocks until the server
	-- answers, so the next pet starts the instant the last resolved — the
	-- full wave moves as one burst, not paced-out single rolls.
	local ok = {}
	local variables = Library.Variables
	local prev = variables.UsingMachine
	variables.UsingMachine = true
	for _, pet in ipairs(sel) do
		local uid = tostring(pet.uid)
		local success
		pcall(function() success = Library.Network.Invoke("Enchant Pet", uid) end)
		ok[uid] = success and true or false
	end
	variables.UsingMachine = prev

	-- per-uid bookkeeping: reset fails on success, else count toward the
	-- 3-strike blacklist (handles trading-booth / otherwise-stuck pets)
	State.EnchantFails = State.EnchantFails or {}
	for _, pet in ipairs(sel) do
		local uid = tostring(pet.uid)
		if ok[uid] then
			State.EnchantFails[uid] = 0
		else
			State.EnchantFails[uid] = (State.EnchantFails[uid] or 0) + 1
		end
	end

	Stats.EnchantRolls += #sel
	-- count how many of the rolled pets now hold a desired enchant.
	-- keep a small settle so the enchant result replicates into the save
	-- before the next wave recomputes the pool (avoids re-rolling a pet
	-- that just reached desired and burning Diamonds on it).
	task.wait(0.1)
	local reached = 0
	for _, pet in ipairs(sel) do
		local live
		pcall(function() live = Library.PetCmds.Get(tostring(pet.uid)) end)
		if petHasDesired(Library, live, desiredSet) then reached += 1 end
	end
	Stats.EnchantDone += reached
	State.EnchantNote = string.format("rolled %d, %d reached desired (%s left)",
		#sel, reached, commas(math.max(0, #pool - reached)))
	return "ran", #sel, reached
end

-- Auto-enchant worker: runs waves while the toggle is on.
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		task.wait(0.1)
		if Config.AutoEnchant and not State.EnchantBusy then
			State.EnchantBusy = true
			local status = "idle"
			pcall(function() status = AreaFarm._enchantOnce(Library) end)
			State.EnchantBusy = false
			-- ran => fire the next wave immediately; anything else => back off
			task.wait(status == "ran" and 0 or 2.5)
		end
	end
end)

-- ========================================================================
-- AUTO-DELETE (Rarity/Variant Filter)
-- Instant: hooks "Pet Added"; safety sweep catches everything else.
-- Always protected: locked pets and egg items. The filter additionally
-- spares, per rarity, the variants listed in KeepVariants[rarity], plus
-- (toggleable) Huges/Titanics.
-- ========================================================================

-- Variant of a pet save entry: dm > r > g, otherwise Normal (shiny is orthogonal)
local function petVariants(pet)
	if pet.dm then return "Dark Matter" end
	if pet.r then return "Rainbow" end
	if pet.g then return "Golden" end
	return "Normal"
end

-- ------------------------------------------------------------------
-- GIFT OPENING helpers (Auto Open Gifts feature)
-- A "gift" is an inventory item whose Directory entry has isGift == true
-- and a giftEggId pointing at the Eggs drop table it hatches into.
-- ------------------------------------------------------------------

-- Set of pet ids the selected gift can drop that are Exclusive AND NOT
-- huge/titanic — i.e. the "normal trash" exclusives the gift spits out.
-- Huge/titanic drops are deliberately excluded so they are always kept.
local function buildGiftTrashIds(Library, giftEggId)
	local set = {}
	if not (Library and giftEggId) then return set end
	local egg = Library.Directory.Eggs[giftEggId]
	if not egg or type(egg.drops) ~= "table" then return set end
	for _, drop in ipairs(egg.drops) do
		local did = tostring(drop[1])
		local pd = Library.Directory.Pets[did]
		if pd and tostring(pd.rarity) == "Exclusive" and not pd.huge and not pd.titanic then
			set[did] = true
		end
	end
	return set
end

-- Held, unopened gift items of the selected gift type: returns { uids }, heldId.
-- Matches by the Directory entry's giftEggId so numeric-id / name aliasing is a non-issue.
local function collectGiftUids(Library, giftEggId)
	local uids, heldId = {}, nil
	local save = Library.Save.Get()
	if not save then return uids, heldId end
	for _, pet in pairs(save.Pets or {}) do
		local d = Library.Directory.Pets[tostring(pet.id)]
		if d and d.isGift and tostring(d.giftEggId) == tostring(giftEggId) then
			uids[#uids + 1] = tostring(pet.uid)
			heldId = tostring(pet.id)
		end
	end
	return uids, heldId
end

-- Is gift-drop cleanup live at all? True when the delete pipeline is armed (either
-- "Auto Open Gifts" is on, or a manual/timed batch run has armed it) AND at least
-- one variant toggle is set. The SCOPE comes from State.GiftTrashIds, which is built
-- only from the selected gift egg's own Exclusive drops -- so with the Halloween gift
-- picked, nothing outside Halloween gift drops can ever be touched.
local function giftTrashActive()
	if not (Config.AutoOpenGifts == true or State.GiftDeleteArmed == true) then return false end
	return Config.GiftDeleteNormal == true or Config.GiftDeleteGolden == true or Config.GiftDeleteRainbow == true
end

-- One toggle per variant, so you can clear Normals (and optionally Goldens) while
-- keeping every Rainbow. Dark Matter, Shiny, locked and Huge/Titanic never qualify.
local function isGiftTrash(Library, pet)
	if not giftTrashActive() then return false end
	local trash = State.GiftTrashIds
	if not trash or not trash[tostring(pet.id)] then return false end
	if pet.l == true then return false end        -- locked
	if pet.dm then return false end               -- Dark Matter is never deletable, no exceptions
	if pet.sh then return false end               -- keep Shiny (premium modifier)
	-- Rainbow first: a rainbow pet carries the golden flag too, so testing golden
	-- ahead of it would route every rainbow through the Golden toggle.
	if pet.r then return Config.GiftDeleteRainbow == true end
	if pet.g then return Config.GiftDeleteGolden == true end
	return Config.GiftDeleteNormal == true
end

local function isDeletableByFilter(Library, pet)
	local id = tostring(pet.id)
	local dir = Library.Directory.Pets[id]
	if not dir then return false end
	if pet.l == true then return false end -- locked
	if pet.dm then return false end -- Dark Matter is never deletable, no exceptions
	if dir.isGift then return false end -- never delete unopened gift items
	if Library.Directory.Eggs[id] or Library.Directory.Eggs[dir.name] then return false end
	if (Config.DeleteRarities or {})[tostring(dir.rarity)] ~= true then return false end
	if Config.ProtectHugeTitanic and (dir.huge or dir.titanic) then return false end
	for _, v in ipairs(Config.KeepVariants[tostring(dir.rarity)] or {}) do
		if v == "Shiny" and pet.sh then return false end
		if v == petVariants(pet) then return false end
	end
	return true
end

local function isDeletableByExclusive(Library, pet)
	local id = tostring(pet.id)
	local dir = Library.Directory.Pets[id]
	if not dir then return false end
	if pet.l == true then return false end -- locked
	if pet.dm then return false end -- Dark Matter is never deletable, no exceptions
	if dir.isGift then return false end -- never delete unopened gift items
	if Library.Directory.Eggs[id] or Library.Directory.Eggs[dir.name] then return false end
	if tostring(dir.rarity) ~= "Exclusive" then return false end
	if Config.ProtectHugeTitanic and (dir.huge or dir.titanic) then return false end
	for _, v in ipairs(Config.KeepVariants["Exclusive"] or {}) do
		if v == "Shiny" and pet.sh then return false end
		if v == petVariants(pet) then return false end
	end
	return true
end

local function isDeletableByAnyRule(Library, pet)
	-- Index feedstock outranks every delete rule: these are the copies the
	-- machines and the Dark Matter converter still need.
	if indexProtected(pet) then return false end
	if isGiftTrash(Library, pet) then return true end
	if Config.AutoDeleteExclusives and isDeletableByExclusive(Library, pet) then return true end
	return isDeletableByFilter(Library, pet)
end
AreaFarm._isDeletable = isDeletableByAnyRule

AreaFarm._sweepAutoDelete = function(dry)
	local Library = AreaFarm.Library
	if not Library then return 0, "Library not ready" end
	local data = Library.Save.Get()
	if not data then return 0, nil end
	local list = {}
	for _, pet in pairs(data.Pets or {}) do
		if isDeletableByAnyRule(Library, pet) then
			table.insert(list, tostring(pet.uid))
		end
	end
	if #list == 0 then return 0, nil end
	if dry then return -#list, nil, list end -- negative count signals dry run; third return holds the uids
	-- unequip any equipped matches first (server won't delete equipped pets cleanly)
	for _, uid in ipairs(list) do
		if data.PetsEquipped[uid] then
			pcall(function() Library.Network.Invoke("Unequip Pet", uid) end)
			task.wait(0.1)
		end
	end
	local deleted = 0
	for i = 1, #list, 50 do
		local batch = {}
		for j = i, math.min(i + 49, #list) do
			table.insert(batch, list[j])
		end
		local ok, err
		pcall(function() ok, err = Library.Network.Invoke("Delete Several Pets", batch) end)
		if ok then
			deleted += #batch
		else
			local e = tostring(err or "delete failed")
			if string.find(e, "not found") then
				deleted += #batch
			else
				return deleted, e
			end
		end
		if i + 49 < #list then task.wait(0.4) end
	end
	return deleted, nil
end

-- Fast drain: pets queued by the Pet Added hook leave in <0.2s
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		if (Config.AutoDeleteExclusives or Config.AutoDeleteFilter or giftTrashActive()) and not State.DeleteBusy and #State.DeleteQueue > 0 then
			State.DeleteBusy = true
			local batch = State.DeleteQueue
			State.DeleteQueue = {}
			local ok, err
			pcall(function() ok, err = Library.Network.Invoke("Delete Several Pets", batch) end)
			if ok then
				Stats.Deleted += #batch
			else
				local e = tostring(err or "delete failed")
				if string.find(e, "not found") then
					Stats.Deleted += #batch
				else
					pushNotify("Cope Hub", "Instant delete failed: " .. e, "triangle-alert")
				end
			end
			State.DeleteBusy = false
		end
		task.wait(0.1)
	end
end)

-- Instant hook: fires the moment a pet enters the local player's inventory
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	local conn = nil
	while AreaFarm.Gen == myGen and not conn do
		-- This build fires a client Signal (not a Network signal) when a pet
		-- spawns for the local player, giving us just the pet's uid.
		local ok, sig = pcall(function() return Library.Signal.Fired("Added Client Pet") end)
		if ok and sig then
			conn = sig:Connect(function(uid)
				if type(uid) ~= "string" then return end
				local pet = nil
				pcall(function()
					local data = Library.Save.Get()
					if data then
						for _, p in pairs(data.Pets or {}) do
							if tostring(p.uid) == uid then pet = p break end
						end
					end
				end)
				if type(pet) ~= "table" then return end
				local dir = Library.Directory.Pets[tostring(pet.id)]
				if dir and dir.huge then
					State.BlockingHuges[tostring(pet.uid)] = true
					if Config.AutoTradeHuges then State.ExclusivePaused = true end
				end
				if (Config.AutoDeleteExclusives or Config.AutoDeleteFilter or giftTrashActive()) and isDeletableByAnyRule(Library, pet) then
					table.insert(State.DeleteQueue, tostring(pet.uid))
				end
			end)
			State.PetAddedHooked = true
		else
			task.wait(1)
		end
	end
	while AreaFarm.Gen == myGen do task.wait(1) end
	if conn then pcall(function() conn:Disconnect() end) end
end)

-- Safety sweep for anything the instant hook misses (equipped, trades, gifts)
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		if (Config.AutoDeleteExclusives or Config.AutoDeleteFilter or giftTrashActive()) and not State.DeleteScanning then
			State.DeleteScanning = true
			local n, err = AreaFarm._sweepAutoDelete()
			if n and n > 0 then
				Stats.Deleted += n
				pushNotify("Cope Hub", "Auto-deleted " .. n .. " pet" .. (n == 1 and "" or "s"), "trash-2")
			elseif err then
				pushNotify("Cope Hub", "Auto-delete failed: " .. err, "triangle-alert")
			end
			State.DeleteScanning = false
			task.wait(2)
		else
			task.wait(0.5)
		end
	end
end)

-- ========================================================================
-- AUTO OPEN GIFTS — opens the selected gift item in bulk, fast. Hatched
-- Normal-variant Exclusive drops are trashed by the delete pipeline above
-- (huge/golden/rainbow/dark-matter/shiny/locked are all kept). This build has
-- no "Open Gift" remote: gifts are held pets and open via
-- "Hatch Exclusive Egg" (uid, amount), one held copy at a time.
-- ========================================================================

-- One open pass: fires opens for held copies of the selected gift.
-- Chunks of 3 use openThree; a 1-2 remainder uses the plain-confirm path.
-- The outer loop re-runs until none remain, so it self-heals regardless of
-- exactly how many the server opens per call.
-- `limit` caps how many gifts this pass opens (nil/0 = every one held); that is
-- what lets the timed batch opener release a fixed number per interval.
AreaFarm._giftOpenStep = function(Library, limit)
	Library = Library or AreaFarm.Library
	if not Library then return "no library" end
	local giftEgg = Config.GiftKey
	if not giftEgg then State.GiftNote = "no gift picked"; return "no key" end
	-- keep the trash set fresh so the instant-delete hook recognises drops
	State.GiftTrashIds = buildGiftTrashIds(Library, giftEgg)
	local uids, giftId = collectGiftUids(Library, giftEgg)
	if #uids == 0 then State.GiftNote = "no gifts of this type to open"; return "empty" end
	local held = #uids
	local target = held
	limit = tonumber(limit) or 0
	if limit > 0 and limit < target then target = limit end
	local i, fired, failErr = 1, 0, nil
	-- This build opens gifts one held pet at a time via "Hatch Exclusive Egg"
	-- (uid, amount), where amount is how many held copies of that gift id to
	-- consume in one call (1 or 3). There is no "Open Gift" batching remote.
	local amts = type(Library.Shared.ExclusiveEggOpenAmounts) == "table"
		and Library.Shared.ExclusiveEggOpenAmounts or { 1, 3 }
	while i <= target and (Config.AutoOpenGifts == true or State.GiftDeleteArmed == true) do
		-- how many of this gift id are still held for this pass; the game only
		-- accepts 1 or 3, so pick the largest supported amount we can afford
		local remaining = target - i + 1
		local amount = 1
		for _, a in ipairs(amts) do
			if tonumber(a) and tonumber(a) <= remaining and tonumber(a) >= amount then
				amount = tonumber(a)
			end
		end
		local callOk, callErr = pcall(function()
			Library.Network.Invoke("Hatch Exclusive Egg", uids[i], amount)
		end)
		if callOk then
			fired += amount
		else
			failErr = tostring(callErr or "open failed")
			break
		end
		i += amount
		task.wait(0.03)
	end
	if failErr then State.GiftNote = "open failed: " .. failErr; return "err" end
	if target < held then
		State.GiftNote = string.format("opened %d of %d held", fired, held)
	else
		State.GiftNote = string.format("opened %d", fired)
	end
	return "ran"
end

task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		-- Stand down while the timed batch opener owns the gift pile, otherwise the
		-- two would race and this loop would drain everything between batches.
		if Config.AutoOpenGifts and Config.GiftKey and not Config.GiftBatchEnabled and not State.GiftBusy then
			State.GiftBusy = true
			local beforeUids = collectGiftUids(Library, Config.GiftKey)
			local beforeN = #beforeUids
			local status = "idle"
			pcall(function() status = AreaFarm._giftOpenStep(Library) end)
			State.GiftBusy = false
			if status == "err" then
				if not State.GiftErrShown then
					State.GiftErrShown = true
					pushNotify("Cope Hub", "Gift open: " .. (State.GiftNote or "failed"), "triangle-alert")
				end
				task.wait(2)
			elseif status == "ran" then
				State.GiftErrShown = false
				task.wait(0.15) -- let hatches replicate into the save
				local afterN = #collectGiftUids(Library, Config.GiftKey)
				if beforeN > afterN then Stats.GiftsOpened += (beforeN - afterN) end
				-- if a pass made no progress, back off to avoid hammering a stuck gift
				task.wait((beforeN > afterN) and 0.05 or 0.6)
			else
				task.wait(0.5)
			end
		else
			task.wait(0.4)
		end
	end
end)

-- ── Timed gift batch opener ─────────────────────────────────────────────────
-- Releases a fixed number of gifts every N minutes (5-60) instead of draining the
-- whole pile at once, so drops -- and the per-variant cleanup in isGiftTrash --
-- land in chunks you can actually watch. It arms State.GiftDeleteArmed for the
-- duration of a batch, so the delete pipeline treats the drops correctly without
-- flipping the user's "Auto Open Gifts" toggle underneath them.
AreaFarm._giftBatchRun = function(Library, count)
	Library = Library or AreaFarm.Library
	if not Library then return "no library" end
	if not Config.GiftKey then State.GiftBatchNote = "no gift picked"; return "no key" end
	if State.GiftBusy then return "busy" end
	count = math.max(1, math.floor(tonumber(count) or tonumber(Config.GiftBatchCount) or 25))
	State.GiftBusy = true
	State.GiftDeleteArmed = true
	local before = 0
	pcall(function() before = #collectGiftUids(Library, Config.GiftKey) end)
	local status = "idle"
	pcall(function() status = AreaFarm._giftOpenStep(Library, count) end)
	task.wait(0.35) -- let the opens replicate into the save before counting
	local after = before
	pcall(function() after = #collectGiftUids(Library, Config.GiftKey) end)
	local opened = math.max(0, before - after)
	if opened > 0 then Stats.GiftsOpened += opened end
	State.GiftDeleteArmed = false
	State.GiftBusy = false
	State.GiftBatchRuns += 1
	State.GiftBatchLastAt = os.clock()
	if status == "err" then
		State.GiftBatchNote = State.GiftNote or "open failed"
	elseif before == 0 then
		State.GiftBatchNote = "nothing held to open"
	else
		State.GiftBatchNote = string.format("opened %d, %d left", opened, after)
	end
	return status
end

task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		if not Config.GiftBatchEnabled then
			-- fully disarm, so re-enabling fires a batch straight away
			State.GiftBatchNextAt, State.GiftBatchLastAt, State.GiftBatchMinsUsed = 0, 0, 0
			if State.GiftBatchNote ~= "off" then State.GiftBatchNote = "off" end
			task.wait(0.5)
		else
			local mins = math.clamp(tonumber(Config.GiftBatchMinutes) or 15, 5, 60)
			local now = os.clock()
			-- (Re)arm when first enabled, or when the interval slider moves, so a
			-- changed interval takes effect against the last run instead of being
			-- ignored until the old countdown expires.
			if State.GiftBatchNextAt <= 0 or State.GiftBatchMinsUsed ~= mins then
				local last = State.GiftBatchLastAt or 0
				State.GiftBatchNextAt = (last > 0) and (last + mins * 60) or now
				State.GiftBatchMinsUsed = mins
			end
			if now >= State.GiftBatchNextAt then
				local held = 0
				pcall(function() held = #collectGiftUids(Library, Config.GiftKey) end)
				if held > 0 then
					pcall(function() AreaFarm._giftBatchRun(Library, Config.GiftBatchCount) end)
					pushNotify("Cope Hub", "Gift batch: " .. (State.GiftBatchNote or "ran"), "gift")
					State.GiftBatchNextAt = os.clock() + mins * 60
				else
					-- nothing to open yet: look again shortly rather than burning the
					-- whole interval on a pile that may arrive any moment
					State.GiftBatchNote = "waiting for gifts"
					State.GiftBatchNextAt = now + 20
				end
			end
			task.wait(1)
		end
	end
end)


task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	local installed = false
	while AreaFarm.Gen == myGen and not installed do
		local ok1, s1 = pcall(function() return Library.Network.Fired("British Init Trade") end)
		local ok2, s2 = pcall(function() return Library.Network.Fired("Trade Processed") end)
		local ok3, s3 = pcall(function() return Library.Network.Fired("Trade Cancelled") end)
		local ok4, s4 = pcall(function() return Library.Network.Fired("Trade Errored") end)
		if ok1 and ok2 and ok3 and ok4 then
			s1:Connect(function(tradeId)
				State.TradeId = tradeId
				State.TradeResult = nil
			end)
			s2:Connect(function(ok, msg)
				State.TradeResult = ok and "done" or ("failed: " .. tostring(msg or ""))
			end)
			s3:Connect(function(id)
				State.TradeResult = "cancelled"
			end)
			s4:Connect(function()
				State.TradeResult = "errored"
			end)
			installed = true
			State.TradeHooks = true
		else
			task.wait(1)
		end
	end
end)

task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	local retryAt = 0
	while AreaFarm.Gen == myGen do
		local held = next(State.BlockingHuges) ~= nil
		if Config.AutoTradeHuges and held and not State.TradeBusy
			and tostring(Config.TradeTarget or "") ~= "" and os.clock() >= retryAt then
			State.TradeBusy = true
			State.TradeStatus = "starting"
			-- collect huges still present in inventory
			local data = Library.Save.Get()
			local present = {}
			if data then
				for _, pet in pairs(data.Pets or {}) do
					present[tostring(pet.uid)] = true
				end
			end
			local uids = {}
			for uid in pairs(State.BlockingHuges) do
				if present[uid] then table.insert(uids, uid) end
			end
			if #uids == 0 then
				State.TradeStatus = "idle"
				State.BlockingHuges = {}
				State.ExclusivePaused = false
			else
				-- find target player in this server
				local target = nil
				local want = tostring(Config.TradeTarget):lower()
				for _, p in ipairs(Players:GetPlayers()) do
					if p.Name:lower() == want or p.DisplayName:lower() == want then
						target = p
						break
					end
				end
				if not target then
					State.TradeStatus = "target not in server"
				else
					State.TradeId = nil
					State.TradeResult = nil
					State.TradeStatus = "inviting " .. target.Name
					local ok, err
					pcall(function() ok, err = Library.Network.Invoke("Send Trade Invite", target.UserId) end)
					if not ok then
						State.TradeStatus = "invite failed: " .. tostring(err or "")
						retryAt = os.clock() + 10
					else
						-- wait for the target to accept (British Init Trade)
						State.TradeStatus = "waiting for " .. target.Name .. " to accept"
						local t0 = os.clock()
						while AreaFarm.Gen == myGen and not State.TradeId and os.clock() - t0 < 90 do
							task.wait(0.25)
						end
						local tradeId = State.TradeId
						if not tradeId then
							State.TradeStatus = "invite timed out"
							retryAt = os.clock() + 10
						else
							task.wait(0.6)
							-- add every held huge to the offer
							for i, uid in ipairs(uids) do
								State.TradeStatus = string.format("adding huge %d/%d", i, #uids)
								pcall(function() Library.Network.Invoke("asdfsjdhf", tradeId, uid) end)
								task.wait(0.35)
							end
							task.wait(0.3)
							State.TradeStatus = "accepting trade"
							local rok
							pcall(function() rok = Library.Network.Invoke("okilikethistrade", tradeId, 0) end)
							-- wait for the other side to accept / server to process
							State.TradeStatus = "waiting for " .. target.Name .. " to confirm"
							local t1 = os.clock()
							while AreaFarm.Gen == myGen and not State.TradeResult and os.clock() - t1 < 120 do
								task.wait(0.25)
							end
							local result = State.TradeResult or "timeout"
							if result == "done" then
								State.TradesDone += 1
								State.TradeStatus = "trade complete"
								pushNotify("Cope Hub", "Huge traded to " .. target.Name .. "!", "check")
							else
								State.TradeStatus = "trade " .. tostring(result)
								pushNotify("Cope Hub", "Trade failed: " .. tostring(result), "triangle-alert")
								pcall(function() Library.Network.Invoke("no id ont like this trade", tradeId) end)
								retryAt = os.clock() + 10
							end
						end
					end
				end
			end
			State.TradeBusy = false
			if State.TradeStatus ~= "trade complete" then
				task.wait(2)
			end
		else
			if not held then State.TradeStatus = "idle" end
			task.wait(1)
		end
	end
end)

-- ========================================================================
-- UI (main thread only — created before this thread ever touches Library)
-- ========================================================================

-- ========================================================================
-- COPE HUB UI ENGINE — custom-built, no external library.
-- Main thread only; never touches the game Library module from here.
-- ========================================================================


-- The main chunk of this file is a single Luau function and its local-register
-- budget is nearly full, so the whole UI engine lives inside one do-block and
-- only the names the rest of the file actually touches are declared out here.
local TweenService, RunService, Lighting
local hexColor, CopeUI, Theme, uiconn, New, Corner, Stroke
local SetUIVisible, selectTab, Window, Tabs
do
-- ========================================================================
-- COPE HUB UI ENGINE v6 — custom-built, no external library.
-- Main thread only; never touches the game Library module from here.
-- Everything continuous (background, sheens, chips) runs off ONE
-- RenderStepped driver that idles while the window is hidden, so no widget
-- ever owns a thread of its own.
-- ========================================================================

TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
RunService = game:GetService("RunService")
Lighting = game:GetService("Lighting")

hexColor = function(hex)
	hex = string.gsub(tostring(hex or ""), "#", "")
	return Color3.fromRGB(
		tonumber(string.sub(hex, 1, 2), 16) or 139,
		tonumber(string.sub(hex, 3, 4), 16) or 92,
		tonumber(string.sub(hex, 5, 6), 16) or 246
	)
end
local function colorHex(c)
	return string.format("%02X%02X%02X", math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5))
end

CopeUI = { Conns = {}, Registry = {}, Themed = {}, FPS = 60, Ping = 0, T0 = os.clock() }
AreaFarm.UI = CopeUI

-- Declared before SetAccent on purpose: the old engine referenced Theme from
-- inside SetAccent while the local was still below it, so every accent preset
-- threw "attempt to index nil" instead of recolouring anything.
Theme = {
	Bg = Color3.fromRGB(11, 11, 19),
	Bg2 = Color3.fromRGB(27, 27, 52),
	Surface = Color3.fromRGB(25, 25, 40),
	SurfaceAlt = Color3.fromRGB(31, 31, 49),
	Element = Color3.fromRGB(38, 38, 60),
	ElementHover = Color3.fromRGB(51, 51, 79),
	Stroke = Color3.fromRGB(70, 70, 108),
	Text = Color3.fromRGB(248, 248, 255),
	SubText = Color3.fromRGB(166, 166, 196),
	Accent = hexColor(Config.Accent1 or "8B5CF6"),
	Accent2 = hexColor(Config.Accent2 or "22D3EE"),
	Green = Color3.fromRGB(52, 211, 153),
	Red = Color3.fromRGB(248, 113, 113),
	Gray = Color3.fromRGB(90, 90, 124),
}

-- Accent-aware parts. prop is a property name ("BackgroundColor3", "Color",
-- "TextColor3"), or "grad"/"grad3" for a UIGradient two/three stop ramp.
-- which == 2 asks for the secondary accent instead of the primary.
function CopeUI.markAccent(inst, prop, which)
	if not inst then return nil end
	table.insert(CopeUI.Themed, { obj = inst, prop = prop, which = which })
	return inst
end

function CopeUI.SetAccent(a1, a2)
	Theme.Accent, Theme.Accent2 = a1, a2
	Config.Accent1, Config.Accent2 = colorHex(a1), colorHex(a2)
	for _, e in ipairs(CopeUI.Themed) do
		pcall(function()
			if e.prop == "grad" then
				e.obj.Color = ColorSequence.new(Theme.Accent, Theme.Accent2)
			elseif e.prop == "grad3" then
				e.obj.Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Theme.Accent),
					ColorSequenceKeypoint.new(0.5, Theme.Accent2),
					ColorSequenceKeypoint.new(1, Theme.Accent),
				})
			else
				e.obj[e.prop] = (e.which == 2) and Theme.Accent2 or Theme.Accent
			end
		end)
	end
	if CopeUI._afterAccent then pcall(CopeUI._afterAccent) end
end

uiconn = function(signal, fn)
	local c = signal:Connect(fn)
	table.insert(CopeUI.Conns, c)
	return c
end

local function guiParent()
	local okHui, hui = pcall(function() return gethui and gethui() end)
	if okHui and hui then return hui end
	local cg = game:GetService("CoreGui")
	if cg and pcall(function() return cg:GetChildren() end) then return cg end
	return Players.LocalPlayer:WaitForChild("PlayerGui")
end

New = function(class, props, parent)
	local inst = Instance.new(class)
	for k, v in pairs(props) do
		if k ~= "Parent" then inst[k] = v end
	end
	inst.Parent = parent or props.Parent
	return inst
end

Corner = function(r, parent)
	return New("UICorner", { CornerRadius = UDim.new(0, r), Parent = parent })
end

Stroke = function(color, transparency, thickness, parent)
	return New("UIStroke", {
		Color = color, Transparency = transparency or 0,
		Thickness = thickness or 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = parent,
	})
end

local function Pad(parent, t, r, b, l)
	return New("UIPadding", {
		PaddingTop = UDim.new(0, t or 0), PaddingRight = UDim.new(0, r or 0),
		PaddingBottom = UDim.new(0, b or 0), PaddingLeft = UDim.new(0, l or 0), Parent = parent,
	})
end

local function Grad(parent, c1, c2, rotation, transparency)
	return New("UIGradient", {
		Color = ColorSequence.new(c1, c2), Rotation = rotation or 0,
		Transparency = transparency or NumberSequence.new(0), Parent = parent,
	})
end

-- Soft drop shadow / outer glow. 9-sliced blurred rounded square; if the asset
-- ever fails to load nothing is drawn and the window simply looks flatter.
local SHADOW_ID = "rbxassetid://6014261993"
local function Shadow(parent, spread, transparency, color, z)
	return New("ImageLabel", {
		Name = "Shadow", BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.new(1, spread * 2, 1, spread * 2),
		Image = SHADOW_ID, ImageColor3 = color or Color3.new(0, 0, 0),
		ImageTransparency = transparency or 0.45,
		ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(49, 49, 450, 450),
		ZIndex = z or 0, Parent = parent,
	})
end

-- A round glow: concentric rounded frames instead of one flat circle, so the
-- edge falls off like a blur without costing an ImageLabel or a real blur pass.
local function glowBlob(size, color, alpha, parent)
	local layers = {}
	local root = New("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(size, size),
		BackgroundColor3 = color, BackgroundTransparency = alpha,
		BorderSizePixel = 0, ZIndex = 0, Parent = parent,
	})
	Corner(999, root)
	table.insert(layers, root)
	for _, f in ipairs({ 0.74, 0.5, 0.3 }) do
		local inner = New("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(f, f),
			BackgroundColor3 = color, BackgroundTransparency = alpha,
			BorderSizePixel = 0, ZIndex = 0, Parent = root,
		})
		Corner(999, inner)
		table.insert(layers, inner)
	end
	return { root = root, layers = layers }
end

-- ------------------------------------------------------------- motion driver
-- Every continuous animation in the hub registers a job here. The driver does
-- nothing at all while the window is hidden or motion is switched off, so an
-- idle hub costs one empty callback per frame instead of ~25 live threads.
local Motion = { t = 0, jobs = {} }
local function everyFrame(fn)
	table.insert(Motion.jobs, fn)
	return fn
end
uiconn(RunService.RenderStepped, function(dt)
	if not State.UIVisible or Config.UIMotion == false then return end
	local speed = math.clamp((tonumber(Config.UIAnimSpeed) or 100) / 100, 0.1, 3)
	Motion.t += dt * speed
	local jobs = Motion.jobs
	for i = 1, #jobs do
		pcall(jobs[i], Motion.t, dt)
	end
end)

-- live client stats for the topbar chips / widget / performance page
do
	local frames, acc = 0, 0
	uiconn(RunService.Heartbeat, function(dt)
		frames += 1
		acc += dt
		if acc >= 0.5 then
			CopeUI.FPS = math.floor(frames / acc + 0.5)
			frames, acc = 0, 0
			pcall(function() CopeUI.Ping = math.floor(Players.LocalPlayer:GetNetworkPing() * 1000 + 0.5) end)
			if CopeUI._onStats then pcall(CopeUI._onStats, CopeUI.FPS, CopeUI.Ping) end
		end
	end)
end

local function ripple(button, big)
	uiconn(button.InputBegan, function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
		pcall(function()
			local pos = button.AbsolutePosition
			local circle = New("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromOffset(input.Position.X - pos.X, input.Position.Y - pos.Y),
				Size = UDim2.fromOffset(8, 8),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 0.8,
				BorderSizePixel = 0,
				ZIndex = button.ZIndex + 20,
				Parent = button,
			})
			Corner(999, circle)
			local target = math.max(button.AbsoluteSize.X, button.AbsoluteSize.Y) * (big and 2.2 or 2.8) + 24
			TweenService:Create(circle, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Size = UDim2.fromOffset(target, target), BackgroundTransparency = 1,
			}):Play()
			task.delay(0.55, function() circle:Destroy() end)
		end)
	end)
end

local ScreenGui = New("ScreenGui", {
	Name = "CopeHubGui",
	ResetOnSpawn = false,
	IgnoreGuiInset = true,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 1000,
	Parent = guiParent(),
})
AreaFarm.ScreenGui = ScreenGui

-- ---------------------------------------------------------------- toasts
local ToastHolder = New("Frame", {
	BackgroundTransparency = 1,
	AnchorPoint = Vector2.new(1, 0),
	Position = UDim2.new(1, -16, 0, 16),
	Size = UDim2.fromOffset(320, 620),
	ZIndex = 200,
	Parent = ScreenGui,
})
New("UIListLayout", {
	Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder,
	HorizontalAlignment = Enum.HorizontalAlignment.Right, Parent = ToastHolder,
})

local TOAST_ICONS = {
	check = { g = "✓", c = Theme.Green },
	["triangle-alert"] = { g = "!", c = Theme.Red },
	clock = { g = "◷", c = Theme.Accent2 },
	info = { g = "i", c = Theme.Accent2 },
	paintbrush = { g = "✦", c = Theme.Accent },
}
function CopeUI.Notify(cfg)
	pcall(function()
		local dur = cfg.Duration or 3
		local long = cfg.Content and #tostring(cfg.Content) > 46
		local card = New("Frame", {
			Size = UDim2.fromOffset(310, long and 84 or 66),
			BackgroundTransparency = 1, BorderSizePixel = 0, Parent = ToastHolder,
		})
		-- The card itself is laid out by the UIListLayout, so the slide has to
		-- happen on an inner frame: a layout parent overwrites Position. This was
		-- a CanvasGroup once, for a combined slide-and-fade, but the offscreen
		-- texture blurred the toast text, so it slides only.
		local body = New("Frame", {
			Size = UDim2.fromScale(1, 1), Position = UDim2.fromOffset(340, 0),
			BackgroundColor3 = Theme.Surface, BackgroundTransparency = 0.06,
			BorderSizePixel = 0, Parent = card,
		})
		Corner(12, body)
		Stroke(Theme.Stroke, 0.35, 1, body)
		local skin = TOAST_ICONS[cfg.Icon] or { g = "✦", c = Theme.Accent }
		local bar = New("Frame", {
			Size = UDim2.new(0, 3, 1, -16), Position = UDim2.new(0, 6, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = skin.c, BorderSizePixel = 0, Parent = body,
		})
		Corner(999, bar)
		local badge = New("Frame", {
			Size = UDim2.fromOffset(26, 26), Position = UDim2.new(0, 18, 0, 12),
			BackgroundColor3 = skin.c, BackgroundTransparency = 0.82, BorderSizePixel = 0, Parent = body,
		})
		Corner(999, badge)
		Stroke(skin.c, 0.55, 1, badge)
		New("TextLabel", {
			Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamBold,
			TextSize = 13, TextColor3 = skin.c, Text = skin.g, Parent = badge,
		})
		New("TextLabel", {
			Position = UDim2.new(0, 54, 0, 12), Size = UDim2.new(1, -66, 0, 16),
			BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 13,
			TextColor3 = Theme.Text, TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring(cfg.Title or ""), Parent = body,
		})
		if cfg.Content then
			New("TextLabel", {
				Position = UDim2.new(0, 54, 0, 29), Size = UDim2.new(1, -66, 0, long and 40 or 22),
				BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 11.5,
				TextColor3 = Theme.SubText, TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true,
				Text = tostring(cfg.Content), Parent = body,
			})
		end
		local progress = New("Frame", {
			Size = UDim2.new(1, -28, 0, 2), Position = UDim2.new(0, 14, 1, -6),
			AnchorPoint = Vector2.new(0, 1), BackgroundColor3 = skin.c,
			BorderSizePixel = 0, BackgroundTransparency = 0.3, Parent = body,
		})
		Corner(999, progress)
		TweenService:Create(progress, TweenInfo.new(dur, Enum.EasingStyle.Linear), { Size = UDim2.new(0, 0, 0, 2) }):Play()
		TweenService:Create(body, TweenInfo.new(0.42, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Position = UDim2.fromOffset(0, 0),
		}):Play()
		task.delay(dur, function()
			TweenService:Create(body, TweenInfo.new(0.26, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				Position = UDim2.fromOffset(340, 0),
			}):Play()
			task.delay(0.3, function() card:Destroy() end)
		end)
	end)
end

while not State.Ready do task.wait(0.1) end

-- ---------------------------------------------------------------- window shell
local WINDOW_W, WINDOW_H = 720, 540

-- Win is the plain frame that gets dragged and scaled; Root is the clipped panel
-- everything is drawn into. Root used to be a CanvasGroup so show/hide could be
-- one GroupTransparency tween, but a CanvasGroup renders its whole subtree into
-- an offscreen texture and composites it back with premultiplied alpha: 12.5 px
-- Gotham came out soft and grey instead of crisp white, which is what made the
-- old build look washed out. Plain Frames draw straight to the framebuffer, so
-- the window animates with scale instead of a group fade. The shadows still live
-- outside Root because Root clips anything hanging over its edge.
local Win = New("Frame", {
	Name = "CopeWin",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(WINDOW_W, WINDOW_H),
	BackgroundTransparency = 1,
	Visible = false,
	Parent = ScreenGui,
})
local WinScale = New("UIScale", { Scale = math.clamp((tonumber(Config.UIScale) or 100) / 100, 0.7, 1.4), Parent = Win })
-- second scale, driven only by the open/close animation, so it can never fight
-- with the user's UI Scale setting
local WinPop = New("UIScale", { Scale = 1, Parent = Win })
local WinShadow = Shadow(Win, 40, 0.52, Color3.new(0, 0, 0), 0)
local WinGlow = Shadow(Win, 16, 0.86, Theme.Accent, 0)
CopeUI.markAccent(WinGlow, "ImageColor3")

local Root = New("Frame", {
	Name = "Root",
	Size = UDim2.fromScale(1, 1),
	BackgroundColor3 = Theme.Bg,
	BorderSizePixel = 0,
	ClipsDescendants = true,
	ZIndex = 2,
	Parent = Win,
})
Corner(16, Root)
local rootGrad = New("UIGradient", { Color = ColorSequence.new(Theme.Bg, Theme.Bg2), Rotation = 115, Parent = Root })
local rootStroke = Stroke(Theme.Stroke, 0.1, 1.5, Root)
CopeUI.markAccent(New("UIGradient", {
	Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Theme.Accent),
		ColorSequenceKeypoint.new(0.5, Theme.Accent2),
		ColorSequenceKeypoint.new(1, Theme.Accent),
	}),
	Rotation = 35, Parent = rootStroke,
}), "grad3")

-- everything animated in the background lives in here and nowhere else
local BgLayer = New("Frame", {
	Name = "Background", Size = UDim2.fromScale(1, 1),
	BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 0, Parent = Root,
})

-- ------------------------------------------------------- background palettes
local BG_PRESETS = {
	{ n = "Midnight", a = "0A0A14", b = "1A1A38" },
	{ n = "Obsidian", a = "07070A", b = "1A1A20" },
	{ n = "Ocean", a = "05131F", b = "0B2C42" },
	{ n = "Plum", a = "120A1C", b = "2E1046" },
	{ n = "Forest", a = "06150F", b = "0F2F20" },
	{ n = "Ember", a = "140A0A", b = "3C1512" },
	{ n = "Slate", a = "0E0E14", b = "22222F" },
	{ n = "Accent", a = "0A0A14", b = "1A1A38" },
}
local BG_STYLES = { "Aurora", "Nebula", "Waves", "Starfield", "Gradient", "Solid" }
CopeUI.BgPresets, CopeUI.BgStyles = {}, BG_STYLES
CopeUI.BgSwatches = BG_PRESETS
for _, p in ipairs(BG_PRESETS) do table.insert(CopeUI.BgPresets, p.n) end

local function bgColors()
	local name = tostring(Config.UIBgPreset or "Midnight")
	if name == "Accent" then
		return Theme.Accent:Lerp(Color3.new(0, 0, 0), 0.9), Theme.Accent2:Lerp(Color3.new(0, 0, 0), 0.8)
	end
	for _, p in ipairs(BG_PRESETS) do
		if p.n == name then return hexColor(p.a), hexColor(p.b) end
	end
	return hexColor("0A0A14"), hexColor("1A1A38")
end
-- 0 hides the animated layer entirely, 100 is the designed look, 200 doubles it
local function bgAlpha(base)
	local k = math.clamp((tonumber(Config.UIBgIntensity) or 100) / 100, 0, 2)
	return math.clamp(1 - (1 - base) * k, 0, 1)
end

local applyBg -- defined with the style builders below

local AfterAccent = {}
CopeUI._afterAccent = function()
	for _, f in ipairs(AfterAccent) do pcall(f) end
end
table.insert(AfterAccent, function()
	if applyBg then applyBg() end
end)

function CopeUI.SetBackground(preset)
	Config.UIBgPreset = tostring(preset)
	if applyBg then applyBg() end
end
function CopeUI.SetBgStyle(style)
	Config.UIBgStyle = tostring(style)
	if applyBg then applyBg() end
end
function CopeUI.RefreshBackground()
	if applyBg then applyBg() end
end
function CopeUI.SetUIScale(pct)
	Config.UIScale = tonumber(pct) or 100
	WinScale.Scale = math.clamp((tonumber(Config.UIScale) or 100) / 100, 0.7, 1.4)
end

-- ------------------------------------------------------- background styles
-- Each builder creates its parts and leaves a single update closure behind.
-- The shared driver calls that closure; nothing here spawns a thread.
local bgParts, bgUpdate = {}, nil
local function bgAdd(inst)
	table.insert(bgParts, inst)
	return inst
end
local function clearBg()
	for _, p in ipairs(bgParts) do pcall(function() p:Destroy() end) end
	table.clear(bgParts)
	bgUpdate = nil
end

local function buildAurora(_, c2)
	local cols = { Theme.Accent, Theme.Accent2, c2:Lerp(Color3.fromRGB(255, 255, 255), 0.14) }
	local sizes = { 440, 370, 300 }
	local blobs = {}
	for i = 1, 3 do
		local b = glowBlob(sizes[i], cols[i], bgAlpha(0.74), BgLayer)
		bgAdd(b.root)
		blobs[i] = b.root
	end
	bgUpdate = function(t)
		for i = 1, 3 do
			local f = i * 1.7
			blobs[i].Position = UDim2.fromScale(
				0.5 + 0.4 * math.sin(t * (0.13 + i * 0.03) + f),
				0.5 + 0.42 * math.cos(t * (0.1 + i * 0.024) + f * 1.4)
			)
		end
	end
end

local function buildNebula(_, c2)
	local sheen = bgAdd(New("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1.8, 1.8), BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0, ZIndex = 0, Parent = BgLayer,
	}))
	local sheenGrad = New("UIGradient", {
		Color = ColorSequence.new(Theme.Accent, Theme.Accent2),
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(0.4, 1),
			NumberSequenceKeypoint.new(0.5, bgAlpha(0.76)),
			NumberSequenceKeypoint.new(0.6, 1),
			NumberSequenceKeypoint.new(1, 1),
		}),
		Parent = sheen,
	})
	local blobs = {}
	for i = 1, 2 do
		local b = glowBlob(i == 1 and 420 or 330, i == 1 and Theme.Accent2 or c2:Lerp(Color3.fromRGB(255, 255, 255), 0.1), bgAlpha(0.76), BgLayer)
		bgAdd(b.root)
		blobs[i] = b.root
	end
	bgUpdate = function(t)
		sheenGrad.Rotation = (t * 16) % 360
		blobs[1].Position = UDim2.fromScale(0.28 + 0.16 * math.sin(t * 0.14), 0.3 + 0.16 * math.cos(t * 0.11))
		blobs[2].Position = UDim2.fromScale(0.74 + 0.16 * math.cos(t * 0.12), 0.72 + 0.14 * math.sin(t * 0.15))
	end
end

local function buildWaves(_, _)
	local bars = {}
	for i = 1, 3 do
		local bar = bgAdd(New("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(WINDOW_W * 1.6, 220 + i * 70),
			Position = UDim2.new(0.5, 0, 1, 70 + i * 34),
			BackgroundColor3 = (i == 2) and Theme.Accent2 or Theme.Accent,
			BackgroundTransparency = bgAlpha(0.8 + i * 0.014),
			BorderSizePixel = 0, ZIndex = 0, Parent = BgLayer,
		}))
		Corner(999, bar)
		bars[i] = bar
	end
	bgUpdate = function(t)
		for i = 1, 3 do
			local ph = t * (0.34 + i * 0.13) + i
			bars[i].Position = UDim2.new(0.5, math.sin(ph) * 70, 1, 70 + i * 34 + math.sin(ph * 0.8) * 30)
			bars[i].Rotation = math.sin(ph * 0.5) * 3
		end
	end
end

local function buildStars(_, _)
	local stars = {}
	for i = 1, 22 do
		local dot = bgAdd(New("Frame", {
			Size = UDim2.fromOffset(i % 5 == 0 and 3 or 2, i % 5 == 0 and 3 or 2),
			BackgroundColor3 = (i % 4 == 0) and Theme.Accent2 or Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = bgAlpha(0.42), BorderSizePixel = 0, ZIndex = 0, Parent = BgLayer,
		}))
		Corner(999, dot)
		stars[i] = { f = dot, x = math.random(), y = math.random(), sp = 0.6 + math.random() * 1.8, ph = math.random() * 6.283 }
	end
	local halo = glowBlob(380, Theme.Accent, bgAlpha(0.8), BgLayer)
	bgAdd(halo.root)
	halo.root.Position = UDim2.fromScale(0.72, 0.22)
	local tick = 0
	bgUpdate = function(t, dt)
		tick += 1
		local twinkle = (tick % 3 == 0)
		local base = bgAlpha(0.38)
		for i = 1, #stars do
			local s = stars[i]
			s.y -= s.sp * dt * 0.02
			if s.y < -0.03 then
				s.y, s.x = 1.03, math.random()
			end
			s.f.Position = UDim2.fromScale(s.x, s.y)
			if twinkle then
				s.f.BackgroundTransparency = math.clamp(base + 0.35 * (0.5 + 0.5 * math.sin(t * 2 + s.ph)), 0, 1)
			end
		end
	end
end

local function buildGradient(_, _)
	local b = glowBlob(520, Theme.Accent, bgAlpha(0.78), BgLayer)
	bgAdd(b.root)
	b.root.Position = UDim2.fromScale(0.18, 0.12)
	local b2 = glowBlob(420, Theme.Accent2, bgAlpha(0.8), BgLayer)
	bgAdd(b2.root)
	b2.root.Position = UDim2.fromScale(0.86, 0.9)
	bgUpdate = function(t)
		rootGrad.Rotation = 115 + math.sin(t * 0.22) * 28
	end
end

applyBg = function()
	local c1, c2 = bgColors()
	Theme.Bg, Theme.Bg2 = c1, c2
	Root.BackgroundColor3 = c1
	rootGrad.Color = ColorSequence.new(c1, c2)
	rootGrad.Rotation = 115
	clearBg()
	local style = tostring(Config.UIBgStyle or "Aurora")
	if style == "Nebula" then buildNebula(c1, c2)
	elseif style == "Waves" then buildWaves(c1, c2)
	elseif style == "Starfield" then buildStars(c1, c2)
	elseif style == "Gradient" then buildGradient(c1, c2)
	elseif style == "Solid" then bgUpdate = nil
	else buildAurora(c1, c2) end
end
everyFrame(function(t, dt)
	if bgUpdate then bgUpdate(t, dt) end
end)
applyBg()

-- ---------------------------------------------------------------- topbar
local Topbar = New("Frame", {
	Name = "Topbar", Size = UDim2.new(1, 0, 0, 54), BackgroundTransparency = 1, ZIndex = 5, Parent = Root,
})
local divider = New("Frame", {
	Size = UDim2.new(1, -28, 0, 1), Position = UDim2.new(0, 14, 0, 54),
	BackgroundColor3 = Theme.Stroke, BorderSizePixel = 0, ZIndex = 5, Parent = Root,
})
New("UIGradient", {
	Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
	Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.25), NumberSequenceKeypoint.new(1, 1),
	}),
	Parent = divider,
})

local LogoMark = New("Frame", {
	Position = UDim2.new(0, 16, 0, 12), Size = UDim2.fromOffset(30, 30),
	BackgroundColor3 = Theme.Accent, BorderSizePixel = 0, ZIndex = 6, Parent = Topbar,
})
Corner(10, LogoMark)
CopeUI.markAccent(LogoMark, "BackgroundColor3")
CopeUI.markAccent(Grad(LogoMark, Theme.Accent, Theme.Accent2, 45), "grad")
CopeUI.markAccent(Stroke(Theme.Accent, 0.5, 1, LogoMark), "Color")
New("TextLabel", {
	Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamBlack,
	TextSize = 15, TextColor3 = Color3.fromRGB(255, 255, 255), Text = "C", ZIndex = 7, Parent = LogoMark,
})

local Logo = New("TextLabel", {
	Name = "Logo",
	Position = UDim2.new(0, 54, 0, 11), Size = UDim2.fromOffset(180, 20),
	BackgroundTransparency = 1, Font = Enum.Font.GothamBlack, TextSize = 17,
	TextColor3 = Theme.Text, TextXAlignment = Enum.TextXAlignment.Left,
	RichText = true, Text = "COPE HUB", ZIndex = 6, Parent = Topbar,
})
local function refreshLogo()
	Logo.Text = string.format('<font color="#%s">COPE</font> <font color="#%s">HUB</font>',
		colorHex(Theme.Accent), colorHex(Theme.Accent2))
end
refreshLogo()
table.insert(AfterAccent, refreshLogo)

local Subtitle = New("TextLabel", {
	Name = "Subtitle",
	Position = UDim2.new(0, 55, 0, 31), Size = UDim2.new(1, -320, 0, 12),
	BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 10.5,
	TextColor3 = Theme.SubText, TextXAlignment = Enum.TextXAlignment.Left,
	TextTruncate = Enum.TextTruncate.AtEnd, Text = "starting...", ZIndex = 6, Parent = Topbar,
})
local VersionChip = New("TextLabel", {
	Position = UDim2.new(0, 158, 0, 13), Size = UDim2.fromOffset(40, 17),
	BackgroundColor3 = Theme.Accent, BackgroundTransparency = 0.78,
	Font = Enum.Font.GothamBold, TextSize = 10, TextColor3 = Theme.Text,
	Text = "v6.0", ZIndex = 6, Parent = Topbar,
})
Corner(6, VersionChip)
CopeUI.markAccent(VersionChip, "BackgroundColor3")
CopeUI.markAccent(Stroke(Theme.Accent, 0.6, 1, VersionChip), "Color")

-- one chip, two live numbers, refreshed twice a second by the stats sampler
local StatChip = New("Frame", {
	AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -114, 0.5, 0),
	Size = UDim2.fromOffset(104, 26), BackgroundColor3 = Theme.Element,
	BackgroundTransparency = 0.35, BorderSizePixel = 0, ZIndex = 6, Parent = Topbar,
})
Corner(8, StatChip)
Stroke(Theme.Stroke, 0.55, 1, StatChip)
local StatText = New("TextLabel", {
	Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium,
	TextSize = 11, TextColor3 = Theme.SubText, RichText = true, Text = "-- fps", ZIndex = 7, Parent = StatChip,
})
CopeUI._onStats = function(fps, ping)
	local fc = (fps >= 45 and "34D399") or (fps >= 25 and "FBBF24") or "F87171"
	StatText.Text = string.format('<font color="#%s">%d</font> fps  <font color="#4A4A68">|</font>  %d ms', fc, fps, ping)
end

local function TopIconBtn(x, glyph, hoverCol, hoverText)
	local btn = New("TextButton", {
		Position = UDim2.new(1, x, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.fromOffset(28, 28), BackgroundColor3 = Theme.Element,
		BackgroundTransparency = 0.25,
		Font = Enum.Font.GothamBold, TextSize = 14, TextColor3 = Theme.SubText,
		Text = glyph, AutoButtonColor = false, ZIndex = 6, Parent = Topbar,
	})
	Corner(8, btn)
	Stroke(Theme.Stroke, 0.55, 1, btn)
	uiconn(btn.MouseEnter, function()
		TweenService:Create(btn, TweenInfo.new(0.14), {
			BackgroundColor3 = hoverCol or Theme.ElementHover, BackgroundTransparency = 0,
			TextColor3 = hoverText or Theme.Text,
		}):Play()
	end)
	uiconn(btn.MouseLeave, function()
		TweenService:Create(btn, TweenInfo.new(0.14), {
			BackgroundColor3 = Theme.Element, BackgroundTransparency = 0.25, TextColor3 = Theme.SubText,
		}):Play()
	end)
	ripple(btn)
	return btn
end

-- ------------------------------------------------------------- show / hide
local hubBlur = nil
local function setBlur(on)
	if on and Config.UIBlur == true then
		if not hubBlur then
			hubBlur = New("BlurEffect", { Name = "CopeHubBlur", Size = 0, Parent = Lighting })
		end
		TweenService:Create(hubBlur, TweenInfo.new(0.3), { Size = 14 }):Play()
	elseif hubBlur then
		local t = TweenService:Create(hubBlur, TweenInfo.new(0.25), { Size = 0 })
		t.Completed:Connect(function()
			if hubBlur and (not State.UIVisible or Config.UIBlur ~= true) then
				hubBlur:Destroy()
				hubBlur = nil
			end
		end)
		t:Play()
	end
end
CopeUI.SetBlur = function(on)
	Config.UIBlur = on == true
	setBlur(State.UIVisible and on == true)
end

-- The panel itself never fades: a transparency ramp on plain Frames would show
-- the widgets floating with no card behind them. The open reads as a zoom
-- instead, with the drop shadow and accent halo blooming in behind it.
local popIn = TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local popOut = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
SetUIVisible = function(v)
	State.UIVisible = v
	if v then
		Win.Visible = true
		WinPop.Scale = 0.9
		WinShadow.ImageTransparency = 1
		WinGlow.ImageTransparency = 1
		TweenService:Create(WinPop, popIn, { Scale = 1 }):Play()
		TweenService:Create(WinShadow, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageTransparency = 0.52 }):Play()
		TweenService:Create(WinGlow, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageTransparency = 0.86 }):Play()
		setBlur(true)
	else
		local tween = TweenService:Create(WinPop, popOut, { Scale = 0.92 })
		tween.Completed:Connect(function()
			if not State.UIVisible then Win.Visible = false end
		end)
		tween:Play()
		TweenService:Create(WinShadow, popOut, { ImageTransparency = 1 }):Play()
		TweenService:Create(WinGlow, popOut, { ImageTransparency = 1 }):Play()
		setBlur(false)
	end
	if AreaFarm._onUIVisible then AreaFarm._onUIVisible(v) end
end
AreaFarm._setUIVisible = SetUIVisible

local MinBtn = TopIconBtn(-76, "–")
MinBtn.Activated:Connect(function() SetUIVisible(false) end)
local CloseBtn = TopIconBtn(-42, "✕", Color3.fromRGB(74, 32, 46), Color3.fromRGB(255, 190, 200))
CloseBtn.Activated:Connect(function() SetUIVisible(false) end)

-- drag from the topbar, clamped so the window can never be lost off-screen
do
	local dragging, dragStart, startPos = false, nil, nil
	uiconn(Topbar.InputBegan, function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging, dragStart, startPos = true, input.Position, Win.Position
		end
	end)
	uiconn(UserInputService.InputChanged, function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			local vp = ScreenGui.AbsoluteSize
			local half = Win.AbsoluteSize / 2
			local px = math.clamp(startPos.X.Offset + delta.X, -vp.X * 0.5 + half.X - 60, vp.X * 0.5 - half.X + 60)
			local py = math.clamp(startPos.Y.Offset + delta.Y, -vp.Y * 0.5 + half.Y - 10, vp.Y * 0.5 - half.Y + 10)
			Win.Position = UDim2.new(0.5, px, 0.5, py)
		end
	end)
	uiconn(UserInputService.InputEnded, function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
end

-- ---------------------------------------------------------------- sidebar
-- 34 + 4 is chosen so all ten tabs fit the 380 px list without scrolling
local SIDE_W, TAB_H, TAB_GAP = 186, 34, 4

local Sidebar = New("Frame", {
	Name = "Sidebar", Position = UDim2.new(0, 14, 0, 64),
	Size = UDim2.new(0, SIDE_W, 1, -78), BackgroundColor3 = Theme.Surface,
	BackgroundTransparency = 0.06, BorderSizePixel = 0, ZIndex = 4, Parent = Root,
})
Corner(14, Sidebar)
Stroke(Theme.Stroke, 0.4, 1, Sidebar)
New("UIGradient", {
	Color = ColorSequence.new(Theme.SurfaceAlt, Theme.Surface), Rotation = 90, Parent = Sidebar,
})

-- player card
do
	local card = New("Frame", {
		Position = UDim2.new(0, 8, 0, 8), Size = UDim2.new(1, -16, 0, 54),
		BackgroundColor3 = Theme.Element, BackgroundTransparency = 0.12,
		BorderSizePixel = 0, ZIndex = 5, Parent = Sidebar,
	})
	Corner(11, card)
	Stroke(Theme.Stroke, 0.4, 1, card)
	local av = New("ImageLabel", {
		Position = UDim2.new(0, 8, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.fromOffset(38, 38), BackgroundColor3 = Theme.SurfaceAlt,
		BorderSizePixel = 0, ZIndex = 6, Parent = card,
	})
	Corner(999, av)
	CopeUI.markAccent(Stroke(Theme.Accent, 0.35, 1.5, av), "Color")
	pcall(function()
		av.Image = string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=48&h=48", Players.LocalPlayer.UserId)
	end)
	New("TextLabel", {
		Position = UDim2.new(0, 54, 0, 11), Size = UDim2.new(1, -62, 0, 15),
		BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12.5,
		TextColor3 = Theme.Text, TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 6, Parent = card,
		Text = tostring(Players.LocalPlayer.DisplayName),
	})
	New("TextLabel", {
		Position = UDim2.new(0, 54, 0, 28), Size = UDim2.new(1, -62, 0, 13),
		BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 10.5,
		TextColor3 = Theme.SubText, TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 6, Parent = card,
		Text = "@" .. tostring(Players.LocalPlayer.Name),
	})
end

local TabList = New("ScrollingFrame", {
	Name = "TabList", Position = UDim2.new(0, 8, 0, 70),
	Size = UDim2.new(1, -16, 1, -82), BackgroundTransparency = 1, BorderSizePixel = 0,
	ScrollBarThickness = 2, ScrollBarImageColor3 = Theme.Stroke, ScrollBarImageTransparency = 0.5,
	CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y,
	ScrollingDirection = Enum.ScrollingDirection.Y, ZIndex = 5, Parent = Sidebar,
})
New("UIListLayout", { Padding = UDim.new(0, TAB_GAP), SortOrder = Enum.SortOrder.LayoutOrder, Parent = TabList })

-- The accent pill that slides between tabs. It cannot be a child of TabList:
-- a UIListLayout lays out every GuiObject child, so the pill would take a slot
-- in the list and shove every tab down by its own height. It lives in an
-- unmanaged overlay pinned over TabList instead, and follows the scroll.
local PillLayer = New("Frame", {
	Name = "PillLayer", Position = TabList.Position, Size = TabList.Size,
	BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 8, Parent = Sidebar,
})
local TabPill = New("Frame", {
	Size = UDim2.fromOffset(3, 18), Position = UDim2.new(0, 0, 0, 9),
	BackgroundColor3 = Theme.Accent, BorderSizePixel = 0, Visible = false, ZIndex = 8, Parent = PillLayer,
})
-- tweening a plain number and mirroring it lets the pill slide and stay aligned
-- with the list even if the user scrolls mid-slide
local pillY = New("NumberValue", { Value = 9, Parent = PillLayer })
local function syncPill()
	TabPill.Position = UDim2.new(0, 0, 0, pillY.Value - TabList.CanvasPosition.Y)
end
uiconn(pillY.Changed, syncPill)
uiconn(TabList:GetPropertyChangedSignal("CanvasPosition"), syncPill)
Corner(999, TabPill)
CopeUI.markAccent(TabPill, "BackgroundColor3")
CopeUI.markAccent(Grad(TabPill, Theme.Accent, Theme.Accent2, 90), "grad")

-- ---------------------------------------------------------------- content
local ContentClip = New("Frame", {
	Name = "Content", Position = UDim2.new(0, 14 + SIDE_W + 12, 0, 64),
	Size = UDim2.new(1, -(14 + SIDE_W + 12) - 14, 1, -78),
	BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 4, Parent = Root,
})
-- dropdown menus live here so ContentClip cannot cut them off
local PopupLayer = New("Frame", {
	Name = "Popups", Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 60, Parent = Root,
})

-- Root is inside two UIScales, so AbsolutePosition deltas are in scaled pixels
-- while UDim2 offsets are not. Divide by the live scale before positioning.
local function uiScaleFactor()
	local s = Win.AbsoluteSize.X / WINDOW_W
	return (s > 0.01) and s or 1
end
local function absToRoot(inst)
	local d = (inst.AbsolutePosition - Root.AbsolutePosition) / uiScaleFactor()
	return d.X, d.Y
end

local dropdownClosers = {}
local function closeAllDropdowns()
	for i = 1, #dropdownClosers do pcall(dropdownClosers[i]) end
end
AreaFarm._closeDropdowns = closeAllDropdowns

-- ---------------------------------------------------------------- tabs
Window = { }
Tabs = {}
AreaFarm.Window = Window
CopeUI.Window = Window
CopeUI.Tabs = Tabs

function Window:SetAuthor(text)
	Subtitle.Text = tostring(text or "")
end
function Window:SetSubtitle(text)
	Subtitle.Text = tostring(text or "")
end

local Widgets = {} -- widget constructors, filled in by the chunks below
local currentTab = nil

-- Pages are plain Frames, so a tab change slides instead of cross-fading: the
-- outgoing page slips left and hides, the incoming one glides in from the right
-- and settles. Two position tweens, no offscreen texture, text stays crisp.
selectTab = function(tab)
	if not tab or currentTab == tab then return end
	closeAllDropdowns()
	local prev = currentTab
	currentTab = tab
	if prev then
		prev.setActive(false)
		local w = prev.wrap
		local out = TweenService:Create(w, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Position = UDim2.fromOffset(-26, 0),
		})
		out.Completed:Connect(function()
			if currentTab ~= prev then w.Visible = false end
		end)
		out:Play()
	end
	tab.setActive(true)
	tab.wrap.Position = UDim2.fromOffset(34, 0)
	tab.wrap.Visible = true
	tab.scroll.Position = UDim2.fromOffset(0, 10)
	TweenService:Create(tab.wrap, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		Position = UDim2.fromOffset(0, 0),
	}):Play()
	TweenService:Create(tab.scroll, TweenInfo.new(0.34, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.fromOffset(0, 0) }):Play()
	TabPill.Visible = true
	TweenService:Create(pillY, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		Value = tab.y + 9,
	}):Play()
end
CopeUI.SelectTab = selectTab

function Window:Tab(cfg)
	cfg = cfg or {}
	local index = #Tabs + 1
	local btn = New("TextButton", {
		Name = "Tab_" .. tostring(cfg.Title or index), LayoutOrder = index,
		Size = UDim2.new(1, 0, 0, TAB_H), BackgroundColor3 = Theme.Element,
		BackgroundTransparency = 1, BorderSizePixel = 0, AutoButtonColor = false,
		Text = "", ZIndex = 6, Parent = TabList,
	})
	Corner(10, btn)
	local chip = New("Frame", {
		Position = UDim2.new(0, 9, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.fromOffset(24, 24), BackgroundColor3 = Theme.Accent,
		BackgroundTransparency = 0.86, BorderSizePixel = 0, ZIndex = 7, Parent = btn,
	})
	Corner(8, chip)
	CopeUI.markAccent(chip, "BackgroundColor3")
	New("TextLabel", {
		Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium,
		TextSize = 12, TextColor3 = Theme.Text, Text = tostring(cfg.Icon or "•"), ZIndex = 8, Parent = chip,
	})
	local label = New("TextLabel", {
		Position = UDim2.new(0, 42, 0, 0), Size = UDim2.new(1, -50, 1, 0),
		BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 12.5,
		TextColor3 = Theme.SubText, TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring(cfg.Title or "Tab"), ZIndex = 7, Parent = btn,
	})

	local wrap = New("Frame", {
		Name = "Page_" .. tostring(cfg.Title or index), Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1, Visible = false, ZIndex = 4, Parent = ContentClip,
	})
	local scroll = New("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0,
		ScrollBarThickness = 3, ScrollBarImageColor3 = Theme.Stroke, ScrollBarImageTransparency = 0.25,
		CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y, Parent = wrap,
	})
	New("UIListLayout", { Padding = UDim.new(0, 9), SortOrder = Enum.SortOrder.LayoutOrder, Parent = scroll })
	Pad(scroll, 2, 10, 18, 2)

	local active = false
	local function setActive(v)
		active = v
		TweenService:Create(btn, TweenInfo.new(0.16), { BackgroundTransparency = v and 0.12 or 1 }):Play()
		TweenService:Create(label, TweenInfo.new(0.16), { TextColor3 = v and Theme.Text or Theme.SubText }):Play()
		TweenService:Create(chip, TweenInfo.new(0.16), { BackgroundTransparency = v and 0.55 or 0.86 }):Play()
	end
	uiconn(btn.MouseEnter, function()
		if not active then TweenService:Create(btn, TweenInfo.new(0.14), { BackgroundTransparency = 0.55 }):Play() end
	end)
	uiconn(btn.MouseLeave, function()
		if not active then TweenService:Create(btn, TweenInfo.new(0.14), { BackgroundTransparency = 1 }):Play() end
	end)
	ripple(btn)

	local tab = {
		Title = tostring(cfg.Title or "Tab"), index = index, y = (index - 1) * (TAB_H + TAB_GAP),
		btn = btn, wrap = wrap, scroll = scroll, setActive = setActive,
	}
	local api = setmetatable({ _tab = tab, _page = scroll }, { __index = Widgets })
	tab.api = api
	table.insert(Tabs, tab)
	uiconn(btn.Activated, function() selectTab(tab) end)
	return api
end

-- ------------------------------------------------------------- row plumbing
local ROW_H, ROW_H_DESC = 44, 60

local function nextOrder(api)
	api._order = (api._order or 0) + 1
	return api._order
end

-- The tab-building code below lives outside this do-block (the enclosing function
-- is at its local-register ceiling), so anything it needs has to travel on CopeUI.
CopeUI.NextOrder, CopeUI.Grad, CopeUI.Ripple = nextOrder, Grad, ripple
-- Drops a lazily-built widget into a slot reserved with Tab:Slot().
CopeUI.pin = function(el, order)
	if el and el.Row and tonumber(order) then el.Row.LayoutOrder = tonumber(order) end
	return el
end

-- Every control sits on one of these cards. It is a TextButton so a whole row
-- can be clickable where that makes sense; rows that do not want it simply
-- never connect Activated.
local function makeRow(api, height)
	local row = New("TextButton", {
		LayoutOrder = nextOrder(api), Size = UDim2.new(1, 0, 0, height),
		BackgroundColor3 = Theme.Surface, BackgroundTransparency = 0.1,
		BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 5, Parent = api._page,
	})
	Corner(11, row)
	local st = Stroke(Theme.Stroke, 0.45, 1, row)
	uiconn(row.MouseEnter, function()
		TweenService:Create(row, TweenInfo.new(0.14), { BackgroundTransparency = 0 }):Play()
		TweenService:Create(st, TweenInfo.new(0.14), { Transparency = 0.2 }):Play()
	end)
	uiconn(row.MouseLeave, function()
		TweenService:Create(row, TweenInfo.new(0.14), { BackgroundTransparency = 0.1 }):Play()
		TweenService:Create(st, TweenInfo.new(0.14), { Transparency = 0.45 }):Play()
	end)
	return row, st
end

-- Rows are declared with Lucide-style icon names, which have no glyph in Gotham:
-- rendering the name itself spilled "rotate-ccw" out of the 26 px chip and across
-- the row title. Anything not in this table falls back to a neutral dot.
local ROW_GLYPHS = {
	["trash-2"] = "🗑",
	["shopping-cart"] = "🛒",
	play = "▶",
	sparkles = "✨",
	gauge = "◔",
	send = "➤",
	["rotate-ccw"] = "↺",
	["log-out"] = "⏻",
	check = "✓",
	info = "i",
	["triangle-alert"] = "!",
}

local function rowTexts(row, cfg, rightPad)
	local hasDesc = cfg.Desc ~= nil and tostring(cfg.Desc) ~= ""
	local x = 14
	if cfg.Icon then
		local chip = New("Frame", {
			Position = UDim2.new(0, 12, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.fromOffset(26, 26), BackgroundColor3 = Theme.Accent,
			BackgroundTransparency = 0.85, BorderSizePixel = 0, ZIndex = 6, Parent = row,
		})
		Corner(8, chip)
		CopeUI.markAccent(chip, "BackgroundColor3")
		New("TextLabel", {
			Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium,
			TextSize = 13, TextColor3 = Theme.Text, ClipsDescendants = true,
			Text = ROW_GLYPHS[cfg.Icon] or (#tostring(cfg.Icon) <= 2 and tostring(cfg.Icon)) or "•",
			ZIndex = 7, Parent = chip,
		})
		x = 48
	end
	local right = (rightPad or 70) + x
	local title = New("TextLabel", {
		Name = "TitleLabel", Position = UDim2.new(0, x, 0, hasDesc and 11 or 0),
		Size = hasDesc and UDim2.new(1, -right, 0, 16) or UDim2.new(1, -right, 1, 0),
		BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12.5,
		TextColor3 = Theme.Text, TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = hasDesc and Enum.TextYAlignment.Center or Enum.TextYAlignment.Center,
		TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring(cfg.Title or ""), ZIndex = 6, Parent = row,
	})
	local desc = nil
	if hasDesc then
		desc = New("TextLabel", {
			Name = "DescLabel", Position = UDim2.new(0, x, 0, 28),
			Size = UDim2.new(1, -right, 0, 24), BackgroundTransparency = 1,
			Font = Enum.Font.Gotham, TextSize = 11, TextColor3 = Theme.SubText,
			TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top,
			TextWrapped = true, Text = tostring(cfg.Desc), ZIndex = 6, Parent = row,
		})
	end
	return title, desc
end

local function stdHandle(el, row)
	el.SetTitle = function(_, t)
		local lbl = row:FindFirstChild("TitleLabel")
		if lbl then lbl.Text = tostring(t) end
	end
	el.SetDesc = function(_, d)
		local lbl = row:FindFirstChild("DescLabel")
		if lbl then lbl.Text = tostring(d) end
	end
	el.Destroy = function() pcall(function() row:Destroy() end) end
	-- Exposed so a widget built later (the dynamic dropdowns) can be pinned back
	-- into a slot reserved for it at build time. See Widgets:Slot / CopeUI.pin.
	el.Row = row
	return el
end

-- ---------------------------------------------------------------- section
-- Reserve a layout position for a widget that gets built later. The dynamic
-- dropdowns (area, world, egg, gift, dark-matter pet, index worlds) are destroyed
-- and rebuilt whenever the game's data changes; without a reserved slot each
-- rebuild appends them to the very bottom of the tab, which is why they used to
-- drift away from the section they belong to.
function Widgets:Slot()
	return nextOrder(self)
end

function Widgets:Section(text)
	local holder = New("Frame", {
		LayoutOrder = nextOrder(self), Size = UDim2.new(1, 0, 0, 30),
		BackgroundTransparency = 1, ZIndex = 5, Parent = self._page,
	})
	local bar = New("Frame", {
		Position = UDim2.new(0, 2, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.fromOffset(3, 14), BackgroundColor3 = Theme.Accent,
		BorderSizePixel = 0, ZIndex = 6, Parent = holder,
	})
	Corner(999, bar)
	CopeUI.markAccent(bar, "BackgroundColor3")
	local label = New("TextLabel", {
		Position = UDim2.new(0, 13, 0, 0), Size = UDim2.new(1, -17, 1, 0),
		BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12.5,
		TextColor3 = Color3.fromRGB(255, 255, 255), TextXAlignment = Enum.TextXAlignment.Left,
		Text = string.upper(tostring(text or "")), ZIndex = 6, Parent = holder,
	})
	-- a UIGradient tints label text as well as backgrounds, so the heading picks
	-- up the accent ramp for free
	CopeUI.markAccent(Grad(label, Theme.Accent, Theme.Accent2, 0), "grad")
	return { SetTitle = function(_, t) label.Text = string.upper(tostring(t or "")) end }
end

-- ---------------------------------------------------------------- stat grid
-- A block of read-only counters, two to a row. Returns a map of key -> setter so
-- the caller's own refresh loop can push numbers in; the grid itself owns no
-- timer, which keeps it free when the tab is not being looked at.
function Widgets:StatGrid(items)
	local rows = math.ceil(#items / 2)
	local holder = New("Frame", {
		LayoutOrder = nextOrder(self), Size = UDim2.new(1, 0, 0, rows * 62 - 8),
		BackgroundTransparency = 1, ZIndex = 5, Parent = self._page,
	})
	New("UIGridLayout", {
		CellSize = UDim2.new(0.5, -4, 0, 54), CellPadding = UDim2.fromOffset(8, 8),
		SortOrder = Enum.SortOrder.LayoutOrder, Parent = holder,
	})
	local setters = {}
	for i, it in ipairs(items) do
		local tile = New("Frame", {
			LayoutOrder = i, BackgroundColor3 = Theme.Surface, BackgroundTransparency = 0.15,
			BorderSizePixel = 0, ZIndex = 6, Parent = holder,
		})
		Corner(11, tile)
		Stroke(Theme.Stroke, 0.5, 1, tile)
		local pip = New("Frame", {
			Position = UDim2.new(0, 0, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.fromOffset(3, 26), BackgroundColor3 = Theme.Accent,
			BorderSizePixel = 0, ZIndex = 7, Parent = tile,
		})
		Corner(999, pip)
		CopeUI.markAccent(pip, "BackgroundColor3")
		New("TextLabel", {
			Position = UDim2.new(0, 14, 0, 9), Size = UDim2.new(1, -22, 0, 12),
			BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 10,
			TextColor3 = Theme.SubText, TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd, Text = string.upper(tostring(it.Title or "")),
			ZIndex = 7, Parent = tile,
		})
		local val = New("TextLabel", {
			Position = UDim2.new(0, 14, 0, 24), Size = UDim2.new(1, -22, 0, 20),
			BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 16,
			TextColor3 = Theme.Text, TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd, Text = "0", ZIndex = 7, Parent = tile,
		})
		setters[it.Key or i] = function(v) val.Text = tostring(v) end
	end
	return setters
end

-- ---------------------------------------------------------------- toggle
function Widgets:Toggle(cfg)
	cfg = cfg or {}
	local row = makeRow(self, cfg.Desc and ROW_H_DESC or ROW_H)
	rowTexts(row, cfg, 74)

	local track = New("Frame", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0),
		Size = UDim2.fromOffset(44, 22), BackgroundColor3 = Theme.Element,
		BackgroundTransparency = 0.1, BorderSizePixel = 0, ZIndex = 6, Parent = row,
	})
	Corner(999, track)
	local tstroke = CopeUI.markAccent(Stroke(Theme.Accent, 0.8, 1, track), "Color")
	CopeUI.markAccent(Grad(track, Theme.Accent, Theme.Accent2, 0), "grad")
	local knob = New("Frame", {
		AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 3, 0.5, 0),
		Size = UDim2.fromOffset(16, 16), BackgroundColor3 = Theme.Gray,
		BorderSizePixel = 0, ZIndex = 7, Parent = track,
	})
	Corner(999, knob)

	local el = { Value = cfg.Value == true }
	local function paint(instant)
		local on = el.Value
		local kpos = on and UDim2.new(1, -19, 0.5, 0) or UDim2.new(0, 3, 0.5, 0)
		local kcol = on and Color3.fromRGB(255, 255, 255) or Theme.Gray
		local tcol = on and Color3.fromRGB(255, 255, 255) or Theme.Element
		local talpha = on and 0 or 0.1
		local salpha = on and 0.3 or 0.82
		if instant then
			knob.Position, knob.BackgroundColor3 = kpos, kcol
			track.BackgroundColor3, track.BackgroundTransparency = tcol, talpha
			tstroke.Transparency = salpha
			return
		end
		TweenService:Create(knob, TweenInfo.new(0.26, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Position = kpos, BackgroundColor3 = kcol,
		}):Play()
		TweenService:Create(track, TweenInfo.new(0.18), { BackgroundColor3 = tcol, BackgroundTransparency = talpha }):Play()
		TweenService:Create(tstroke, TweenInfo.new(0.18), { Transparency = salpha }):Play()
	end
	paint(true)

	el.Set = function(_, v, fireCallback, instant)
		el.Value = v == true
		paint(instant == true)
		if fireCallback ~= false and cfg.Callback then task.spawn(cfg.Callback, el.Value) end
	end
	stdHandle(el, row)
	uiconn(row.Activated, function() el:Set(not el.Value, true) end)
	ripple(row, true)
	table.insert(CopeUI.Registry, { type = "toggle", set = function(v) el:Set(v, true) end, default = cfg.Value == true })
	return el
end

-- ---------------------------------------------------------------- dropdown
local activePopup = nil
local function closeActivePopup()
	local a = activePopup
	if not a then return end
	activePopup = nil
	pcall(function() a.catcher:Destroy() end)
	if a.onClose then pcall(a.onClose) end
	local w = a.wrap
	TweenService:Create(a.scale, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.9 }):Play()
	task.delay(0.13, function() pcall(function() w:Destroy() end) end)
end
table.insert(dropdownClosers, closeActivePopup)

local POPUP_W = 192

function Widgets:Dropdown(cfg)
	cfg = cfg or {}
	local multi = cfg.Multi == true
	local function values() return cfg.Values or {} end
	local selected
	if multi then
		selected = {}
		for _, v in ipairs(type(cfg.Value) == "table" and cfg.Value or {}) do selected[v] = true end
	else
		selected = cfg.Value
		if selected == nil and cfg.AllowNone ~= true and #values() > 0 then selected = values()[1] end
	end

	local row = makeRow(self, cfg.Desc and ROW_H_DESC or ROW_H)
	rowTexts(row, cfg, 176)
	local pill = New("TextButton", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0),
		Size = UDim2.fromOffset(162, 30), BackgroundColor3 = Theme.Element,
		BackgroundTransparency = 0.15, BorderSizePixel = 0,
		AutoButtonColor = false, Text = "", ZIndex = 8, Parent = row,
	})
	Corner(9, pill)
	local pillStroke = Stroke(Theme.Stroke, 0.4, 1, pill)
	local ptext = New("TextLabel", {
		Position = UDim2.new(0, 10, 0, 0), Size = UDim2.new(1, -30, 1, 0),
		BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 11.5,
		TextColor3 = Theme.SubText, TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd, Text = "", ZIndex = 9, Parent = pill,
	})
	local chev = New("TextLabel", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -8, 0.5, 0),
		Size = UDim2.fromOffset(12, 12), BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = Theme.SubText,
		Text = "▾", ZIndex = 9, Parent = pill,
	})
	uiconn(pill.MouseEnter, function()
		TweenService:Create(pill, TweenInfo.new(0.14), { BackgroundTransparency = 0 }):Play()
		TweenService:Create(pillStroke, TweenInfo.new(0.14), { Transparency = 0.15 }):Play()
	end)
	uiconn(pill.MouseLeave, function()
		TweenService:Create(pill, TweenInfo.new(0.14), { BackgroundTransparency = 0.15 }):Play()
		TweenService:Create(pillStroke, TweenInfo.new(0.14), { Transparency = 0.4 }):Play()
	end)
	ripple(pill)

	local el = {}
	local function pillText()
		if multi then
			local list = {}
			for _, v in ipairs(values()) do
				if selected[v] then table.insert(list, v) end
			end
			el.Value = list
			ptext.Text = #list > 0 and table.concat(list, ", ") or (cfg.AllowNone and "Nothing" or "Select…")
			ptext.TextColor3 = #list > 0 and Theme.Text or Theme.SubText
		else
			el.Value = selected
			ptext.Text = tostring(selected or (cfg.AllowNone and "Nothing" or "Select…"))
			ptext.TextColor3 = selected ~= nil and Theme.Text or Theme.SubText
		end
	end
	pillText()

	uiconn(pill.Activated, function()
		if activePopup and activePopup.owner == el then
			closeActivePopup()
			return
		end
		closeActivePopup()
		local list = values()
		local relX, relY = absToRoot(pill)
		local listH = math.min(#list * 32 + 12, 226)
		local flip = (relY + 34 + listH) > (WINDOW_H - 10)
		local px = math.clamp(relX + 162 - POPUP_W, 8, WINDOW_W - POPUP_W - 8)

		local catcher = New("TextButton", {
			Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
			Text = "", AutoButtonColor = false, ZIndex = 51, Parent = PopupLayer,
		})
		catcher.Activated:Connect(closeActivePopup)

		local wrap = New("Frame", {
			AnchorPoint = flip and Vector2.new(0, 1) or Vector2.new(0, 0),
			Position = flip and UDim2.new(0, px, 0, relY - 4) or UDim2.new(0, px, 0, relY + 34),
			Size = UDim2.fromOffset(POPUP_W, listH), BackgroundTransparency = 1,
			ZIndex = 52, Parent = PopupLayer,
		})
		local scale = New("UIScale", { Scale = 0.92, Parent = wrap })
		local panel = New("Frame", {
			Size = UDim2.fromScale(1, 1), BackgroundColor3 = Theme.SurfaceAlt,
			BorderSizePixel = 0, ZIndex = 52, Parent = wrap,
		})
		Corner(11, panel)
		CopeUI.markAccent(Stroke(Theme.Accent, 0.55, 1, panel), "Color")
		local scroll = New("ScrollingFrame", {
			Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0,
			CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.Y, ScrollBarThickness = 3,
			ScrollBarImageTransparency = 0.2, ZIndex = 53, Parent = panel,
		})
		CopeUI.markAccent(scroll, "ScrollBarImageColor3")
		New("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder, Parent = scroll })
		Pad(scroll, 6, 6, 6, 6)

		for i, opt in ipairs(list) do
			local optBtn = New("TextButton", {
				Size = UDim2.new(1, -4, 0, 28), BackgroundColor3 = Theme.Element,
				BackgroundTransparency = 0.1, BorderSizePixel = 0, AutoButtonColor = false,
				Text = "", ZIndex = 54, LayoutOrder = i, Parent = scroll,
			})
			Corner(7, optBtn)
			local otext = New("TextLabel", {
				Position = UDim2.new(0, 9, 0, 0), Size = UDim2.new(1, -32, 1, 0),
				BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 11.5,
				TextColor3 = Theme.SubText, TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring(opt), ZIndex = 55, Parent = optBtn,
			})
			local mark = New("TextLabel", {
				AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -8, 0.5, 0),
				Size = UDim2.fromOffset(14, 14), BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Theme.Text,
				Text = "✓", Visible = false, ZIndex = 55, Parent = optBtn,
			})
			local function refreshBtn()
				local isSel = multi and (selected[opt] == true) or (not multi and selected == opt)
				optBtn.BackgroundColor3 = isSel and Theme.Accent or Theme.Element
				optBtn.BackgroundTransparency = isSel and 0.25 or 0.1
				otext.TextColor3 = isSel and Theme.Text or Theme.SubText
				mark.Visible = isSel
			end
			refreshBtn()
			optBtn.MouseEnter:Connect(function()
				local isSel = multi and (selected[opt] == true) or (not multi and selected == opt)
				if not isSel then
					TweenService:Create(optBtn, TweenInfo.new(0.12), { BackgroundColor3 = Theme.ElementHover, BackgroundTransparency = 0 }):Play()
				end
			end)
			optBtn.MouseLeave:Connect(refreshBtn)
			optBtn.Activated:Connect(function()
				if multi then
					selected[opt] = (not selected[opt]) or nil
					refreshBtn()
					pillText()
					if cfg.Callback then task.spawn(cfg.Callback, el.Value) end
				else
					selected = opt
					pillText()
					closeActivePopup()
					if cfg.Callback then task.spawn(cfg.Callback, selected) end
				end
			end)
		end

		activePopup = {
			owner = el, wrap = wrap, scale = scale, catcher = catcher,
			onClose = function()
				TweenService:Create(chev, TweenInfo.new(0.16), { Rotation = 0 }):Play()
			end,
		}
		TweenService:Create(chev, TweenInfo.new(0.16), { Rotation = 180 }):Play()
		TweenService:Create(scale, TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
	end)

	el.Set = function(_, listOrValue, fireCallback)
		if multi then
			selected = {}
			for _, v in ipairs(type(listOrValue) == "table" and listOrValue or {}) do selected[v] = true end
		else
			selected = listOrValue
		end
		pillText()
		if fireCallback ~= false and cfg.Callback then
			task.spawn(cfg.Callback, multi and el.Value or selected)
		end
	end
	stdHandle(el, row)
	local baseDestroy = el.Destroy
	el.Destroy = function()
		if activePopup and activePopup.owner == el then closeActivePopup() end
		if baseDestroy then baseDestroy() end
	end
	table.insert(CopeUI.Registry, {
		type = "dropdown", multi = multi, default = cfg.Value,
		set = function(v) el:Set(v, true) end,
	})
	return el
end

-- ---------------------------------------------------------------- button
-- Every accent button has a sheen strip. The old engine gave each one its own
-- task.spawn loop; here one driver job walks the list and only touches the
-- buttons that are on the tab the user is actually looking at.
local sheens = {}
everyFrame(function(t)
	for i = 1, #sheens do
		local s = sheens[i]
		if s.tab == currentTab then
			s.grad.Offset = Vector2.new(((t * 0.42 + s.phase) % 1.7) - 0.35, 0)
		end
	end
end)

local SHEEN_ALPHA = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.42, 1),
	NumberSequenceKeypoint.new(0.5, 0.84),
	NumberSequenceKeypoint.new(0.58, 1),
	NumberSequenceKeypoint.new(1, 1),
})

function Widgets:Button(cfg)
	cfg = cfg or {}
	local row = makeRow(self, cfg.Desc and 54 or 44)
	row.BackgroundColor3 = Theme.Accent
	CopeUI.markAccent(row, "BackgroundColor3")
	CopeUI.markAccent(Grad(row, Theme.Accent, Theme.Accent2, 25), "grad")
	local title, desc = rowTexts(row, cfg, 46)
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	if desc then desc.TextColor3 = Color3.fromRGB(226, 226, 244) end

	local sheen = New("Frame", {
		Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0, ZIndex = 7, Parent = row,
	})
	Corner(11, sheen)
	local sgrad = New("UIGradient", { Transparency = SHEEN_ALPHA, Rotation = 18, Parent = sheen })
	table.insert(sheens, { grad = sgrad, tab = self._tab, phase = math.random() * 1.7 })

	local arrow = New("TextLabel", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -16, 0.5, 0),
		Size = UDim2.fromOffset(18, 18), BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold, TextSize = 15, TextColor3 = Color3.fromRGB(255, 255, 255),
		Text = "›", ZIndex = 8, Parent = row,
	})
	local scale = New("UIScale", { Scale = 1, Parent = row })
	uiconn(row.MouseEnter, function()
		TweenService:Create(arrow, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Position = UDim2.new(1, -11, 0.5, 0),
		}):Play()
	end)
	uiconn(row.MouseLeave, function()
		TweenService:Create(arrow, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Position = UDim2.new(1, -16, 0.5, 0),
		}):Play()
	end)
	uiconn(row.MouseButton1Down, function()
		TweenService:Create(scale, TweenInfo.new(0.1), { Scale = 0.975 }):Play()
	end)
	uiconn(row.MouseButton1Up, function()
		TweenService:Create(scale, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
	end)
	ripple(row, true)

	local el = {}
	stdHandle(el, row)
	uiconn(row.Activated, function()
		if cfg.Callback then task.spawn(cfg.Callback) end
	end)
	return el
end

-- ---------------------------------------------------------------- slider
-- One shared input pair drives whichever slider is being dragged, instead of a
-- pair of UserInputService connections per slider.
local sliderDrag, sliderRelease = nil, nil
uiconn(UserInputService.InputChanged, function(input)
	if sliderDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		sliderDrag(input.Position.X)
	end
end)
uiconn(UserInputService.InputEnded, function(input)
	if sliderDrag and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
		sliderDrag = nil
		if sliderRelease then
			pcall(sliderRelease)
			sliderRelease = nil
		end
	end
end)

function Widgets:Slider(cfg)
	cfg = cfg or {}
	local spec = cfg.Value or {}
	local vmin = tonumber(spec.Min) or 0
	local vmax = tonumber(spec.Max) or 100
	local step = tonumber(cfg.Step) or 1
	if step <= 0 then step = 1 end
	local hasDesc = cfg.Desc ~= nil and tostring(cfg.Desc) ~= ""
	local row = makeRow(self, hasDesc and 78 or 60)

	local title = New("TextLabel", {
		Name = "TitleLabel", Position = UDim2.new(0, 14, 0, 10), Size = UDim2.new(1, -100, 0, 16),
		BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12.5,
		TextColor3 = Theme.Text, TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring(cfg.Title or ""), ZIndex = 6, Parent = row,
	})
	if hasDesc then
		New("TextLabel", {
			Name = "DescLabel", Position = UDim2.new(0, 14, 0, 27), Size = UDim2.new(1, -100, 0, 22),
			BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 11,
			TextColor3 = Theme.SubText, TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true,
			Text = tostring(cfg.Desc), ZIndex = 6, Parent = row,
		})
	end
	local bubble = New("Frame", {
		AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -14, 0, 8),
		Size = UDim2.fromOffset(62, 20), BackgroundColor3 = Theme.Accent,
		BackgroundTransparency = 0.78, BorderSizePixel = 0, ZIndex = 6, Parent = row,
	})
	Corner(7, bubble)
	CopeUI.markAccent(bubble, "BackgroundColor3")
	CopeUI.markAccent(Stroke(Theme.Accent, 0.6, 1, bubble), "Color")
	local vlabel = New("TextLabel", {
		Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamBold,
		TextSize = 11, TextColor3 = Theme.Text, Text = "0", ZIndex = 7, Parent = bubble,
	})

	local track = New("Frame", {
		Position = UDim2.new(0, 14, 1, -18), Size = UDim2.new(1, -28, 0, 6),
		BackgroundColor3 = Theme.Element, BorderSizePixel = 0, ZIndex = 6, Parent = row,
	})
	Corner(999, track)
	local fill = New("Frame", {
		Size = UDim2.fromScale(0, 1), BackgroundColor3 = Theme.Accent,
		BorderSizePixel = 0, ZIndex = 7, Parent = track,
	})
	Corner(999, fill)
	CopeUI.markAccent(fill, "BackgroundColor3")
	CopeUI.markAccent(Grad(fill, Theme.Accent, Theme.Accent2, 0), "grad")
	local knob = New("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.fromOffset(14, 14), BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0, ZIndex = 8, Parent = track,
	})
	Corner(999, knob)
	CopeUI.markAccent(Stroke(Theme.Accent, 0.25, 2, knob), "Color")

	local el = { Value = tonumber(spec.Default) or vmin }
	local function fmt(v)
		if step < 1 then return string.format("%.2f", v) end
		return tostring(math.floor(v + 0.5))
	end
	local function apply(raw, fire, instant)
		local v = math.clamp(tonumber(raw) or vmin, vmin, vmax)
		v = vmin + math.floor((v - vmin) / step + 0.5) * step
		v = math.clamp(v, vmin, vmax)
		el.Value = v
		local pct = (vmax > vmin) and (v - vmin) / (vmax - vmin) or 0
		vlabel.Text = fmt(v)
		if instant then
			fill.Size = UDim2.fromScale(pct, 1)
			knob.Position = UDim2.new(pct, 0, 0.5, 0)
		else
			local ti = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			TweenService:Create(fill, ti, { Size = UDim2.fromScale(pct, 1) }):Play()
			TweenService:Create(knob, ti, { Position = UDim2.new(pct, 0, 0.5, 0) }):Play()
		end
		if fire and cfg.Callback then task.spawn(cfg.Callback, v) end
	end
	apply(el.Value, false, true)

	local function fromX(x)
		local w = track.AbsoluteSize.X
		if w <= 0 then return end
		local pct = math.clamp((x - track.AbsolutePosition.X) / w, 0, 1)
		apply(vmin + pct * (vmax - vmin), true, true)
	end
	local function grab(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
		sliderDrag = fromX
		TweenService:Create(knob, TweenInfo.new(0.12), { Size = UDim2.fromOffset(18, 18) }):Play()
		TweenService:Create(track, TweenInfo.new(0.12), { Size = UDim2.new(1, -28, 0, 8) }):Play()
		sliderRelease = function()
			TweenService:Create(knob, TweenInfo.new(0.16), { Size = UDim2.fromOffset(14, 14) }):Play()
			TweenService:Create(track, TweenInfo.new(0.16), { Size = UDim2.new(1, -28, 0, 6) }):Play()
		end
		fromX(input.Position.X)
	end
	uiconn(track.InputBegan, grab)
	uiconn(knob.InputBegan, grab)
	uiconn(row.InputBegan, function(input)
		-- clicking the lower strip of the card counts as grabbing the bar
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
		local ly = input.Position.Y - row.AbsolutePosition.Y
		if ly >= row.AbsoluteSize.Y - 26 then grab(input) end
	end)

	el.Set = function(_, v, fireCallback) apply(v, fireCallback ~= false, false) end
	stdHandle(el, row)
	el.SetTitle = function(_, t) title.Text = tostring(t) end
	table.insert(CopeUI.Registry, {
		type = "slider", default = tonumber(spec.Default) or vmin,
		set = function(v) apply(tonumber(v) or vmin, true, false) end,
	})
	return el
end

-- ---------------------------------------------------------------- input
function Widgets:Input(cfg)
	cfg = cfg or {}
	local row = makeRow(self, cfg.Desc and ROW_H_DESC or ROW_H)
	rowTexts(row, cfg, 184)
	local box = New("TextBox", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0),
		Size = UDim2.fromOffset(170, 30), BackgroundColor3 = Theme.Element,
		BackgroundTransparency = 0.15, BorderSizePixel = 0,
		Font = Enum.Font.Gotham, TextSize = 11.5, TextColor3 = Theme.Text,
		PlaceholderColor3 = Color3.fromRGB(112, 112, 142), PlaceholderText = tostring(cfg.Placeholder or ""),
		Text = "", ClearTextOnFocus = false, TextTruncate = Enum.TextTruncate.AtEnd,
		TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8, Parent = row,
	})
	Corner(9, box)
	Pad(box, 0, 10, 0, 10)
	local bs = Stroke(Theme.Stroke, 0.4, 1, box)
	local el = { Text = "", Value = "" }
	uiconn(box.Focused, function()
		TweenService:Create(box, TweenInfo.new(0.15), { BackgroundTransparency = 0 }):Play()
		TweenService:Create(bs, TweenInfo.new(0.15), { Color = Theme.Accent, Transparency = 0.1 }):Play()
	end)
	uiconn(box.FocusLost, function(enterPressed)
		TweenService:Create(box, TweenInfo.new(0.15), { BackgroundTransparency = 0.15 }):Play()
		TweenService:Create(bs, TweenInfo.new(0.15), { Color = Theme.Stroke, Transparency = 0.4 }):Play()
		el.Text, el.Value = box.Text, box.Text
		if enterPressed and cfg.Callback then task.spawn(cfg.Callback, box.Text) end
	end)
	uiconn(box:GetPropertyChangedSignal("Text"), function()
		el.Text, el.Value = box.Text, box.Text
	end)
	stdHandle(el, row)
	el.SetText = function(_, t)
		box.Text = tostring(t or "")
		el.Text, el.Value = box.Text, box.Text
	end
	return el
end

-- ---------------------------------------------------------------- hotkeys
-- K always works; Config.HotkeyName is the rebindable second key.
uiconn(UserInputService.InputBegan, function(input, processed)
	if processed then return end
	if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
	local kc = input.KeyCode
	if State.RebindWaiting then
		State.RebindWaiting = false
		if kc ~= Enum.KeyCode.Escape then
			Config.HotkeyName = kc.Name
			CopeUI.Notify({ Title = "Cope Hub", Content = "Hotkey set to " .. kc.Name .. " (K also works)", Icon = "check", Duration = 2.5 })
			AreaFarm.SaveSettings(true)
		else
			CopeUI.Notify({ Title = "Cope Hub", Content = "Rebind cancelled", Icon = "info", Duration = 2 })
		end
		if AreaFarm._refreshHotkeyLabel then AreaFarm._refreshHotkeyLabel() end
		return
	end
	-- F8 puts the picture back whatever the UI is doing. Background Mode can stop
	-- the renderer, and a switch that is able to blank the window needs a way out
	-- that does not depend on the window.
	if kc == Enum.KeyCode.F8 then
		if AreaFarm._bgPanic then pcall(AreaFarm._bgPanic) end
		return
	end
	if kc == Enum.KeyCode.K or kc.Name == tostring(Config.HotkeyName) then
		SetUIVisible(not State.UIVisible)
	end
end)

function Window:Destroy()
	for _, c in ipairs(CopeUI.Conns) do pcall(function() c:Disconnect() end) end
	table.clear(CopeUI.Conns)
	table.clear(Motion.jobs)
	pcall(function() if hubBlur then hubBlur:Destroy() end end)
	hubBlur = nil
	pcall(function() ScreenGui:Destroy() end)
	AreaFarm.ScreenGui = nil
end
end

-- Sidebar order. Grouped by what you are trying to do rather than by which
-- remote it happens to call: Farm/Eggs produce pets, Index/Variants complete the
-- collection, Gifts/Collect bring things in, Delete throws things away.
local FarmTab = Window:Tab({ Title = "Farm", Icon = "🌾" })
local EggTab = Window:Tab({ Title = "Eggs", Icon = "🥚" })
local IndexTab = Window:Tab({ Title = "Index", Icon = "📖" })
local VariantTab = Window:Tab({ Title = "Variants", Icon = "🔮" })
local GiftTab = Window:Tab({ Title = "Gifts", Icon = "🎁" })
local CollectTab = Window:Tab({ Title = "Collect", Icon = "🧲" })
local DeleteTab = Window:Tab({ Title = "Delete", Icon = "🗑️" })
local BoostsTab = Window:Tab({ Title = "Boosts", Icon = "⚡" })
local EnchantTab = Window:Tab({ Title = "Enchant", Icon = "✨" })
local AlertTab = Window:Tab({ Title = "Alerts", Icon = "🔔" })
local StatsTab = Window:Tab({ Title = "Stats", Icon = "📊" })
local PerfTab = Window:Tab({ Title = "Performance", Icon = "🚀" })
local SettingsTab = Window:Tab({ Title = "Settings", Icon = "⚙️" })

AreaFarm._destroyUI = function()
	if AreaFarm._destroyWidget then pcall(AreaFarm._destroyWidget) end
	pcall(function() Window:Destroy() end)
end

selectTab(Tabs[1])
task.delay(0.4, function()
	pcall(function() AreaFarm.SaveSettings(true) end)
end)

FarmTab:Section("Breakables")
FarmTab:Toggle({
	Title = "Auto Farm Breakables",
	Desc = "Splits pets across several breakables and attacks them all at once",
	Value = false,
	Callback = function(v) Config.AutoFarm = v end,
})
FarmTab:Slider({
	Title = "Parallel Targets",
	Desc = "How many breakables to farm at the same time",
	Value = { Min = 1, Max = 10, Default = tonumber(Config.MultiTargets) or 3 },
	Step = 1,
	Callback = function(v) Config.MultiTargets = v end,
})
FarmTab:Toggle({
	Title = "Farm Whole Area At Once",
	Desc = "Ignores Parallel Targets + distance — puts a pet on EVERY breakable in the area simultaneously",
	Value = Config.FarmAllArea == true,
	Callback = function(v) Config.FarmAllArea = v end,
})
FarmTab:Slider({
	Title = "Fire Delay",
	Desc = "Seconds between Farm Coin attacks",
	Value = { Min = 0.01, Max = 0.5, Default = 0.05 },
	Step = 0.01,
	Callback = function(v) Config.FireDelay = v end,
})
FarmTab:Slider({
	Title = "Max Fires/Sec (Kick Safety)",
	Desc = "Hard cap on total Farm Coin rate. Above ~100/s this account gets disconnected — raise at your own risk.",
	Value = { Min = 30, Max = 150, Default = tonumber(Config.SafeFireRate) or 100 },
	Step = 10,
	Callback = function(v) Config.SafeFireRate = v end,
})
FarmTab:Slider({
	Title = "Max Distance",
	Desc = "Caps coin targeting + drop collection, 0 = unlimited",
	Value = { Min = 0, Max = 5000, Default = 0 },
	Step = 50,
	Callback = function(v) Config.MaxDistance = v end,
})
FarmTab:Toggle({
	Title = "Leave Coin On Break",
	Value = true,
	Callback = function(v) Config.LeaveOnBreak = v end,
})
FarmTab:Toggle({
	Title = "Only Break Strongest Breakables",
	Desc = "Ignores the weak coin tiers in an area and only attacks coins at the top health tier",
	Value = Config.StrongestOnly ~= false,
	Callback = function(v) Config.StrongestOnly = v end,
})

FarmTab:Section("Area & World")
-- The area and world pickers are rebuilt every time the game's area list changes,
-- so they get reserved positions here instead of re-appending to the bottom of the
-- tab (which is what used to strand them below Progression).
local AreaSlot = FarmTab:Slot()
local WorldSlot = FarmTab:Slot()

FarmTab:Section("Progression")
local ProgBA, ProgWP, ProgACG
ProgBA = FarmTab:Toggle({
	Title = "Auto Best Area",
	Desc = "Keeps farming the highest area you own in the current world",
	Value = Config.AutoBestArea == true,
	Callback = function(v)
		Config.AutoBestArea = v
		if v then
			Config.AutoWorldProgress, Config.AutoCompleteGame = false, false
			ProgWP:Set(false, false, true)
			ProgACG:Set(false, false, true)
		end
	end,
})
ProgWP = FarmTab:Toggle({
	Title = "World Progression",
	Desc = "Farms until every area of the world is owned (buys gates), then moves to the next world",
	Value = Config.AutoWorldProgress == true,
	Callback = function(v)
		Config.AutoWorldProgress = v
		if v then
			Config.AutoBestArea, Config.AutoCompleteGame = false, false
			ProgBA:Set(false, false, true)
			ProgACG:Set(false, false, true)
			if not Config.AutoFarm then
				Config.AutoFarm = true
				pushNotify("Cope Hub", "Progression enabled Auto Farm for you", "info")
			end
		end
	end,
})
ProgACG = FarmTab:Toggle({
	Title = "Auto Complete Game",
	Desc = "Fixed route: Spawn -> Fantasy -> 7.5B Fantasy Coins -> back to Spawn for Ice Tech -> Tech -> Hacker Portal quests -> Void -> Axolotl Ocean -> Pixel. Ignores gamepass-only areas (VIP). Forces Auto Farm on. Disables itself when done.",
	Value = Config.AutoCompleteGame == true,
	Callback = function(v)
		Config.AutoCompleteGame = v
		if v then
			Config.AutoBestArea, Config.AutoWorldProgress = false, false
			ProgBA:Set(false, false, true)
			ProgWP:Set(false, false, true)
			if Config.ACGResumeFarm == nil then Config.ACGResumeFarm = Config.AutoFarm end
			if not Config.AutoFarm then
				Config.AutoFarm = true
				pushNotify("Cope Hub", "Auto Complete Game enabled Auto Farm", "rocket")
			end
			pushNotify("Cope Hub", "AUTO COMPLETE GAME: starting the grind!", "trophy")
		elseif Config.ACGResumeFarm ~= nil then
			if Config.ACGResumeFarm == false then Config.AutoFarm = false end
			Config.ACGResumeFarm = nil
		end
	end,
})
FarmTab:Button({
	Title = "What Is It Doing?",
	Desc = "Shows the progression worker's current status",
	Callback = function()
		local note = AreaFarm._progState and AreaFarm._progState.note or ""
		pushNotify("Cope Hub", "Progression: " .. (note ~= "" and note or "idle"), "gauge")
	end,
})

EggTab:Section("Hatching")
-- Reserved position for the egg picker: it is rebuilt on every world change, so
-- without a slot it would keep re-appending itself below Trading.
local EggSlot = EggTab:Slot()
EggTab:Toggle({
	Title = "Auto Open Eggs",
	Desc = "Hatches from anywhere via teleport-flicker",
	Value = false,
	Callback = function(v)
		Config.AutoEggs = v
		if not v then State.EggTpDone = nil end
	end,
})
EggTab:Dropdown({
	Title = "Hatch Amount",
	Desc = "x8 needs the game's Buy-8 unlock; without it the farm falls back to x3.",
	Values = { "x1", "x3", "x8" },
	Value = "x3",
	Callback = function(v)
		Config.EggAmount = (v == "x8") and 8 or ((v == "x3") and 3 or 1)
		State.OctupleWarned = false
	end,
})
EggTab:Toggle({
	Title = "Skip Hatch Animation",
	Desc = "Disables the game's cutscene listener",
	Value = true,
	Callback = function(v) Config.SkipAnim = v end,
})
EggTab:Slider({
	Title = "Hatch Delay",
	Desc = "Server enforces ~0.8s minimum between buys",
	Value = { Min = 0.8, Max = 3, Default = 0.8 },
	Step = 0.05,
	Callback = function(v) Config.HatchDelay = v end,
})
AreaFarm._deleteToggle = nil

DeleteTab:Section("Rules")
-- PSX-style "Auto Delete (Eggs)": six rarity toggles like the real panel.
-- Rarity toggles arm our own sweep + instant-delete paths (both Dark-Matter
-- safe). The game's native filter is kept off — it has no variant protection.
local FilterToggle = DeleteTab:Toggle({
	Title = "Auto-Delete Filter",
	Desc = "Deletes hatched pets of the picked rarities via the hub — Dark Matter always safe",
	Value = false,
	Callback = function(v) Config.AutoDeleteFilter = v end,
})
AreaFarm._filterToggle = FilterToggle
local ExclDeleteToggle = DeleteTab:Toggle({
	Title = "Auto-Delete Exclusives",
	Desc = "Deletes hatched Exclusive-rarity pets automatically (except Huges/Titanics, locked, and your kept Exclusive variants) — Dark Matter always safe",
	Value = Config.AutoDeleteExclusives == true,
	Callback = function(v) Config.AutoDeleteExclusives = v end,
})
AreaFarm._exclDeleteToggle = ExclDeleteToggle

-- The game's own native auto-delete has no variant protection, so it stays OFF
-- at all times; deletion runs only through our guarded sweep/instant paths,
-- which never touch Dark Matter.
local function syncNativeAutoDelete()
	task.spawn(function()
		local Library = AreaFarm.Library
		if not Library then return end
		pcall(function()
			local data = Library.Save.Get()
			if not data or not data.AutoDelete then return end
			for _, r in ipairs(PSX_RARITIES) do
				data.AutoDelete[r] = false
			end
			if Library.Variables then Library.Variables.AutoDeleteEnabled = false end
		end)
	end)
end

-- Re-assert on every session: a stale save can carry old native flags.
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	if AreaFarm.Gen == myGen then syncNativeAutoDelete() end
end)

DeleteTab:Section("Rarities To Delete")
local RarityToggles = {}
for _, r in ipairs(PSX_RARITIES) do
	RarityToggles[r] = DeleteTab:Toggle({
		Title = r,
		Desc = "Auto-delete hatched pets of this rarity (Dark Matter spared)",
		Value = Config.DeleteRarities[r] == true,
		Callback = function(v)
			Config.DeleteRarities[r] = v or nil
			syncNativeAutoDelete()
		end,
	})
end
-- Second pass on purpose: the rarity switches and their variant exceptions used to
-- be interleaved, which made a six-rarity list read as twelve unrelated rows. Now
-- you arm rarities in one block and carve out exceptions in another.
DeleteTab:Section("Keep Variants (per rarity)")
for _, r in ipairs(PSX_RARITIES) do
	DeleteTab:Dropdown({
		Title = r,
		Desc = "Among armed " .. r .. " pets, spare these variants",
		Values = { "Normal", "Golden", "Rainbow", "Dark Matter", "Shiny" },
		Multi = true,
		AllowNone = true,
		Value = {},
		Callback = function(v)
			local sel = type(v) == "table" and v or { v }
			Config.KeepVariants[r] = (#sel > 0) and sel or nil
		end,
	})
end
AreaFarm._rarityToggles = RarityToggles
AreaFarm._runOnHubThread = function(fn) task.spawn(fn) end

DeleteTab:Section("Protections")
DeleteTab:Toggle({
	Title = "Never Delete Huges & Titanics",
	Desc = "Locked pets and egg items are always safe regardless of settings",
	Value = true,
	Callback = function(v) Config.ProtectHugeTitanic = v end,
})

DeleteTab:Section("Manual")
DeleteTab:Button({
	Title = "Run Delete Sweep Now",
	Desc = "One-time sweep of your current inventory",
	Icon = "trash-2",
	Callback = function()
		if State.DeleteScanning then
			pushNotify("Cope Hub", "A delete sweep is already running", "clock")
			return
		end
		task.spawn(function()
			State.DeleteScanning = true
			local n, err = AreaFarm._sweepAutoDelete()
			State.DeleteScanning = false
			if err then
				pushNotify("Cope Hub", "Delete failed: " .. err, "triangle-alert")
			elseif n > 0 then
				Stats.Deleted += n
				pushNotify("Cope Hub", "Deleted " .. n .. " pet" .. (n == 1 and "" or "s"), "check")
			else
				pushNotify("Cope Hub", "No deletable pets found", "info")
			end
		end)
	end,
})

CollectTab:Section("Pickups")
CollectTab:Toggle({
	Title = "Auto Collect Orbs",
	Desc = "Remote claim in batches of 5 (server limit)",
	Value = false,
	Callback = function(v) Config.AutoOrbs = v end,
})
CollectTab:Toggle({
	Title = "Auto Collect Lootbags",
	Desc = "Remote collection",
	Value = false,
	Callback = function(v) Config.AutoBags = v end,
})
CollectTab:Section("Magnet")
CollectTab:Toggle({
	Title = "Magnet: Orbs",
	Desc = "Pulls EVERY orb on the map to you, 10x per second",
	Value = false,
	Callback = function(v) Config.MagnetOrbs = v end,
})
CollectTab:Toggle({
	Title = "Magnet: Lootbags",
	Desc = "Teleports lootbags to your feet",
	Value = false,
	Callback = function(v) Config.MagnetBags = v end,
})

GiftTab:Section("Playtime Rewards")
GiftTab:Toggle({
	Title = "Auto Claim Playtime Gifts",
	Desc = "Claims every free playtime gift the moment its timer is ready. The whole 12-gift set re-arms on the server's reset clock (~5 h), which the tiles below count down to.",
	Value = Config.AutoGifts == true,
	Callback = function(v) Config.AutoGifts = v end,
})
local PlayTiles = GiftTab:StatGrid({
	{ Key = "Claimed", Title = "Claimed / Total" },
	{ Key = "Reset", Title = "Set Resets In" },
})
-- Driven by the 1 s housekeeping loop, same as the Stats grid -- the tiles have no
-- clock of their own. Reads the save directly so it reflects the server's copy
-- rather than anything the hub thinks it claimed.
AreaFarm._refreshPlayTiles = function()
	local Library = AreaFarm.Library
	if not Library then return end
	local total, claimed, resetIn = 0, 0, nil
	pcall(function()
		-- counted with pairs, not #, because the game's FreeGifts directory is keyed
		-- by index but not guaranteed to stay a dense array
		for _ in pairs(Library.Directory.FreeGifts or {}) do total += 1 end
		local save = Library.Save.Get()
		if not save then return end
		local red = save.FreeGiftsRedeemed
		if type(red) == "table" then claimed = #red end
		local rt = tonumber(save.FreeGiftsResetTime)
		if rt then resetIn = rt - os.time() end
	end)
	PlayTiles.Claimed(string.format("%d / %d", claimed, total))
	if not resetIn then
		PlayTiles.Reset("—")
	elseif resetIn <= 0 then
		PlayTiles.Reset("ready")
	else
		PlayTiles.Reset(string.format("%dh %02dm", math.floor(resetIn / 3600), math.floor(resetIn % 3600 / 60)))
	end
end

-- Boosts tab: selector, quantity, live subtotal, buy/use
local boostByKey = {}
for _, b in ipairs(AreaFarm.BOOSTS) do boostByKey[b.key] = b end
local boostLabels, labelToBoost = {}, {}
for _, b in ipairs(AreaFarm.BOOSTS) do
	local label = string.format("%s — %s Diamonds (%s)", b.key, commas(b.price), b.duration)
	table.insert(boostLabels, label)
	labelToBoost[label] = b.key
end

local updateBoostDisplays
BoostsTab:Section("Buy & Use")
local BoostDropdown = BoostsTab:Dropdown({
	Title = "Boost",
	Values = boostLabels,
	Value = boostLabels[1],
	Callback = function(v)
		Config.BoostKey = labelToBoost[v] or AreaFarm.BOOSTS[1].key
		updateBoostDisplays()
	end,
})
local AmountSlider = BoostsTab:Slider({
	Title = "Amount",
	Desc = "How many to buy",
	Value = { Min = 1, Max = 100, Default = 1 },
	Step = 1,
	Callback = function(v)
		Config.BoostAmount = v
		updateBoostDisplays()
	end,
})
local BuyButton = BoostsTab:Button({
	Title = "Buy",
	Desc = "Purchase with diamonds",
	Icon = "shopping-cart",
	Callback = function()
		if State.BoostBusy then
			pushNotify("Cope Hub", "A boost purchase is already running", "clock")
			return
		end
		local b = boostByKey[Config.BoostKey] or AreaFarm.BOOSTS[1]
		local n = Config.BoostAmount or 1
		State.BoostBusy = true
		task.spawn(function()
			pcall(function() BuyButton:SetTitle(string.format("Buying 0/%d...", n)) end)
			local bought, err = AreaFarm._buyBoosts(b.key, n, function(done, total)
				pcall(function() BuyButton:SetTitle(string.format("Buying %d/%d...", done, total)) end)
			end)
			State.BoostBusy = false
			if err then
				pushNotify("Cope Hub", string.format("Bought %d/%d x %s — %s", bought, n, b.key, err), "triangle-alert")
			else
				pushNotify("Cope Hub", string.format("Bought %d x %s for %s Diamonds", bought, b.key, commas(bought * b.price)), "check")
			end
			updateBoostDisplays()
		end)
	end,
})
local UseAmountSlider = BoostsTab:Slider({
	Title = "Use Amount",
	Desc = "How many owned boosts to activate",
	Value = { Min = 1, Max = 100, Default = 1 },
	Step = 1,
	Callback = function(v)
		Config.BoostUseAmount = v
		updateBoostDisplays()
	end,
})
local UseButton = BoostsTab:Button({
	Title = "Use from Inventory",
	Desc = "Activate boosts you already own",
	Icon = "play",
	Callback = function()
		local b = boostByKey[Config.BoostKey] or AreaFarm.BOOSTS[1]
		local d = State.PendingData
		local owned = d and d.BoostInv and (d.BoostInv[b.key] or 0) or 0
		local n = math.min(Config.BoostUseAmount or 1, owned)
		if n <= 0 then
			pushNotify("Cope Hub", "You own 0 x " .. b.key, "triangle-alert")
			return
		end
		task.spawn(function()
			pcall(function() UseButton:SetTitle(string.format("Using 0/%d...", n)) end)
			AreaFarm._activateBoosts(b.key, n)
			pcall(function() UseButton:SetTitle(string.format("Using %d/%d...", n, n)) end)
			-- verify the server actually consumed them (Trading Plaza blocks activation)
			local consumed = false
			local Library = AreaFarm.Library
			if Library then
				for _ = 1, 16 do
					task.wait(0.25)
					pcall(function()
						local data = Library.Save.Get()
						local left = tonumber(data.BoostsInventory[b.key]) or 0
						if left <= owned - n then consumed = true end
					end)
					if consumed then break end
				end
			end
			if consumed then
				pushNotify("Cope Hub", string.format("Activated %d x %s (%s each)", n, b.key, b.duration), "check")
			else
				pushNotify("Cope Hub", "Activation had no effect — boosts can't be used in the Trading Plaza", "triangle-alert")
			end
			task.wait(0.5)
			updateBoostDisplays()
		end)
	end,
})

updateBoostDisplays = function()
	local b = boostByKey[Config.BoostKey] or AreaFarm.BOOSTS[1]
	local n = Config.BoostAmount or 1
	local total = b.price * n
	local d = State.PendingData
	pcall(function()
		AmountSlider:SetTitle(string.format("Amount — Subtotal: %s Diamonds", commas(total)))
		local bal = d and d.Diamonds
		local balTxt = ""
		if bal then
			if bal < total then
				balTxt = string.format(" | Balance: %s (short %s!)", commas(bal), commas(total - bal))
			else
				balTxt = string.format(" | Balance: %s -> %s", commas(bal), commas(bal - total))
			end
		end
		BuyButton:SetTitle(string.format("Buy %d x %s = %s Diamonds%s", n, b.key, commas(total), balTxt))
		local owned = d and d.BoostInv and (d.BoostInv[b.key] or 0) or 0
		local act = d and d.BoostsActive and d.BoostsActive[b.key]
		UseButton:SetTitle(string.format("Use %d x %s (owned: %d)", Config.BoostUseAmount or 1, b.key, owned))
		local status = act and ("Active: " .. timeStr(act)) or "Not active"
		if d and d.World == "Trading Plaza" then
			status = status .. " | Trading Plaza blocks boost use"
		end
		BoostDropdown:SetDesc(string.format("%s Diamonds, lasts %s — %s", commas(b.price), b.duration, status))
	end)
end
updateBoostDisplays()

-- Diamond packs are the free-to-play route to gems: they are paid for in farmable
-- currency (Coins / Tech Coins / Rainbow Coins), NOT Robux, so unlike the four
-- "P2W Diamonds" developer products they need no purchase prompt and can be bought
-- in a loop. Costs are re-read from the game's own ShopConfig on every call instead
-- of being copied in here -- the Medium pack quietly went from 6T to 3.5T Tech Coins
-- between two place versions, and a hardcoded table would have been wrong about it.
-- Note the game's own `displayCost` strings are stale/mismatched (pack 3 is labelled
-- "2.5T Tech Coins" but actually costs 250b Rainbow Coins), so labels are built from
-- the authoritative Currency + Cost fields rather than reused.
function AreaFarm._diamondPacks()
	local packs = {}
	pcall(function()
		local dir = game:GetService("ReplicatedStorage"):FindFirstChild("__DIRECTORY")
		local mod = dir and dir:FindFirstChild("ShopConfig")
		if not mod then return end
		local cfg = require(mod)
		local list = cfg and cfg.DiamondPacks
		if type(list) ~= "table" then return end
		for i = 1, #list do
			local p = list[i]
			if type(p) == "table" and p.Currency and tonumber(p.Cost) and tonumber(p.Diamonds) then
				packs[#packs + 1] = {
					index = i,
					currency = tostring(p.Currency),
					cost = tonumber(p.Cost),
					diamonds = tonumber(p.Diamonds),
				}
			end
		end
	end)
	return packs
end

function AreaFarm._dpLabel(p)
	return string.format("#%d  %s %s  ->  %s Diamonds", p.index, abbrev(p.cost), p.currency, abbrev(p.diamonds))
end

function AreaFarm._dpFind(index)
	for _, p in ipairs(AreaFarm._diamondPacks()) do
		if p.index == tonumber(index) then return p end
	end
	return nil
end

-- One purchase. The server owns the whole transaction and answers (ok, message),
-- so there is nothing to verify client-side beyond passing the pack index through.
function AreaFarm._buyDiamondPack(Library, index)
	local ok, a, b = pcall(function()
		return Library.Network.Invoke("Buy DiamondPack", tonumber(index))
	end)
	if not ok then return false, tostring(a) end
	if a == true then return true, nil end
	return false, tostring(b or "refused")
end

BoostsTab:Section("Diamond Packs (free, no Robux)")
local DPLabels, DPValueMap, DPSelected = {}, {}, nil
for _, p in ipairs(AreaFarm._diamondPacks()) do
	local label = AreaFarm._dpLabel(p)
	DPLabels[#DPLabels + 1] = label
	DPValueMap[label] = p
	if p.index == tonumber(Config.DiamondPackIndex) then DPSelected = label end
end
if #DPLabels == 0 then
	DPLabels = { "(shop config not loaded)" }
elseif not DPSelected then
	DPSelected = DPLabels[#DPLabels] -- best gems-per-currency of the four, as a sane default
	Config.DiamondPackIndex = DPValueMap[DPSelected] and DPValueMap[DPSelected].index or nil
end
local DPDropdown, DPToggle
DPDropdown = BoostsTab:Dropdown({
	Title = "Pack To Buy",
	Desc = "Paid in farmable currency, not Robux. Pick which one every buy below uses.",
	Values = DPLabels,
	Value = DPSelected or DPLabels[1],
	Callback = function(v)
		local p = DPValueMap[v]
		Config.DiamondPackIndex = p and p.index or nil
		State.DPBase = nil -- a different currency needs its own reserve baseline
	end,
})
BoostsTab:Button({
	Title = "Buy One Pack Now",
	Desc = "Single purchase of the pack above, ignoring the interval and the cap. Still respects nothing but your balance — use this to sanity-check the price before arming auto-buy.",
	Callback = function()
		task.spawn(function()
			local Library2 = AreaFarm.Library
			if not Library2 then
				pushNotify("Cope Hub", "Library not ready", "triangle-alert")
				return
			end
			local p = AreaFarm._dpFind(Config.DiamondPackIndex)
			if not p then
				pushNotify("Cope Hub", "Pick a diamond pack first", "triangle-alert")
				return
			end
			local ok, err = AreaFarm._buyDiamondPack(Library2, p.index)
			if ok then
				State.DPBought = (State.DPBought or 0) + 1
				State.DPGained = (State.DPGained or 0) + p.diamonds
				State.DPNote = "manual buy"
				pushNotify("Cope Hub", string.format("Bought pack #%d: +%s Diamonds", p.index, abbrev(p.diamonds)), "gem")
			else
				State.DPNote = tostring(err)
				pushNotify("Cope Hub", "Pack refused: " .. tostring(err), "triangle-alert")
			end
		end)
	end,
})
DPToggle = BoostsTab:Toggle({
	Title = "Auto Buy Diamond Packs",
	Desc = "Keeps buying the pack above on the interval below. Switches itself off once the purchase cap or the diamond target is met; if you simply cannot afford one it idles and waits for your balance to farm back up.",
	Value = Config.AutoDiamondPacks == true,
	Callback = function(v)
		Config.AutoDiamondPacks = v
		if v then
			-- fresh run: new baseline for the reserve, counters and cap reset
			State.DPBase, State.DPBought, State.DPGained = nil, 0, 0
			State.DPNextAt, State.DPNote = 0, "starting"
		end
	end,
})
AreaFarm._dpToggle = DPToggle
BoostsTab:Slider({
	Title = "Seconds Between Buys",
	Desc = "Spacing between purchases. Low values are fine — the server charges per call, there is no discount for hammering it.",
	Value = { Min = 1, Max = 60, Default = math.clamp(tonumber(Config.DiamondPackInterval) or 5, 1, 60) },
	Step = 1,
	Callback = function(v) Config.DiamondPackInterval = math.clamp(math.floor(tonumber(v) or 5), 1, 60) end,
})
BoostsTab:Slider({
	Title = "Max Buys Per Run",
	Desc = "Hard stop after this many purchases, counted from when you switched auto-buy on. Slide to 0 for unlimited — it then buys forever and only the currency floor, the diamond target or your own balance can stop it.",
	Value = { Min = 0, Max = 1000, Default = math.clamp(tonumber(Config.DiamondPackCap) or 0, 0, 1000) },
	Step = 1,
	Callback = function(v) Config.DiamondPackCap = math.clamp(math.floor(tonumber(v) or 0), 0, 1000) end,
})
BoostsTab:Slider({
	Title = "Keep % Of Currency",
	Desc = "Floor for the pack's own currency, as a percentage of what you held when auto-buy started. At 0 it spends down to the last coin; at 50 it stops once half your starting balance is gone.",
	Value = { Min = 0, Max = 90, Default = math.clamp(tonumber(Config.DiamondPackReservePct) or 0, 0, 90) },
	Step = 5,
	Callback = function(v) Config.DiamondPackReservePct = math.clamp(math.floor(tonumber(v) or 0), 0, 90) end,
})
BoostsTab:Slider({
	Title = "Stop At Diamonds",
	Desc = "Stops once your diamond count reaches this. Leave at 0 for no target.",
	Value = { Min = 0, Max = 500000000, Default = math.max(0, math.floor(tonumber(Config.DiamondPackTarget) or 0)) },
	Step = 5000000,
	Callback = function(v) Config.DiamondPackTarget = math.max(0, math.floor(tonumber(v) or 0)) end,
})
local DPTiles = BoostsTab:StatGrid({
	{ Key = "Next", Title = "Next Buy In" },
	{ Key = "Bal", Title = "Can Afford" },
	{ Key = "Bought", Title = "Bought / Cap" },
	{ Key = "Gained", Title = "Diamonds Gained" },
})
-- Fed by the 1 s housekeeping loop, like the other stat grids -- no clock of its own.
AreaFarm._refreshDPTiles = function()
	local p = AreaFarm._dpFind(Config.DiamondPackIndex)
	local cap = math.clamp(math.floor(tonumber(Config.DiamondPackCap) or 0), 0, 1000)
	DPTiles.Bought(string.format("%s / %s", commas(State.DPBought or 0), (cap > 0 and commas(cap) or "∞")))
	DPTiles.Gained(abbrev(State.DPGained or 0))
	if not p then
		DPTiles.Bal("no pack")
	else
		local bal = 0
		pcall(function()
			local save = AreaFarm.Library and AreaFarm.Library.Save.Get()
			bal = save and (tonumber(save[p.currency]) or 0) or 0
		end)
		DPTiles.Bal(string.format("%dx (%s %s)", math.floor(bal / math.max(1, p.cost)), abbrev(bal), p.currency))
	end
	if not Config.AutoDiamondPacks then
		DPTiles.Next(tostring(State.DPNote or "off"))
	elseif not p then
		DPTiles.Next("no pack")
	else
		local left = (State.DPNextAt or 0) - os.clock()
		if (State.DPNextAt or 0) <= 0 or left <= 0 then
			DPTiles.Next("now")
		else
			DPTiles.Next(string.format("%ds", math.ceil(left)))
		end
	end
end

BoostsTab:Section("Potion Keeper")
BoostsTab:Dropdown({
	Title = "Keep Stocked",
	Desc = "Never run out of these potions — auto-buys + auto-uses",
	Values = boostLabels,
	Value = (function()
		local out = {}
		for _, key in ipairs(Config.PotionKeepBoosts or {}) do
			for _, label in ipairs(boostLabels) do
				if labelToBoost[label] == key then table.insert(out, label) break end
			end
		end
		return (#out > 0 and out or { boostLabels[1] })
	end)(),
	Multi = true,
	Callback = function(v)
		local keys = {}
		for _, label in ipairs(type(v) == "table" and v or {}) do
			local k = labelToBoost[label]
			if k then table.insert(keys, k) end
		end
		Config.PotionKeepBoosts = keys
	end,
})
BoostsTab:Slider({
	Title = "Restock To",
	Desc = "Buys until you own this many of each selected potion",
	Value = { Min = 1, Max = 50, Default = tonumber(Config.PotionKeepStock) or 10 },
	Step = 1,
	Callback = function(v) Config.PotionKeepStock = v end,
})
BoostsTab:Toggle({
	Title = "Auto-Use When Expired",
	Desc = "Re-activates a potion from your stock the moment the old one runs out",
	Value = Config.PotionAutoUse ~= false,
	Callback = function(v) Config.PotionAutoUse = v end,
})
BoostsTab:Slider({
	Title = "Diamond Floor",
	Desc = "Potion Keeper stops buying if it would drop you below this",
	Value = { Min = 0, Max = 10000000, Default = tonumber(Config.PotionDiamondFloor) or 100000 },
	Step = 10000,
	Callback = function(v) Config.PotionDiamondFloor = v end,
})

-- ========================================================================
-- ENCHANT TAB — auto-enchant pets in waves until they roll a desired power
-- ========================================================================
EnchantTab:Section("Auto Enchant")
local EnchantToggle, EnchantStatusBtn
local EnchantDesiredDrop = EnchantTab:Dropdown({
	Title = "Desired Enchant(s)",
	Desc = "A pet is 'done' once it rolls ANY of these. Pick one or several.",
	Values = ENCHANT_TITLES,
	Multi = true,
	AllowNone = true,
	Value = Config.EnchantDesired or {},
	Callback = function(v)
		local sel = type(v) == "table" and v or (v ~= nil and { v } or {})
		Config.EnchantDesired = sel
	end,
})
EnchantToggle = EnchantTab:Toggle({
	Title = "Auto Enchant",
	Desc = "Enchants a batch of eligible pets over and over until each one has a desired enchant. WARNING: replaces any existing enchants and costs Diamonds per roll.",
	Value = Config.AutoEnchant == true,
	Callback = function(v)
		Config.AutoEnchant = v
		if v and #(Config.EnchantDesired or {}) == 0 then
			pushNotify("Cope Hub", "Pick a Desired Enchant first — enchant idles until you do", "triangle-alert")
		end
	end,
})
EnchantTab:Slider({
	Title = "Batch Size",
	Desc = "Pets enchanted per wave (fired concurrently in groups of 3)",
	Value = { Min = 1, Max = 30, Default = math.clamp(tonumber(Config.EnchantBatch) or 10, 1, 30) },
	Step = 1,
	Callback = function(v) Config.EnchantBatch = v end,
})
EnchantTab:Toggle({
	Title = "Skip Locked Pets",
	Desc = "Leaves your locked pets untouched (recommended — enchanting overwrites their powers)",
	Value = Config.EnchantSkipLocked ~= false,
	Callback = function(v) Config.EnchantSkipLocked = v end,
})
EnchantTab:Slider({
	Title = "Diamond Floor",
	Desc = "Stops enchanting before your Diamonds would drop below this (0 = no limit)",
	Value = { Min = 0, Max = 50000000, Default = tonumber(Config.EnchantDiamondFloor) or 0 },
	Step = 10000,
	Callback = function(v) Config.EnchantDiamondFloor = v end,
})
EnchantTab:Button({
	Title = "Enchant Now (one wave)",
	Desc = "Runs a single batch immediately, without turning Auto Enchant on",
	Icon = "sparkles",
	Callback = function()
		if #(Config.EnchantDesired or {}) == 0 then
			pushNotify("Cope Hub", "Pick a Desired Enchant first", "triangle-alert")
			return
		end
		if State.EnchantBusy then
			pushNotify("Cope Hub", "An enchant wave is already running", "clock")
			return
		end
		task.spawn(function()
			State.EnchantBusy = true
			local status, n, reached = "idle"
			pcall(function() status, n, reached = AreaFarm._enchantOnce(AreaFarm.Library) end)
			State.EnchantBusy = false
			if status == "ran" then
				pushNotify("Cope Hub", string.format("Enchanted %d pet(s), %d got a desired enchant", n or 0, reached or 0), "sparkles")
			else
				pushNotify("Cope Hub", "Enchant: " .. (State.EnchantNote or tostring(status)), "info")
			end
		end)
	end,
})
EnchantStatusBtn = EnchantTab:Button({
	Title = "What Is It Doing?",
	Desc = "Shows the auto-enchant worker's current status",
	Icon = "gauge",
	Callback = function()
		pushNotify("Cope Hub", "Enchant: " .. (State.EnchantNote or "idle"), "gauge")
	end,
})

AlertTab:Section("Discord Webhook")
AlertTab:Input({
	Title = "Webhook URL",
	Desc = "Discord webhook link (https://discord.com/api/webhooks/...)",
	Placeholder = "https://discord.com/api/webhooks/...",
	Callback = function(v) Config.WebhookURL = v end,
})
AlertTab:Toggle({
	Title = "Notify On Huge Hatch",
	Desc = "Posts an embed with pet, chance, image and username",
	Value = false,
	Callback = function(v) Config.WebhookEnabled = v end,
})
AlertTab:Section("Alerts & Journal")
AlertTab:Toggle({
	Title = "Kick Alert",
	Desc = "DMs you the moment this account gets kicked or disconnected (with session totals)",
	Value = Config.KickAlert ~= false,
	Callback = function(v) Config.KickAlert = v end,
})
AlertTab:Toggle({
	Title = "Trade Journal",
	Desc = "Logs every completed trade to Discord from the server's own trade history",
	Value = Config.TradeJournal == true,
	Callback = function(v)
		Config.TradeJournal = v
		if not v then State.TradeSeen = nil end
	end,
})
AlertTab:Button({
	Title = "Send Test Webhook",
	Desc = "Posts a sample Huge embed to check the URL",
	Icon = "send",
	Callback = function()
		task.spawn(function()
			local ok, err = AreaFarm._testWebhook()
			if ok then
				pushNotify("Cope Hub", "Test webhook sent", "check")
			else
				pushNotify("Cope Hub", "Webhook failed: " .. tostring(err), "triangle-alert")
			end
		end)
	end,
})

EggTab:Section("Teleport")
EggTab:Toggle({
	Title = "Teleport To Egg When Hatching",
	Desc = "Teleports you next to the selected egg ONCE when hatching starts (and after each world switch). You can walk away freely afterwards.",
	Value = Config.EggStay == true,
	Callback = function(v)
		Config.EggStay = v
		if not v then State.EggTpDone = nil end
	end,
})
EggTab:Button({
	Title = "Teleport To Selected Egg Now",
	Desc = "One-shot: stand on your current side of the egg chosen above, facing it",
	Callback = function()
		task.spawn(function()
			local ok, err = AreaFarm._teleportToEgg and AreaFarm._teleportToEgg()
			if ok then
				local key2 = AreaFarm.Config.EggKey
				AreaFarm.State.EggTpDone = key2 and (key2 .. "@manual") or nil
				pushNotify("Cope Hub", "Teleported to egg", "check")
			else
				pushNotify("Cope Hub", "Teleport failed: " .. tostring(err), "triangle-alert")
			end
		end)
	end,
})

EggTab:Section("Exclusive Egg")
local ExEggToggle = EggTab:Toggle({
	Title = "Auto Open Exclusive Egg",
	Desc = "Buys the exclusive egg (your selected egg, Diamonds) on a loop. Pauses while a Huge is queued for trade, resumes once it's traded.",
	Value = Config.AutoOpenExclusive == true,
	Callback = function(v)
		Config.AutoOpenExclusive = v
		if v then State.ExclusivePaused = false end
	end,
})
AreaFarm._exEggToggle = ExEggToggle
EggTab:Slider({
	Title = "Exclusive Egg Delay",
	Desc = "Seconds between exclusive egg buys (server enforces ~0.8s minimum)",
	Value = { Min = 0.8, Max = 5, Default = 1 },
	Step = 0.1,
	Callback = function(v) Config.ExclusiveOpenDelay = v end,
})
EggTab:Section("Huge Trading")
EggTab:Input({
	Title = "Trade Huges To (username)",
	Desc = "Must be in this server. They accept the invite + trade on their side.",
	Placeholder = "Username",
	Callback = function(v) Config.TradeTarget = v end,
})
local TradeToggle = EggTab:Toggle({
	Title = "Auto Trade Huges After Hatch",
	Desc = "Trades any hatched Huge to the user above and accepts. Egg opening resumes once it's gone.",
	Value = false,
	Callback = function(v) Config.AutoTradeHuges = v end,
})
AreaFarm._tradeToggle = TradeToggle

VariantTab:Section("Golden & Rainbow Machines")
local GoldenToggle = VariantTab:Toggle({
	Title = "Auto Make Golden (100%)",
	Desc = "Feeds exactly 6 identical plain pets into the Golden Machine — the guaranteed row, so nothing is ever gambled. 1,250 Diamonds per Golden.",
	Value = Config.AutoGolden == true,
	Callback = function(v)
		Config.AutoGolden = v
		if v then
			State.GoldenErrShown = false
			State.GoldenIdleNotified = false
		end
	end,
})
AreaFarm._goldenToggle = GoldenToggle
local RainbowToggle = VariantTab:Toggle({
	Title = "Auto Make Rainbow (100%)",
	Desc = "Feeds exactly 6 identical Golden pets into the Rainbow Machine — also the guaranteed row. 2,250 Diamonds per Rainbow. Run this with Auto Golden to chain plain pets all the way to Rainbow.",
	Value = Config.AutoRainbow == true,
	Callback = function(v)
		Config.AutoRainbow = v
		if v then
			State.RainbowErrShown = false
			State.RainbowIdleNotified = false
		end
	end,
})
AreaFarm._rainbowToggle = RainbowToggle
VariantTab:Input({
	Title = "Diamond Floor",
	Desc = "Both machines pause rather than spend below this many Diamonds. Blank/0 = spend freely. Press Enter to set.",
	Placeholder = "e.g. 1000000",
	Callback = function(v)
		local n = tonumber((tostring(v):gsub("[^%d%.]", "")))
		Config.MachineDiamondFloor = math.max(0, n or 0)
		State.MachineBrokeNotified = false
		pushNotify("Cope Hub", "Machine diamond floor set to " .. tostring(math.floor(Config.MachineDiamondFloor)), "check")
	end,
})
VariantTab:Button({
	Title = "Make One Golden Now",
	Desc = "One guaranteed 6-pet conversion. Runs even with the toggle off.",
	Callback = function()
		task.spawn(function()
			local Library2 = AreaFarm.Library
			if not Library2 then
				pushNotify("Cope Hub", "Library not ready", "triangle-alert")
				return
			end
			pcall(machineStep, Library2, "golden")
			pushNotify("Cope Hub", State.GoldenNote or "done", "sparkles")
		end)
	end,
})
VariantTab:Button({
	Title = "Make One Rainbow Now",
	Desc = "One guaranteed 6-Golden conversion. Runs even with the toggle off.",
	Callback = function()
		task.spawn(function()
			local Library2 = AreaFarm.Library
			if not Library2 then
				pushNotify("Cope Hub", "Library not ready", "triangle-alert")
				return
			end
			pcall(machineStep, Library2, "rainbow")
			pushNotify("Cope Hub", State.RainbowNote or "done", "sparkles")
		end)
	end,
})

VariantTab:Section("Dark Matter")
-- Reserved position for the rainbow-pet picker, which is rebuilt from your live
-- inventory and would otherwise drift to the bottom of the tab on every rescan.
local DMSlot = VariantTab:Slot()
local DMValueMap = {}
local DMDropdown = nil
VariantTab:Toggle({
	Title = "Auto Make Dark Matter",
	Desc = "Converts your Rainbow of the pet above one at a time (1:1 → each becomes its own Dark Matter pet): 7,500 Diamonds convert + 1,000,000 Diamonds skip per pet, instant claim.",
	Value = Config.AutoDarkMatter == true,
	Callback = function(v)
		Config.AutoDarkMatter = v
		if v then State.DMIdleNotified = false end
	end,
})
VariantTab:Toggle({
	Title = "Auto Skip Timer (Gems)",
	Desc = "Pays 1,000,000 Diamonds per slot to skip the timer and claim instantly. Off = let the timers run for free.",
	Value = Config.DMAutoSkip ~= false,
	Callback = function(v)
		Config.DMAutoSkip = v
		State.DMBrokeNotified = false
	end,
})
local DMFloorInput = VariantTab:Input({
	Title = "Keep Diamonds Above",
	Desc = "Stop spending on convert/skip once Diamonds would drop below this. Press Enter to set.",
	Placeholder = "e.g. 5000000",
	Callback = function(v)
		local n = tonumber((tostring(v):gsub("[^%d%.]", "")))
		Config.DMDiamondFloor = n or 0
		State.DMBrokeNotified = false
		pushNotify("Cope Hub", "Diamond floor set to " .. tostring(math.floor(Config.DMDiamondFloor)), "check")
	end,
})
pcall(function() DMFloorInput:SetText(tostring(math.floor(tonumber(Config.DMDiamondFloor) or 0))) end)
VariantTab:Button({
	Title = "Convert One Pet Now",
	Desc = "One pet: convert, skip timer with Diamonds, claim. Runs even with the toggle off.",
	Callback = function()
		if State.DMBusy then
			pushNotify("Cope Hub", "A DM batch is already running", "clock")
			return
		end
		task.spawn(function()
			local Library2 = AreaFarm.Library
			if not Library2 then
				pushNotify("Cope Hub", "Library not ready", "triangle-alert")
				return
			end
			State.DMBusy = true
			local wasAuto = Config.AutoDarkMatter
			Config.AutoDarkMatter = true
			pcall(AreaFarm._dmStep, Library2)
			Config.AutoDarkMatter = wasAuto
			State.DMBusy = false
		end)
	end,
})

GiftTab:Section("Gift Opener")
-- Reserved so the gift dropdown -- which is rebuilt from the game's gift list and
-- would otherwise re-append itself to the very bottom of the tab -- lands here,
-- directly under its own heading.
local GiftSlot = GiftTab:Slot()
local GiftValueMap = {}
local GiftDropdown = nil
local GiftToggle = GiftTab:Toggle({
	Title = "Auto Open Gifts (continuous)",
	Desc = "Bulk-opens every held copy of the gift picked above, as fast as the server allows, and keeps opening as more arrive. Stands down automatically while the timed batch opener below is on.",
	Value = Config.AutoOpenGifts == true,
	Callback = function(v)
		Config.AutoOpenGifts = v
		if v then State.GiftErrShown = false end
	end,
})
AreaFarm._giftToggle = GiftToggle
GiftTab:Button({
	Title = "Open Selected Gifts Now",
	Desc = "One-shot bulk open of every held copy of the gift chosen above. Runs even with both toggles off.",
	Callback = function()
		if State.GiftBusy then
			pushNotify("Cope Hub", "A gift open is already running", "clock")
			return
		end
		task.spawn(function()
			local Library2 = AreaFarm.Library
			if not Library2 then
				pushNotify("Cope Hub", "Library not ready", "triangle-alert")
				return
			end
			if not Config.GiftKey then
				pushNotify("Cope Hub", "Pick a gift type first", "triangle-alert")
				return
			end
			State.GiftBusy = true
			-- Arms the delete pipeline for this run only, instead of flipping the
			-- user's own Auto Open toggle behind their back like this used to.
			State.GiftDeleteArmed = true
			State.GiftTrashIds = buildGiftTrashIds(Library2, Config.GiftKey)
			pcall(AreaFarm._giftOpenStep, Library2)
			task.wait(0.3) -- keep the delete gate open long enough for late hatches
			State.GiftDeleteArmed = false
			State.GiftBusy = false
			pushNotify("Cope Hub", State.GiftNote or "done", "gift")
		end)
	end,
})

GiftTab:Section("Timed Batch Opener")
GiftTab:Toggle({
	Title = "Open A Batch On A Timer",
	Desc = "Releases a fixed number of the gift picked above every interval, instead of draining the whole pile at once. Takes over from the continuous opener while it is on.",
	Value = Config.GiftBatchEnabled == true,
	Callback = function(v)
		Config.GiftBatchEnabled = v
		if v then
			State.GiftErrShown = false
			-- clear the arming state so switching it on fires a batch immediately
			State.GiftBatchNextAt, State.GiftBatchLastAt, State.GiftBatchMinsUsed = 0, 0, 0
		end
	end,
})
GiftTab:Slider({
	Title = "Batch Interval (minutes)",
	Desc = "How long to wait between batches. Changing this re-times the countdown against the last batch straight away.",
	Value = { Min = 5, Max = 60, Default = math.clamp(tonumber(Config.GiftBatchMinutes) or 15, 5, 60) },
	Step = 1,
	Callback = function(v) Config.GiftBatchMinutes = math.clamp(math.floor(tonumber(v) or 15), 5, 60) end,
})
GiftTab:Slider({
	Title = "Gifts Per Batch",
	Desc = "How many gifts to open each time the timer fires. If you hold fewer than this, it opens what you have.",
	Value = { Min = 1, Max = 250, Default = math.max(1, math.floor(tonumber(Config.GiftBatchCount) or 25)) },
	Step = 1,
	Callback = function(v) Config.GiftBatchCount = math.max(1, math.floor(tonumber(v) or 25)) end,
})
local BatchTiles = GiftTab:StatGrid({
	{ Key = "Next", Title = "Next Batch In" },
	{ Key = "Held", Title = "Gifts Held" },
	{ Key = "Runs", Title = "Batches Run" },
	{ Key = "Last", Title = "Last Batch" },
})
-- Also fed by the 1 s housekeeping loop.
AreaFarm._refreshBatchTiles = function()
	local held = 0
	if AreaFarm.Library and Config.GiftKey then
		pcall(function() held = #collectGiftUids(AreaFarm.Library, Config.GiftKey) end)
	end
	BatchTiles.Held(commas(held))
	BatchTiles.Runs(commas(State.GiftBatchRuns or 0))
	BatchTiles.Last(tostring(State.GiftBatchNote or "off"))
	if not Config.GiftBatchEnabled then
		BatchTiles.Next("off")
	elseif not Config.GiftKey then
		BatchTiles.Next("no gift")
	else
		local left = (State.GiftBatchNextAt or 0) - os.clock()
		if (State.GiftBatchNextAt or 0) <= 0 or left <= 0 then
			BatchTiles.Next("now")
		else
			BatchTiles.Next(string.format("%d:%02d", math.floor(left / 60), math.floor(left % 60)))
		end
	end
end
GiftTab:Button({
	Title = "Open One Batch Now",
	Desc = "Fires a single batch of the size above immediately, without waiting for the timer, and resets the countdown.",
	Callback = function()
		if State.GiftBusy then
			pushNotify("Cope Hub", "A gift open is already running", "clock")
			return
		end
		task.spawn(function()
			local Library2 = AreaFarm.Library
			if not Library2 then
				pushNotify("Cope Hub", "Library not ready", "triangle-alert")
				return
			end
			if not Config.GiftKey then
				pushNotify("Cope Hub", "Pick a gift type first", "triangle-alert")
				return
			end
			State.GiftTrashIds = buildGiftTrashIds(Library2, Config.GiftKey)
			pcall(function() AreaFarm._giftBatchRun(Library2, Config.GiftBatchCount) end)
			-- push the timed countdown out so the worker does not immediately double up
			if Config.GiftBatchEnabled then
				State.GiftBatchNextAt = os.clock() + math.clamp(tonumber(Config.GiftBatchMinutes) or 15, 5, 60) * 60
			end
			pushNotify("Cope Hub", "Gift batch: " .. (State.GiftBatchNote or "ran"), "gift")
		end)
	end,
})

GiftTab:Section("Drop Cleanup")
GiftTab:Toggle({
	Title = "Delete Normal Exclusives",
	Desc = "Trashes plain (no-modifier) Exclusive pets that come out of the gift picked above. Nothing outside that gift's own drops is ever touched.",
	Value = Config.GiftDeleteNormal ~= false,
	Callback = function(v) Config.GiftDeleteNormal = v end,
})
GiftTab:Toggle({
	Title = "Delete Golden Exclusives",
	Desc = "Also trashes Golden-variant Exclusives from that gift. Off by default — Goldens are worth keeping.",
	Value = Config.GiftDeleteGolden == true,
	Callback = function(v) Config.GiftDeleteGolden = v end,
})
GiftTab:Toggle({
	Title = "Delete Rainbow Exclusives",
	Desc = "Also trashes Rainbow-variant Exclusives from that gift. Off by default — this is the rarest tier the cleanup can reach.",
	Value = Config.GiftDeleteRainbow == true,
	Callback = function(v) Config.GiftDeleteRainbow = v end,
})
GiftTab:Button({
	Title = "Never Deleted, Whatever The Toggles Say",
	Desc = "Dark Matter, Shiny, Locked, Huge and Titanic are excluded from gift cleanup unconditionally. Cleanup is also scoped to the selected gift's own Exclusive drops, so pets from anywhere else are safe.",
	Callback = function()
		pushNotify("Cope Hub", "DM / Shiny / Locked / Huge / Titanic are always kept", "shield")
	end,
})

IndexTab:Section("Collection Index")
-- Reserved position for the world multi-select, rebuilt whenever the reachable
-- world list changes.
local IndexWorldSlot = IndexTab:Slot()
local IndexToggle = IndexTab:Toggle({
	Title = "Auto Index Collection",
	Desc = "Walks every hatchable egg of the worlds you pick, cheapest first, teleports in front of it and hatches until that egg owes the Collection nothing — every pet, and Normal/Golden/Rainbow/Dark Matter for each. Takes over hatching from Auto Eggs and protects the pets it still needs from auto-delete.",
	Value = Config.AutoIndex == true,
	Callback = function(v)
		Config.AutoIndex = v
		State.IndexNote = v and "starting" or "off"
		State.IndexFullNotified = false
		State.IndexTargets, State.IndexTotal = nil, 0
		State.IndexKeepUids, State.IndexKeepAt = nil, 0
		State.IndexGoldenActive = false
		State.OctupleWarned = false
		if v then
			-- These two drive world travel themselves and would drag the
			-- character off the egg mid-hatch.
			if Config.AutoCompleteGame or Config.AutoWorldProgress then
				Config.AutoCompleteGame, Config.AutoWorldProgress = false, false
				pushNotify("Cope Hub", "Turned off Auto Complete Game / World Progress — they fight the index over world travel", "triangle-alert")
			end
			if #(Config.IndexWorlds or {}) == 0 then
				pushNotify("Cope Hub", "Pick at least one world in Index Worlds", "triangle-alert")
			end
		else
			State.IndexNeedIds = nil
			State.IndexGoldenActive = false
		end
	end,
})
AreaFarm._indexToggle = IndexToggle

IndexTab:Section("Index Tuning")
IndexTab:Dropdown({
	Title = "Hatch Amount",
	Desc = "How many eggs per buy while indexing. More pets per second, more coin burn. x8 needs the game's Buy-8 unlock; without it the index falls back to x3.",
	Values = { "x1", "x3", "x8" },
	Value = (Config.IndexHatchAmount == 8) and "x8" or ((Config.IndexHatchAmount == 1) and "x1" or "x3"),
	Callback = function(v)
		Config.IndexHatchAmount = (v == "x8") and 8 or ((v == "x1") and 1 or 3)
		State.OctupleWarned = false
	end,
})
IndexTab:Toggle({
	Title = "Use Machines",
	Desc = "Rainbow never drops from an egg and Golden only drops from a golden one, so the index makes them: 6 identical plain pets -> Golden, 6 Goldens -> Rainbow, always on the guaranteed row. Off means only Normal entries will ever complete.",
	Value = Config.IndexUseMachines ~= false,
	Callback = function(v) Config.IndexUseMachines = v end,
})
IndexTab:Toggle({
	Title = "Hatch Golden Eggs",
	Desc = "Once an egg owes no more Normal entries, switch to the golden egg beside it — every hatch comes out Golden, so the Rainbow machine gets fed in one step instead of six plain pets per Golden. Costs about 9x the coins per hatch and needs the golden egg to be standing in the world.",
	Value = Config.IndexGoldenEggs ~= false,
	Callback = function(v)
		Config.IndexGoldenEggs = v
		if not v then State.IndexGoldenActive = false end
	end,
})
IndexTab:Toggle({
	Title = "Skip Dark Matter Timer",
	Desc = "Pays 1,000,000 Diamonds to finish a Dark Matter conversion instantly instead of waiting out the machine. Off still works — the slot just redeems itself later once the timer expires.",
	Value = Config.IndexForceSkipDM ~= false,
	Callback = function(v) Config.IndexForceSkipDM = v end,
})
IndexTab:Input({
	Title = "Diamond Floor",
	Desc = "The index won't spend Diamonds below this balance (machines and timer skips both). Blank/0 = spend freely. Press Enter to set.",
	Placeholder = "e.g. 2000000",
	Callback = function(v)
		local n = tonumber((tostring(v):gsub("[^%d%.]", "")))
		Config.IndexDiamondFloor = math.max(0, n or 0)
		pushNotify("Cope Hub", "Index diamond floor set to " .. tostring(math.floor(Config.IndexDiamondFloor)), "check")
	end,
})
IndexTab:Input({
	Title = "Hatch Cap Per Egg",
	Desc = "Give up on an egg after this many hatches and move to the next one, retrying it next lap. Blank/0 = no cap. Press Enter to set.",
	Placeholder = "0 = unlimited",
	Callback = function(v)
		local n = tonumber((tostring(v):gsub("[^%d]", "")))
		Config.IndexEggCap = math.max(0, n or 0)
		pushNotify("Cope Hub", "Index hatch cap: " .. (Config.IndexEggCap == 0 and "unlimited" or tostring(Config.IndexEggCap)), "check")
	end,
})
IndexTab:Input({
	Title = "Patience Per Egg",
	Desc = "Move on after this many hatches with no new Collection entry. Guards against an egg whose last pet is a 1-in-a-million drop. Default 600. Press Enter to set.",
	Placeholder = "600",
	Callback = function(v)
		local n = tonumber((tostring(v):gsub("[^%d]", "")))
		Config.IndexEggPatience = math.max(0, n or 0)
		pushNotify("Cope Hub", "Index patience: " .. (Config.IndexEggPatience == 0 and "unlimited" or tostring(Config.IndexEggPatience) .. " hatches"), "check")
	end,
})
IndexTab:Slider({
	Title = "Hatch Delay",
	Desc = "Seconds between hatches. Below 1.2s the server starts answering \"you are doing this too quickly\".",
	Value = { Min = 1.2, Max = 4, Default = tonumber(Config.IndexHatchDelay) or 1.2 },
	Step = 0.1,
	Callback = function(v) Config.IndexHatchDelay = math.max(1.2, tonumber(v) or 1.2) end,
})
IndexTab:Button({
	Title = "Show Index Progress",
	Desc = "Progress for the worlds you selected — every variant of every pet their eggs can complete — plus your overall Collection total.",
	Callback = function()
		task.spawn(function()
			local Library = AreaFarm.Library
			if not Library then
				pushNotify("Cope Hub", "Library not ready", "triangle-alert")
				return
			end
			local targets = indexTargets(Library)
			local coll = indexCollection(Library)
			if not targets or not coll then
				pushNotify("Cope Hub", "Could not read the Collection", "triangle-alert")
				return
			end
			local have, total = 0, 0
			for k in pairs(targets) do
				total += 1
				if coll[k] then have += 1 end
			end
			-- World-scoped, per-variant breakdown for the current selection.
			local hardcore = indexIsHardcore(Library)
			local worldSet, worldNames = {}, {}
			for _, w in ipairs(Config.IndexWorlds or {}) do
				if type(w) == "string" then worldSet[w] = true table.insert(worldNames, w) end
			end
			local Areas = Library.Directory.Areas
			local VN = { "Normal", "Golden", "Rainbow", "DarkMatter" }
			local vHave, vTotal, seen = { 0, 0, 0, 0 }, { 0, 0, 0, 0 }, {}
			pcall(function()
				for id, dir in pairs(Library.Directory.Eggs) do
					if dir and dir.hatchable and not dir.disabled and not dir.isGolden and dir.area then
						local a = Areas[tostring(dir.area)]
						local w = a and tostring(a.world or "") or nil
						if w and worldSet[w] then
							for _, pid in ipairs(indexEggPets(Library, tostring(id), hardcore)) do
								for v = 1, 4 do
									local key = pid .. "-" .. v
									if targets[key] and not seen[key] then
										seen[key] = true
										vTotal[v] += 1
										if coll[key] then vHave[v] += 1 end
									end
								end
							end
						end
					end
				end
			end)
			local aTotal, aHave = 0, 0
			for v = 1, 4 do aTotal += vTotal[v] aHave += vHave[v] end
			if #worldNames == 0 then
				pushNotify("Cope Hub", string.format("No worlds selected. Collection overall: %d / %d (%d left)", have, total, total - have), "list-checks")
				return
			end
			local parts = {}
			for v = 1, 4 do
				if vTotal[v] > 0 then
					table.insert(parts, string.format("%s %d/%d", VN[v], vHave[v], vTotal[v]))
				end
			end
			local label = (#worldNames <= 3) and table.concat(worldNames, ", ")
				or (#worldNames .. " worlds")
			pushNotify("Cope Hub", string.format(
				"%s — %d/%d (%d left)\n%s\nCollection overall: %d/%d",
				label, aHave, aTotal, aTotal - aHave, table.concat(parts, "  "), have, total), "list-checks")
		end)
	end,
})

StatsTab:Section("Session Totals")
local StatTiles = StatsTab:StatGrid({
	{ Key = "Coins", Title = "Coins Collected" },
	{ Key = "Damage", Title = "Damage Dealt" },
	{ Key = "Eggs", Title = "Eggs Hatched" },
	{ Key = "Huges", Title = "Huges Hatched" },
	{ Key = "Orbs", Title = "Orbs Collected" },
	{ Key = "Bags", Title = "Bags Collected" },
	{ Key = "Deleted", Title = "Pets Deleted" },
	{ Key = "GiftsOpened", Title = "Gifts Opened" },
	{ Key = "ExEggsOpened", Title = "Exclusive Eggs" },
	{ Key = "IndexNew", Title = "New Index Entries" },
	{ Key = "GoldenMade", Title = "Goldens Made" },
	{ Key = "RainbowMade", Title = "Rainbows Made" },
	{ Key = "DMMade", Title = "Dark Matter Made" },
	{ Key = "EnchantDone", Title = "Enchants Applied" },
})
-- the 1 s housekeeping loop at the bottom of the file calls this; the grid has no
-- clock of its own
AreaFarm._refreshStatTiles = function()
	for k, set in pairs(StatTiles) do
		local n = Stats[k]
		if k == "Damage" then
			set(abbrev(n or 0))
		else
			set(commas(math.floor(tonumber(n) or 0)))
		end
	end
end

StatsTab:Section("Maintenance")
StatsTab:Button({
	Title = "Reset Stats",
	Icon = "rotate-ccw",
	Callback = function()
		for k in pairs(Stats) do Stats[k] = 0 end
		pushNotify("Cope Hub", "Stats reset", "check")
	end,
})
StatsTab:Button({
	Title = "Unload Hub",
	Icon = "log-out",
	Callback = function()
		task.spawn(function() AreaFarm._stop() end)
	end,
})

-- ========================================================================
-- PERFORMANCE TAB — FPS boosters
-- ========================================================================
local PerfUndo = { shadows = nil, mats = {}, decals = {}, fx = {}, postfx = {}, hideConn = nil }

local function inAnyCharacter(inst)
	local lp = Players.LocalPlayer
	local c = lp.Character
	if c and inst:IsDescendantOf(c) then return true end
	for _, plr in ipairs(Players:GetPlayers()) do
		local pc = plr.Character
		if pc and inst:IsDescendantOf(pc) then return true end
	end
	return false
end

local function eachDescendantChunked(fn)
	task.spawn(function()
		local list = workspace:GetDescendants()
		for i = 1, #list do
			pcall(fn, list[i])
			if i % 400 == 0 then task.wait() end
		end
	end)
end

AreaFarm._perfRestoreAll = function()
	pcall(function()
		if PerfUndo.shadows ~= nil then Lighting.GlobalShadows = PerfUndo.shadows end
		for inst, mat in pairs(PerfUndo.mats) do
			if inst.Parent then inst.Material = mat end
		end
		for inst, t in pairs(PerfUndo.decals) do
			if inst.Parent then inst.Transparency = t end
		end
		for inst, en in pairs(PerfUndo.fx) do
			if inst.Parent then inst.Enabled = en end
		end
		for inst, en in pairs(PerfUndo.postfx) do
			if inst.Parent then inst.Enabled = en end
		end
		table.clear(PerfUndo.mats)
		table.clear(PerfUndo.decals)
		table.clear(PerfUndo.fx)
		table.clear(PerfUndo.postfx)
		PerfUndo.shadows = nil
		if PerfUndo.hideConn then
			PerfUndo.hideConn:Disconnect()
			PerfUndo.hideConn = nil
		end
		for _, plr in ipairs(Players:GetPlayers()) do
			local c = plr.Character
			if c and plr ~= Players.LocalPlayer then
				for _, d in ipairs(c:GetDescendants()) do
					pcall(function()
						if d:IsA("BasePart") then d.LocalTransparencyModifier = 0 end
					end)
				end
			end
		end
	end)
end

local function applyShadows(on)
	task.spawn(function()
		if on then
			if PerfUndo.shadows == nil then PerfUndo.shadows = Lighting.GlobalShadows end
			Lighting.GlobalShadows = false
		elseif PerfUndo.shadows ~= nil then
			Lighting.GlobalShadows = PerfUndo.shadows
			PerfUndo.shadows = nil
		end
	end)
end

local function applyTextures(on)
	task.spawn(function()
		if not on then
			for inst, mat in pairs(PerfUndo.mats) do
				pcall(function() if inst.Parent then inst.Material = mat end end)
			end
			for inst, t in pairs(PerfUndo.decals) do
				pcall(function() if inst.Parent then inst.Transparency = t end end)
			end
			table.clear(PerfUndo.mats)
			table.clear(PerfUndo.decals)
			return
		end
		eachDescendantChunked(function(d)
			if inAnyCharacter(d) then return end
			if d:IsA("BasePart") and d.Material ~= Enum.Material.SmoothPlastic and PerfUndo.mats[d] == nil then
				PerfUndo.mats[d] = d.Material
				d.Material = Enum.Material.SmoothPlastic
			elseif (d:IsA("Decal") or d:IsA("Texture")) and PerfUndo.decals[d] == nil then
				PerfUndo.decals[d] = d.Transparency
				d.Transparency = 1
			end
		end)
	end)
end

local function applyParticles(on)
	task.spawn(function()
		if not on then
			for inst, en in pairs(PerfUndo.fx) do
				pcall(function() if inst.Parent then inst.Enabled = en end end)
			end
			table.clear(PerfUndo.fx)
			return
		end
		eachDescendantChunked(function(d)
			if (d:IsA("ParticleEmitter") or d:IsA("Beam") or d:IsA("Trail")
				or d:IsA("Fire") or d:IsA("Smoke") or d:IsA("Sparkles"))
				and PerfUndo.fx[d] == nil then
				PerfUndo.fx[d] = d.Enabled
				d.Enabled = false
			end
		end)
	end)
end

-- Post-processing kill: the game runs Bloom + ColorCorrection (and sometimes
-- SunRays / DoF) full-screen every frame. Disabling them is a cheap, fully
-- reversible GPU win. The hub's own blur (CopeHubBlur) is left alone so the
-- Background Blur toggle stays in charge of it. Backed up in its own table so
-- toggling off never disturbs the particle backup that shares PerfUndo.
local function applyPostFX(on)
	task.spawn(function()
		if on then
			for _, d in ipairs(Lighting:GetDescendants()) do
				if (d:IsA("BloomEffect") or d:IsA("SunRaysEffect")
					or d:IsA("ColorCorrectionEffect") or d:IsA("DepthOfFieldEffect")
					or d:IsA("BlurEffect"))
					and d.Name ~= "CopeHubBlur" and PerfUndo.postfx[d] == nil then
					PerfUndo.postfx[d] = d.Enabled
					pcall(function() d.Enabled = false end)
				end
			end
		else
			for inst, en in pairs(PerfUndo.postfx) do
				pcall(function() if inst.Parent then inst.Enabled = en end end)
			end
			table.clear(PerfUndo.postfx)
		end
	end)
end

local function applyHidePlayers(on)
	task.spawn(function()
		if not on then
			if PerfUndo.hideConn then
				PerfUndo.hideConn:Disconnect()
				PerfUndo.hideConn = nil
			end
			for _, plr in ipairs(Players:GetPlayers()) do
				local c = plr.Character
				if c and plr ~= Players.LocalPlayer then
					for _, d in ipairs(c:GetDescendants()) do
						pcall(function()
							if d:IsA("BasePart") then d.LocalTransparencyModifier = 0 end
						end)
					end
				end
			end
			return
		end
		if PerfUndo.hideConn then return end
		PerfUndo.hideConn = RunService.RenderStepped:Connect(function()
			for _, plr in ipairs(Players:GetPlayers()) do
				local c = plr.Character
				if c and plr ~= Players.LocalPlayer then
					for _, d in ipairs(c:GetDescendants()) do
						if d:IsA("BasePart") then d.LocalTransparencyModifier = 1 end
					end
				end
			end
		end)
	end)
end

-- Hide world objects locally: orbs, lootbags and breakables. Breakables keep
-- their billboard HUD (the health bar lives on the coin's POS part as a
-- BillboardGui named HUD). Original transparency/enabled values are remembered
-- per object in a weak table so toggling off restores exactly, and each
-- instance is marked with an attribute so the sweeper touches it once.
local visRecords = setmetatable({}, { __mode = "k" })
AreaFarm._visRecords = visRecords

local function visApply(inst, hide, keepBillboards)
	for _, d in ipairs(inst:GetDescendants()) do
		local isPart = d:IsA("BasePart") or d:IsA("Decal") or d:IsA("Texture")
		local isFx = d:IsA("ParticleEmitter") or d:IsA("Beam") or d:IsA("Trail")
			or d:IsA("Fire") or d:IsA("Smoke") or d:IsA("Sparkles")
		local isGui = d:IsA("BillboardGui") or d:IsA("SurfaceGui")
		if isGui and keepBillboards then continue end
		if isPart or isFx or isGui then
			if hide then
				if visRecords[d] == nil then
					visRecords[d] = isPart and d.Transparency or d.Enabled
				end
				if isPart then
					d.Transparency = 1
				else
					d.Enabled = false
				end
			else
				local orig = visRecords[d]
				if orig ~= nil then
					if isPart then d.Transparency = orig else d.Enabled = orig end
					visRecords[d] = nil
				end
			end
		end
	end
	inst:SetAttribute("CopeVisHidden", hide and true or nil)
end

-- Sweeper: ChildAdded hides new spawns the instant they appear (orbs live
-- less than a second in busy servers — a poll alone loses the race), and a
-- 1s backstop poll catches anything the connections miss plus restores on
-- toggle-off. Runs from Config alone — the UI toggles only flip the flag.
AreaFarm._visDebug = { passes = 0, orbProc = 0, orbErr = "none" }
task.spawn(function()
	local T = workspace:WaitForChild("__THINGS", 180)
	if not T then return end
	local sets = {
		{ name = "Orbs", key = "HideOrbs", keepBB = false },
		{ name = "Lootbags", key = "HideLootbags", keepBB = false },
		{ name = "Coins", key = "HideBreakables", keepBB = true },
	}
	local bound = {}
	while AreaFarm.Gen == myGen do
		for _, s in ipairs(sets) do
			local cont = T:FindFirstChild(s.name)
			if cont then
				-- (re)bind the fast path if the folder is new or changed
				if bound[s.name] ~= cont then
					bound[s.name] = cont
					if bound[s.name .. ":conn"] then
						pcall(function() bound[s.name .. ":conn"]:Disconnect() end)
					end
					bound[s.name .. ":conn"] = cont.ChildAdded:Connect(function(inst)
						task.defer(function()
							if AreaFarm.Gen ~= myGen then return end
							if Config[s.key] == true then
								pcall(visApply, inst, true, s.keepBB)
							end
						end)
					end)
				end
				local hide = Config[s.key] == true
				for _, inst in ipairs(cont:GetChildren()) do
					local marked = inst:GetAttribute("CopeVisHidden") == true
					if hide ~= marked then
						local ok, err = pcall(visApply, inst, hide, s.keepBB)
						if s.name == "Orbs" and not ok then
							AreaFarm._visDebug.orbErr = tostring(err)
						end
					end
				end
				if s.name == "Orbs" then AreaFarm._visDebug.passes += 1 end
			end
		end
		task.wait(1)
	end
	for k, v in pairs(bound) do
		if k:sub(-5) == ":conn" and v then pcall(function() v:Disconnect() end) end
	end
end)

-- Break-effect killer: the coin death routine (PlayerScripts Scripts.Game.Coins
-- -> CoinDamageAnimation / PetDamageAnimation) clones a full particle set and
-- up to ~55 physics chunk models per break, plus an emitter on every hit —
-- the main source of break-time lag. Swapping the client-side asset templates
-- for inert stand-ins stops the game from ever building them at zero ongoing
-- cost. Originals are parked parented-to-nil so toggling off restores exactly.
--
-- Two rules here, both learned from the overnight crashes this caused:
--
--  1. A stand-in MUST keep the original's base class. CoinDamageAnimation does
--     Assets.Models["Coin Particle"]:Clone() and then writes .CFrame, .Velocity
--     and .RotVelocity straight onto the clone. A Model has none of those, so a
--     Model stand-in threw on every single coin break -- 68,298 errors in one
--     8-hour log -- and because `coroutine.wrap(...)()` re-raises into its
--     caller, that throw also skipped the AddDebris(host, 5) two lines below it.
--     Every break then orphaned one invisible "host" Part, plus its Attachment
--     and BindableEvent, in workspace.__DEBRIS permanently: measured at +20,000
--     instances and +1.6 GB of BaseParts per hour. Five clients on a 16 GB
--     machine, all dead by morning. An anchored 0.001-stud invisible Part keeps
--     every one of those property writes legal and still draws and simulates
--     nothing.
--  2. The backup has to survive a live-reload. A plain `local bfxBackup` is nil
--     again after every reload, so the second apply stashed the *stand-in* as if
--     it were the original and the real asset was gone until the next rejoin.
--     The backup therefore lives in getgenv(), keyed to this DataModel so a
--     rejoin starts clean, and every stand-in is tagged so one can never be
--     mistaken for something worth saving.
local BFX_TAG = "CopeInertStandIn"
local bfxStore = getgenv().__cope_bfx_backup
if type(bfxStore) ~= "table" or bfxStore.dm ~= game then
	bfxStore = { dm = game, items = {} }
	getgenv().__cope_bfx_backup = bfxStore
end
local bfxItems = bfxStore.items
local function bfxContainer(Assets, name)
	return name == "Coin Particle" and Assets.Models or Assets.Particles
end
-- Is this instance plausibly the game's real asset, or is it wreckage from the
-- build that caused the crashes? Untagged stand-ins exist in the wild: any
-- client still running the old code has an empty Model sitting where the real
-- Coin Particle belongs, and restoring THAT on toggle-off would put the leak
-- straight back. So an object has to look right before it is worth keeping.
local function bfxSane(name, inst)
	local ok, sane = pcall(function()
		if name == "Coin Particle" then
			-- CoinDamageAnimation writes .CFrame, .Velocity and .RotVelocity onto
			-- its clone, so only a BasePart can possibly be the original.
			return inst:IsA("BasePart")
		end
		-- The old particle stand-ins were childless Folders; the real assets are
		-- emitters, or containers with something inside them.
		if inst:IsA("ParticleEmitter") then return true end
		return #inst:GetChildren() > 0
	end)
	return ok and sane == true
end
-- Originals are parked parented-to-nil, so a copy orphaned by an earlier reload
-- is still sitting in memory and can be adopted back into the backup slot. This
-- is what lets a client that has been running the broken build all night get its
-- real Coin Particle back without rejoining.
local function bfxRecover(name)
	local ok, list = pcall(getnilinstances)
	if not ok or type(list) ~= "table" then return nil end
	for _, inst in ipairs(list) do
		local good = false
		pcall(function()
			good = typeof(inst) == "Instance" and inst.Name == name
				and inst:GetAttribute(BFX_TAG) == nil and bfxSane(name, inst)
		end)
		if good then return inst end
	end
	return nil
end
AreaFarm._bfxRestore = function()
	if not next(bfxItems) then return end
	local Assets = AreaFarm.Library and AreaFarm.Library.Assets
	if Assets then
		for name, orig in pairs(bfxItems) do
			if orig and orig.Parent == nil and bfxSane(name, orig) then
				local cont = bfxContainer(Assets, name)
				local cur = cont:FindFirstChild(name)
				if cur and cur:GetAttribute(BFX_TAG) then cur:Destroy() end
				orig.Parent = cont
			end
		end
	end
	table.clear(bfxItems)
end
AreaFarm._applyBreakFx = function(on)
	task.spawn(function()
		while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
		if AreaFarm.Gen ~= myGen then return end
		local Assets = AreaFarm.Library and AreaFarm.Library.Assets
		if not Assets then return end
		if not on then
			AreaFarm._bfxRestore()
			return
		end
		local function stash(container, name)
			if bfxItems[name] then return end -- already swapped this session
			local cur = container:FindFirstChild(name)
			if not cur or cur:GetAttribute(BFX_TAG) then return end -- ours already
			if bfxSane(name, cur) then
				bfxItems[name] = cur
				cur.Parent = nil
			else
				-- Wrong class and not tagged: a stand-in from the build that broke
				-- this. Keeping it would mean restoring the bug on toggle-off, so
				-- it is binned and the real asset adopted back if it is findable.
				local real = bfxRecover(name)
				if real then bfxItems[name] = real end
				cur:Destroy()
			end
			local inert
			if name == "Coin Particle" then
				-- Must stay a BasePart -- see rule 1 above. Anchored so the game's
				-- .Velocity / .RotVelocity writes are accepted but never simulated.
				inert = Instance.new("Part")
				inert.Anchored = true
				inert.CanCollide = false
				inert.CanQuery = false
				inert.CanTouch = false
				inert.CastShadow = false
				inert.Transparency = 1
				inert.Size = Vector3.new(0.001, 0.001, 0.001)
			elseif name == "Pet Damage" then
				inert = Instance.new("ParticleEmitter")
				inert.Transparency = NumberSequence.new(1)
				inert.Size = NumberSequence.new(0)
				inert.Lifetime = NumberRange.new(0, 0)
			else
				inert = Instance.new("Folder")
			end
			inert.Name = name
			inert:SetAttribute(BFX_TAG, true)
			inert.Parent = container
		end
		for _, n in ipairs({ "Coin Explode", "Coin Damage", "Pet Damage" }) do
			stash(Assets.Particles, n)
		end
		stash(Assets.Models, "Coin Particle")
	end)
end
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	if AreaFarm.Gen ~= myGen then return end
	AreaFarm._applyBreakFx(Config.HideBreakFx == true)
end)

-- ========================================================================
-- OVERNIGHT STABILITY
-- Four separate leaks were killing 8-hour runs. Each one is handled below.
--
-- And one thing that was not a leak at all: this hub's own habit of rejoining.
-- Anti-AFK teleported on Idled, the Memory Guard teleported at the ceiling, and
-- the disconnect watchdog teleported on a kick. A teleport holds two copies of
-- the place at once, so it is the most expensive thing a client ever does, and
-- because every tab was launched together they all hit Idled within the same
-- minute -- five simultaneous teleports every ~20 minutes, all night, on a
-- machine with no commit left. That is why the tabs were found dead in the
-- morning rather than merely slow. Every automatic teleport is now refused by
-- default (Config.NoRejoin) and memory pressure is answered in place instead.
-- ========================================================================

-- 1. LEAK GUARD  (this is the one that was actually crashing the tabs)
-- ReplicatedStorage.Library.Functions.AddDebris is the game's own scheduler for
-- "destroy this in n seconds", and every effect in the game routes through it.
-- It keeps a LeftistHeap of due times plus a plain table of buckets keyed by due
-- time. Its Stepped handler pops the heap, reads the bucket, destroys everything
-- in it -- and then never clears the bucket. So the table keeps one array of
-- Instance references per distinct due time, for the whole session, and nothing
-- in it is ever released. Destroy() does not help: the instance is gone from the
-- DataModel but its reference is still held, so the engine cannot reclaim it.
--
-- Measured on one client after 30 minutes of grinding:
--   76,240 stale buckets holding 877,702 destroyed Instances
--   getnilinstances() = 760,584   (game:GetDescendants() = 93,997)
--   481,817 Part, 178,943 Sound, 17,316 Decal -- none of them reachable
--   total memory +4,402 MB/h, of which BaseParts alone was +2,271 MB/h
-- Purging the stale buckets released all 877,702 at once and dropped the client
-- from 3,406 MB to 3,238 MB inside ten seconds. Eight hours of that growth is
-- what fills a 16 GB machine and takes every tab down at once.
--
-- Left to run for a few hours it does not stay at 877,702. Measured across five
-- tabs on one server before the guard existed:
--   Haivialt4      27,448 buckets     340,189 held      2,174 MB
--   Haivialt6     123,823 buckets   1,421,876 held      4,750 MB
--   Haivialt5     122,750 buckets   1,593,345 held      5,199 MB
--   haivialt1     344,611 buckets   3,814,445 held     10,630 MB
--   PR3TTIEZALT   403,663 buckets   4,343,103 held     12,323 MB
-- 27.6 GB of private commit on a 15.1 GB machine, 22.5 GB of it paged out to
-- disk, individual frames taking 25 to 56 seconds. With the guard on, the same
-- tabs sat at 1,438 and 1,563 MB with zero buckets held and 35-40 FPS.
--
-- Two halves to the fix. AddDebris is replaced with a version that schedules
-- through task.delay and holds nothing afterwards, which stops new references
-- accruing. That alone is not enough, because any module that cached the
-- original function into a local at load time still calls the leaky one, so the
-- original's bucket table is also purged on a timer. Only buckets whose due time
-- has already passed are removed -- the Stepped handler runs every frame, so a
-- bucket older than the safety margin has certainly been processed, and dropping
-- one that had not would leave its contents undestroyed instead.
AreaFarm.LeakMargin = 3
if type(getgenv().__cope_leak_state) ~= "table" or getgenv().__cope_leak_state.dm ~= game then
	getgenv().__cope_leak_state = { dm = game, orig = nil, patched = nil, released = 0 }
end
AreaFarm._leakStore = getgenv().__cope_leak_state
AreaFarm._leakBuckets = function()
	-- Read the live bucket table and clock straight off the original closure's
	-- upvalues. Real's debug.getupvalue returns the value only, not a name pair.
	local fn = AreaFarm._leakStore.orig
	if type(fn) ~= "function" then return nil, nil end
	local okC, clock = pcall(debug.getupvalue, fn, 1)
	local okB, buckets = pcall(debug.getupvalue, fn, 2)
	if not okC or not okB or type(buckets) ~= "table" or type(clock) ~= "number" then
		return nil, nil
	end
	return buckets, clock
end
AreaFarm._leakInstall = function()
	local store = AreaFarm._leakStore
	local Library = AreaFarm.Library
	if not Library or type(Library.Functions) ~= "table" then return false end
	if not store.orig then
		local orig = Library.Functions.AddDebris
		if type(orig) ~= "function" or orig == store.patched then return false end
		-- Only wrap the real thing. If the upvalues are not where they should be
		-- the game has been changed and guessing would be worse than doing nothing.
		store.orig = orig
		if not AreaFarm._leakBuckets() then
			store.orig = nil
			return false
		end
	end
	if not store.patched then
		store.patched = function(inst, secs)
			if typeof(inst) ~= "Instance" then return end
			local t = tonumber(secs)
			if t == nil or t ~= t then t = 0 end
			if t == math.huge then return end -- the original ignores these too
			if t <= 0 then
				task.defer(function() pcall(function() inst:Destroy() end) end)
			else
				-- Deliberately task.delay and not Debris:AddItem -- Debris.MaxItems
				-- reads 1000 on this client and this path can queue far more.
				task.delay(t, function() pcall(function() inst:Destroy() end) end)
			end
		end
	end
	if Library.Functions.AddDebris ~= store.patched then
		Library.Functions.AddDebris = store.patched
	end
	return true
end
AreaFarm._leakRestore = function()
	local store = AreaFarm._leakStore
	local Library = AreaFarm.Library
	if Library and type(Library.Functions) == "table" and store.orig
		and Library.Functions.AddDebris == store.patched then
		Library.Functions.AddDebris = store.orig
	end
end
AreaFarm._leakArmed = function()
	local armed = false
	pcall(function()
		local store = AreaFarm._leakStore
		armed = store.orig ~= nil and AreaFarm.Library.Functions.AddDebris == store.patched
	end)
	return armed
end
AreaFarm._leakPurge = function()
	local buckets, clock = AreaFarm._leakBuckets()
	if not buckets then return 0, 0, false end
	local cutoff = clock - AreaFarm.LeakMargin
	local stale, held, live = {}, 0, 0
	-- No yielding inside pairs(): the game's own handler inserts into this table
	-- every frame, and a rehash across a yield can invalidate the iterator.
	for k, v in pairs(buckets) do
		if type(k) == "number" and k < cutoff then
			stale[#stale + 1] = k
		else
			live += 1
		end
	end
	-- Dropping the last reference to a large batch at once is not free: the first
	-- pass on a client that had been grinding for hours found 123,823 buckets
	-- holding 1,421,876 instances, and releasing them in 20,000-key chunks froze
	-- the client for 56 seconds while the engine reclaimed them. So the work is
	-- budgeted -- a few hundred keys per frame, a couple of thousand per pass --
	-- and the worker comes straight back for another pass while a backlog lasts
	-- instead of waiting out the full interval. Steady state is ~250 buckets, so
	-- this only ever matters on the pass right after the guard is installed.
	local budget = math.min(#stale, 2000)
	for i = 1, budget do
		local v = buckets[stale[i]]
		if type(v) == "table" then held += #v end
		buckets[stale[i]] = nil
		if i % 200 == 0 then task.wait() end
	end
	AreaFarm._leakStore.released += held
	State.LeakReleased = AreaFarm._leakStore.released
	State.LeakBacklog = #stale - budget
	State.LeakBuckets = live + State.LeakBacklog
	State.LeakLastPass = held
	return budget, held, budget < #stale
end
AreaFarm._leakPurgeSecs = function()
	return math.clamp(math.floor(tonumber(Config.LeakPurgeSecs) or 30), 10, 300)
end
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	if AreaFarm.Gen ~= myGen then return end
	while AreaFarm.Gen == myGen do
		local backlog = false
		if Config.LeakGuard ~= false then
			-- Re-asserted every pass rather than once: the toggle can be turned
			-- back on, and this also survives anything else reassigning the field.
			pcall(AreaFarm._leakInstall)
			local ok, _, _, more = pcall(AreaFarm._leakPurge)
			backlog = ok and more == true
		else
			pcall(AreaFarm._leakRestore)
			State.LeakBacklog = nil
		end
		State.LeakArmed = AreaFarm._leakArmed()
		-- One second between passes while draining a backlog, otherwise sleep the
		-- configured interval. A fresh client never takes this branch.
		local wake = backlog and 1 or AreaFarm._leakPurgeSecs()
		for _ = 1, wake do
			if AreaFarm.Gen ~= myGen then return end
			task.wait(1)
		end
	end
end)

-- 2. DEBRIS JANITOR
-- Every particle effect in this game parks an invisible "host" Part in
-- workspace.__DEBRIS (Library.Functions.CreateParticleHost) and then relies on
-- its own animation reaching an AddDebris(host, n) line to clean it up. Any
-- animation that errors before that line leaks the host, its Attachment and its
-- BindableEvent permanently. Measured on one client: +4.5 hosts a second,
-- +20,473 instances an hour, +1,586 MB of BaseParts an hour.
--
-- The stand-in class fix above removes the one animation I know was throwing,
-- but an unattended overnight run cannot rest on the assumption that no other
-- effect in the game ever errors, so the folder is swept regardless of who
-- filled it. The game's own longest host lifetime is 5 s, so the 6 s floor here
-- can never race a live effect. Only children literally named "host" are
-- touched: __MAPDEBRIS is a folder the map owns and must be left alone.
AreaFarm._sweepSecs = function()
	return math.clamp(math.floor(tonumber(Config.DebrisSweepSecs) or 20), 6, 120)
end
task.spawn(function()
	local Debris = game:GetService("Debris")
	local folder, waited = workspace:FindFirstChild("__DEBRIS"), 0
	while not folder and AreaFarm.Gen == myGen and waited < 180 do
		task.wait(0.5)
		waited += 0.5
		folder = workspace:FindFirstChild("__DEBRIS")
	end
	if not folder or AreaFarm.Gen ~= myGen then return end
	State.DebrisFolder = folder
	-- Debris is engine-side, so this costs no Lua thread per host, and calling
	-- AddItem again on something the game already scheduled is a harmless no-op.
	local function sweep(child)
		if child.Name ~= "host" or Config.DebrisSweep == false then return end
		State.DebrisSwept = (State.DebrisSwept or 0) + 1
		pcall(function() Debris:AddItem(child, AreaFarm._sweepSecs()) end)
	end
	for _, child in ipairs(folder:GetChildren()) do sweep(child) end
	State.DebrisConn = folder.ChildAdded:Connect(function(child)
		if AreaFarm.Gen ~= myGen then
			if State.DebrisConn then State.DebrisConn:Disconnect() end
			return
		end
		sweep(child)
	end)
end)
-- 3. IDLE-TRACKER SILENCER
-- This one is a bug in the game, not in the hub. PlayerScripts."Idle Tracking"
-- counts idle seconds on Heartbeat, and at 1185 s it compares a boolean against
-- that number. From that frame on it throws every single frame, forever: one
-- 7.9-hour log held 1,108,502 copies of
--   Idle Tracking:33: attempt to compare boolean <= number
-- plus 3.3M stack-trace lines -- a 368 MB log file per client per night, each
-- error allocating a fresh string and traceback.
--
-- The counter cannot be reset from here. It only clears on real
-- UserInputService input, and VirtualUser needs the LocalUser capability that
-- Real cannot grant at any thread identity (checked: identity 2 still refuses
-- CaptureController), which is also why the Anti-AFK toggle below could never
-- have worked. Disabling the connection is the only lever, and it costs
-- nothing: the script's only two jobs are showing an idle-timer GUI to a
-- hardcoded allow-list that nobody is on, and firing "Move Server" to shunt you
-- to a different server for being idle -- which is the opposite of what an
-- overnight farm wants.
--
-- The connection's .Enabled is read-only through Real: writing false to it
-- silently does nothing and reads back true. :Disable() is the one that works.
AreaFarm._killIdleTracker = function()
	local killed = 0
	pcall(function()
		for _, c in ipairs(getconnections(game:GetService("RunService").Heartbeat)) do
			local fn = c.Function
			if fn then
				local src = select(1, debug.info(fn, "s"))
				if type(src) == "string" and string.find(src, "Idle Tracking", 1, true) and c.Enabled then
					pcall(function() c:Disable() end)
					if c.Enabled == false then killed += 1 end
				end
			end
		end
	end)
	State.IdleKilled = (State.IdleKilled or 0) + killed
	return killed
end
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	-- The script connects during load, so retry rather than race it.
	for _ = 1, 40 do
		if AreaFarm.Gen ~= myGen then return end
		if Config.KillIdleTracker ~= false and AreaFarm._killIdleTracker() > 0 then return end
		task.wait(2)
	end
end)
-- 4. MEMORY GUARD
-- Even with all three leaks above sealed, a Roblox client that has been hatching
-- for eight hours does not give memory back, and five of them on a 16 GB machine
-- is the actual reason every tab dies at once rather than one at a time. So there
-- is a ceiling, and hitting it costs a 10-second rejoin instead of the whole
-- night's progress.
--
-- Stats:GetTotalMemoryUsageMb() is not usable as a trigger -- consecutive reads
-- gave 433, 1103, 1221 and 545 MB across one quiet window, because it reports
-- mid-GC. Summing the per-tag figures is stable and monotonic, and it matched
-- the process's private working set to within 5 MB (2,243 vs 2,248), so that is
-- what gets watched.
AreaFarm._memoryMb = function()
	local Stats = game:GetService("Stats")
	local sum = 0
	for _, tag in ipairs(Enum.DeveloperMemoryTag:GetEnumItems()) do
		local ok, v = pcall(function() return Stats:GetMemoryUsageMbForTag(tag) end)
		if ok and type(v) == "number" and v == v and v ~= math.huge then sum += v end
	end
	return math.floor(sum)
end
AreaFarm._memLimit = function()
	return math.clamp(math.floor(tonumber(Config.MemGuardMb) or 2600), 800, 12000)
end
-- A rejoin is the most memory-hungry thing a client can do: TeleportService
-- loads the place a second time before it releases the first copy, so the peak
-- during a teleport is roughly double the steady state. On a machine that is
-- already out of commit that is not a rescue, it is the moment the process dies
-- -- three tabs were lost mid-teleport in front of me, each having grown to
-- 10-12 GB of private commit first. So every automatic teleport now goes
-- through here and every one of them is refused while NoRejoin is set, which is
-- the default. What is left is the in-place answer below.
AreaFarm._rejoinBlocked = function()
	return Config.NoRejoin ~= false
end
AreaFarm._refreshClient = function(reason)
	if AreaFarm._rejoinBlocked() then
		State.RejoinRefused = (State.RejoinRefused or 0) + 1
		State.RejoinRefusedWhy = tostring(reason)
		return false
	end
	if State.MemRejoining then return false end
	State.MemRejoining = true
	pushNotify("Cope Hub", "Refreshing client — " .. tostring(reason), "triangle-alert")
	pcall(function() AreaFarm.SaveSettings(true) end)
	pcall(function()
		AreaFarm._notifyWebhook("Client refresh", string.format(
			"**%s** is rejoining to free memory.\n%s\nSession: **%dm**",
			Players.LocalPlayer.Name, tostring(reason),
			math.floor((os.clock() - CopeUI.T0) / 60)), 0xFBBF24)
	end)
	task.wait(2)
	pcall(function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, Players.LocalPlayer)
	end)
	return true
end
-- What the ceiling does instead of teleporting: drain the whole held-object
-- backlog rather than one budgeted slice, empty the debris park, and drop the
-- caches the hub itself is holding. This cannot give back memory the engine has
-- already committed -- nothing but a rejoin does that -- but it does release
-- every reference the client is still holding, which is what was growing.
AreaFarm._memReclaim = function(reason)
	if State.MemReclaiming then return 0 end
	State.MemReclaiming = true
	local before = State.MemMb or 0
	local freed = 0
	-- Up to 60 purge passes: 2,000 buckets each, so 120,000 buckets per call.
	-- Each pass yields internally, so the client keeps rendering throughout.
	for _ = 1, 60 do
		local ok, _, held, more = pcall(AreaFarm._leakPurge)
		if not ok then break end
		freed += (tonumber(held) or 0)
		if more ~= true then break end
		task.wait()
	end
	pcall(function()
		if State.DebrisFolder then
			for _, d in ipairs(State.DebrisFolder:GetChildren()) do
				pcall(function() d:Destroy() end)
			end
		end
	end)
	-- Hub-side caches. These are small next to the leak but they are ours, and a
	-- client under pressure has no use for a warm lookup table.
	pcall(function()
		State.PetIndexCache = nil
		State.EggCache = nil
		State.SaveCache = nil
	end)
	task.wait(1)
	local after = AreaFarm._memoryMb()
	State.MemMb = after
	State.MemReclaimed = (State.MemReclaimed or 0) + freed
	State.MemLastReclaim = os.time()
	pushNotify("Cope Hub", string.format(
		"Memory reclaim — released %s objects, %s MB -> %s MB (%s)",
		commas(freed), commas(before), commas(after), tostring(reason)), "shield")
	pcall(function()
		AreaFarm._notifyWebhook("Memory reclaim", string.format(
			"**%s** hit the ceiling and reclaimed in place instead of rejoining.\n%s\nReleased **%s** objects, **%s MB -> %s MB**",
			Players.LocalPlayer.Name, tostring(reason), commas(freed),
			commas(before), commas(after)), 0x22D3EE)
	end)
	State.MemReclaiming = false
	return freed
end
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local born, overSince, lastAct = os.clock(), nil, 0
	while AreaFarm.Gen == myGen do
		task.wait(10)
		local mb = AreaFarm._memoryMb()
		State.MemMb = mb
		State.MemPeak = math.max(State.MemPeak or 0, mb)
		local reason
		if Config.MemGuard ~= false then
			local limit = AreaFarm._memLimit()
			if mb >= limit then
				-- Require the breach to hold for 30 s; one reading can spike.
				overSince = overSince or os.clock()
				if os.clock() - overSince >= 30 then
					reason = string.format("%d MB used, ceiling is %d MB", mb, limit)
				end
			else
				overSince = nil
			end
		end
		local hrs = math.clamp(tonumber(Config.MemRejoinHours) or 0, 0, 24)
		if not reason and hrs > 0 and (os.clock() - born) >= hrs * 3600
			and not AreaFarm._rejoinBlocked() then
			reason = string.format("scheduled %gh refresh", hrs)
		end
		-- Rate-limited to one action every 2 minutes. Without this a client that
		-- is genuinely over the ceiling reclaims every 10 s and gets nothing but
		-- the cost, because the buckets it just emptied have not refilled.
		if reason and (os.clock() - lastAct) > 120 then
			lastAct = os.clock()
			overSince = nil
			if AreaFarm._rejoinBlocked() then
				AreaFarm._memReclaim(reason)
			else
				AreaFarm._refreshClient(reason)
			end
		end
	end
end)


-- ========================================================================
-- BACKGROUND MODE — the cheapest a tab can be while still farming
--
-- Every FPS switch above this makes the picture cheaper to draw. This one
-- stops drawing it. RunService:Set3dRenderingEnabled(false) halts the
-- renderer without touching the scheduler, so the farm loops, remotes and
-- timers all run at full speed while the GPU does essentially nothing -- and
-- 2D ScreenGuis keep drawing, which is why this hub stays visible and
-- clickable with the world switched off.
--
-- It matters most for exactly the setup this hub gets used in. Five clients
-- on one GPU are not sharing it politely: each is asking for 60 frames a
-- second of a fully lit world, and they fight for the GPU, for the memory
-- bus, and for the per-frame allocations that feed the very leak the Leak
-- Guard exists to clean up. Turn rendering off on the four tabs nobody is
-- looking at and there is one client drawing instead of five.
--
-- The frame cap is the milder version of the same idea and works on its own:
-- a capped client stops generating frames it has no reason to generate.
--
-- Neither of these lives in the DataModel, so both are undone on unload and
-- both are reachable from F8 -- see _bgPanic. That escape hatch is not
-- decoration: a switch that can blank the window must have a way back that
-- does not depend on the window.
-- ========================================================================
AreaFarm._bgState = { render3dOff = false, qualityHeld = nil, capHeld = nil,
	render3dOk = nil, qualityOk = nil, capOk = nil, auto = false }

AreaFarm._bgFpsCap = function()
	return math.clamp(math.floor(tonumber(Config.BgFpsCap) or 30), 5, 240)
end

AreaFarm._bgSetCap = function(n)
	local st = AreaFarm._bgState
	local fn = rawget(getgenv(), "setfpscap") or setfpscap or set_fps_cap
	if type(fn) ~= "function" then
		st.capOk = false
		return false
	end
	-- 0 means "no cap" to Real, which is also what we want when restoring: the
	-- client goes back to whatever the user's own FPS unlocker or Roblox default
	-- was doing before the hub touched it.
	local ok = pcall(fn, n or 0)
	st.capOk = ok
	if ok then st.capHeld = n end
	return ok
end

AreaFarm._bgSetRender = function(off)
	local st = AreaFarm._bgState
	local ok = pcall(function()
		game:GetService("RunService"):Set3dRenderingEnabled(not off)
	end)
	st.render3dOk = ok
	if ok then st.render3dOff = off end
	return ok
end

AreaFarm._bgSetQuality = function(low)
	local st = AreaFarm._bgState
	-- settings() is not reachable from an ordinary LocalScript. At Real's identity
	-- it usually is, but treat it as optional: it is the smallest of the three
	-- wins here and not worth failing the whole toggle over.
	local ok = pcall(function()
		local r = settings().Rendering
		if low then
			if st.qualityHeld == nil then st.qualityHeld = r.QualityLevel end
			r.QualityLevel = Enum.QualityLevel.Level01
		elseif st.qualityHeld ~= nil then
			r.QualityLevel = st.qualityHeld
			st.qualityHeld = nil
		end
	end)
	st.qualityOk = ok
	return ok
end

AreaFarm._bgApply = function(on)
	local st = AreaFarm._bgState
	if on then
		AreaFarm._bgSetCap(AreaFarm._bgFpsCap())
		AreaFarm._bgSetQuality(true)
		if Config.BgRender3D ~= false then
			AreaFarm._bgSetRender(true)
		elseif st.render3dOff then
			AreaFarm._bgSetRender(false)
		end
	else
		if st.render3dOff then AreaFarm._bgSetRender(false) end
		AreaFarm._bgSetQuality(false)
		AreaFarm._bgSetCap(0)
	end
	State.BgOn = on and true or false
	return true
end

-- F8, and the button in the UI. Puts the picture back no matter what got it
-- into this state -- the toggle, the auto-when-hidden rule, or a reload that
-- died halfway through applying it.
AreaFarm._bgPanic = function()
	Config.BgMode = false
	Config.BgAuto = false
	AreaFarm._bgApply(false)
	pcall(function()
		if AreaFarm._refreshBgToggles then AreaFarm._refreshBgToggles() end
	end)
	pushNotify("Cope Hub", "Background Mode off — rendering restored (F8)", "check")
end

AreaFarm._bgReport = function()
	local st = AreaFarm._bgState
	if not State.BgOn then return "off" end
	if st.render3dOff then return "3D off" end
	if st.render3dOk == false then return "capped (3D blocked)" end
	return "capped"
end

-- Auto-engage while the hub is hidden. The hub being hidden is the closest
-- thing to a reliable "nobody is looking at this tab" signal available from
-- inside the client, and it is the state a tab spends the whole night in.
task.spawn(function()
	while AreaFarm.Gen == myGen do
		task.wait(2)
		local want
		if Config.BgAuto == true then
			want = not State.UIVisible
		else
			want = Config.BgMode == true
		end
		if want ~= (State.BgOn == true) then
			pcall(AreaFarm._bgApply, want)
		end
	end
end)

PerfTab:Section("Background Mode")
-- Widget handles hang off AreaFarm rather than becoming file-scope locals: the
-- main chunk is close enough to Luau's 200-live-locals ceiling that four more
-- would be a compile error, not a style choice.
AreaFarm._bgTiles = PerfTab:StatGrid({
	{ Key = "State", Title = "Background Mode" },
	{ Key = "Fps", Title = "FPS / Cap" },
})
AreaFarm._bgW = {}
AreaFarm._refreshBgTiles = function()
	local T = AreaFarm._bgTiles
	T.State(AreaFarm._bgReport())
	T.Fps(string.format("%d / %s", CopeUI.FPS or 0,
		State.BgOn and tostring(AreaFarm._bgFpsCap()) or "none"))
end
AreaFarm._refreshBgToggles = function()
	local W = AreaFarm._bgW
	pcall(function() W.main:Set(Config.BgMode == true, true) end)
	pcall(function() W.auto:Set(Config.BgAuto == true, true) end)
	pcall(function() W.render:Set(Config.BgRender3D ~= false, true) end)
end
AreaFarm._bgW.main = PerfTab:Toggle({
	Title = "Background Mode",
	Desc = "Stops this tab drawing the world at all. The farm keeps running at full speed — only the renderer sleeps. The biggest single FPS win here, and it frees the GPU for the tab you are actually watching. F8 undoes it any time",
	Value = Config.BgMode == true,
	Callback = function(v)
		Config.BgMode = v
		if v then Config.BgAuto = false end
		pcall(AreaFarm._bgApply, v)
		if v then
			if AreaFarm._bgState.render3dOk == false and Config.BgRender3D ~= false then
				pushNotify("Cope Hub",
					"Background Mode on — frame cap only, this client will not let the renderer be switched off",
					"triangle-alert")
			else
				pushNotify("Cope Hub", "Background Mode on — " .. AreaFarm._bgReport()
					.. ". Press F8 to get the picture back", "shield")
			end
		else
			pushNotify("Cope Hub", "Background Mode off — rendering restored", "check")
		end
	end,
})
AreaFarm._bgW.auto = PerfTab:Toggle({
	Title = "Only While The Hub Is Hidden",
	Desc = "Engages Background Mode whenever you hide the hub and lifts it when you bring it back. Best setting for overnight runs — you see a normal game whenever you look at it",
	Value = Config.BgAuto == true,
	Callback = function(v)
		Config.BgAuto = v
		if v then
			Config.BgMode = false
			pcall(function() AreaFarm._bgW.main:Set(false, true) end)
			pushNotify("Cope Hub", "Background Mode will follow the hub — hidden means asleep", "check")
		else
			pcall(AreaFarm._bgApply, false)
		end
	end,
})
AreaFarm._bgW.render = PerfTab:Toggle({
	Title = "Stop 3D Rendering",
	Desc = "The part of Background Mode that does the work. Off leaves only the frame cap and the quality drop, which is gentler but nowhere near as cheap",
	Value = Config.BgRender3D ~= false,
	Callback = function(v)
		Config.BgRender3D = v
		if State.BgOn then pcall(AreaFarm._bgApply, true) end
		if not v then pcall(AreaFarm._bgSetRender, false) end
	end,
})
PerfTab:Slider({
	Title = "Background FPS Cap",
	Desc = "Frames per second while Background Mode is on. 30 is plenty for a farm; 10 is fine if nothing on screen needs to look smooth. Lifted the moment Background Mode goes off",
	Value = { Min = 5, Max = 240, Default = tonumber(Config.BgFpsCap) or 30 },
	Step = 5,
	Callback = function(v)
		Config.BgFpsCap = v
		if State.BgOn then pcall(AreaFarm._bgSetCap, AreaFarm._bgFpsCap()) end
	end,
})
PerfTab:Button({
	Title = "Restore Rendering Now (F8)",
	Desc = "Panic button. Turns Background Mode and the auto rule off and puts the renderer, quality and frame cap back",
	Callback = function() AreaFarm._bgPanic() end,
})

PerfTab:Section("FPS Boosters")
local perfToggles = {}
local perfMasterBusy = false
PerfTab:Toggle({
	Title = "Max FPS Mode",
	Desc = "One switch — shadows, particles, post-processing, textures and break effects all off. Fully reversible",
	Value = Config.PerfMaxMode == true,
	Callback = function(v)
		Config.PerfMaxMode = v
		if perfMasterBusy then return end
		perfMasterBusy = true
		for _, t in ipairs(perfToggles) do pcall(function() t:Set(v, true) end) end
		if v then pcall(CopeUI.SetBlur, false) end
		perfMasterBusy = false
	end,
})
table.insert(perfToggles, PerfTab:Toggle({
	Title = "Disable Shadows",
	Desc = "Turns off global lighting shadows",
	Value = Config.PerfNoShadows == true,
	Callback = function(v)
		Config.PerfNoShadows = v
		applyShadows(v)
	end,
}))
table.insert(perfToggles, PerfTab:Toggle({
	Title = "Disable Post-Processing",
	Desc = "Turns off Bloom, colour correction, sun rays and depth-of-field in Lighting — a cheap GPU win",
	Value = Config.PerfPostFX == true,
	Callback = function(v)
		Config.PerfPostFX = v
		applyPostFX(v)
	end,
}))
table.insert(perfToggles, PerfTab:Toggle({
	Title = "Remove Textures / Materials",
	Desc = "Flattens the map to SmoothPlastic and hides decals. Reverts when toggled off or on unload",
	Value = Config.PerfTextures == true,
	Callback = function(v)
		Config.PerfTextures = v
		applyTextures(v)
	end,
}))
table.insert(perfToggles, PerfTab:Toggle({
	Title = "Disable Particles",
	Desc = "Kills particle emitters, beams, trails, fire and smoke",
	Value = Config.PerfParticles == true,
	Callback = function(v)
		Config.PerfParticles = v
		applyParticles(v)
	end,
}))
PerfTab:Toggle({
	Title = "Hide Other Players",
	Desc = "Makes other players' characters invisible locally (pets unaffected)",
	Value = Config.PerfHidePlayers == true,
	Callback = function(v)
		Config.PerfHidePlayers = v
		applyHidePlayers(v)
	end,
})

PerfTab:Section("Hide World Objects")
PerfTab:Toggle({
	Title = "Hide Orbs",
	Desc = "Makes orbs invisible locally. Auto-collect still works — only the visuals are hidden",
	Value = Config.HideOrbs == true,
	Callback = function(v) Config.HideOrbs = v end,
})
PerfTab:Toggle({
	Title = "Hide Lootbags",
	Desc = "Makes lootbags invisible locally. Auto-bag pickup still works",
	Value = Config.HideLootbags == true,
	Callback = function(v) Config.HideLootbags = v end,
})
PerfTab:Toggle({
	Title = "Hide Breakables (Keep Health Bars)",
	Desc = "Hides the coin meshes but keeps the floating health bars, so the farm still shows what it is breaking",
	Value = Config.HideBreakables == true,
	Callback = function(v) Config.HideBreakables = v end,
})
table.insert(perfToggles, PerfTab:Toggle({
	Title = "Hide Break Effects",
	Desc = "Removes the explosion particles and flying coin chunks when a breakable dies — the main break-time lag source",
	Value = Config.HideBreakFx ~= false,
	Callback = function(v) Config.HideBreakFx = v; AreaFarm._applyBreakFx(v) end,
}))

PerfTab:Section("Overnight Stability")
local StabTiles = PerfTab:StatGrid({
	{ Key = "Mem", Title = "Client Memory" },
	{ Key = "Peak", Title = "Peak / Ceiling" },
	{ Key = "Leak", Title = "Leak Released" },
	{ Key = "Held", Title = "Buckets Held" },
	{ Key = "Debris", Title = "Debris Parked" },
	{ Key = "Swept", Title = "Hosts Swept" },
	{ Key = "Rejoin", Title = "Auto Rejoin" },
	{ Key = "Reclaimed", Title = "Reclaimed" },
})
-- Fed by the 1 s housekeeping loop like the other stat grids -- no clock here.
AreaFarm._refreshStabTiles = function()
	local mb = State.MemMb or 0
	StabTiles.Mem(mb > 0 and (commas(mb) .. " MB") or "reading...")
	StabTiles.Peak(string.format("%s / %s MB", commas(State.MemPeak or 0),
		commas(AreaFarm._memLimit())))
	if Config.LeakGuard == false then
		StabTiles.Leak("off")
	elseif State.LeakArmed then
		StabTiles.Leak(commas(State.LeakReleased or 0))
	else
		StabTiles.Leak("arming...")
	end
	if (State.LeakBacklog or 0) > 0 then
		StabTiles.Held(commas(State.LeakBuckets or 0) .. " (draining)")
	else
		StabTiles.Held(commas(State.LeakBuckets or 0))
	end
	local live = "—"
	if State.DebrisFolder then
		local ok, n = pcall(function() return #State.DebrisFolder:GetChildren() end)
		if ok then live = commas(n) end
	end
	StabTiles.Debris(live)
	StabTiles.Swept(commas(State.DebrisSwept or 0))
	if Config.NoRejoin == false then
		StabTiles.Rejoin("allowed")
	elseif (State.RejoinRefused or 0) > 0 then
		StabTiles.Rejoin("blocked x" .. commas(State.RejoinRefused))
	else
		StabTiles.Rejoin("blocked")
	end
	StabTiles.Reclaimed(commas(State.MemReclaimed or 0))
end
PerfTab:Toggle({
	Title = "Leak Guard",
	Desc = "THE crash fix. The game's own AddDebris never lets go of what it deletes — one tab was holding 4,343,103 dead objects and 12.3 GB before this existed. Releases them and stops more accruing. Leave it on",
	Value = Config.LeakGuard ~= false,
	Callback = function(v)
		Config.LeakGuard = v
		if v then
			task.spawn(function()
				pcall(AreaFarm._leakInstall)
				local keys, held, more = 0, 0, false
				local ok = pcall(function() keys, held, more = AreaFarm._leakPurge() end)
				State.LeakArmed = AreaFarm._leakArmed()
				if ok and State.LeakArmed then
					pushNotify("Cope Hub", string.format(
						"Leak Guard on — released %s objects from %s buckets%s",
						commas(held), commas(keys),
						more and (", " .. commas(State.LeakBacklog or 0) .. " left to drain") or ""), "shield")
				else
					pushNotify("Cope Hub", "Leak Guard on — waiting for the game to load", "clock")
				end
			end)
		else
			pcall(AreaFarm._leakRestore)
			State.LeakArmed = false
			pushNotify("Cope Hub", "Leak Guard off — memory will climb again", "triangle-alert")
		end
	end,
})
PerfTab:Slider({
	Title = "Leak Purge Interval (s)",
	Desc = "How often the held-object buckets are cleared. 30s is cheap and keeps the backlog near zero; only raise it if you see a hitch",
	Value = { Min = 10, Max = 300, Default = tonumber(Config.LeakPurgeSecs) or 30 },
	Step = 5,
	Callback = function(v) Config.LeakPurgeSecs = v end,
})
PerfTab:Toggle({
	Title = "Sweep Leftover Debris",
	Desc = "Deletes the invisible particle hosts the game forgets to clean up. A second, smaller leak than the one above — leave it on",
	Value = Config.DebrisSweep ~= false,
	Callback = function(v) Config.DebrisSweep = v end,
})
PerfTab:Slider({
	Title = "Debris Sweep Delay",
	Desc = "Seconds before a parked host is deleted. The game's own effects never live longer than 5s, so anything here is safe",
	Value = { Min = 6, Max = 120, Default = tonumber(Config.DebrisSweepSecs) or 20 },
	Step = 2,
	Callback = function(v) Config.DebrisSweepSecs = v end,
})
PerfTab:Toggle({
	Title = "Silence Idle Tracker",
	Desc = "Kills the game's broken idle script. It throws an error every frame after ~20 min AFK — 1.1 million of them and a 368 MB log in one night",
	Value = Config.KillIdleTracker ~= false,
	Callback = function(v)
		Config.KillIdleTracker = v
		if v then
			local n = AreaFarm._killIdleTracker()
			pushNotify("Cope Hub", n > 0 and ("Idle tracker silenced (" .. n .. ")")
				or "Idle tracker not running yet — will retry", "shield")
		else
			pushNotify("Cope Hub", "Idle tracker left alone — rejoin to re-enable it", "info")
		end
	end,
})
PerfTab:Toggle({
	Title = "Never Rejoin",
	Desc = "Blocks every automatic teleport. A rejoin loads the place a second time before it drops the first, so it needs MORE memory at exactly the moment there is none — it is what killed the tabs, not what saved them. On, the ceiling reclaims in place instead. Leave this on",
	Value = Config.NoRejoin ~= false,
	Callback = function(v)
		Config.NoRejoin = v
		if v then
			pushNotify("Cope Hub", "Never Rejoin on — the ceiling will reclaim in place instead", "shield")
		else
			pushNotify("Cope Hub", "Never Rejoin OFF — this client may teleport itself again", "triangle-alert")
		end
	end,
})
PerfTab:Toggle({
	Title = "Memory Guard",
	Desc = "Watches this client's memory and acts when it passes the ceiling below. With Never Rejoin on it drains the whole held-object backlog and empties the debris park in place; with it off it rejoins",
	Value = Config.MemGuard ~= false,
	Callback = function(v) Config.MemGuard = v end,
})
PerfTab:Button({
	Title = "Reclaim Memory Now",
	Desc = "Runs the ceiling's whole in-place pass immediately — drains every stale bucket, empties the debris park, drops the hub's caches. Safe to press any time",
	Callback = function()
		task.spawn(function() AreaFarm._memReclaim("asked for it") end)
	end,
})
PerfTab:Slider({
	Title = "Memory Ceiling (MB)",
	Desc = "Where the Memory Guard acts. This reads lower than Task Manager — a healthy client shows ~1400 here while committing ~3.2 GB — so keep it early: 2600 for 4 tabs on 16 GB, 3000 for 3 tabs",
	Value = { Min = 800, Max = 12000, Default = tonumber(Config.MemGuardMb) or 2600 },
	Step = 100,
	Callback = function(v) Config.MemGuardMb = v end,
})
PerfTab:Slider({
	Title = "Scheduled Rejoin (hours)",
	Desc = "Refresh this client every N hours whatever the memory reads. Ignored while Never Rejoin is on, and 0 disables it — which is the default now",
	Value = { Min = 0, Max = 12, Default = tonumber(Config.MemRejoinHours) or 0 },
	Step = 1,
	Callback = function(v) Config.MemRejoinHours = v end,
})

-- ========================================================================
-- SETTINGS TAB — hotkey rebind, rejoin, config reset
-- ========================================================================
SettingsTab:Section("Interface")
local HotkeyBtn
HotkeyBtn = SettingsTab:Button({
	Title = "Rebind Hide/Show Key — " .. tostring(Config.HotkeyName),
	Desc = "Press any key to bind it. Esc cancels. K always works too.",
	Callback = function()
		if State.RebindWaiting then return end
		State.RebindWaiting = true
		pushNotify("Cope Hub", "Press any key to set the new hide/show key...", "clock")
		SetUIVisible(false)
	end,
})
AreaFarm._refreshHotkeyLabel = function()
	pcall(function()
		HotkeyBtn.SetTitle(HotkeyBtn, "Rebind Hide/Show Key — " .. tostring(Config.HotkeyName))
	end)
end
SettingsTab:Toggle({
	Title = "Auto Rejoin On Disconnect",
	Desc = "Teleports you back if you get kicked or disconnected. This one is harmless — the client is already off the server, so there is no second copy of the place to pay for — but Never Rejoin on the Performance tab still overrides it",
	Value = Config.AutoRejoin ~= false,
	Callback = function(v) Config.AutoRejoin = v end,
})
SettingsTab:Toggle({
	Title = "Anti-AFK",
	Desc = "Reports it when Roblox flags this client idle (~20 min) and keeps farming. It used to rejoin instead — which meant every tab teleported at once every 20 minutes, and that is what was killing them overnight. Real cannot fake input, so nothing else is possible here",
	Value = Config.AntiAFK ~= false,
	Callback = function(v) Config.AntiAFK = v end,
})
SettingsTab:Toggle({
	Title = "Disable Pop-Ups",
	Desc = "Blocks in-game notification toasts and modal message boxes (confirm dialogs auto-accept)",
	Value = Config.DisablePopups == true,
	Callback = function(v)
		Config.DisablePopups = v
		AreaFarm._setDisablePopups(v)
	end,
})

SettingsTab:Section("Configuration")
do
	local armed = false
	SettingsTab:Button({
		Title = "Reset All Settings",
		Desc = "Restores every control to its default and deletes the saved file",
		Callback = function()
			task.spawn(function()
				if not armed then
					armed = true
					pushNotify("Cope Hub", "Click Reset again within 5 seconds to confirm", "triangle-alert")
					task.delay(5, function() armed = false end)
					return
				end
				armed = false
				for _, entry in ipairs(CopeUI.Registry) do
					pcall(entry.set, entry.default)
				end
				Config.TargetArea, Config.World, Config.EggKey = nil, nil, nil
				pcall(function() if isfile(AreaFarm.SAVE_PATH) then delfile(AreaFarm.SAVE_PATH) end end)
				State.LastSavedSnapshot = configSnapshot()
				if AreaFarm._refreshHotkeyLabel then AreaFarm._refreshHotkeyLabel() end
				pushNotify("Cope Hub", "All settings reset", "check")
			end)
		end,
	})
end

SettingsTab:Section("Auto-Save")
do
	local statusBtn
	local function refreshStatus()
		pcall(function()
			local when = AreaFarm._lastSavedAt and os.date("%H:%M:%S", AreaFarm._lastSavedAt) or "never"
			statusBtn.SetTitle(statusBtn,
				(Config.AutoSaveSettings == false and "Settings — auto-save OFF" or "Settings — last saved %s"):format(when))
		end)
	end
	SettingsTab:Toggle({
		Title = "Auto-Save Settings",
		Desc = "Writes every setting change to disk within 5 seconds, so nothing is lost on a crash, kick or rejoin",
		Value = Config.AutoSaveSettings ~= false,
		Callback = function(v)
			Config.AutoSaveSettings = v
			if v then pcall(function() AreaFarm.SaveSettings(true) end) end
			refreshStatus()
		end,
	})
	statusBtn = SettingsTab:Button({
		Title = "Settings — last saved never",
		Desc = "Click to force an immediate save of all current settings",
		Callback = function()
			task.spawn(function()
				local ok = pcall(function() AreaFarm.SaveSettings(true) end)
				if ok then AreaFarm._lastSavedAt = os.time() end
				refreshStatus()
				pushNotify("Cope Hub", ok and "Settings saved" or "Save failed", ok and "check" or "triangle-alert")
			end)
		end,
	})
	AreaFarm._refreshSaveStatus = refreshStatus
end

SettingsTab:Section("Background")
SettingsTab:Dropdown({
	Title = "Background Animation",
	Desc = "What moves behind the panels. Gradient and Solid do no per-frame work at all.",
	Values = CopeUI.BgStyles,
	Value = tostring(Config.UIBgStyle or "Aurora"),
	Callback = function(v) CopeUI.SetBgStyle(v) end,
})
SettingsTab:Section("Background Colors")
-- Four to a row, each painted in the palette it selects, so the choice is made by
-- eye instead of by reading eight names out of a dropdown.
do
	local holder = New("Frame", {
		LayoutOrder = CopeUI.NextOrder(SettingsTab), Size = UDim2.new(1, 0, 0, 106),
		BackgroundTransparency = 1, ZIndex = 5, Parent = SettingsTab._page,
	})
	New("UIGridLayout", {
		CellSize = UDim2.new(0.25, -7, 0, 49), CellPadding = UDim2.fromOffset(9, 8),
		SortOrder = Enum.SortOrder.LayoutOrder, Parent = holder,
	})
	local rings = {}
	local function markActive(which)
		for name, ring in pairs(rings) do
			local on = (name == which)
			TweenService:Create(ring, TweenInfo.new(0.18), {
				Color = on and Theme.Accent or Theme.Stroke,
				Transparency = on and 0.05 or 0.55, Thickness = on and 2 or 1,
			}):Play()
		end
	end
	for i, p in ipairs(CopeUI.BgSwatches) do
		local tile = New("TextButton", {
			LayoutOrder = i, BackgroundColor3 = hexColor(p.a), BorderSizePixel = 0,
			AutoButtonColor = false, Text = "", ZIndex = 6, Parent = holder,
		})
		Corner(11, tile)
		-- "Accent" tracks the live accent, so its swatch has to be re-tinted too
		local g = CopeUI.Grad(tile, hexColor(p.a), hexColor(p.b), 35)
		if p.n == "Accent" then
			CopeUI.markAccent(tile, "BackgroundColor3")
			CopeUI.markAccent(g, "grad")
		end
		rings[p.n] = Stroke(Theme.Stroke, 0.55, 1, tile)
		New("TextLabel", {
			Position = UDim2.new(0, 9, 0, 0), Size = UDim2.new(1, -14, 1, 0),
			BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11.5,
			TextColor3 = Color3.fromRGB(255, 255, 255), TextXAlignment = Enum.TextXAlignment.Left,
			Text = p.n, ZIndex = 7, Parent = tile,
		})
		local sc = New("UIScale", { Scale = 1, Parent = tile })
		uiconn(tile.MouseEnter, function()
			TweenService:Create(sc, TweenInfo.new(0.14, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Scale = 1.05 }):Play()
		end)
		uiconn(tile.MouseLeave, function()
			TweenService:Create(sc, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Scale = 1 }):Play()
		end)
		CopeUI.Ripple(tile, true)
		uiconn(tile.Activated, function()
			CopeUI.SetBackground(p.n)
			markActive(p.n)
		end)
		if tostring(Config.UIBgPreset or "Midnight") == p.n then markActive(p.n) end
	end
	-- the dropdown this grid replaced carried the Reset-All entry, so the grid has
	-- to register one itself
	table.insert(CopeUI.Registry, {
		type = "bgpreset", default = "Midnight",
		set = function(v)
			local name = tostring(v or "Midnight")
			CopeUI.SetBackground(name)
			markActive(name)
		end,
	})
	AreaFarm._markBgPreset = markActive
end
SettingsTab:Section("Appearance")
SettingsTab:Slider({
	Title = "Background Intensity",
	Desc = "0 = flat and dark, 200 = full brightness",
	Value = { Min = 0, Max = 200, Default = tonumber(Config.UIBgIntensity) or 100 },
	Step = 5,
	Callback = function(v)
		Config.UIBgIntensity = v
		CopeUI.RefreshBackground()
	end,
})
SettingsTab:Slider({
	Title = "Animation Speed",
	Desc = "Scales every looping animation. Lower is calmer and cheaper.",
	Value = { Min = 25, Max = 200, Default = tonumber(Config.UIAnimSpeed) or 100 },
	Step = 5,
	Callback = function(v) Config.UIAnimSpeed = v end,
})
SettingsTab:Toggle({
	Title = "UI Animations",
	Desc = "Off freezes all background and highlight motion — the cheapest the hub gets",
	Value = Config.UIMotion ~= false,
	Callback = function(v)
		Config.UIMotion = v
		CopeUI.RefreshBackground()
	end,
})
SettingsTab:Slider({
	Title = "UI Scale",
	Desc = "Size of the whole window, in percent",
	Value = { Min = 80, Max = 130, Default = tonumber(Config.UIScale) or 100 },
	Step = 5,
	Callback = function(v) CopeUI.SetUIScale(v) end,
})
SettingsTab:Toggle({
	Title = "Background Blur",
	Desc = "Frosted-glass blur behind the hub. Looks great but costs ~6ms/frame (about 8 FPS) — off by default",
	Value = Config.UIBlur == true,
	Callback = function(v) CopeUI.SetBlur(v) end,
})

SettingsTab:Section("Accent Color")
-- These used to be six ordinary Buttons, which meant every card painted itself in
-- the *live* accent: the picker showed six identical tiles and previewed nothing.
-- Each swatch now carries its own gradient, so the list reads as a palette.
do
	local presets = {
		{ n = "Violet",  a = "8B5CF6", b = "22D3EE" },
		{ n = "Sunset",  a = "FF6B9D", b = "FFB86B" },
		{ n = "Emerald", a = "34D399", b = "A3E635" },
		{ n = "Ocean",   a = "3B82F6", b = "38BDF8" },
		{ n = "Magma",   a = "EF4444", b = "F97316" },
		{ n = "Mono",    a = "A1A1AA", b = "E4E4E7" },
	}
	local holder = New("Frame", {
		LayoutOrder = CopeUI.NextOrder(SettingsTab), Size = UDim2.new(1, 0, 0, 124),
		BackgroundTransparency = 1, ZIndex = 5, Parent = SettingsTab._page,
	})
	New("UIGridLayout", {
		CellSize = UDim2.new(1 / 3, -6, 0, 58), CellPadding = UDim2.fromOffset(9, 8),
		SortOrder = Enum.SortOrder.LayoutOrder, Parent = holder,
	})
	local rings = {}
	local function markActive(which)
		for name, ring in pairs(rings) do
			local on = (name == which)
			TweenService:Create(ring, TweenInfo.new(0.18), {
				Transparency = on and 0 or 1, Thickness = on and 2 or 1,
			}):Play()
		end
	end
	for i, p in ipairs(presets) do
		local tile = New("TextButton", {
			LayoutOrder = i, BackgroundColor3 = hexColor(p.a), BorderSizePixel = 0,
			AutoButtonColor = false, Text = "", ZIndex = 6, Parent = holder,
		})
		Corner(12, tile)
		CopeUI.Grad(tile, hexColor(p.a), hexColor(p.b), 28)
		rings[p.n] = Stroke(Color3.fromRGB(255, 255, 255), 1, 1, tile)
		New("TextLabel", {
			Position = UDim2.new(0, 11, 0, 12), Size = UDim2.new(1, -18, 0, 15),
			BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 13,
			TextColor3 = Color3.fromRGB(255, 255, 255), TextXAlignment = Enum.TextXAlignment.Left,
			Text = p.n, ZIndex = 7, Parent = tile,
		})
		New("TextLabel", {
			Position = UDim2.new(0, 11, 0, 30), Size = UDim2.new(1, -18, 0, 13),
			BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 10,
			TextColor3 = Color3.fromRGB(255, 255, 255), TextTransparency = 0.25,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = "#" .. p.a, ZIndex = 7, Parent = tile,
		})
		local sc = New("UIScale", { Scale = 1, Parent = tile })
		uiconn(tile.MouseEnter, function()
			TweenService:Create(sc, TweenInfo.new(0.14, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Scale = 1.04 }):Play()
		end)
		uiconn(tile.MouseLeave, function()
			TweenService:Create(sc, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Scale = 1 }):Play()
		end)
		CopeUI.Ripple(tile, true)
		uiconn(tile.Activated, function()
			CopeUI.SetAccent(hexColor(p.a), hexColor(p.b))
			markActive(p.n)
			pushNotify("Cope Hub", "Theme set to " .. p.n, "paintbrush")
		end)
		if string.upper(tostring(Config.Accent1 or "")) == p.a then markActive(p.n) end
	end
	table.insert(CopeUI.Registry, {
		type = "accent", default = "Violet",
		set = function(v)
			for _, q in ipairs(presets) do
				if q.n == tostring(v) then
					CopeUI.SetAccent(hexColor(q.a), hexColor(q.b))
					markActive(q.n)
					return
				end
			end
		end,
	})
	AreaFarm._markAccentPreset = markActive
end

-- ---------------------------------------------------------------- anti-afk
-- Roblox fires Player.Idled after ~20 minutes without real input and kicks
-- shortly after. The textbook answer is VirtualUser:CaptureController(), and
-- that is what this used to do -- but VirtualUser needs the LocalUser capability
-- Real cannot grant at any thread identity, so every attempt threw instead:
-- 233 "Button2Down lacking capability LocalUser" errors per run and not one
-- idle timer ever reset. It is still tried first in case a future build allows
-- it, once, and then never again.
--
-- What it must NOT do is what it used to do next. Falling back to a rejoin meant
-- every tab teleported the moment Idled fired, and because the tabs were all
-- started together they all fired within the same minute -- five simultaneous
-- teleports, each one briefly holding two copies of the place, every ~20 minutes
-- all night. That is the "I wake up to all my tabs crashed" report: not the tabs
-- running out of memory on their own, but this trying to save them. So the
-- fallback is now to say so and keep farming. A tab Roblox actually kicks is
-- caught by the disconnect watchdog; a tab that is still alive is left alone.
function AreaFarm._setAntiAFK(on)
	if on and not State.AntiAFKConn then
		State.AntiAFKConn = Players.LocalPlayer.Idled:Connect(function()
			State.LastIdleSpoof = os.time()
			State.IdleFlagged = (State.IdleFlagged or 0) + 1
			if State.VirtualUserOk ~= false then
				local ok = pcall(function()
					local vu = game:GetService("VirtualUser")
					vu:CaptureController()
					vu:ClickButton2(Vector2.new())
				end)
				State.VirtualUserOk = ok
				if ok then return end
			end
			-- Report once per session, not once per Idled -- this fires repeatedly.
			if not State.IdleReported then
				State.IdleReported = true
				pushNotify("Cope Hub",
					"Roblox flagged this client idle. Farming continues — no rejoin, that was what killed the tabs",
					"triangle-alert")
				pcall(function()
					AreaFarm._notifyWebhook("Flagged idle", string.format(
						"**%s** was flagged idle by Roblox. Real cannot fake input, so nothing is done about it: the farm keeps running and the tab is left alone.",
						Players.LocalPlayer.Name), 0xFBBF24)
				end)
			end
		end)
	elseif not on and State.AntiAFKConn then
		State.AntiAFKConn:Disconnect()
		State.AntiAFKConn = nil
	end
end

-- ------------------------------------------------------------------ popups
do
	local _origSignalFire, _origMessageNew = nil, nil
	function AreaFarm._setDisablePopups(on)
		local Library = AreaFarm.Library
		if not Library then return end
		if on then
			if not _origSignalFire then
				_origSignalFire = Library.Signal.Fire
				Library.Signal.Fire = function(name, ...)
					if name == "Notification" then return end
					return _origSignalFire(name, ...)
				end
			end
			if not _origMessageNew then
				_origMessageNew = Library.Message.New
				Library.Message.New = function() return false end
			end
		else
			if _origSignalFire then
				Library.Signal.Fire = _origSignalFire
				_origSignalFire = nil
			end
			if _origMessageNew then
				Library.Message.New = _origMessageNew
				_origMessageNew = nil
			end
		end
	end
end

-- auto-rejoin watchdog (best effort)
task.spawn(function()
	while AreaFarm.Gen == myGen do
		task.wait(1)
		if Config.AutoRejoin and not State.RejoinedOnce then
			local lp = Players.LocalPlayer
			local kicked = lp.Parent == nil
			local dialogShown = false
			pcall(function()
				local pg = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGuiFrame")
				dialogShown = pg ~= nil and pg.DisplayDialog == true
			end)
			if kicked or dialogShown then
				if not State.KickAlertSent then
					State.KickAlertSent = true
					if Config.KickAlert and Config.WebhookEnabled and Config.WebhookURL ~= "" then
						pcall(function()
							AreaFarm._sendWebhook(Config.WebhookURL, { {
								title = "Disconnected",
								description = string.format(
									"**%s** was kicked/disconnected.\nSession: **%dm**\nEggs: **%d** | Huges: **%d**",
									Players.LocalPlayer.Name, math.floor((os.clock() - CopeUI.T0) / 60), Stats.Eggs, Stats.Huges),
								color = 0xF87171,
								footer = { text = "Cope Hub kick alert" },
								timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
							} })
						end)
					end
				end
				State.RejoinedOnce = true
				-- This is the one teleport that cannot cost anything: the client is
				-- already off the server, so there is no second copy of the place to
				-- hold. It still respects Never Rejoin, because the point of that
				-- switch is that the user wants to find the tab where they left it.
				if AreaFarm._rejoinBlocked() then
					pushNotify("Cope Hub", "Disconnected. Not rejoining — Never Rejoin is on", "triangle-alert")
				else
					pushNotify("Cope Hub", "Disconnect detected — attempting rejoin...", "triangle-alert")
					pcall(function()
						game:GetService("TeleportService"):Teleport(game.PlaceId, lp)
					end)
				end
			end
		end
	end
end)

-- ========================================================================
-- EVENT WEBHOOK HELPER
-- ========================================================================
AreaFarm._notifyWebhook = function(title, desc, color)
	if not Config.WebhookEnabled or Config.WebhookURL == "" then return false end
	local ok = pcall(function()
		AreaFarm._sendWebhook(Config.WebhookURL, { {
			title = title, description = desc, color = color or 0x8B5CF6,
			footer = { text = "Cope Hub — " .. Players.LocalPlayer.Name },
			timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
		} })
	end)
	return ok
end

-- ========================================================================
-- PROGRESSION — Auto Best Area / World Progression / Auto Complete Game
-- Area gates unlock remotely via Invoke("Buy Area", name); worlds advance
-- through WorldCmds.Load once every area in the current world is owned.
-- ========================================================================
AreaFarm._progState = { note = "", lastBuy = 0 }

local function progOrderedWorlds(Library)
	local wlist = {}
	for name, wd in pairs(Library.Directory.Worlds) do
		if not wd.disabled and (tonumber(wd.worldOrder) or 0) >= 1 then
			table.insert(wlist, { name = name, order = tonumber(wd.worldOrder) or 99 })
		end
	end
	table.sort(wlist, function(a, b)
		if a.order ~= b.order then return a.order < b.order end
		return a.name < b.name
	end)
	return wlist
end

local function progWorldAreas(Library, world)
	local list = {}
	for name, ad in pairs(Library.Directory.Areas) do
		if ad.world == world and not ad.hidden and not ad.isShop and not ad.isVIP then
			table.insert(list, { name = name, id = tonumber(ad.id) or 0 })
		end
	end
	table.sort(list, function(a, b) return a.id < b.id end)
	return list
end

local function progHasArea(Library, name)
	local ok, r = pcall(function() return Library.WorldCmds.HasArea(name) end)
	return ok and r == true
end

-- Only BUYABLE areas count as locked: VIP has no gate (gamepass only) and
-- would pin progression forever waiting on it. `skip` defers areas like
-- Ice Tech whose price is only farmable in a later world.
local function progLockedCount(Library, world, skip)
	local n = 0
	for _, a in ipairs(progWorldAreas(Library, world)) do
		local ad = Library.Directory.Areas[a.name]
		if ad and ad.gate and not (skip and skip[a.name]) and not progHasArea(Library, a.name) then
			n += 1
		end
	end
	return n
end

-- Travel with verification: Load blocks until the new map is live; the caller
-- re-checks WorldCmds.Get() next cycle and retries automatically if it failed.
local function progTravel(Library, dest)
	Config.TargetArea = nil
	Config.World = dest -- keep the world switcher in agreement, never fight it
	State.SwitchingWorld = true
	local ok, res = pcall(function() return Library.WorldCmds.Load(dest) end)
	State.SwitchingWorld = false
	if ok and res == true then
		pushNotify("Cope Hub", "Progression: arrived at " .. tostring(dest), "globe")
		return true
	end
	return false
end

local function progFarmBest(areas, bestUnlocked, prog)
	local target = bestUnlocked or areas[1] and areas[1].name
	if target and Config.AutoFarm and Config.TargetArea ~= target then
		Config.TargetArea = target
		prog.note = (prog.note == "" and "" or prog.note .. " · ") .. "farming " .. target
	end
end

local function progBuyNext(Library, save, prog, nextTarget, nextHasGate)
	if not nextTarget then return end
	if not nextHasGate then
		prog.note = nextTarget .. ": no gate — needs manual/quest unlock"
		return
	end
	local ad = Library.Directory.Areas[nextTarget]
	local gate = ad and ad.gate
	if not gate then
		prog.note = nextTarget .. ": no gate data"
		return
	end
	local cost = tonumber(gate.cost) or 0
	local bal = tonumber(save[gate.currency]) or 0
	if bal < cost then
		prog.note = string.format("%s: %s / %s %s", nextTarget, abbrev(bal), abbrev(cost), tostring(gate.currency))
		return
	end
	if os.clock() - prog.lastBuy <= 1.5 then return end
	prog.lastBuy = os.clock()
	local ok, err = Library.Network.Invoke("Buy Area", nextTarget)
	if ok then
		pushNotify("Cope Hub", "Progression: unlocked " .. nextTarget, "check")
		prog.note = "unlocked " .. nextTarget
	else
		prog.note = "buy failed: " .. tostring(err)
	end
end

local function progPortalQuests(Library, save, prog)
	local hp = save.HackerPortalProgress or {0, -1}
	local progress = tonumber(hp[1]) or 0
	local stage = tonumber(hp[2]) or -1
	if stage <= 0 then
		Library.Network.Fire("Start Hacker Portal Quests")
		prog.note = prog.note .. "starting hacker portal quests"
	elseif stage <= 3 then
		local reqTable = Library.Shared.HackerPortalQuests
		local req = reqTable and tonumber(reqTable[stage])
		if req and progress >= req then
			local ok = Library.Network.Invoke("Finish Hacker Portal Quest")
			prog.note = ok
				and string.format("%sportal quest stage %d finished", prog.note, stage)
				or (prog.note .. "finish quest failed")
		elseif stage == 3 then
			-- drive the Dark Matter machine: batch same-id convertible pets
			local dmSet = Library.Shared.DarkMatterMachineSettings
				and Library.Shared.DarkMatterMachineSettings.Normal or {}
			local maxBatch = math.max(1, #dmSet)
			local uids, firstId = {}, nil
			for _, pet in pairs(save.Pets or {}) do
				if #uids >= maxBatch then break end
				local dir = pet.id and Library.Directory.Pets[pet.id]
				if pet.r ~= nil and not pet.dm and not pet.l and dir
					and not dir.isPremium and not dir.isGift
					and dir.rarity ~= "Event" and dir.rarity ~= "Exclusive"
					and (firstId == nil or pet.id == firstId) then
					firstId = firstId or pet.id
					table.insert(uids, pet.uid)
				end
			end
			if #uids > 0 then
				local tier = dmSet[math.min(#uids, #dmSet)] or {cost = 0}
				if (tonumber(save.Diamonds) or 0) >= (tonumber(tier.cost) or 0) * 3 then
					if os.clock() < (prog.dmFailUntil or 0) then
						prog.note = prog.note .. "DM convert cooling down"
					else
						local ok, err = Library.Network.Invoke("Convert To Dark Matter", uids)
						prog.note = ok
							and string.format("%sDM machine: converting %d pets", prog.note, #uids)
							or (prog.note .. "convert failed: " .. tostring(err))
						if not ok then prog.dmFailUntil = os.clock() + 30 end
					end
				else
					prog.note = string.format("%sDM machine needs %d diamonds", prog.note, tonumber(tier.cost) or 0)
				end
			else
				prog.note = prog.note .. "portal q3: no convertible pets"
			end
		else
			prog.note = string.format("%sportal q%d: %d/%d%s",
				prog.note, stage, progress, req or -1,
				stage == 1 and " chests (auto-farm)" or stage == 2 and " bags (auto-bags)" or "")
		end
	end
end

task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		task.wait(2)
		local mode = (Config.AutoCompleteGame and "acg")
			or (Config.AutoWorldProgress and "wp")
			or (Config.AutoBestArea and "ba")
		if mode and not State.SwitchingWorld then
			pcall(function()
				local save = Library.Save.Get()
				if not save then return end
				local cur = Library.WorldCmds.Get()
				if not cur then return end
				local function progIsUnlocked(name)
					local ok, r = pcall(function() return Library.WorldCmds.HasArea(name) end)
					return ok and r == true
				end
				local areas = progWorldAreas(Library, cur)
				local lockedCount, nextTarget, bestUnlocked, nextHasGate = 0, nil, nil, false
				for _, a in ipairs(areas) do
					if progIsUnlocked(a.name) then
						bestUnlocked = a.name
					else
						local ad = Library.Directory.Areas[a.name]
						if ad and ad.gate then
							-- only buyable areas gate progression (VIP etc. never do)
							lockedCount += 1
							if not nextTarget then
								nextTarget = a.name
								nextHasGate = true
							end
						end
					end
				end
				local prog = AreaFarm._progState
				prog.note = ""

				-- ============================================================
				-- AUTO COMPLETE GAME — explicit ordered route:
				-- Spawn all areas -> Fantasy -> 7.5B Fantasy Coins -> back to
				-- Spawn, buy Ice Tech (7.5B FC) -> Tech -> Hacker Portal quests
				-- -> Void -> Axolotl Ocean -> Pixel. Every step re-derives from
				-- save state each cycle, so it resumes cleanly after any kick.
				-- ============================================================
				if mode == "acg" then
					local FANTASY_GOAL = 7500000000
					local function go(w)
						if cur == w then return true end
						if not Library.WorldCmds.HasAccess(w) then
							prog.note = "no access to " .. tostring(w)
							return false
						end
						if os.clock() < (prog.travelHoldUntil or 0) then
							prog.note = "travel to " .. tostring(w) .. " paused"
							return false
						end
						prog.note = "traveling to " .. tostring(w)
						if not progTravel(Library, w) then
							prog.travelHoldUntil = os.clock() + 5
							prog.note = "travel to " .. tostring(w) .. " failed — retrying"
						end
						return false
					end
					-- 1) every buyable Spawn area owned except Ice Tech — its
					-- 7.5B Fantasy Coins price can only be farmed in Fantasy,
					-- so it is bought later, in step 3
					if progLockedCount(Library, "Spawn", { ["Ice Tech"] = true }) > 0 then
						if go("Spawn") then
							progFarmBest(areas, bestUnlocked, prog)
							progBuyNext(Library, save, prog, nextTarget, nextHasGate)
						end
						return
					end
					-- 2) Fantasy world: complete all areas
					if cur ~= "Fantasy" then go("Fantasy") return end
					if progLockedCount(Library, "Fantasy") > 0 then
						progFarmBest(areas, bestUnlocked, prog)
						progBuyNext(Library, save, prog, nextTarget, nextHasGate)
						return
					end
					-- 3) Ice Tech (Tech Entry) costs exactly 7.5B Fantasy Coins:
					-- stack them here in Fantasy first, since they can't be farmed
					-- back in Spawn. Skipped entirely if Ice Tech is already owned.
					if not progIsUnlocked("Ice Tech") then
						local fc = tonumber(save["Fantasy Coins"]) or 0
						if fc < FANTASY_GOAL then
							progFarmBest(areas, bestUnlocked, prog)
							prog.note = string.format("%s · %s / 7.5B Fantasy Coins",
								prog.note == "" and "grinding" or prog.note, abbrev(fc))
							return
						end
						if cur ~= "Spawn" then go("Spawn") return end
						progFarmBest(areas, bestUnlocked, prog)
						progBuyNext(Library, save, prog, nextTarget, nextHasGate)
						return
					end
					-- 4) Tech world: complete all areas (incl. the 4.5B TC Hacker Portal area)
					if cur ~= "Tech" then go("Tech") return end
					if progLockedCount(Library, "Tech") > 0 then
						progFarmBest(areas, bestUnlocked, prog)
						progBuyNext(Library, save, prog, nextTarget, nextHasGate)
						return
					end
					-- 6) hacker portal quest line
					if not save.HackerPortalUnlocked then
						progPortalQuests(Library, save, prog)
						return
					end
					-- 7) Void (entry granted by owning the Hacker Portal area)
					if cur ~= "Void" then go("Void") return end
					if not progIsUnlocked("The Void") then
						prog.note = "waiting for 'The Void' area grant"
						return
					end
					-- 8) Axolotl Ocean: complete all areas
					if progLockedCount(Library, "Axolotl Ocean") > 0 then
						if go("Axolotl Ocean") then
							progFarmBest(areas, bestUnlocked, prog)
							progBuyNext(Library, save, prog, nextTarget, nextHasGate)
						end
						return
					end
					-- 9) Pixel: complete all areas -> done
					if progLockedCount(Library, "Pixel") > 0 then
						if go("Pixel") then
							progFarmBest(areas, bestUnlocked, prog)
							progBuyNext(Library, save, prog, nextTarget, nextHasGate)
						end
						return
					end
					Config.AutoCompleteGame = false
					if Config.ACGResumeFarm == false then Config.AutoFarm = false end
					Config.ACGResumeFarm = nil
					pushNotify("Cope Hub", "AUTO COMPLETE GAME finished — Pixel complete!", "trophy")
					AreaFarm._notifyWebhook("Auto Complete Game Complete",
						"Every world completed through **Pixel**!", 0x34D399)
					return
				end

				if lockedCount == 0 then
					-- world fully unlocked: advance to the next ordered world (wp only)
					if mode == "wp" then
						local worlds = progOrderedWorlds(Library)
						local nextW, passed = nil, false
						for _, w in ipairs(worlds) do
							if passed then nextW = w.name break end
							if w.name == cur then passed = true end
						end
						if nextW and Library.WorldCmds.HasAccess(nextW) then
							prog.note = tostring(cur) .. " done -> " .. tostring(nextW)
							progTravel(Library, nextW)
						elseif nextW then
							prog.note = "waiting for access to " .. tostring(nextW)
						else
							prog.note = "no further worlds"
						end
					else
						prog.note = tostring(cur) .. " fully unlocked"
					end
					return
				end

				-- farm target: highest unlocked area in this world
				progFarmBest(areas, bestUnlocked, prog)

				-- buy the next gate when affordable
				if mode == "wp" then
					progBuyNext(Library, save, prog, nextTarget, nextHasGate)
				end

				-- hacker portal quests (world progression benefits from them too)
				if mode == "wp" and cur == "Tech" and not save.HackerPortalUnlocked then
					progPortalQuests(Library, save, prog)
				end

				if prog.note == "" then
					prog.note = string.format(
						"%s — %d locked%s",
						tostring(cur), lockedCount,
						nextTarget and (": next " .. nextTarget .. (nextHasGate and "" or " (no gate)")) or "")
				end
			end)
		end
	end
end)

-- ========================================================================
-- AUTO BEST AREA GUARANTEE — keeps Config.TargetArea pointed at a farmable
-- area in the current world. The progression loop above only sets a target
-- while it has something to unlock; in a fully-unlocked world it never does,
-- which leaves the farm with no target (nothing gets broken). This runs
-- alongside and fills that gap: it prefers the highest area you own (the
-- toggle's documented behaviour) and falls back to the area whose live coins
-- carry the most total HP. Only writes while AutoBestArea is the active mode.
-- ========================================================================
local function baTopUnlockedArea(Library, cur)
	local bestUnlocked = nil
	for _, a in ipairs(progWorldAreas(Library, cur)) do
		if progHasArea(Library, a.name) then bestUnlocked = a.name end
	end
	return bestUnlocked
end

local function baMostCoinsArea(Library, cur)
	local score = {}
	local T = things()
	local Coins = T and T:FindFirstChild("Coins")
	if Coins then
		for _, coin in ipairs(Coins:GetChildren()) do
			local area = tostring(coinAttr(coin, "Area") or "")
			if area ~= "" then
				local h = coinAttr(coin, "Health") or 0
				if h > 0 then score[area] = (score[area] or 0) + h end
			end
		end
	end
	local best, bs = nil, -1
	for a, v in pairs(score) do
		if v > bs then best, bs = a, v end
	end
	if best then return best end
	local areas = progWorldAreas(Library, cur)
	return areas[1] and areas[1].name
end

task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		task.wait(2.5)
		if Config.AutoBestArea == true
			and Config.AutoWorldProgress ~= true
			and Config.AutoCompleteGame ~= true
			and not State.SwitchingWorld
		then
			local cur = nil
			pcall(function() cur = Library.WorldCmds.Get() end)
			if cur then
				local t = baTopUnlockedArea(Library, cur) or baMostCoinsArea(Library, cur)
				if t and Config.TargetArea ~= t then Config.TargetArea = t end
			end
		end
	end
end)

-- ========================================================================
-- AUTO GIFTS — claims every ready free gift on its refresh cycle
-- ========================================================================
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		task.wait(20)
		if Config.AutoGifts then
			pcall(function()
				local save = Library.Save.Get()
				if not save then return end
				local redeemed = save.FreeGiftsRedeemed or {}
				local claimed, ready = 0, 0
				for i, g in pairs(Library.Directory.FreeGifts or {}) do
					local idx = tonumber(i)
					if idx and type(g) == "table"
						and (tonumber(g.waitTime) or 0) <= (tonumber(save.FreeGiftsTime) or 0)
						and not table.find(redeemed, idx) then
						ready += 1
						-- Claimed one at a time, in order, and sequentially: the server
						-- returns (ok, message) and rejects a re-claim outright, so firing
						-- these in parallel only produced "already claimed" noise. No cap
						-- any more -- after the set's reset clock rolls over all 12 come
						-- back at once and every one of them should be taken in one pass.
						local ok, res = pcall(function()
							return select(1, Library.Network.Invoke("Redeem Free Gift", idx))
						end)
						if ok and res ~= false then claimed += 1 end
						task.wait(0.15)
					end
				end
				if claimed > 0 then
					pushNotify("Cope Hub", string.format("Playtime gifts: claimed %d of %d ready", claimed, ready), "gift")
				end
			end)
		end
	end
end)

-- ========================================================================
-- DIAMOND PACK AUTO-BUY — converts farmed currency into gems on a timer
-- ========================================================================
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		task.wait(1)
		if Config.AutoDiamondPacks then
			pcall(function()
				local p = AreaFarm._dpFind(Config.DiamondPackIndex)
				if not p then
					State.DPNote = "no pack picked"
					return
				end
				local save = Library.Save.Get()
				if not save then return end

				-- Terminal stops switch the toggle off, because both are budgets the user
				-- set deliberately and neither can un-meet itself. Running out of currency
				-- is NOT terminal -- the farm keeps earning, so that case just idles.
				-- A cap of 0 means unlimited: skipped entirely rather than compared against.
				local cap = math.clamp(math.floor(tonumber(Config.DiamondPackCap) or 0), 0, 1000)
				if cap > 0 and (State.DPBought or 0) >= cap then
					State.DPNote = string.format("cap reached (%d)", cap)
					Config.AutoDiamondPacks = false
					if AreaFarm._dpToggle then pcall(function() AreaFarm._dpToggle:Set(false, false) end) end
					pushNotify("Cope Hub", string.format("Diamond packs: stopped at the %d-buy cap (+%s Diamonds)", cap, abbrev(State.DPGained or 0)), "gem")
					return
				end
				local target = math.max(0, math.floor(tonumber(Config.DiamondPackTarget) or 0))
				local dia = tonumber(save.Diamonds) or 0
				if target > 0 and dia >= target then
					State.DPNote = "target met"
					Config.AutoDiamondPacks = false
					if AreaFarm._dpToggle then pcall(function() AreaFarm._dpToggle:Set(false, false) end) end
					pushNotify("Cope Hub", string.format("Diamond packs: hit the %s target", abbrev(target)), "gem")
					return
				end

				if (State.DPNextAt or 0) > os.clock() then return end

				local bal = tonumber(save[p.currency]) or 0
				-- Baseline is captured once per run so the reserve is a fixed floor. Taking
				-- the percentage of the *live* balance instead would shrink the floor as fast
				-- as the balance did, and never actually stop anything.
				if not State.DPBase then State.DPBase = bal end
				local pct = math.clamp(math.floor(tonumber(Config.DiamondPackReservePct) or 0), 0, 90)
				local floorAmt = math.floor((State.DPBase or bal) * pct / 100)
				if bal - p.cost < floorAmt then
					State.DPNote = (bal < p.cost) and "cannot afford" or string.format("at %d%% floor", pct)
					State.DPNextAt = os.clock() + 15 -- let the farm earn; re-check shortly
					return
				end

				local ok, err = AreaFarm._buyDiamondPack(Library, p.index)
				local interval = math.clamp(math.floor(tonumber(Config.DiamondPackInterval) or 5), 1, 60)
				State.DPNextAt = os.clock() + interval
				if ok then
					State.DPBought = (State.DPBought or 0) + 1
					State.DPGained = (State.DPGained or 0) + p.diamonds
					State.DPNote = string.format("bought #%d", p.index)
					pushNotify("Cope Hub", string.format("Pack #%d bought (%s) — +%s Diamonds",
						p.index, (cap > 0 and string.format("%d/%d", State.DPBought, cap) or commas(State.DPBought)),
						abbrev(p.diamonds)), "gem")
				else
					State.DPNote = tostring(err)
					-- A refusal is the server's verdict, not a transient miss, so back off
					-- harder than the normal interval rather than spinning on it.
					State.DPNextAt = os.clock() + math.max(interval, 10)
					if not State.DPErrShown then
						State.DPErrShown = true
						pushNotify("Cope Hub", "Diamond pack refused: " .. tostring(err), "triangle-alert")
					end
				end
			end)
		end
	end
end)

-- ========================================================================
-- POTION KEEPER — keeps boost potions stocked and active so you never run out
-- ========================================================================
local progFloorWarned = {}
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		task.wait(15)
		local picks = Config.PotionKeepBoosts
		if type(picks) == "table" and #picks > 0 then
			pcall(function()
				local save = Library.Save.Get()
				if not save then return end
				local now = 0
				pcall(function() now = tonumber(Library.Network.Invoke("Get OSTime")) or 0 end)
				local inv = save.BoostsInventory or {}
				local active = save.Boosts or {}
				local keep = tonumber(Config.PotionKeepStock) or 10
				local floor_ = tonumber(Config.PotionDiamondFloor) or 0
				for _, key in ipairs(picks) do
					local meta = nil
					for _, b in ipairs(AreaFarm.BOOSTS) do
						if b.key == key then meta = b break end
					end
					if meta then
						local have = tonumber(inv[key]) or 0
						local exp = tonumber(active[key]) or 0
						if Config.PotionAutoUse and have > 0 and exp <= now then
							pcall(function() Library.Network.Fire("Activate Boost", key) end)
							have -= 1
							pushNotify("Cope Hub", "Potion Keeper: activated " .. key, "flask")
						end
						local deficit = keep - have
						if deficit > 0 then
							local dia = tonumber(save.Diamonds) or 0
							local cost = deficit * (meta.price or 0)
							if dia - cost >= floor_ then
								local bought = select(1, AreaFarm._buyBoosts(key, math.min(deficit, 25), nil, { floor = floor_ }))
								if bought and bought > 0 then
									pushNotify("Cope Hub", string.format("Potion Keeper: +%dx %s", bought, key), "flask")
								end
							else
								progFloorWarned = progFloorWarned or {}
								if not progFloorWarned[key] then
									progFloorWarned[key] = true
									pushNotify("Cope Hub", "Potion Keeper: diamond floor hit, skipping " .. key, "triangle-alert")
									task.delay(300, function() progFloorWarned[key] = nil end)
								end
							end
						end
					end
				end
			end)
		end
	end
end)

-- ========================================================================
-- TRADE JOURNAL — diffs the server-side TradeHistory2 log into Discord
-- ========================================================================
local function tradeDescribe(e)
	if type(e) ~= "table" then return tostring(e) end
	local parts = {}
	for k, v in pairs(e) do
		if type(v) == "table" then
			local c, first = 0, nil
			for k2, v2 in pairs(v) do
				c += 1
				first = first or (tostring(k2) .. "=" .. (type(v2) == "table" and "?" or tostring(v2)))
			end
			parts[#parts + 1] = tostring(k) .. ": " .. c .. " item(s)" .. (first and (" — first: " .. first) or "")
		else
			parts[#parts + 1] = tostring(k) .. ": " .. tostring(v)
		end
	end
	if #parts == 0 then return "(empty entry)" end
	return table.concat(parts, "\n")
end

task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	while AreaFarm.Gen == myGen do
		task.wait(6)
		if Config.TradeJournal and Config.WebhookEnabled and Config.WebhookURL ~= "" then
			pcall(function()
				local save = Library.Save.Get()
				local hist = save and save.TradeHistory2
				if type(hist) ~= "table" then return end
				local n = #hist
				if State.TradeSeen == nil then
					State.TradeSeen = n
					return
				end
				if n > State.TradeSeen then
					for i = State.TradeSeen + 1, n do
						AreaFarm._notifyWebhook("Trade Completed", tradeDescribe(hist[i]), 0x22D3EE)
					end
					State.TradeSeen = n
				elseif n < State.TradeSeen then
					State.TradeSeen = n
				end
			end)
		end
	end
end)

-- periodic settings save (honors the Auto-Save toggle)
task.spawn(function()
	while AreaFarm.Gen == myGen do
		task.wait(5)
		if Config.AutoSaveSettings ~= false then
			local wrote = false
			pcall(function() wrote = AreaFarm.SaveSettings() end)
			if wrote and AreaFarm._refreshSaveStatus then
				pcall(AreaFarm._refreshSaveStatus)
			end
		end
	end
end)

-- apply persisted performance / afk settings shortly after boot
task.delay(2, function()
	applyShadows(Config.PerfNoShadows == true)
	applyTextures(Config.PerfTextures == true)
	applyParticles(Config.PerfParticles == true)
	applyPostFX(Config.PerfPostFX == true)
	applyHidePlayers(Config.PerfHidePlayers == true)
	AreaFarm._setAntiAFK(Config.AntiAFK ~= false)
	AreaFarm._setDisablePopups(Config.DisablePopups == true)
	-- Background Mode is deliberately NOT restored from the save here. It is the
	-- one setting that can leave a blank window, and re-applying it two seconds
	-- into a fresh load -- before the user has seen the hub, and possibly before
	-- they remember it was on -- reads as a broken client. The "only while hidden"
	-- rule brings it back on its own the first time the hub is hidden, which is
	-- the case that actually matters overnight.
	if Config.BgMode == true then
		Config.BgMode = false
		if Config.BgAuto ~= true then
			pushNotify("Cope Hub", "Background Mode starts off after a load — turn it back on, or use \"Only While The Hub Is Hidden\"", "info")
		end
	end
end)

-- ========================================================================
-- FLOATING STATS WIDGET — pinned above the game's Hoverboard button
-- ========================================================================
AreaFarm._destroyWidget = nil
do
	local built = false

	function AreaFarm.BuildWidget()
		if built then return end
		built = true
		task.spawn(function()
			-- Host the widget in Main.Left, NOT in Tools: Tools is UIListLayout-managed,
			-- so any extra GuiObject there shoves Hoverboard/Teleport/AutoSettings around.
			local host = nil
			for _ = 1, 120 do
				local ok, res = pcall(function()
					return Players.LocalPlayer.PlayerGui.Main.Left
				end)
				if ok and res then host = res break end
				task.wait(0.5)
			end
			if not host or not host.Parent then return end
			local hb = nil
			for _ = 1, 60 do
				hb = host:FindFirstChild("Tools") and host.Tools:FindFirstChild("Hoverboard")
				if hb then break end
				task.wait(0.5)
			end
			if not hb then return end
			if AreaFarm.Gen ~= myGen then return end

			local gui = New("Frame", {
				Name = "CopeHubStats", BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Parent = host,
			})

			local anchor = New("Frame", {
				Name = "Anchor", BackgroundTransparency = 1,
				Size = UDim2.fromOffset(46, 46),
				Position = UDim2.fromOffset(0, 0),
				Parent = gui,
			})
			local btn = New("TextButton", {
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Theme.Bg,
				BackgroundTransparency = 0.08,
				Text = "", AutoButtonColor = false,
				ZIndex = 900, Parent = anchor,
			})
			Corner(14, btn)
			New("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new(Theme.Element, Theme.Bg),
				Parent = btn,
			})
			local ring = CopeUI.markAccent(Stroke(Theme.Accent, 0.15, 2, btn), "Color")
			local ringGrad = New("UIGradient", {
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Theme.Accent),
					ColorSequenceKeypoint.new(0.5, Theme.Accent2),
					ColorSequenceKeypoint.new(1, Theme.Accent),
				}),
				Parent = ring,
			})
			CopeUI.markAccent(ringGrad, "grad")
			local gloss = New("Frame", {
				Position = UDim2.new(0, 6, 0, 3), Size = UDim2.new(1, -12, 0, 12),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 0.88, BorderSizePixel = 0,
				ZIndex = 901, Parent = btn,
			})
			Corner(999, gloss)
			local glyph = New("TextLabel", {
				Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
				Font = Enum.Font.GothamBlack, Text = "C", TextSize = 20,
				TextColor3 = Theme.Text, ZIndex = 902, Parent = btn,
			})
			New("UIGradient", {
				Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Theme.Accent2),
				Rotation = 115, Parent = glyph,
			})
			local pulse = New("UIScale", { Scale = 1, Parent = btn })

			task.spawn(function()
				while gui.Parent do
					ringGrad.Rotation = (os.clock() * 120) % 360
					pulse.Scale = 1 + math.sin(os.clock() * 2.2) * 0.025
					task.wait(0.05)
				end
			end)

			btn.MouseEnter:Connect(function()
				TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundTransparency = 0 }):Play()
				TweenService:Create(pulse, TweenInfo.new(0.15), { Scale = 1.06 }):Play()
			end)
			btn.MouseLeave:Connect(function()
				TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundTransparency = 0.08 }):Play()
				TweenService:Create(pulse, TweenInfo.new(0.2), { Scale = 1 }):Play()
			end)
			btn.MouseButton1Down:Connect(function()
				TweenService:Create(pulse, TweenInfo.new(0.08), { Scale = 0.94 }):Play()
			end)
			btn.MouseButton1Up:Connect(function()
				TweenService:Create(pulse, TweenInfo.new(0.1), { Scale = 1 }):Play()
			end)

			-- stats panel: slides out to the RIGHT of the button so it never
			-- covers the tools stack or run off the top of the screen
			local PANEL_W, PANEL_H = 178, 206
			local panel = New("Frame", {
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(1, 12, 0.5, 0),
				Size = UDim2.fromOffset(PANEL_W, PANEL_H),
				BackgroundColor3 = Theme.Surface,
				Visible = false,
				BorderSizePixel = 0, ZIndex = 950, Parent = anchor,
			})
			Corner(14, panel)
			Stroke(Theme.Stroke, 0.3, 1, panel)
			local panelScale = New("UIScale", { Scale = 0.92, Parent = panel })

			local header = New("Frame", {
				Position = UDim2.new(0, 12, 0, 10), Size = UDim2.new(1, -24, 0, 18),
				BackgroundTransparency = 1, ZIndex = 951, Parent = panel,
			})
			New("TextLabel", {
				Size = UDim2.new(1, -14, 1, 0), BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold, TextSize = 12, RichText = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = '<font color="#8B5CF6">COPE</font> <font color="#22D3EE">HUB</font>',
				ZIndex = 952, Parent = header,
				 })
			local dot = New("Frame", { -- live dot
				AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0),
				Size = UDim2.fromOffset(7, 7), BackgroundColor3 = Color3.fromRGB(74, 222, 128),
				BorderSizePixel = 0, ZIndex = 952, Parent = header,
			})
			Corner(999, dot)
			Stroke(Color3.fromRGB(74, 222, 128), 0.5, 1, dot)

			local divider = New("Frame", { -- gradient divider
				Position = UDim2.new(0, 12, 0, 34), Size = UDim2.new(1, -24, 0, 1),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.85,
				BorderSizePixel = 0, ZIndex = 951, Parent = panel,
			})
			CopeUI.markAccent(New("UIGradient", {
				Color = ColorSequence.new(Theme.Accent, Theme.Accent2),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0.2),
					NumberSequenceKeypoint.new(0.5, 0.5),
					NumberSequenceKeypoint.new(1, 0.95),
				}),
				Parent = divider,
			}), "grad")

			local rowsHolder = New("Frame", {
				Position = UDim2.new(0, 12, 0, 42), Size = UDim2.new(1, -24, 1, -50),
				BackgroundTransparency = 1, ZIndex = 951, Parent = panel,
			})
			New("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder, Parent = rowsHolder })
			local GREEN, YELLOW, RED = Color3.fromRGB(74, 222, 128), Color3.fromRGB(251, 191, 36), Color3.fromRGB(248, 113, 113)
			local rowDefs = {
				{ key = "fps",     label = "FPS",             color = function(v) return v end },
				{ key = "ping",    label = "Ping",            color = function(v) return v end },
				{ key = "session", label = "Session" },
				{ key = "eggs",    label = "Eggs Hatched" },
				{ key = "huges",   label = "Huges Hatched" },
				{ key = "dia",     label = "Diamonds Earned", fixed = Theme.Accent2 },
			}
			local valueLabels = {}
			for i, def in ipairs(rowDefs) do
				local r = New("Frame", {
					Size = UDim2.new(1, 0, 0, 25), BackgroundColor3 = Theme.Bg,
					BackgroundTransparency = 0.55, BorderSizePixel = 0,
					ZIndex = 951, LayoutOrder = i, Parent = rowsHolder,
				})
				Corner(8, r)
				New("TextLabel", {
					Position = UDim2.new(0, 9, 0, 0), Size = UDim2.new(0.6, -9, 1, 0), BackgroundTransparency = 1,
					Font = Enum.Font.GothamMedium, TextSize = 11, TextColor3 = Theme.SubText,
					TextXAlignment = Enum.TextXAlignment.Left, Text = def.label, ZIndex = 952, Parent = r,
				})
				valueLabels[def.key] = New("TextLabel", {
					AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -9, 0, 0),
					Size = UDim2.new(0.4, -9, 1, 0), BackgroundTransparency = 1,
					Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = Theme.Text,
					TextXAlignment = Enum.TextXAlignment.Right, Text = "-", ZIndex = 952, Parent = r,
				})
			end

			local open = false
			local function refreshPanel()
				pcall(function()
					local fps = CopeUI.FPS
					valueLabels.fps.Text = tostring(fps)
					valueLabels.fps.TextColor3 = (fps >= 50 and GREEN) or (fps >= 30 and YELLOW) or RED
					local ping = CopeUI.Ping
					valueLabels.ping.Text = ping .. " ms"
					valueLabels.ping.TextColor3 = (ping <= 90 and GREEN) or (ping <= 170 and YELLOW) or RED
					valueLabels.session.TextColor3 = Theme.Text
					valueLabels.session.Text = timeStr(math.floor(os.clock() - CopeUI.T0))
					valueLabels.eggs.TextColor3 = Theme.Text
					valueLabels.eggs.Text = commas(Stats.Eggs)
					valueLabels.huges.TextColor3 = Theme.Text
					valueLabels.huges.Text = commas(Stats.Huges)
					valueLabels.dia.TextColor3 = Theme.Accent2
					local dia = State.PendingData and State.PendingData.Diamonds
					if dia and State.DiaStart then
						valueLabels.dia.Text = abbrev(dia - State.DiaStart)
					else
						valueLabels.dia.Text = "-"
					end
				end)
			end
			btn.Activated:Connect(function()
				open = not open
				if open then
					refreshPanel()
					panel.Visible = true
					panelScale.Scale = 0.92
					TweenService:Create(panelScale, TweenInfo.new(0.24, Enum.EasingStyle.Back), { Scale = 1 }):Play()
				else
					TweenService:Create(panelScale, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0.9 }):Play()
					task.delay(0.16, function() if not open then panel.Visible = false end end)
				end
			end)

			-- follow the hoverboard button in case the game re-lays-out the tools stack
			uiconn(RunService.Heartbeat, function()
				if not hb.Parent or not host.Parent then return end
				anchor.Position = UDim2.fromOffset(
					math.floor(hb.AbsolutePosition.X - host.AbsolutePosition.X),
					math.floor(hb.AbsolutePosition.Y - host.AbsolutePosition.Y) - 61
				)
			end)
			task.spawn(function()
				while gui.Parent and AreaFarm.Gen == myGen do
					if open then refreshPanel() end
					task.wait(0.5)
				end
			end)

			AreaFarm._destroyWidget = function()
				pcall(function() gui:Destroy() end)
				built = false
			end
		end)
	end

	task.spawn(function()
		AreaFarm.BuildWidget()
	end)
end

-- Dynamic dropdowns (rebuilt when the worker's data changes)
local Elements = { Area = nil, World = nil, Egg = nil, IndexWorlds = nil }
local EggValueMap = {}

local function buildAreaDropdown(d)
	if Elements.Area then Elements.Area:Destroy() end
	local values = d.Areas
	if #values == 0 then return end
	table.insert(values, 1, "None")
	if Config.TargetArea ~= nil and not table.find(values, Config.TargetArea) then
		Config.TargetArea = d.DefaultArea or values[#values]
	end
	Elements.Area = CopeUI.pin(FarmTab:Dropdown({
		Title = "Target Area",
		Desc = "Your unlocked areas (live); None idles the farm",
		Values = values,
		Value = Config.TargetArea or "None",
		Callback = function(v)
			Config.TargetArea = (v == "None") and nil or v
		end,
	}), AreaSlot)
end

local function buildWorldDropdown(d)
	if Elements.World then Elements.World:Destroy() end
	local values = d.Worlds
	if #values == 0 then return end
	if not Config.World or not table.find(values, Config.World) then
		Config.World = d.World or values[1]
	end
	Elements.World = CopeUI.pin(FarmTab:Dropdown({
		Title = "World (in: " .. tostring(d.World) .. ")",
		Desc = "Switch worlds; farming resumes after load",
		Values = values,
		Value = Config.World,
		Callback = function(v) Config.World = v end,
	}), WorldSlot)
end

-- Which worlds the index completes. Multi-select over the worlds you can reach,
-- in the game's own world order. The worker visits each selected world and hatches
-- every egg in it until the Collection owes those eggs nothing.
local function buildIndexWorldsDropdown(d)
	if Elements.IndexWorlds then Elements.IndexWorlds:Destroy() end
	local values = d.Worlds
	if #values == 0 then return end
	local sel = {}
	for _, w in ipairs(Config.IndexWorlds or {}) do
		if table.find(values, w) then table.insert(sel, w) end
	end
	if #sel == 0 then
		-- Seed with the world the farm is already in, so the first open lands on
		-- somewhere reachable; fall back to the first in the list.
		local seed = (d.World and table.find(values, d.World) and d.World) or values[1]
		sel = { seed }
	end
	Config.IndexWorlds = sel
	Elements.IndexWorlds = CopeUI.pin(IndexTab:Dropdown({
		Title = "Worlds To Complete",
		Desc = "Every variant of every pet from every egg in each selected world gets completed — Normal from the egg, Golden/Rainbow via the machines, Dark Matter via conversion. Cheapest egg first, retried across laps until done.",
		Values = values,
		Multi = true,
		AllowNone = true,
		Value = sel,
		Callback = function(v)
			Config.IndexWorlds = type(v) == "table" and v or (v ~= nil and { v } or {})
		end,
	}), IndexWorldSlot)
end

local function buildEggDropdown(d)
	if Elements.Egg then Elements.Egg:Destroy() end
	EggValueMap = {}
	local values = {}
	for _, e in ipairs(d.Eggs) do
		local label = string.format("%s — %s %s", e.name, abbrev(e.cost), e.currency)
		if EggValueMap[label] then label = label .. " [" .. e.key .. "]" end
		EggValueMap[label] = e.key
		table.insert(values, label)
	end
	if #values == 0 then
		Config.EggKey = nil
		return
	end
	local exists = false
	for _, e in ipairs(d.Eggs) do
		if e.key == Config.EggKey then exists = true break end
	end
	if not exists then Config.EggKey = d.Eggs[1].key end
	local selectedLabel = nil
	for label, key in pairs(EggValueMap) do
		if key == Config.EggKey then selectedLabel = label break end
	end
	Elements.Egg = CopeUI.pin(EggTab:Dropdown({
		Title = "Egg (current world, sorted by price)",
		Values = values,
		Value = selectedLabel,
		Callback = function(v)
			Config.EggKey = EggValueMap[v]
			AreaFarm.State.EggTpDone = nil
		end,
	}), EggSlot)
end

local function buildDMDropdown(list)
	if DMDropdown then DMDropdown:Destroy() end
	DMValueMap = {}
	local values = {}
	for _, g in ipairs(list or {}) do
		local label = string.format("%s ×%d", g.name or g.id, g.count)
		if DMValueMap[label] then label = label .. " [" .. tostring(g.id) .. "]" end
		DMValueMap[label] = g.id
		table.insert(values, label)
	end
	if #values == 0 then
		Config.DarkMatterKey = nil
		DMDropdown = CopeUI.pin(VariantTab:Dropdown({
			Title = "Rainbow Pet To Convert",
			Desc = "No eligible Rainbow pets found in your inventory",
			Values = { "None" },
			Value = "None",
			Callback = function() end,
		}), DMSlot)
		AreaFarm._dmDropdown = DMDropdown
		return
	end
	local exists = false
	if Config.DarkMatterKey then
		for _, g in ipairs(list or {}) do
			if g.id == Config.DarkMatterKey then exists = true break end
		end
	end
	if not exists then Config.DarkMatterKey = list[1].id end
	local selectedLabel = nil
	for label, k in pairs(DMValueMap) do
		if k == Config.DarkMatterKey then selectedLabel = label break end
	end
	DMDropdown = CopeUI.pin(VariantTab:Dropdown({
		Title = "Rainbow Pet To Convert",
		Desc = "Which Rainbow pet becomes Dark Matter (auto-populates from your inventory)",
		Values = values,
		Value = selectedLabel,
		Callback = function(v)
			Config.DarkMatterKey = DMValueMap[v]
		end,
	}), DMSlot)
	AreaFarm._dmDropdown = DMDropdown
end

local function buildGiftDropdown(list)
	if GiftDropdown then GiftDropdown:Destroy() end
	GiftValueMap = {}
	local values = {}
	for _, g in ipairs(list or {}) do
		local label = g.name or g.id
		if GiftValueMap[label] then label = label .. " [" .. tostring(g.id) .. "]" end
		GiftValueMap[label] = g.id
		table.insert(values, label)
	end
	if #values == 0 then
		Config.GiftKey = nil
		GiftDropdown = CopeUI.pin(GiftTab:Dropdown({
			Title = "Gift To Open",
			Desc = "No gift types found in this game",
			Values = { "None" },
			Value = "None",
			Callback = function() end,
		}), GiftSlot)
		AreaFarm._giftDropdown = GiftDropdown
		return
	end
	-- default: prefer a Halloween gift, else the first one
	local exists = false
	if Config.GiftKey then
		for _, g in ipairs(list) do if g.id == Config.GiftKey then exists = true break end end
	end
	if not exists then
		Config.GiftKey = nil
		for _, g in ipairs(list) do
			local hay = string.lower(tostring(g.id) .. " " .. tostring(g.name))
			if string.find(hay, "halloween", 1, true) then Config.GiftKey = g.id break end
		end
		if not Config.GiftKey then Config.GiftKey = list[1].id end
	end
	local selectedLabel = nil
	for label, k in pairs(GiftValueMap) do if k == Config.GiftKey then selectedLabel = label break end end
	GiftDropdown = CopeUI.pin(GiftTab:Dropdown({
		Title = "Gift To Open",
		Desc = "Which gift type to bulk-open (auto-populates from the game's gift list)",
		Values = values,
		Value = selectedLabel,
		Callback = function(v)
			Config.GiftKey = GiftValueMap[v]
			State.GiftErrShown = false
		end,
	}), GiftSlot)
	AreaFarm._giftDropdown = GiftDropdown
end

local function dataSig(d)
	local parts = {}
	for _, a in ipairs(d.Areas) do table.insert(parts, a) end
	table.insert(parts, "#")
	for _, w in ipairs(d.Worlds) do table.insert(parts, w) end
	table.insert(parts, "#")
	for _, e in ipairs(d.Eggs) do table.insert(parts, e.key .. ":" .. e.cost) end
	table.insert(parts, "#")
	table.insert(parts, tostring(d.World))
	return table.concat(parts, "|")
end

local function applyData(d)
	buildAreaDropdown(d)
	buildWorldDropdown(d)
	buildIndexWorldsDropdown(d)
	buildEggDropdown(d)
end

-- Main loop: stats subtitle, notification pump, dropdown refresh
-- (spawned so this chunk returns — reload-safe)

-- One-time populate of the gift-type dropdown (gift types are static in the
-- Directory, so this runs once when the Library is ready).
task.spawn(function()
	while AreaFarm.Gen == myGen and not AreaFarm.Library do task.wait(0.5) end
	local Library = AreaFarm.Library
	if not Library then return end
	local seen, list = {}, {}
	for _, d in pairs(Library.Directory.Pets or {}) do
		if type(d) == "table" and d.isGift and d.giftEggId then
			local id = tostring(d.giftEggId)
			if not seen[id] then
				seen[id] = true
				list[#list + 1] = { id = id, name = tostring(d.name or id) }
			end
		end
	end
	table.sort(list, function(a, b) return tostring(a.name) < tostring(b.name) end)
	State.GiftList = list
	State.GiftListVersion += 1
end)

task.spawn(function()
	while AreaFarm.Gen == myGen do
		task.wait(1)
		pcall(function()
			Window:SetAuthor(string.format(
				"Coins: %d | Dmg: %s | Eggs: %d | Huges: %d | Orbs: %d | Bags: %d%s%s",
				Stats.Coins, abbrev(Stats.Damage), Stats.Eggs, Stats.Huges, Stats.Orbs, Stats.Bags,
				Stats.ExEggsOpened > 0 and (" | ExOpened: " .. Stats.ExEggsOpened) or "",
				Stats.DMMade > 0 and (" | DM: " .. Stats.DMMade) or ""
			))
		end)
		if updateBoostDisplays and not State.BoostBusy then
			pcall(updateBoostDisplays)
		end
		if State.UIVisible and AreaFarm._refreshStatTiles then
			pcall(AreaFarm._refreshStatTiles)
		end
		if State.UIVisible then
			if AreaFarm._refreshPlayTiles then pcall(AreaFarm._refreshPlayTiles) end
			if AreaFarm._refreshBatchTiles then pcall(AreaFarm._refreshBatchTiles) end
			if AreaFarm._refreshDPTiles then pcall(AreaFarm._refreshDPTiles) end
			if AreaFarm._refreshStabTiles then pcall(AreaFarm._refreshStabTiles) end
			if AreaFarm._refreshBgTiles then pcall(AreaFarm._refreshBgTiles) end
		end
		if Stats.Deleted > 0 and Stats.Deleted % 25 == 0 then
			pushNotify("Cope Hub", "Auto-deleted " .. Stats.Deleted .. " pet" .. (Stats.Deleted == 1 and "" or "s"), "trash-2")
		end
		if State.NativeDeleteImport and not State.NativeDeleteApplied then
			State.NativeDeleteApplied = true
			pcall(function()
				for _, r in ipairs(PSX_RARITIES) do
					local on = State.NativeDeleteImport[r] == true
					Config.DeleteRarities[r] = on or nil
					if RarityToggles[r] then RarityToggles[r]:Set(on, false, true) end
				end
			end)
		end
		if FilterToggle then
			pcall(function()
				local armed = {}
				for _, r in ipairs(PSX_RARITIES) do
					if Config.DeleteRarities[r] then table.insert(armed, r) end
				end
				local keep = {}
				for _, r in ipairs(PSX_RARITIES) do
					local kv = Config.KeepVariants[r]
					if kv and #kv > 0 then table.insert(keep, r .. "=" .. table.concat(kv, "/")) end
				end
				table.sort(keep, function(a, b) return tostring(a) < tostring(b) end)
				local keepTxt = #keep > 0 and table.concat(keep, ", ") or "none"
				local armedTxt = #armed > 0 and table.concat(armed, ", ") or "none"
				FilterToggle:SetTitle(string.format(
					"Auto-Delete Filter — %s | Keep: %s | %s",
					armedTxt, keepTxt,
					Config.AutoDeleteFilter and "ON" or "OFF"
				))
			end)
		end

		if TradeToggle then
			pcall(function()
				TradeToggle:SetTitle(string.format("Auto Trade Huges — Done: %d (%s)", State.TradesDone, State.TradeStatus or "idle"))
			end)
		end
		if EnchantToggle then
			pcall(function()
				EnchantToggle:SetTitle(string.format("Auto Enchant — Rolls: %d | Done: %d%s",
					Stats.EnchantRolls, Stats.EnchantDone,
					Config.AutoEnchant and (" (" .. (State.EnchantNote or "running") .. ")") or ""))
			end)
		end
		if State.DMPetsVersion ~= State.DMPetsApplied then
			State.DMPetsApplied = State.DMPetsVersion
			pcall(buildDMDropdown, State.DMPets or {})
		end
		if State.GiftListVersion ~= State.GiftListApplied then
			State.GiftListApplied = State.GiftListVersion
			pcall(buildGiftDropdown, State.GiftList or {})
		end
		if GiftToggle then
			pcall(function()
				GiftToggle:SetTitle(string.format("Auto Open Gifts (continuous) — Opened: %d (%s)",
					Stats.GiftsOpened, State.GiftNote or "idle"))
			end)
		end
		if GoldenToggle then
			pcall(function()
				GoldenToggle:SetTitle(string.format("Auto Make Golden (100%%) — Made: %d (%s)",
					Stats.GoldenMade, State.GoldenNote or "idle"))
			end)
		end
		if RainbowToggle then
			pcall(function()
				RainbowToggle:SetTitle(string.format("Auto Make Rainbow (100%%) — Made: %d (%s)",
					Stats.RainbowMade, State.RainbowNote or "idle"))
			end)
		end
		if IndexToggle then
			pcall(function()
				local have, total = State.IndexHave or 0, State.IndexTotal or 0
				IndexToggle:SetTitle(string.format("Auto Index Collection — %d/%d entries | +%d this run%s",
					have, total, Stats.IndexNew,
					Config.AutoIndex and (" (" .. (State.IndexNote or "running") .. ")") or ""))
			end)
		end
	while #State.NotifyQueue > 0 do
		local n = table.remove(State.NotifyQueue, 1)
		pcall(function()
			CopeUI.Notify({ Title = n.Title, Content = n.Content, Duration = 3, Icon = n.Icon })
		end)
	end
	local d = State.PendingData
	if d and State.DataVersion ~= State.AppliedVersion then
		local sig = dataSig(d)
		if sig ~= State.LastSig then
			State.LastSig = sig
			pcall(applyData, d)
		elseif Elements.World then
			pcall(function() Elements.World:SetTitle("World (in: " .. tostring(d.World) .. ")") end)
		end
		State.AppliedVersion = State.DataVersion
	end
end
end)
