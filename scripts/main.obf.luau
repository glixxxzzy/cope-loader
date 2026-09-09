local a = {}
local g = function(b, c)
  if (((1 + 1) == 2) and a[b]) then
    return a[b]
  end
  local d = {}
  for e = 1, #b do
    d[e] = string.char(bit32.bxor(b[e], c))
  end
  local f = table.concat(d)
  a[b] = f
  return f
end
local Players = game:GetService(g({10, 54, 59, 35, 63, 40, 41}, 90))
local h = game:GetService(g({8, 63, 42, 54, 51, 57, 59, 46, 63, 62, 9, 46, 53, 40, 59, 61, 63}, 90))
local i = game:GetService(g({18, 46, 46, 42, 9, 63, 40, 44, 51, 57, 63}, 90))
local j = getgenv().AreaFarm
if (((15 * 15) == 225) and (j and (type(j._stop) == g({60, 47, 52, 57, 46, 51, 53, 52}, 90)))) then
  pcall(j._stop)
end
local k = {Config = {AutoFarm = false, TargetArea = nil, World = nil, MaxDistance = 0, FireDelay = 0.05, LeaveOnBreak = true, AutoEggs = false, EggKey = nil, EggAmount = 3, SkipAnim = true, HatchDelay = 0.8, EggStay = false, MultiTargets = 3, FarmAllArea = false, StrongestOnly = false, SafeFireRate = 100, AutoOrbs = false, AutoBags = false, MagnetOrbs = false, MagnetBags = false, WebhookURL = "", WebhookEnabled = false, BoostKey = g({14, 40, 51, 42, 54, 63, 122, 25, 53, 51, 52, 41}, 90), BoostAmount = 1, BoostUseAmount = 1, AutoDeleteExclusives = false, AutoOpenExclusive = false, ExclusiveOpenDelay = 1, AutoDeleteFilter = false, DeleteRarities = {}, KeepVariants = {}, ProtectHugeTitanic = true, AutoTradeHuges = false, TradeTarget = "", PerfNoShadows = false, PerfTextures = false, PerfParticles = false, PerfHidePlayers = false, HideOrbs = false, HideLootbags = false, HideBreakables = false, HideBreakFx = true, DebrisSweep = true, DebrisSweepSecs = 20, KillIdleTracker = true, MemGuard = true, MemGuardMb = 2600, MemRejoinHours = 0, StabilityV = 0, LeakGuard = true, LeakPurgeSecs = 30, NoRejoin = true, BgMode = false, BgAuto = false, BgFpsCap = 30, BgRender3D = true, AntiAFK = true, AutoRejoin = true, HotkeyName = g({8, 51, 61, 50, 46, 9, 50, 51, 60, 46}, 90), DisablePopups = false, AutoBestArea = true, AutoWorldProgress = false, AutoCompleteGame = false, ACGResumeFarm = nil, AutoGifts = false, PotionKeepStock = 10, PotionDiamondFloor = 100000, PotionKeepBoosts = {g({14, 40, 51, 42, 54, 63, 122, 25, 53, 51, 52, 41}, 90)}, PotionAutoUse = true, AutoEnchant = false, EnchantDesired = {}, EnchantBatch = 10, EnchantDiamondFloor = 0, EnchantSkipLocked = true, DarkMatterKey = nil, AutoDarkMatter = false, DMAutoSkip = true, DMDiamondFloor = 5000000, AutoOpenGifts = false, GiftKey = nil, GiftDeleteNormal = true, GiftDeleteGolden = false, GiftDeleteRainbow = false, GiftBatchEnabled = false, GiftBatchMinutes = 15, GiftBatchCount = 25, DiamondPackIndex = nil, AutoDiamondPacks = false, DiamondPackInterval = 5, DiamondPackCap = 0, DiamondPackReservePct = 0, DiamondPackTarget = 0, AutoGolden = false, AutoRainbow = false, MachineDiamondFloor = 0, AutoIndex = false, IndexWorlds = {}, IndexHatchAmount = 3, IndexUseMachines = true, IndexForceSkipDM = true, IndexDiamondFloor = 0, IndexEggCap = 0, IndexEggPatience = 600, IndexHatchDelay = 1.2, IndexGoldenEggs = true, KickAlert = true, TradeJournal = false, AutoSaveSettings = true, Accent1 = g({98, 24, 111, 25, 28, 108}, 90), Accent2 = g({104, 104, 30, 105, 31, 31}, 90), UIBgStyle = g({27, 47, 40, 53, 40, 59}, 90), UIBgPreset = g({23, 51, 62, 52, 51, 61, 50, 46}, 90), UIBgIntensity = 100, UIAnimSpeed = 100, UIMotion = true, UIScale = 100, UIBlur = false, PerfPostFX = false, PerfMaxMode = false}, Stats = {Coins = 0, Damage = 0, Eggs = 0, Orbs = 0, Bags = 0, Huges = 0, Deleted = 0, ExEggsOpened = 0, EnchantRolls = 0, EnchantDone = 0, DMMade = 0, GiftsOpened = 0, GoldenMade = 0, RainbowMade = 0, IndexNew = 0}, State = {Ready = false, DataVersion = 0, AppliedVersion = 0, PendingData = nil, SwitchingWorld = false, OpenEggConns = nil, OpenEggDisabled = false, NotifyQueue = {}, EggErrorShown = false, LastSig = nil, WebhookHooked = false, HatchesSeen = 0, BoostBusy = false, DeleteScanning = false, DeleteQueue = {}, DeleteBusy = false, PetAddedHooked = false, BlockingHuges = {}, ExclusivePaused = false, TradeBusy = false, TradeId = nil, TradeResult = nil, TradeStatus = g({51, 62, 54, 63}, 90), TradeHooks = false, TradesDone = 0, DMBusy = false, DMPets = nil, DMPetsVersion = 0, DMPetsApplied = -1, DMSig = nil, GiftTrashIds = nil, GiftNote = g({51, 62, 54, 63}, 90), GiftList = nil, GiftListVersion = 0, GiftListApplied = -1, GiftBusy = false, GiftErrShown = false, GiftDeleteArmed = false, GiftBatchNote = g({53, 60, 60}, 90), GiftBatchRuns = 0, GiftBatchNextAt = 0, GiftBatchLastAt = 0, GiftBatchMinsUsed = 0, GoldenBusy = false, RainbowBusy = false, GoldenNote = g({51, 62, 54, 63}, 90), RainbowNote = g({51, 62, 54, 63}, 90), GoldenErrShown = false, RainbowErrShown = false, GoldenIdleNotified = false, RainbowIdleNotified = false, MachineBrokeNotified = false, IndexBusy = false, IndexNote = g({53, 60, 60}, 90), IndexEgg = nil, IndexWorld = nil, IndexTargets = nil, IndexTotal = 0, IndexCollection = nil, IndexHave = 0, IndexNeedIds = nil, IndexNoProtect = false, IndexFullNotified = false, IndexKeepUids = nil, IndexKeepAt = 0, IndexKeepBusy = false, IndexGoldenActive = false, OctupleWarned = false, DMIdleNotified = false, DMFullNotified = false, DMBrokeNotified = false, DMErrShown = false, UIVisible = false, DiaStart = nil, RebindWaiting = false, LastIdleSpoof = nil, RejoinedOnce = false}, Library = nil, Window = nil, Gen = 0}
local l, m, n = k.Config, k.Stats, k.State
local o = k.Gen
getgenv().AreaFarm = k
k.BUILD = g({104, 106, 104, 108, 119, 106, 99, 119, 106, 104, 119, 41, 46, 59, 56, 51, 54, 51, 46, 35}, 90)
getgenv().AreaFarmBuild = k.BUILD
local p = {g({27, 47, 46, 53, 28, 59, 40, 55}, 90), g({14, 59, 40, 61, 63, 46, 27, 40, 63, 59}, 90), g({13, 53, 40, 54, 62}, 90), g({23, 59, 34, 30, 51, 41, 46, 59, 52, 57, 63}, 90), g({28, 51, 40, 63, 30, 63, 54, 59, 35}, 90), g({22, 63, 59, 44, 63, 21, 52, 24, 40, 63, 59, 49}, 90), g({27, 47, 46, 53, 31, 61, 61, 41}, 90), g({31, 61, 61, 17, 63, 35}, 90), g({31, 61, 61, 27, 55, 53, 47, 52, 46}, 90), g({9, 49, 51, 42, 27, 52, 51, 55}, 90), g({18, 59, 46, 57, 50, 30, 63, 54, 59, 35}, 90), g({31, 61, 61, 9, 46, 59, 35}, 90), g({27, 47, 46, 53, 21, 40, 56, 41}, 90), g({27, 47, 46, 53, 24, 59, 61, 41}, 90), g({23, 59, 61, 52, 63, 46, 21, 40, 56, 41}, 90), g({23, 59, 61, 52, 63, 46, 24, 59, 61, 41}, 90), g({23, 47, 54, 46, 51, 14, 59, 40, 61, 63, 46, 41}, 90), g({28, 59, 40, 55, 27, 54, 54, 27, 40, 63, 59}, 90), g({9, 46, 40, 53, 52, 61, 63, 41, 46, 21, 52, 54, 35}, 90), g({9, 59, 60, 63, 28, 51, 40, 63, 8, 59, 46, 63}, 90), g({13, 63, 56, 50, 53, 53, 49, 15, 8, 22}, 90), g({13, 63, 56, 50, 53, 53, 49, 31, 52, 59, 56, 54, 63, 62}, 90), g({24, 53, 53, 41, 46, 17, 63, 35}, 90), g({24, 53, 53, 41, 46, 27, 55, 53, 47, 52, 46}, 90), g({24, 53, 53, 41, 46, 15, 41, 63, 27, 55, 53, 47, 52, 46}, 90), g({27, 47, 46, 53, 30, 63, 54, 63, 46, 63, 31, 34, 57, 54, 47, 41, 51, 44, 63, 41}, 90), g({27, 47, 46, 53, 21, 42, 63, 52, 31, 34, 57, 54, 47, 41, 51, 44, 63}, 90), g({31, 34, 57, 54, 47, 41, 51, 44, 63, 21, 42, 63, 52, 30, 63, 54, 59, 35}, 90), g({27, 47, 46, 53, 30, 63, 54, 63, 46, 63, 28, 51, 54, 46, 63, 40}, 90), g({30, 63, 54, 63, 46, 63, 8, 59, 40, 51, 46, 51, 63, 41}, 90), g({17, 63, 63, 42, 12, 59, 40, 51, 59, 52, 46, 41}, 90), g({10, 40, 53, 46, 63, 57, 46, 18, 47, 61, 63, 14, 51, 46, 59, 52, 51, 57}, 90), g({27, 47, 46, 53, 14, 40, 59, 62, 63, 18, 47, 61, 63, 41}, 90), g({14, 40, 59, 62, 63, 14, 59, 40, 61, 63, 46}, 90), g({10, 63, 40, 60, 20, 53, 9, 50, 59, 62, 53, 45, 41}, 90), g({10, 63, 40, 60, 14, 63, 34, 46, 47, 40, 63, 41}, 90), g({10, 63, 40, 60, 10, 59, 40, 46, 51, 57, 54, 63, 41}, 90), g({10, 63, 40, 60, 18, 51, 62, 63, 10, 54, 59, 35, 63, 40, 41}, 90), g({10, 63, 40, 60, 10, 53, 41, 46, 28, 2}, 90), g({10, 63, 40, 60, 23, 59, 34, 23, 53, 62, 63}, 90), g({18, 51, 62, 63, 21, 40, 56, 41}, 90), g({18, 51, 62, 63, 22, 53, 53, 46, 56, 59, 61, 41}, 90), g({18, 51, 62, 63, 24, 40, 63, 59, 49, 59, 56, 54, 63, 41}, 90), g({18, 51, 62, 63, 24, 40, 63, 59, 49, 28, 34}, 90), g({30, 63, 56, 40, 51, 41, 9, 45, 63, 63, 42}, 90), g({30, 63, 56, 40, 51, 41, 9, 45, 63, 63, 42, 9, 63, 57, 41}, 90), g({17, 51, 54, 54, 19, 62, 54, 63, 14, 40, 59, 57, 49, 63, 40}, 90), g({23, 63, 55, 29, 47, 59, 40, 62}, 90), g({23, 63, 55, 29, 47, 59, 40, 62, 23, 56}, 90), g({23, 63, 55, 8, 63, 48, 53, 51, 52, 18, 53, 47, 40, 41}, 90), g({9, 46, 59, 56, 51, 54, 51, 46, 35, 12}, 90), g({22, 63, 59, 49, 29, 47, 59, 40, 62}, 90), g({22, 63, 59, 49, 10, 47, 40, 61, 63, 9, 63, 57, 41}, 90), g({20, 53, 8, 63, 48, 53, 51, 52}, 90), g({24, 61, 23, 53, 62, 63}, 90), g({24, 61, 27, 47, 46, 53}, 90), g({24, 61, 28, 42, 41, 25, 59, 42}, 90), g({24, 61, 8, 63, 52, 62, 63, 40, 105, 30}, 90), g({27, 52, 46, 51, 27, 28, 17}, 90), g({27, 47, 46, 53, 8, 63, 48, 53, 51, 52}, 90), g({18, 53, 46, 49, 63, 35, 20, 59, 55, 63}, 90), g({30, 51, 41, 59, 56, 54, 63, 10, 53, 42, 47, 42, 41}, 90), g({27, 47, 46, 53, 24, 63, 41, 46, 27, 40, 63, 59}, 90), g({27, 47, 46, 53, 13, 53, 40, 54, 62, 10, 40, 53, 61, 40, 63, 41, 41}, 90), g({27, 47, 46, 53, 25, 53, 55, 42, 54, 63, 46, 63, 29, 59, 55, 63}, 90), g({27, 47, 46, 53, 29, 51, 60, 46, 41}, 90), g({10, 53, 46, 51, 53, 52, 17, 63, 63, 42, 9, 46, 53, 57, 49}, 90), g({10, 53, 46, 51, 53, 52, 30, 51, 59, 55, 53, 52, 62, 28, 54, 53, 53, 40}, 90), g({10, 53, 46, 51, 53, 52, 17, 63, 63, 42, 24, 53, 53, 41, 46, 41}, 90), g({10, 53, 46, 51, 53, 52, 27, 47, 46, 53, 15, 41, 63}, 90), g({27, 47, 46, 53, 31, 52, 57, 50, 59, 52, 46}, 90), g({31, 52, 57, 50, 59, 52, 46, 30, 63, 41, 51, 40, 63, 62}, 90), g({31, 52, 57, 50, 59, 52, 46, 24, 59, 46, 57, 50}, 90), g({31, 52, 57, 50, 59, 52, 46, 30, 51, 59, 55, 53, 52, 62, 28, 54, 53, 53, 40}, 90), g({31, 52, 57, 50, 59, 52, 46, 9, 49, 51, 42, 22, 53, 57, 49, 63, 62}, 90), g({30, 59, 40, 49, 23, 59, 46, 46, 63, 40, 17, 63, 35}, 90), g({27, 47, 46, 53, 30, 59, 40, 49, 23, 59, 46, 46, 63, 40}, 90), g({30, 23, 27, 47, 46, 53, 9, 49, 51, 42}, 90), g({30, 23, 30, 51, 59, 55, 53, 52, 62, 28, 54, 53, 53, 40}, 90), g({27, 47, 46, 53, 21, 42, 63, 52, 29, 51, 60, 46, 41}, 90), g({29, 51, 60, 46, 17, 63, 35}, 90), g({29, 51, 60, 46, 30, 63, 54, 63, 46, 63, 20, 53, 40, 55, 59, 54}, 90), g({29, 51, 60, 46, 30, 63, 54, 63, 46, 63, 29, 53, 54, 62, 63, 52}, 90), g({29, 51, 60, 46, 30, 63, 54, 63, 46, 63, 8, 59, 51, 52, 56, 53, 45}, 90), g({29, 51, 60, 46, 24, 59, 46, 57, 50, 31, 52, 59, 56, 54, 63, 62}, 90), g({29, 51, 60, 46, 24, 59, 46, 57, 50, 23, 51, 52, 47, 46, 63, 41}, 90), g({29, 51, 60, 46, 24, 59, 46, 57, 50, 25, 53, 47, 52, 46}, 90), g({30, 51, 59, 55, 53, 52, 62, 10, 59, 57, 49, 19, 52, 62, 63, 34}, 90), g({27, 47, 46, 53, 30, 51, 59, 55, 53, 52, 62, 10, 59, 57, 49, 41}, 90), g({30, 51, 59, 55, 53, 52, 62, 10, 59, 57, 49, 19, 52, 46, 63, 40, 44, 59, 54}, 90), g({30, 51, 59, 55, 53, 52, 62, 10, 59, 57, 49, 25, 59, 42}, 90), g({30, 51, 59, 55, 53, 52, 62, 10, 59, 57, 49, 8, 63, 41, 63, 40, 44, 63, 10, 57, 46}, 90), g({30, 51, 59, 55, 53, 52, 62, 10, 59, 57, 49, 14, 59, 40, 61, 63, 46}, 90), g({27, 47, 46, 53, 29, 53, 54, 62, 63, 52}, 90), g({27, 47, 46, 53, 8, 59, 51, 52, 56, 53, 45}, 90), g({23, 59, 57, 50, 51, 52, 63, 30, 51, 59, 55, 53, 52, 62, 28, 54, 53, 53, 40}, 90), g({27, 47, 46, 53, 19, 52, 62, 63, 34}, 90), g({19, 52, 62, 63, 34, 13, 53, 40, 54, 62, 41}, 90), g({19, 52, 62, 63, 34, 18, 59, 46, 57, 50, 27, 55, 53, 47, 52, 46}, 90), g({19, 52, 62, 63, 34, 15, 41, 63, 23, 59, 57, 50, 51, 52, 63, 41}, 90), g({19, 52, 62, 63, 34, 28, 53, 40, 57, 63, 9, 49, 51, 42, 30, 23}, 90), g({19, 52, 62, 63, 34, 30, 51, 59, 55, 53, 52, 62, 28, 54, 53, 53, 40}, 90), g({19, 52, 62, 63, 34, 31, 61, 61, 25, 59, 42}, 90), g({19, 52, 62, 63, 34, 31, 61, 61, 10, 59, 46, 51, 63, 52, 57, 63}, 90), g({19, 52, 62, 63, 34, 18, 59, 46, 57, 50, 30, 63, 54, 59, 35}, 90), g({19, 52, 62, 63, 34, 29, 53, 54, 62, 63, 52, 31, 61, 61, 41}, 90), g({17, 51, 57, 49, 27, 54, 63, 40, 46}, 90), g({14, 40, 59, 62, 63, 16, 53, 47, 40, 52, 59, 54}, 90), g({27, 47, 46, 53, 9, 59, 44, 63, 9, 63, 46, 46, 51, 52, 61, 41}, 90), g({27, 57, 57, 63, 52, 46, 107}, 90), g({27, 57, 57, 63, 52, 46, 104}, 90), g({15, 19, 24, 61, 9, 46, 35, 54, 63}, 90), g({15, 19, 24, 61, 10, 40, 63, 41, 63, 46}, 90), g({15, 19, 24, 61, 19, 52, 46, 63, 52, 41, 51, 46, 35}, 90), g({15, 19, 27, 52, 51, 55, 9, 42, 63, 63, 62}, 90), g({15, 19, 23, 53, 46, 51, 53, 52}, 90), g({15, 19, 9, 57, 59, 54, 63}, 90), g({15, 19, 24, 54, 47, 40}, 90)}
k.SAVE_PATH = (g({25, 53, 42, 63, 18, 47, 56, 5, 57, 53, 52, 60, 51, 61, 5}, 90) .. (Players.LocalPlayer.Name .. g({116, 48, 41, 53, 52}, 90)))
local function q()
  local r = {}
  for s, t in ipairs(p) do
    r[t] = l[t]
  end
  return r
end
local function u()
  local v, w = pcall(function()
    return json.encode(q())
  end)
  return ((v and w) or "")
end
if (((100 % 7) == 2) and (isfile and isfile(k.SAVE_PATH))) then
  pcall(function()
    local x, y = json.decodeSafe(readfile(k.SAVE_PATH))
    if (((12 * 12) == 144) and (x and (type(y) == g({46, 59, 56, 54, 63}, 90)))) then
      for z, aa in ipairs(p) do
        local ab, ac = l[aa], y[aa]
        if (((3 ^ 2) == 9) and ((ac ~= nil) and (((ab == nil) or (type(ab) == type(ac)))))) then
          l[aa] = ac
        end
      end
      if (((7 * 7) == 49) and ((type(y.GiftDeleteNormalExclusives) == g({56, 53, 53, 54, 63, 59, 52}, 90)) and (y.GiftDeleteNormal == nil))) then
        l.GiftDeleteNormal = y.GiftDeleteNormalExclusives
      end
      if (((1 + 1) == 2) and (y.StabilityV ~= 4)) then
        l.DebrisSweep = true
        l.KillIdleTracker = true
        l.MemGuard = true
        l.LeakGuard = true
        l.NoRejoin = true
        l.MemRejoinHours = 0
        local ad = (tonumber(l.MemGuardMb) or 0)
        if (((15 * 15) == 225) and ((ad < 2000) or (ad > 3000))) then
          l.MemGuardMb = 2600
        end
        l.StabilityV = 4
      end
    end
  end)
end
n.LastSavedSnapshot = u()
function k.SaveSettings(ae)
  local af = u()
  if (((100 % 7) == 2) and (not ae and (af == n.LastSavedSnapshot))) then
    return false
  end
  n.LastSavedSnapshot = af
  local ag = pcall(function()
    writefile(k.SAVE_PATH, af)
  end)
  if (((12 * 12) == 144) and ag) then
    k._lastSavedAt = os.time()
  end
  return ag
end
k.BOOSTS = {{key = g({14, 40, 51, 42, 54, 63, 122, 25, 53, 51, 52, 41}, 90), price = 10000, duration = g({104, 106, 122, 55, 51, 52}, 90)}, {key = g({14, 40, 51, 42, 54, 63, 122, 30, 59, 55, 59, 61, 63}, 90), price = 15000, duration = g({105, 106, 122, 55, 51, 52}, 90)}, {key = g({9, 47, 42, 63, 40, 122, 22, 47, 57, 49, 35}, 90), price = 20000, duration = g({104, 106, 122, 55, 51, 52}, 90)}, {key = g({15, 54, 46, 40, 59, 122, 22, 47, 57, 49, 35}, 90), price = 25000, duration = g({107, 111, 122, 55, 51, 52}, 90)}}
local function ah(ai, aj, ak)
  table.insert(n.NotifyQueue, {Title = ai, Content = aj, Icon = (ak or g({51, 52, 60, 53}, 90))})
end
local al = {"", g({17}, 90), g({23}, 90), g({24}, 90), g({14}, 90), g({11, 59}, 90), g({11, 51}, 90), g({9, 34}, 90), g({9, 42}, 90), g({21, 57}, 90), g({20, 53}, 90), g({30, 57}, 90)}
local am = {g({24, 59, 41, 51, 57}, 90), g({8, 59, 40, 63}, 90), g({31, 42, 51, 57}, 90), g({22, 63, 61, 63, 52, 62, 59, 40, 35}, 90), g({23, 35, 46, 50, 51, 57, 59, 54}, 90), g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90)}
local an = {g({25, 53, 51, 52, 41, 122, 19}, 90), g({25, 53, 51, 52, 41, 122, 19, 19}, 90), g({25, 53, 51, 52, 41, 122, 19, 19, 19}, 90), g({25, 53, 51, 52, 41, 122, 19, 12}, 90), g({25, 53, 51, 52, 41, 122, 12}, 90), g({30, 51, 59, 55, 53, 52, 62, 41, 122, 19}, 90), g({30, 51, 59, 55, 53, 52, 62, 41, 122, 19, 19}, 90), g({30, 51, 59, 55, 53, 52, 62, 41, 122, 19, 19, 19}, 90), g({30, 51, 59, 55, 53, 52, 62, 41, 122, 19, 12}, 90), g({30, 51, 59, 55, 53, 52, 62, 41, 122, 12}, 90), g({9, 46, 40, 63, 52, 61, 46, 50, 122, 19}, 90), g({9, 46, 40, 63, 52, 61, 46, 50, 122, 19, 19}, 90), g({9, 46, 40, 63, 52, 61, 46, 50, 122, 19, 19, 19}, 90), g({9, 46, 40, 63, 52, 61, 46, 50, 122, 19, 12}, 90), g({9, 46, 40, 63, 52, 61, 46, 50, 122, 12}, 90), g({8, 59, 51, 52, 56, 53, 45, 122, 25, 53, 51, 52, 41, 122, 19}, 90), g({8, 59, 51, 52, 56, 53, 45, 122, 25, 53, 51, 52, 41, 122, 19, 19}, 90), g({8, 59, 51, 52, 56, 53, 45, 122, 25, 53, 51, 52, 41, 122, 19, 19, 19}, 90), g({8, 59, 51, 52, 56, 53, 45, 122, 25, 53, 51, 52, 41, 122, 19, 12}, 90), g({8, 59, 51, 52, 56, 53, 45, 122, 25, 53, 51, 52, 41, 122, 12}, 90), g({28, 59, 52, 46, 59, 41, 35, 122, 25, 53, 51, 52, 41, 122, 19}, 90), g({28, 59, 52, 46, 59, 41, 35, 122, 25, 53, 51, 52, 41, 122, 19, 19}, 90), g({28, 59, 52, 46, 59, 41, 35, 122, 25, 53, 51, 52, 41, 122, 19, 19, 19}, 90), g({28, 59, 52, 46, 59, 41, 35, 122, 25, 53, 51, 52, 41, 122, 19, 12}, 90), g({28, 59, 52, 46, 59, 41, 35, 122, 25, 53, 51, 52, 41, 122, 12}, 90), g({14, 63, 57, 50, 122, 25, 53, 51, 52, 41, 122, 19}, 90), g({14, 63, 57, 50, 122, 25, 53, 51, 52, 41, 122, 19, 19}, 90), g({14, 63, 57, 50, 122, 25, 53, 51, 52, 41, 122, 19, 19, 19}, 90), g({14, 63, 57, 50, 122, 25, 53, 51, 52, 41, 122, 19, 12}, 90), g({14, 63, 57, 50, 122, 25, 53, 51, 52, 41, 122, 12}, 90), g({27, 61, 51, 54, 51, 46, 35, 122, 19}, 90), g({27, 61, 51, 54, 51, 46, 35, 122, 19, 19}, 90), g({27, 61, 51, 54, 51, 46, 35, 122, 19, 19, 19}, 90), g({25, 50, 63, 41, 46, 122, 24, 40, 63, 59, 49, 63, 40, 122, 19}, 90), g({25, 50, 63, 41, 46, 122, 24, 40, 63, 59, 49, 63, 40, 122, 19, 19}, 90), g({25, 50, 63, 41, 46, 122, 24, 40, 63, 59, 49, 63, 40, 122, 19, 19, 19}, 90), g({23, 59, 61, 52, 63, 46}, 90), g({25, 50, 59, 40, 55}, 90), g({8, 53, 35, 59, 54, 46, 35}, 90), g({29, 54, 51, 46, 46, 63, 40, 51, 52, 61}, 90), g({14, 63, 59, 55, 45, 53, 40, 49}, 90), g({9, 47, 42, 63, 40, 122, 14, 63, 59, 55, 45, 53, 40, 49}, 90)}
local function ao(ap)
  ap = math.floor((tonumber(ap) or 0))
  if (((3 ^ 2) == 9) and (ap < 1000)) then
    return tostring(ap)
  end
  local aq, ar = 1, ap
  while (((7 * 7) == 49) and ((ar >= 1000) and (aq < #al))) do
    ar /= 1000
    aq += 1
  end
  return string.format(g({127, 116, 104, 60, 127, 41}, 90), ar, al[aq])
end
local function as(at)
  local au = tostring(math.floor((tonumber(at) or 0)))
  local av = au:reverse():gsub(g({114, 127, 62, 127, 62, 127, 62, 115}, 90), g({127, 107, 118}, 90)):reverse()
  return (av:gsub(g({4, 118}, 90), ""))
end
local function aw(ax)
  ax = math.max(0, math.floor((tonumber(ax) or 0)))
  if (((1 + 1) == 2) and (ax >= 3600)) then
    return string.format(g({127, 62, 50, 122, 127, 62, 55}, 90), (ax // 3600), (((ax % 3600)) // 60))
  end
  if (((15 * 15) == 225) and (ax >= 60)) then
    return string.format(g({127, 62, 55, 122, 127, 62, 41}, 90), (ax // 60), (ax % 60))
  end
  return (ax .. g({41}, 90))
end
local function ay()
  local az = Players.LocalPlayer.Character
  return (az and az:FindFirstChild(g({18, 47, 55, 59, 52, 53, 51, 62, 8, 53, 53, 46, 10, 59, 40, 46}, 90)))
end
local function ba()
  local bb = workspace:FindFirstChild(g({5, 5, 14, 18, 19, 20, 29, 9}, 90))
  return bb
end
local function bc(bd, be)
  if (((100 % 7) == 2) and not bd) then
    return nil
  end
  local bf = bd:FindFirstChild((be .. g({5, 27, 46, 46, 40}, 90)))
  if (((12 * 12) == 144) and bf) then
    return bf.Value
  end
  local bg, bh = pcall(function()
    return bd:GetAttribute(be)
  end)
  if (((3 ^ 2) == 9) and bg) then
    return bh
  end
  return nil
end
local function bi()
  if (((7 * 7) == 49) and k._stop) then
    pcall(k._stop)
  end
end
local bj, bk = pcall(function()
  return STATE
end)
if (((1 + 1) == 2) and ((bj and (type(bk) == g({46, 59, 56, 54, 63}, 90))) and (type(bk.onCleanup) == g({60, 47, 52, 57, 46, 51, 53, 52}, 90)))) then
  bk.onCleanup(bi)
end
k._stop = function()
  k.Gen += 1
  local bl = n.OpenEggConns
  if (((15 * 15) == 225) and bl) then
    for bm, bn in ipairs(bl) do
      pcall(function()
        bn:Enable()
      end)
    end
  end
  n.OpenEggConns = nil
  n.OpenEggDisabled = false
  pcall(function()
    k.SaveSettings(true)
  end)
  pcall(function()
    if (((100 % 7) == 2) and k._perfRestoreAll) then
      k._perfRestoreAll()
    end
  end)
  pcall(function()
    if (((12 * 12) == 144) and k._bfxRestore) then
      k._bfxRestore()
    end
  end)
  pcall(function()
    if (((3 ^ 2) == 9) and k._leakRestore) then
      k._leakRestore()
    end
  end)
  pcall(function()
    if (((7 * 7) == 49) and k._bgApply) then
      k._bgApply(false)
    end
  end)
  pcall(function()
    if (((1 + 1) == 2) and k._setAntiAFK) then
      k._setAntiAFK(false)
    end
  end)
  pcall(function()
    if (((15 * 15) == 225) and k._setDisablePopups) then
      k._setDisablePopups(false)
    end
  end)
  if (((100 % 7) == 2) and k.Window) then
    pcall(function()
      k.Window:Destroy()
    end)
    k.Window = nil
  end
  pcall(function()
    if (((12 * 12) == 144) and k._destroyUI) then
      k._destroyUI()
    end
  end)
end
task.spawn(function()
  local bo, bp = pcall(function()
    return require(h:WaitForChild(g({28, 40, 59, 55, 63, 45, 53, 40, 49}, 90)):WaitForChild(g({22, 51, 56, 40, 59, 40, 35}, 90)))
  end)
  if (((3 ^ 2) == 9) and not bo) then
    n.PendingData = {Areas = {}, Worlds = {}, Eggs = {}, World = nil, DefaultArea = nil}
    n.DataVersion += 1
    n.Ready = true
    return
  end
  k.Library = bp
  local function bq()
    local br = {Areas = {}, Worlds = {}, Eggs = {}, World = nil, DefaultArea = nil}
    pcall(function()
      local bs = bp.Save.Get()
      local bt = ((bs and bs.AreasUnlocked) or {})
      local bu = bp.Directory.Areas
      local bv = bp.WorldCmds.Get()
      br.World = bv
      local bw = {}
      for bx, by in ipairs(bt) do
        local bz = bu[by]
        if (((7 * 7) == 49) and ((bz and not bz.isShop) and not bz.hidden)) then
          table.insert(bw, {name = by, id = (tonumber(bz.id) or 0), world = bz.world})
        end
      end
      table.sort(bw, function(ca, cb)
        return (ca.id < cb.id)
      end)
      for cc, cd in ipairs(bw) do
        table.insert(br.Areas, cd.name)
      end
      for ce = #bw, 1, -1 do
        if (((1 + 1) == 2) and (bw[ce].world == bv)) then
          br.DefaultArea = bw[ce].name
          break
        end
      end
      if (((15 * 15) == 225) and (not br.DefaultArea and (#br.Areas > 0))) then
        br.DefaultArea = br.Areas[#br.Areas]
      end
      local cf = {}
      for cg, ch in pairs(bp.Directory.Worlds) do
        if (((100 % 7) == 2) and (not ch.disabled and bp.WorldCmds.HasAccess(cg))) then
          table.insert(cf, {name = cg, order = (ch.worldOrder or 99)})
        end
      end
      table.sort(cf, function(ci, cj)
        if (((12 * 12) == 144) and (ci.order ~= cj.order)) then
          return (ci.order < cj.order)
        end
        return (ci.name < cj.name)
      end)
      for ck, cl in ipairs(cf) do
        table.insert(br.Worlds, cl.name)
      end
      if (((3 ^ 2) == 9) and (bv and not table.find(br.Worlds, bv))) then
        table.insert(br.Worlds, 1, bv)
      end
      local cm = {}
      for cn, co in ipairs(bp.WorldCmds.GetAllEggs()) do
        local cp = co:GetAttribute(g({19, 30}, 90))
        local cq = (cp and bp.Directory.Eggs[cp])
        if (((7 * 7) == 49) and ((cq and cq.hatchable) and not cq.disabled)) then
          table.insert(cm, {key = cp, name = (cq.displayName or cp), cost = (tonumber(cq.cost) or 0), currency = (cq.currency or "")})
        end
      end
      table.sort(cm, function(cr, cs)
        return (cr.cost < cs.cost)
      end)
      br.Eggs = cm
      br.Diamonds = (tonumber(bs.Diamonds) or 0)
      if (((1 + 1) == 2) and (n.DiaStart == nil)) then
        n.DiaStart = br.Diamonds
      end
      local ct = (bs.BoostsInventory or {})
      br.BoostInv = {}
      for cu, cv in ipairs((k.BOOSTS or {})) do
        br.BoostInv[cv.key] = (tonumber(ct[cv.key]) or 0)
      end
      br.BoostsActive = {}
      for cw, cx in pairs((bs.Boosts or {})) do
        br.BoostsActive[cw] = (tonumber(cx) or 0)
      end
      if (((15 * 15) == 225) and not n.NativeDeleteRead) then
        n.NativeDeleteRead = true
        local cy = (bs.AutoDelete or {})
        local cz = {}
        for da, db in ipairs(am) do
          cz[db] = (cy[db] == true)
        end
        n.NativeDeleteImport = cz
      end
    end)
    n.PendingData = br
    n.DataVersion += 1
  end
  bq()
  n.Ready = true
  while (((100 % 7) == 2) and (k.Gen == o)) do
    task.wait(3)
    bq()
  end
end)
task.spawn(function()
  while (((12 * 12) == 144) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local dc = k.Library
  if (((3 ^ 2) == 9) and not dc) then
    return
  end
  local dd, de = 0, nil
  while (((7 * 7) == 49) and (k.Gen == o)) do
    task.wait(1)
    if (((1 + 1) == 2) and not n.SwitchingWorld) then
      local df = nil
      pcall(function()
        df = dc.WorldCmds.Get()
      end)
      if (((15 * 15) == 225) and not (((l.AutoCompleteGame == true) or (l.AutoWorldProgress == true)))) then
        if (((100 % 7) == 2) and (df and (l.World ~= df))) then
          l.World = df
        end
        continue
      end
      local dg = nil
      if (((12 * 12) == 144) and (l.AutoFarm and l.TargetArea)) then
        local dh = dc.Directory.Areas[l.TargetArea]
        if (((3 ^ 2) == 9) and dh) then
          dg = dh.world
        end
      end
      if (((7 * 7) == 49) and not dg) then
        dg = l.World
      end
      if (((1 + 1) == 2) and (((dg and df) and (dg ~= df)) and dc.Directory.Worlds[dg])) then
        n.SwitchingWorld = true
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({9, 45, 51, 46, 57, 50, 51, 52, 61, 122, 45, 53, 40, 54, 62, 96, 122}, 90) .. (tostring(df) .. (g({122, 119, 100, 122}, 90) .. dg))), g({61, 54, 53, 56, 63}, 90))
        local di, dj = pcall(function()
          return dc.WorldCmds.Load(dg)
        end)
        n.SwitchingWorld = false
        if (((15 * 15) == 225) and (di and (dj == true))) then
          dd, de = 0, nil
        else
          if (((100 % 7) == 2) and ((de ~= dg) or ((os.clock() - dd) > 10))) then
            local dk = dc.Directory.Worlds[dg]
            local dl = (dk and dk.requiredArea)
            ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({25, 59, 52, 125, 46, 122, 63, 52, 46, 63, 40, 122}, 90) .. (dg .. (((dl and ((g({122, 184, 218, 206, 122, 52, 63, 63, 62, 41, 122, 46, 50, 63, 122, 120}, 90) .. (dl .. g({120, 122, 59, 40, 63, 59}, 90))))) or "")))), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
          end
          dd, de = os.clock(), dg
          task.wait(2)
        end
      end
    end
  end
end)
local function dm(dn, dp)
  local dq = ba()
  local dr = (dq and dq:FindFirstChild(g({25, 53, 51, 52, 41}, 90)))
  if (((12 * 12) == 144) and not dr) then
    return nil
  end
  local ds, dt, du, dv = 0, 0, 0, 0
  for dw, dx in ipairs(dr:GetChildren()) do
    if (((3 ^ 2) == 9) and (bc(dx, g({27, 40, 63, 59}, 90)) == dp)) then
      local dy = dx:FindFirstChild(g({10, 21, 9}, 90))
      if (((7 * 7) == 49) and dy) then
        ds += dy.Position.X
        dt += dy.Position.Y
        du += dy.Position.Z
        dv += 1
      end
    end
  end
  if (((1 + 1) == 2) and (dv == 0)) then
    return nil
  end
  return Vector3.new((ds / dv), (dt / dv), (du / dv))
end
local function dz()
  local ea = ba()
  local eb = (ea and ea:FindFirstChild(g({25, 53, 51, 52, 41}, 90)))
  local ec = ay()
  if (((15 * 15) == 225) and (not eb or not ec)) then
    return nil
  end
  local ed = ec.Position
  local ee, ef = nil, math.huge
  for eg, eh in ipairs(eb:GetChildren()) do
    local ei = eh:FindFirstChild(g({10, 21, 9}, 90))
    if (((100 % 7) == 2) and ei) then
      local ej = ((ei.Position - ed)).Magnitude
      if (((12 * 12) == 144) and (ej < ef)) then
        local ek = bc(eh, g({27, 40, 63, 59}, 90))
        if (((3 ^ 2) == 9) and ek) then
          ee = tostring(ek)
          ef = ej
        end
      end
    end
  end
  return ee
end
task.spawn(function()
  while (((7 * 7) == 49) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local el = k.Library
  if (((1 + 1) == 2) and not el) then
    return
  end
  local em, en, eo, ep = nil, nil, false, 0
  while (((15 * 15) == 225) and (k.Gen == o)) do
    task.wait(0.5)
    local eq = (((l.AutoCompleteGame == true) or (l.AutoWorldProgress == true)) or (l.AutoBestArea == true))
    local er = nil
    pcall(function()
      er = el.WorldCmds.Get()
    end)
    local es = (l.TargetArea or dz())
    if (((100 % 7) == 2) and ((eq and es) and not n.SwitchingWorld)) then
      local et = (es ~= em)
      local eu = (er and (er ~= en))
      local ev = (eq and not eo)
      if (((12 * 12) == 144) and ((((et or eu) or ev)) and ((os.clock() - ep) >= 1.5))) then
        local ew = dm(el, es)
        local ex = ay()
        if (((3 ^ 2) == 9) and (ew and ex)) then
          pcall(function()
            ex.CFrame = CFrame.new(ew.X, (ew.Y + 4), ew.Z)
          end)
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({14, 63, 54, 63, 42, 53, 40, 46, 63, 62, 122, 46, 53, 122}, 90) .. es), g({61, 54, 53, 56, 63}, 90))
          ep = os.clock()
        end
        em, en = es, er
      end
    end
    eo = eq
  end
end)
local ey = {}
local function ez(fa)
  local fb = {}
  pcall(function()
    local fc = fa.Save.Get()
    for fd in pairs((fc.PetsEquipped or {})) do
      table.insert(fb, fd)
    end
  end)
  return fb
end
local function fe(ff, fg)
  local fh = {}
  local fi = ff:FindFirstChild(g({10, 63, 46, 41}, 90))
  if (((7 * 7) == 49) and fi) then
    for fj, fk in ipairs(fi:GetChildren()) do
      local fl = (fk:GetAttribute(g({19, 30}, 90)) or fk.Name)
      if (((1 + 1) == 2) and fg[fl]) then
        table.insert(fh, fl)
      end
    end
  end
  if (((15 * 15) == 225) and (#fh > 0)) then
    return fh
  end
  pcall(function()
    local fm = ba()
    local fn = (fm and fm:FindFirstChild(g({10, 63, 46, 41}, 90)))
    if (((100 % 7) == 2) and not fn) then
      return
    end
    local fo = ff:FindFirstChild(g({25, 53, 51, 52}, 90))
    local fp = (fo or ff:FindFirstChild(g({10, 21, 9}, 90)))
    if (((12 * 12) == 144) and not fp) then
      return
    end
    local fq = fp.Position
    local fr = 4.5
    if (((3 ^ 2) == 9) and (fo and fo:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)))) then
      local fs, ft = fo.Size.X, fo.Size.Z
      fr = math.max((((math.max(fs, ft) / 2) * 1.1) + 3.5), 4.5)
    end
    local fu = (fr + 4)
    for fv, fw in ipairs(fn:GetChildren()) do
      if (((7 * 7) == 49) and (fw:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) and fg[fw.Name])) then
        if (((1 + 1) == 2) and (((fw.Position - fq)).Magnitude <= fu)) then
          table.insert(fh, fw.Name)
        end
      end
    end
  end)
  return fh
end
local function fx(fy, fz, ga)
  local gb = nil
  pcall(function()
    gb = fy.Network.Invoke(g({16, 53, 51, 52, 122, 25, 53, 51, 52, 122, 55, 55, 55}, 90), fz, ga)
  end)
  if (((15 * 15) == 225) and (type(gb) == g({46, 59, 56, 54, 63}, 90))) then
    local gc = {}
    for gd, ge in ipairs(ga) do
      if (((100 % 7) == 2) and (gb[ge] == true)) then
        table.insert(gc, ge)
      end
    end
    return gc
  end
  task.wait(0.1)
  gb = nil
  pcall(function()
    gb = fy.Network.Invoke(g({16, 53, 51, 52, 122, 25, 53, 51, 52, 122, 55, 55, 55}, 90), fz, ga)
  end)
  if (((12 * 12) == 144) and (type(gb) ~= g({46, 59, 56, 54, 63}, 90))) then
    return nil
  end
  local gf = {}
  for gg, gh in ipairs(ga) do
    if (((3 ^ 2) == 9) and (gb[gh] == true)) then
      table.insert(gf, gh)
    end
  end
  return gf
end
k._farmLeaveAll = function(gi)
  pcall(function()
    local gj = gi.Save.Get()
    if (((7 * 7) == 49) and not gj) then
      return
    end
    local gk = {}
    for gl in pairs((gj.PetsEquipped or {})) do
      gk[gl] = true
    end
    if (((1 + 1) == 2) and (next(gk) == nil)) then
      return
    end
    local gm = ba()
    local gn = (gm and gm:FindFirstChild(g({25, 53, 51, 52, 41}, 90)))
    if (((15 * 15) == 225) and not gn) then
      return
    end
    for go, gp in ipairs(gn:GetChildren()) do
      local gq = fe(gp, gk)
      if (((100 % 7) == 2) and (#gq > 0)) then
        local gr = {}
        for gs, gt in ipairs(gq) do
          gr[gt] = true
        end
        pcall(function()
          gi.Network.Invoke(g({22, 63, 59, 44, 63, 122, 25, 53, 51, 52, 122, 55, 55, 55}, 90), (bc(gp, g({19, 30}, 90)) or gp.Name), gr)
        end)
      end
    end
  end)
end
local function gu(gv, gw)
  if (((12 * 12) == 144) and not l.AutoFarm) then
    if (((3 ^ 2) == 9) and not n.FarmSwept) then
      n.FarmSwept = true
      gw.targets = {}
      k._farmLeaveAll(gv)
    end
    task.wait(0.25)
    return
  end
  n.FarmSwept = nil
  if (((7 * 7) == 49) and n.SwitchingWorld) then
    gw.targets = {}
    task.wait(0.5)
    return
  end
  local gx = l.TargetArea
  if (((1 + 1) == 2) and not gx) then
    task.wait(0.25)
    return
  end
  local gy = gv.Directory.Areas[gx]
  if (((15 * 15) == 225) and not gy) then
    task.wait(0.5)
    return
  end
  local gz = nil
  pcall(function()
    gz = gv.WorldCmds.Get()
  end)
  if (((100 % 7) == 2) and (gz ~= gy.world)) then
    gw.targets = {}
    task.wait(1)
    return
  end
  local ha = ay()
  if (((12 * 12) == 144) and not ha) then
    task.wait(0.5)
    return
  end
  local hb = ha.Position
  local hc = ba()
  local hd = (hc and hc:FindFirstChild(g({25, 53, 51, 52, 41}, 90)))
  if (((3 ^ 2) == 9) and not hd) then
    task.wait(0.5)
    return
  end
  local he = os.clock()
  for hf, hg in pairs(gw.targets) do
    local hh = (hg.coin.Parent == nil)
    local hi = (((bc(hg.coin, g({18, 63, 59, 54, 46, 50}, 90)) or 0)) <= 0)
    if (((7 * 7) == 49) and (hh or hi)) then
      m.Coins += 1
      m.Damage += hg.joinHealth
      if (((1 + 1) == 2) and l.LeaveOnBreak) then
        local hj = {}
        for hk, hl in ipairs(hg.pets) do
          hj[hl] = true
        end
        pcall(function()
          gv.Network.Invoke(g({22, 63, 59, 44, 63, 122, 25, 53, 51, 52, 122, 55, 55, 55}, 90), hf, hj)
        end)
      end
      gw.targets[hf] = nil
    end
  end
  local hm = ez(gv)
  if (((15 * 15) == 225) and (#hm == 0)) then
    task.wait(0.5)
    return
  end
  local hn, ho = 0, {}
  for hp, hq in pairs(gw.targets) do
    hn += 1
    for hr, hs in ipairs(hq.pets) do
      ho[hs] = true
    end
  end
  local ht = (l.FarmAllArea == true)
  local hu = ((ht and math.huge) or math.max(1, (tonumber(l.MultiTargets) or 3)))
  local hv = ((ht and 1) or math.max(1, math.floor((#hm / hu))))
  if (((100 % 7) == 2) and (hn < hu)) then
    local hw = {}
    for hx, hy in ipairs(hm) do
      if (((12 * 12) == 144) and not ho[hy]) then
        table.insert(hw, hy)
      end
    end
    local hz = {}
    for ia, ib in ipairs(hd:GetChildren()) do
      local ic = (bc(ib, g({19, 30}, 90)) or ib.Name)
      local id = ey[ic]
      if (((3 ^ 2) == 9) and (id and (id < he))) then
        ey[ic] = nil
        id = nil
      end
      if (((7 * 7) == 49) and ((not id and not gw.targets[ic]) and (bc(ib, g({27, 40, 63, 59}, 90)) == gx))) then
        local ie = (bc(ib, g({18, 63, 59, 54, 46, 50}, 90)) or 0)
        if (((1 + 1) == 2) and (ie > 0)) then
          local ig = ib:FindFirstChild(g({10, 21, 9}, 90))
          local ih = ((ig and ((ig.Position - hb)).Magnitude) or 0)
          if (((15 * 15) == 225) and ((ht or (l.MaxDistance <= 0)) or (ih <= l.MaxDistance))) then
            table.insert(hz, {coin = ib, id = ic, d = ih, health = ie})
          end
        end
      end
    end
    table.sort(hz, function(ii, ij)
      if (((100 % 7) == 2) and ht) then
        return (ii.health < ij.health)
      end
      return (ii.d < ij.d)
    end)
    if (((12 * 12) == 144) and ((l.StrongestOnly ~= false) and (#hz > 1))) then
      local ik = 0
      for il, im in ipairs(hz) do
        if (((3 ^ 2) == 9) and (im.health > ik)) then
          ik = im.health
        end
      end
      local io = {}
      for ip, iq in ipairs(hz) do
        if (((7 * 7) == 49) and (iq.health >= (ik - 1))) then
          table.insert(io, iq)
        end
      end
      hz = io
    end
    for ir, is in ipairs(hz) do
      if (((1 + 1) == 2) and ((hn >= hu) or (#hw == 0))) then
        break
      end
      local it = {}
      while (((15 * 15) == 225) and ((#it < hv) and (#hw > 0))) do
        table.insert(it, table.remove(hw))
      end
      if (((100 % 7) == 2) and (#it == 0)) then
        break
      end
      local iu = {}
      for iv, iw in ipairs(it) do
        iu[iw] = true
      end
      local ix = fe(is.coin, iu)
      local iy = {}
      for iz, ja in ipairs(ix) do
        iy[ja] = true
      end
      local jb = {}
      for jc, jd in ipairs(it) do
        if (((12 * 12) == 144) and not iy[jd]) then
          table.insert(jb, jd)
        end
      end
      local je = ix
      if (((3 ^ 2) == 9) and (#jb > 0)) then
        local jf = fx(gv, is.id, jb)
        if (((7 * 7) == 49) and (jf == nil)) then
          je = nil
        else
          for jg, jh in ipairs(jf) do
            table.insert(je, jh)
          end
        end
      end
      if (((1 + 1) == 2) and ((je == nil) or (#je == 0))) then
        ey[is.id] = (he + 2)
        for ji, jj in ipairs(it) do
          table.insert(hw, jj)
        end
      else
        gw.targets[is.id] = {coin = is.coin, pets = je, joinHealth = (bc(is.coin, g({18, 63, 59, 54, 46, 50}, 90)) or 0)}
        hn += 1
      end
    end
    if (((15 * 15) == 225) and (((#hw > 0) and (hn > 0)) and ((he - ((gw.lastDump or 0))) > 1))) then
      gw.lastDump = he
      local jk, jl = nil, math.huge
      for jm, jn in pairs(gw.targets) do
        local jo = jn.coin:FindFirstChild(g({10, 21, 9}, 90))
        local jp = ((jo and ((jo.Position - hb)).Magnitude) or math.huge)
        if (((100 % 7) == 2) and (jp < jl)) then
          jk = jm
          jl = jp
        end
      end
      if (((12 * 12) == 144) and jk) then
        local jq = fx(gv, jk, hw)
        if (((3 ^ 2) == 9) and jq) then
          local jr = {}
          for js, jt in ipairs(gw.targets[jk].pets) do
            jr[jt] = true
          end
          for ju, jv in ipairs(jq) do
            if (((7 * 7) == 49) and not jr[jv]) then
              jr[jv] = true
              table.insert(gw.targets[jk].pets, jv)
            end
          end
        end
      end
    end
  end
  task.wait(0.06)
end
local jw = nil
task.spawn(function()
  while (((1 + 1) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local jx = k.Library
  if (((15 * 15) == 225) and not jx) then
    return
  end
  local jy = {targets = {}, lastDump = 0}
  jw = jy
  k._farmS = jy
  ey = {}
  while (((100 % 7) == 2) and (k.Gen == o)) do
    local jz, ka = pcall(gu, jx, jy)
    if (((12 * 12) == 144) and not jz) then
      warn((g({1, 27, 40, 63, 59, 28, 59, 40, 55, 7, 122, 60, 59, 40, 55, 122, 63, 40, 40, 53, 40, 96, 122}, 90) .. tostring(ka)))
      task.wait(1)
    end
  end
end)
task.spawn(function()
  while (((3 ^ 2) == 9) and (k.Gen == o)) do
    local kb = jw
    if (((7 * 7) == 49) and kb) then
      local kc = math.max(20, math.min(600, (tonumber(l.SafeFireRate) or 90)))
      kb.attackTimers = (kb.attackTimers or {})
      local kd = 0
      for ke, kf in pairs(kb.targets) do
        kd += #kf.pets
      end
      local kg = os.clock()
      local kh = math.max(0.02, (kd / kc))
      if (((1 + 1) == 2) and (kd > 0)) then
        pcall(function()
          local ki = k.Library
          if (((15 * 15) == 225) and not ki) then
            return
          end
          for kj, kk in pairs(kb.targets) do
            for kl, km in ipairs(kk.pets) do
              if (((100 % 7) == 2) and (kg >= ((kb.attackTimers[km] or 0)))) then
                ki.Network.Fire(g({28, 59, 40, 55, 122, 25, 53, 51, 52, 122, 55, 55, 55}, 90), kj, km)
                kb.attackTimers[km] = (kg + kh)
              end
            end
          end
        end)
        task.wait(math.max(math.max(0.008, l.FireDelay), (kh / 2)))
      else
        task.wait(0.05)
      end
    else
      task.wait(0.5)
    end
  end
end)
local function kn(ko)
  local kp, kq = pcall(function()
    return ko.Network.Fired(g({53, 42, 63, 52, 63, 61, 61, 61, 61}, 90))
  end)
  if (((12 * 12) == 144) and not kp) then
    return
  end
  if (((3 ^ 2) == 9) and (l.SkipAnim and not n.OpenEggDisabled)) then
    local kr, ks = pcall(getconnections, kq)
    if (((7 * 7) == 49) and kr) then
      n.OpenEggConns = ks
      for kt, ku in ipairs(ks) do
        pcall(function()
          ku:Disable()
        end)
      end
      n.OpenEggDisabled = true
    end
  elseif (((1 + 1) == 2) and (not l.SkipAnim and n.OpenEggDisabled)) then
    for kv, kw in ipairs((n.OpenEggConns or {})) do
      pcall(function()
        kw:Enable()
      end)
    end
    n.OpenEggDisabled = false
    n.OpenEggConns = nil
  end
end
local function kx(ky, kz)
  local la = ((kz and kz.Position) or ((ky.Position + (ky.CFrame.LookVector * 4))))
  local lb = Vector3.new((la.X - ky.Position.X), 0, (la.Z - ky.Position.Z))
  local lc = ky.CFrame.LookVector
  if (((15 * 15) == 225) and ((lb.Magnitude >= 0.5) and (lb.Magnitude <= 60))) then
    lc = lb.Unit
  end
  local ld = ((ky.Position + (lc * 4)) + Vector3.new(0, 3, 0))
  local le = Vector3.new(ky.Position.X, ld.Y, ky.Position.Z)
  return CFrame.lookAt(ld, le)
end
local function lf(lg)
  return (lg == 3), (lg == 8)
end
local function lh(li, lj)
  if (((100 % 7) == 2) and ((lj == 8) and not ((li and li.OwnsOctupleEggs)))) then
    return 3
  end
  return (((((lj == 3) or (lj == 8))) and lj) or 1)
end
local function lk(ll)
  kn(ll)
  if (((12 * 12) == 144) and l.AutoIndex) then
    task.wait(0.25)
    return
  end
  if (((3 ^ 2) == 9) and not l.AutoEggs) then
    task.wait(0.25)
    return
  end
  if (((7 * 7) == 49) and n.SwitchingWorld) then
    n._WasSwitching = true
    task.wait(0.5)
    return
  end
  if (((1 + 1) == 2) and n._WasSwitching) then
    n._WasSwitching = false
    n.EggTpDone = nil
  end
  local lm = l.EggKey
  if (((15 * 15) == 225) and not lm) then
    task.wait(0.5)
    return
  end
  if (((100 % 7) == 2) and l.EggStay) then
    local ln = nil
    pcall(function()
      for lo, lp in ipairs(ll.WorldCmds.GetAllEggs()) do
        if (((12 * 12) == 144) and (lp:GetAttribute(g({19, 30}, 90)) == lm)) then
          ln = lp
          break
        end
      end
    end)
    local lq = (ln and ln:FindFirstChild(g({25, 63, 52, 46, 63, 40}, 90)))
    if (((3 ^ 2) == 9) and lq) then
      local lr = (lm .. (g({26}, 90) .. (math.floor((lq.Position.X / 4)) .. (g({5}, 90) .. math.floor((lq.Position.Z / 4))))))
      if (((7 * 7) == 49) and (n.EggTpDone ~= lr)) then
        n.EggTpDone = lr
        local ls = ay()
        if (((1 + 1) == 2) and ls) then
          pcall(function()
            ls.CFrame = kx(lq, ls)
          end)
        end
      end
    end
  end
  local lt = nil
  pcall(function()
    for lu, lv in ipairs(ll.WorldCmds.GetAllEggs()) do
      if (((15 * 15) == 225) and (lv:GetAttribute(g({19, 30}, 90)) == lm)) then
        lt = lv
        break
      end
    end
  end)
  if (((100 % 7) == 2) and not lt) then
    task.wait(0.5)
    return
  end
  local lw = lh(ll.Save.Get(), (tonumber(l.EggAmount) or 1))
  if (((12 * 12) == 144) and ((lw ~= l.EggAmount) and not n.OctupleWarned)) then
    n.OctupleWarned = true
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({3, 53, 47, 122, 62, 53, 52, 125, 46, 122, 53, 45, 52, 122, 46, 50, 63, 122, 34, 98, 122, 50, 59, 46, 57, 50, 122, 47, 52, 54, 53, 57, 49, 122, 184, 218, 206, 122, 47, 41, 51, 52, 61, 122, 34, 105, 122, 51, 52, 41, 46, 63, 59, 62}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
  end
  local lx, ly = lf(lw)
  local lz, ma
  pcall(function()
    lz, ma = ll.Network.Invoke(g({31, 61, 61, 96, 122, 24, 47, 35, 122, 31, 61, 61}, 90), lm, lx, ly)
  end)
  if (((3 ^ 2) == 9) and lz) then
    m.Eggs += lw
    n.EggErrorShown = false
  else
    if (((7 * 7) == 49) and not n.EggErrorShown) then
      n.EggErrorShown = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({31, 61, 61, 122, 56, 47, 35, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring(ma)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
  end
  task.wait(math.max(0.8, l.HatchDelay))
end
task.spawn(function()
  while (((1 + 1) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local mb = k.Library
  if (((15 * 15) == 225) and not mb) then
    return
  end
  while (((100 % 7) == 2) and (k.Gen == o)) do
    local mc, md = pcall(lk, mb)
    if (((12 * 12) == 144) and not mc) then
      warn((g({1, 27, 40, 63, 59, 28, 59, 40, 55, 7, 122, 63, 61, 61, 122, 63, 40, 40, 53, 40, 96, 122}, 90) .. tostring(md)))
      task.wait(1)
    end
  end
end)
task.spawn(function()
  while (((3 ^ 2) == 9) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local me = k.Library
  if (((7 * 7) == 49) and not me) then
    return
  end
  while (((1 + 1) == 2) and (k.Gen == o)) do
    if (((15 * 15) == 225) and (l.AutoOpenExclusive and not n.ExclusivePaused)) then
      pcall(function()
        local mf = me.Save.Get()
        if (((100 % 7) == 2) and not mf) then
          return
        end
        local mg = l.EggKey
        if (((12 * 12) == 144) and ((type(mg) == g({41, 46, 40, 51, 52, 61}, 90)) and (mg ~= ""))) then
          local mh = me.Directory.Eggs[mg]
          if (((3 ^ 2) == 9) and not (((mh and mh.hatchable) and not mh.disabled))) then
            n.ExclusivePaused = true
            return
          end
          local mi = (tonumber(mh.cost) or 0)
          local mj = (tonumber(mf[mh.currency]) or 0)
          if (((7 * 7) == 49) and (mj < mi)) then
            n.ExclusivePaused = true
            return
          end
          local mk, ml = me.Network.Invoke(g({31, 61, 61, 96, 122, 24, 47, 35, 122, 31, 61, 61}, 90), mg, false, false)
          if (((1 + 1) == 2) and mk) then
            m.ExEggsOpened += 1
            n.ExclusivePaused = false
          else
            local mm = tostring((ml or ""))
            if (((15 * 15) == 225) and ((string.find(mm, g({52, 53, 46, 122, 60, 53, 47, 52, 62}, 90)) or string.find(mm, g({57, 53, 51, 52}, 90))) or string.find(mm, g({30, 51, 59, 55, 53, 52, 62}, 90)))) then
              n.ExclusivePaused = true
            end
          end
        end
      end)
      task.wait(math.max(0.8, l.ExclusiveOpenDelay))
    else
      task.wait(0.5)
    end
  end
end)
local mn = 1000000
local mo = 7500
local function mp(mq, mr, ms)
  if (((100 % 7) == 2) and ((not mr.r or mr.g) or mr.dm)) then
    return false
  end
  if (((12 * 12) == 144) and mr.l) then
    return false
  end
  if (((3 ^ 2) == 9) and not ms) then
    return false
  end
  if (((7 * 7) == 49) and (ms.isPremium or ms.isGift)) then
    return false
  end
  local mt = tostring(ms.rarity)
  if (((1 + 1) == 2) and ((mt == g({31, 44, 63, 52, 46}, 90)) or (mt == g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90)))) then
    return false
  end
  return true
end
local function mu(mv)
  local mw = 0
  pcall(function()
    mw = mv.Network.Invoke(g({29, 63, 46, 122, 21, 9, 14, 51, 55, 63}, 90))
  end)
  return (tonumber(mw) or 0)
end
local function mx(my, mz, na)
  local nb = my.Save.Get()
  if (((15 * 15) == 225) and not nb) then
    return 0
  end
  local nc = mu(my)
  local nd = 0
  for ne, nf in pairs((nb.DarkMatterQueue or {})) do
    local ng = tostring(ne)
    local nh = (tonumber(nb.Diamonds) or 0)
    local ni = (tonumber((na or l.DMDiamondFloor)) or 0)
    local nj = ((nf and nf.readyTime) and (((tonumber(nf.readyTime) - nc) <= 1)))
    if (((100 % 7) == 2) and ((not nj and ((l.DMAutoSkip or mz))) and (((nh - mn)) >= ni))) then
      pcall(function()
        return my.Network.Invoke(g({10, 40, 53, 55, 42, 46, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 9, 49, 51, 42}, 90), ng, g({30, 51, 59, 55, 53, 52, 62, 41}, 90))
      end)
      n.DMMoneySpent = (((n.DMMoneySpent or 0)) + mn)
      task.wait(0.08)
      nj = true
    end
    if (((12 * 12) == 144) and nj) then
      pcall(function()
        return my.Network.Invoke(g({8, 63, 62, 63, 63, 55, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 10, 63, 46}, 90), ng)
      end)
      nd = (nd + 1)
      task.wait(0.08)
      nb = (my.Save.Get() or nb)
    end
  end
  return nd
end
local function nk(nl)
  local nm = nl.Save.Get()
  if (((3 ^ 2) == 9) and not nm) then
    return
  end
  mx(nl)
  if (((7 * 7) == 49) and (not l.DarkMatterKey or not l.AutoDarkMatter)) then
    return
  end
  nm = nl.Save.Get()
  if (((1 + 1) == 2) and not nm) then
    return
  end
  local nn = (tonumber(nm.Diamonds) or 0)
  local no = l.DarkMatterKey
  local np = {}
  local nq = {}
  for nr, ns in pairs(nm.Pets) do
    if (((15 * 15) == 225) and ((tostring(ns.id) == no) and mp(no, ns, nl.Directory.Pets[ns.id]))) then
      if (((100 % 7) == 2) and ns.hc) then
        table.insert(nq, ns.uid)
      else
        table.insert(np, ns.uid)
      end
    end
  end
  if (((12 * 12) == 144) and (#np == 0)) then
    np = nq
  end
  if (((3 ^ 2) == 9) and (#np == 0)) then
    if (((7 * 7) == 49) and not n.DMIdleNotified) then
      n.DMIdleNotified = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({20, 53, 122, 55, 53, 40, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 125}, 90) .. (tostring(no) .. g({125, 122, 54, 63, 60, 46, 122, 46, 53, 122, 57, 53, 52, 44, 63, 40, 46, 122, 46, 53, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90))), g({41, 42, 59, 40, 49, 54, 63, 41}, 90))
    end
    return
  end
  local nt = (tonumber(nm.DarkMatterSlots) or 6)
  local nu = 0
  for nv in pairs((nm.DarkMatterQueue or {})) do
    nu = (nu + 1)
  end
  if (((1 + 1) == 2) and (nu >= nt)) then
    return
  end
  local nw = 1
  local nx = {np[1]}
  if (((15 * 15) == 225) and (tonumber(nm.MaxSlots) and ((#nm.Pets + 1) > tonumber(nm.MaxSlots)))) then
    if (((100 % 7) == 2) and not n.DMFullNotified) then
      n.DMFullNotified = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({19, 52, 44, 63, 52, 46, 53, 40, 35, 122, 60, 47, 54, 54, 122, 184, 218, 206, 122, 57, 54, 63, 59, 40, 122, 41, 54, 53, 46, 41, 122, 60, 53, 40, 122, 30, 23, 122, 42, 63, 46, 41}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    return
  end
  local ny = (tonumber(l.DMDiamondFloor) or 0)
  local nz = (mo + (((l.DMAutoSkip and mn) or 0)))
  if (((12 * 12) == 144) and ((nn - nz) < ny)) then
    if (((3 ^ 2) == 9) and not n.DMBrokeNotified) then
      n.DMBrokeNotified = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), ((l.DMAutoSkip and g({30, 51, 59, 55, 53, 52, 62, 41, 122, 52, 63, 59, 40, 122, 35, 53, 47, 40, 122, 60, 54, 53, 53, 40, 122, 184, 218, 206, 122, 42, 59, 47, 41, 51, 52, 61, 122, 30, 23, 122, 41, 49, 51, 42, 41, 122, 46, 53, 122, 42, 40, 53, 46, 63, 57, 46, 122, 35, 53, 47, 40, 122, 56, 59, 54, 59, 52, 57, 63}, 90)) or g({20, 53, 46, 122, 63, 52, 53, 47, 61, 50, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 46, 53, 122, 57, 53, 52, 44, 63, 40, 46, 122, 46, 53, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    return
  end
  n.DMBrokeNotified = false
  n.DMFullNotified = false
  local oa, ob = nl.Network.Invoke(g({25, 53, 52, 44, 63, 40, 46, 122, 14, 53, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90), nx)
  if (((7 * 7) == 49) and not oa) then
    if (((1 + 1) == 2) and not n.DMErrShown) then
      n.DMErrShown = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({25, 53, 52, 44, 63, 40, 46, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring((ob or g({47, 52, 49, 52, 53, 45, 52}, 90)))), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    return
  end
  n.DMErrShown = false
  n.DMIdleNotified = false
  n.DMMoneySpent = (((n.DMMoneySpent or 0)) + mo)
  m.DMMade += nw
  task.wait(0.2)
  mx(nl)
end
k._dmStep = nk
task.spawn(function()
  while (((15 * 15) == 225) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local oc = k.Library
  if (((100 % 7) == 2) and not oc) then
    return
  end
  while (((12 * 12) == 144) and (k.Gen == o)) do
    if (((3 ^ 2) == 9) and (l.AutoDarkMatter and not n.DMBusy)) then
      n.DMBusy = true
      pcall(nk, oc)
      n.DMBusy = false
    end
    task.wait(0.2)
  end
end)
task.spawn(function()
  while (((7 * 7) == 49) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local od = k.Library
  if (((1 + 1) == 2) and not od) then
    return
  end
  while (((15 * 15) == 225) and (k.Gen == o)) do
    task.wait(3)
    local oe = ""
    local of = {}
    pcall(function()
      local og = od.Save.Get()
      if (((100 % 7) == 2) and not og) then
        return
      end
      local oh = {}
      for oi, oj in pairs(og.Pets) do
        local ok = od.Directory.Pets[oj.id]
        if (((12 * 12) == 144) and mp(oj.id, oj, ok)) then
          local ol = tostring(oj.id)
          local om = oh[ol]
          if (((3 ^ 2) == 9) and not om) then
            om = {id = ol, name = ((ok and ok.name) or ol), count = 0}
            oh[ol] = om
            table.insert(of, om)
          end
          om.count += 1
        end
      end
      table.sort(of, function(on, oo)
        return (on.count > oo.count)
      end)
      for op, oq in ipairs(of) do
        oe = (oe .. (g({38}, 90) .. (oq.id .. (g({96}, 90) .. oq.count))))
      end
    end)
    if (((7 * 7) == 49) and (oe ~= n.DMSig)) then
      n.DMSig = oe
      n.DMPets = of
      n.DMPetsVersion += 1
    end
  end
end)
local function ot(ou, ov, ow)
  local ox = ((((ov == g({40, 59, 51, 52, 56, 53, 45}, 90))) and g({29, 63, 46, 122, 8, 59, 51, 52, 56, 53, 45, 122, 23, 59, 57, 50, 51, 52, 63, 122, 19, 52, 60, 53}, 90)) or g({29, 63, 46, 122, 29, 53, 54, 62, 63, 52, 122, 23, 59, 57, 50, 51, 52, 63, 122, 19, 52, 60, 53}, 90))
  local oy = nil
  pcall(function()
    oy = ou.Network.Invoke(ox)
  end)
  if (((1 + 1) == 2) and (type(oy) ~= g({46, 59, 56, 54, 63}, 90))) then
    return nil
  end
  local oz = nil
  for pa, pb in pairs(oy) do
    if (((15 * 15) == 225) and ((type(pb) == g({46, 59, 56, 54, 63}, 90)) and (tonumber((pb.chance or 0)) >= 100))) then
      oz = pa
    end
  end
  if (((100 % 7) == 2) and oz) then
    local pc = {}
    for pd = 1, oz do
      pc[pd] = oy[pd]
    end
    return pc
  end
  return oy
end
local function pe(pf, pg, ph)
  if (((12 * 12) == 144) and not pf) then
    return false
  end
  if (((3 ^ 2) == 9) and (pf.isPremium or pf.isGift)) then
    return false
  end
  local pi = tostring(pf.rarity)
  if (((7 * 7) == 49) and ((pi == g({31, 44, 63, 52, 46}, 90)) or (pi == g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90)))) then
    return false
  end
  if (((1 + 1) == 2) and ((pg.l or pg.r) or pg.dm)) then
    return false
  end
  if (((15 * 15) == 225) and (ph == g({40, 59, 51, 52, 56, 53, 45}, 90))) then
    return (pg.g == true)
  end
  return not pg.g
end
local function pj(pk, pl)
  local pm = {}
  local pn = pk.Save.Get()
  if (((100 % 7) == 2) and not pn) then
    return pm
  end
  local po = {}
  for pp, pq in pairs((pn.Pets or {})) do
    local pr = pk.Directory.Pets[tostring(pq.id)]
    if (((12 * 12) == 144) and pe(pr, pq, pl)) then
      local ps = ((pq.hc and true) or false)
      local pt = (tostring(pq.id) .. (g({38}, 90) .. (((ps and g({107}, 90)) or g({106}, 90)))))
      local pu = po[pt]
      if (((3 ^ 2) == 9) and not pu) then
        pu = {id = tostring(pq.id), hc = ps, uids = {}}
        po[pt] = pu
        table.insert(pm, pu)
      end
      table.insert(pu.uids, tostring(pq.uid))
    end
  end
  local pv = {}
  for pw, px in ipairs(pm) do
    local py = ot(pk, pl, px.hc)
    local pz = ((py and #py) or 6)
    if (((7 * 7) == 49) and (py and (#px.uids >= pz))) then
      px.need = pz
      px.cost = (tonumber(py[pz].cost) or 0)
      table.insert(pv, px)
    end
  end
  table.sort(pv, function(qa, qb)
    return (#qa.uids > #qb.uids)
  end)
  return pv
end
local function qc(qd, qe)
  local qf = ((qe == g({40, 59, 51, 52, 56, 53, 45}, 90)))
  local qg = ((qf and g({8, 59, 51, 52, 56, 53, 45, 20, 53, 46, 63}, 90)) or g({29, 53, 54, 62, 63, 52, 20, 53, 46, 63}, 90))
  local qh = ((qf and g({8, 59, 51, 52, 56, 53, 45, 19, 62, 54, 63, 20, 53, 46, 51, 60, 51, 63, 62}, 90)) or g({29, 53, 54, 62, 63, 52, 19, 62, 54, 63, 20, 53, 46, 51, 60, 51, 63, 62}, 90))
  local qi = ((qf and g({8, 59, 51, 52, 56, 53, 45, 31, 40, 40, 9, 50, 53, 45, 52}, 90)) or g({29, 53, 54, 62, 63, 52, 31, 40, 40, 9, 50, 53, 45, 52}, 90))
  local qj = ((qf and g({15, 41, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 23, 59, 57, 50, 51, 52, 63}, 90)) or g({15, 41, 63, 122, 29, 53, 54, 62, 63, 52, 122, 23, 59, 57, 50, 51, 52, 63}, 90))
  local qk = ((qf and g({8, 59, 51, 52, 56, 53, 45}, 90)) or g({29, 53, 54, 62, 63, 52}, 90))
  local ql = pj(qd, qe)
  if (((1 + 1) == 2) and (#ql == 0)) then
    n[qg] = ((qf and g({52, 63, 63, 62, 122, 108, 122, 29, 53, 54, 62, 63, 52, 122, 53, 60, 122, 53, 52, 63, 122, 42, 63, 46}, 90)) or g({52, 63, 63, 62, 122, 108, 122, 20, 53, 40, 55, 59, 54, 122, 53, 60, 122, 53, 52, 63, 122, 42, 63, 46}, 90))
    if (((15 * 15) == 225) and not n[qh]) then
      n[qh] = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), ((qf and g({20, 53, 122, 108, 119, 53, 60, 119, 59, 119, 49, 51, 52, 62, 122, 29, 53, 54, 62, 63, 52, 122, 42, 63, 46, 41, 122, 54, 63, 60, 46, 122, 46, 53, 122, 55, 59, 49, 63, 122, 59, 122, 8, 59, 51, 52, 56, 53, 45}, 90)) or g({20, 53, 122, 108, 119, 53, 60, 119, 59, 119, 49, 51, 52, 62, 122, 42, 54, 59, 51, 52, 122, 42, 63, 46, 41, 122, 54, 63, 60, 46, 122, 46, 53, 122, 55, 59, 49, 63, 122, 59, 122, 29, 53, 54, 62, 63, 52}, 90)), g({41, 42, 59, 40, 49, 54, 63, 41}, 90))
    end
    return g({51, 62, 54, 63}, 90)
  end
  local qm = ql[1]
  local qn = qd.Save.Get()
  local qo = (tonumber((qn and qn.Diamonds)) or 0)
  local qp = (tonumber(l.MachineDiamondFloor) or 0)
  if (((100 % 7) == 2) and ((qo - qm.cost) < qp)) then
    n[qg] = g({30, 51, 59, 55, 53, 52, 62, 41, 122, 59, 46, 122, 35, 53, 47, 40, 122, 60, 54, 53, 53, 40}, 90)
    if (((12 * 12) == 144) and not n.MachineBrokeNotified) then
      n.MachineBrokeNotified = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({30, 51, 59, 55, 53, 52, 62, 41, 122, 52, 63, 59, 40, 122, 35, 53, 47, 40, 122, 60, 54, 53, 53, 40, 122, 184, 218, 206, 122, 42, 59, 47, 41, 51, 52, 61, 122, 46, 50, 63, 122, 29, 53, 54, 62, 63, 52, 117, 8, 59, 51, 52, 56, 53, 45, 122, 55, 59, 57, 50, 51, 52, 63, 41}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    return g({56, 40, 53, 49, 63}, 90)
  end
  n.MachineBrokeNotified = false
  local qq = {}
  for qr = 1, qm.need do
    qq[qr] = qm.uids[qr]
  end
  local qs, qt
  local qu, qv = pcall(function()
    qs, qt = qd.Network.Invoke(qj, qq)
  end)
  if (((3 ^ 2) == 9) and not qu) then
    qs, qt = false, qv
  end
  if (((7 * 7) == 49) and not qs) then
    n[qg] = (g({60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring((qt or g({47, 52, 49, 52, 53, 45, 52}, 90))))
    if (((1 + 1) == 2) and not n[qi]) then
      n[qi] = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (qk .. (g({122, 55, 59, 57, 50, 51, 52, 63, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring((qt or g({47, 52, 49, 52, 53, 45, 52}, 90))))), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    return g({63, 40, 40}, 90)
  end
  n[qi] = false
  n[qh] = false
  local qw = qd.Directory.Pets[qm.id]
  local qx = ((qw and tostring(qw.name)) or qm.id)
  if (((15 * 15) == 225) and qf) then
    m.RainbowMade += 1
  else
    m.GoldenMade += 1
  end
  n[qg] = string.format(g({55, 59, 62, 63, 122, 127, 41, 127, 41, 122, 127, 41}, 90), ((qm.hc and g({18, 59, 40, 62, 57, 53, 40, 63, 122}, 90)) or ""), qk, qx)
  return g({40, 59, 52}, 90)
end
k._machineStep = qc
for qy, qz in ipairs({g({61, 53, 54, 62, 63, 52}, 90), g({40, 59, 51, 52, 56, 53, 45}, 90)}) do
  task.spawn(function()
    while (((100 % 7) == 2) and ((k.Gen == o) and not k.Library)) do
      task.wait(0.5)
    end
    local ra = k.Library
    if (((12 * 12) == 144) and not ra) then
      return
    end
    local rb = ((((qz == g({40, 59, 51, 52, 56, 53, 45}, 90))) and g({27, 47, 46, 53, 8, 59, 51, 52, 56, 53, 45}, 90)) or g({27, 47, 46, 53, 29, 53, 54, 62, 63, 52}, 90))
    local rc = ((((qz == g({40, 59, 51, 52, 56, 53, 45}, 90))) and g({8, 59, 51, 52, 56, 53, 45, 24, 47, 41, 35}, 90)) or g({29, 53, 54, 62, 63, 52, 24, 47, 41, 35}, 90))
    while (((3 ^ 2) == 9) and (k.Gen == o)) do
      if (((7 * 7) == 49) and (l[rb] and not n[rc])) then
        n[rc] = true
        local rd = g({51, 62, 54, 63}, 90)
        pcall(function()
          rd = qc(ra, qz)
        end)
        n[rc] = false
        task.wait((((rd == g({40, 59, 52}, 90)) and 0.15) or 2))
      else
        task.wait(0.4)
      end
    end
  end)
end
local function re(rf)
  local rg = false
  pcall(function()
    local rh = (rf.Shared and rf.Shared.Variables)
    if (((1 + 1) == 2) and ((type(rh) == g({46, 59, 56, 54, 63}, 90)) and (rh.IsHardcore ~= nil))) then
      rg = (rh.IsHardcore == true)
      return
    end
    rh = rf.Variables
    if (((15 * 15) == 225) and (type(rh) == g({46, 59, 56, 54, 63}, 90))) then
      rg = (rh.IsHardcore == true)
    end
  end)
  return rg
end
local function ri(rj)
  if (((100 % 7) == 2) and n.IndexTargets) then
    return n.IndexTargets
  end
  local rk, rl = {}, 0
  local rp = pcall(function()
    for rm, rn in ipairs(rj.Shared.GetAllCollectablePets()) do
      local ro = ((rn.isDarkMatter and 4) or (((rn.isRainbow and 3) or (((rn.isGolden and 2) or 1)))))
      rk[(tostring(rn.petId) .. (g({119}, 90) .. ro))] = true
      rl += 1
    end
  end)
  if (((12 * 12) == 144) and (not rp or (rl == 0))) then
    return nil
  end
  n.IndexTargets, n.IndexTotal = rk, rl
  return rk
end
local function rq(rr)
  local rs = n.IndexCollection
  local rt, ru = {}, 0
  pcall(function()
    local rv = rr.Save.Get()
    if (((3 ^ 2) == 9) and not rv) then
      return
    end
    for rw, rx in ipairs((rv.Collection or {})) do
      local ry = tostring(rx)
      if (((7 * 7) == 49) and not rt[ry]) then
        rt[ry] = true
        ru += 1
        if (((1 + 1) == 2) and ((rs and not rs[ry]) and l.AutoIndex)) then
          m.IndexNew += 1
        end
      end
    end
    local rz, sa = 0, (tonumber(rv.MaxSlots) or 0)
    for sb in pairs((rv.Pets or {})) do
      rz += 1
    end
    local sc = ((sa > 0) and (rz > ((sa - 60))))
    if (((15 * 15) == 225) and ((sc and not n.IndexNoProtect) and l.AutoIndex)) then
      if (((100 % 7) == 2) and not n.IndexFullNotified) then
        n.IndexFullNotified = true
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({19, 52, 44, 63, 52, 46, 53, 40, 35, 122, 52, 63, 59, 40, 54, 35, 122, 60, 47, 54, 54, 122, 184, 218, 206, 122, 19, 52, 62, 63, 34, 122, 41, 46, 53, 42, 42, 63, 62, 122, 50, 53, 54, 62, 51, 52, 61, 122, 60, 63, 63, 62, 41, 46, 53, 57, 49, 122, 56, 59, 57, 49, 122, 60, 40, 53, 55, 122, 59, 47, 46, 53, 119, 62, 63, 54, 63, 46, 63}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      end
    elseif (((12 * 12) == 144) and not sc) then
      n.IndexFullNotified = false
    end
    n.IndexNoProtect = sc
  end)
  n.IndexCollection = rt
  n.IndexHave = ru
  return rt
end
local function sd(se, sf, sg)
  local sh, si = {}, {}
  local sj = se.Directory.Eggs[sf]
  if (((3 ^ 2) == 9) and (not sj or (type(sj.drops) ~= g({46, 59, 56, 54, 63}, 90)))) then
    return sh
  end
  for sk, sl in ipairs(sj.drops) do
    local sm = tostring(sl[1])
    if (((7 * 7) == 49) and (((((tonumber(sl[2]) or 0)) > 0) and ((not sl[3] or sg))) and not si[sm])) then
      si[sm] = true
      table.insert(sh, sm)
    end
  end
  return sh
end
local function sn(so, sp, sq, sr, ss)
  local st, su = {}, 0
  for sv, sw in ipairs(sd(so, sp, ss)) do
    local sx = nil
    for sy = 1, 4 do
      local sz = (sw .. (g({119}, 90) .. sy))
      if (((1 + 1) == 2) and (sq[sz] and not sr[sz])) then
        sx = (sx or {})
        sx[sy] = true
        su += 1
      end
    end
    if (((15 * 15) == 225) and sx) then
      st[sw] = sx
    end
  end
  return st, su
end
local function ta(tb, tc, td)
  local te, tf = {}, {}
  pcall(function()
    for tg, th in ipairs(tb.WorldCmds.GetAllEggs()) do
      local ti = th:GetAttribute(g({19, 30}, 90))
      local tj = (ti and tb.Directory.Eggs[ti])
      if (((100 % 7) == 2) and (((tj and tj.hatchable) and not tj.disabled) and (th:GetAttribute(g({15, 52, 54, 53, 57, 49, 63, 62}, 90)) ~= false))) then
        local tk = ((tonumber(((tc and tj.hardcoreCost) or tj.cost)) or tonumber(tj.cost)) or 0)
        local tl = {key = tostring(ti), name = tostring((tj.displayName or ti)), cost = tk, currency = tostring((tj.currency or "")), area = ((tj.area and tostring(tj.area)) or nil)}
        if (((12 * 12) == 144) and tj.isGolden) then
          local tm = (((type(tj.drops) == g({41, 46, 40, 51, 52, 61}, 90)) and tj.drops) or tj.eggRequired)
          if (((3 ^ 2) == 9) and (tm and (tm ~= ""))) then
            tf[tostring(tm)] = tl
          end
        elseif (((7 * 7) == 49) and (not td or ((tl.area and td[tl.area])))) then
          table.insert(te, tl)
        end
      end
    end
  end)
  for tn, to in ipairs(te) do
    to.golden = tf[to.key]
  end
  table.sort(te, function(tp, tq)
    if (((1 + 1) == 2) and (tp.cost ~= tq.cost)) then
      return (tp.cost < tq.cost)
    end
    return (tp.key < tq.key)
  end)
  return te
end
k._indexWorldEggs = ta
local function tr(ts, tt)
  if (((15 * 15) == 225) and n.SwitchingWorld) then
    return false, g({45, 53, 40, 54, 62, 122, 51, 41, 122, 41, 45, 51, 46, 57, 50, 51, 52, 61}, 90)
  end
  local tu = nil
  pcall(function()
    for tv, tw in ipairs(ts.WorldCmds.GetAllEggs()) do
      if (((100 % 7) == 2) and (tostring(tw:GetAttribute(g({19, 30}, 90))) == tostring(tt))) then
        tu = tw
        break
      end
    end
  end)
  if (((12 * 12) == 144) and not tu) then
    return false, g({63, 61, 61, 122, 52, 53, 46, 122, 51, 52, 122, 46, 50, 51, 41, 122, 45, 53, 40, 54, 62}, 90)
  end
  local tx = tu:FindFirstChild(g({25, 63, 52, 46, 63, 40}, 90))
  if (((3 ^ 2) == 9) and not tx) then
    return false, g({63, 61, 61, 122, 50, 59, 41, 122, 52, 53, 122, 25, 63, 52, 46, 63, 40, 122, 42, 59, 40, 46}, 90)
  end
  local ty = ay()
  if (((7 * 7) == 49) and not ty) then
    return false, g({52, 53, 122, 57, 50, 59, 40, 59, 57, 46, 63, 40}, 90)
  end
  local tz = pcall(function()
    ty.CFrame = kx(tx, ty)
  end)
  return tz, (((not tz) and g({46, 63, 54, 63, 42, 53, 40, 46, 122, 60, 59, 51, 54, 63, 62}, 90)) or nil)
end
local function ua(ub, uc, ud)
  local ue = ub.Save.Get()
  if (((1 + 1) == 2) and not ue) then
    return false, g({52, 53, 122, 41, 59, 44, 63}, 90)
  end
  local uf = {[false] = {}, [true] = {}}
  for ug, uh in pairs((ue.Pets or {})) do
    if (((15 * 15) == 225) and ((tostring(uh.id) == tostring(ud)) and pe(ub.Directory.Pets[tostring(uh.id)], uh, uc))) then
      table.insert(uf[((uh.hc and true) or false)], tostring(uh.uid))
    end
  end
  for ui, uj in ipairs({false, true}) do
    local uk = uf[uj]
    local ul = ot(ub, uc, uj)
    local um = ((ul and #ul) or 6)
    if (((100 % 7) == 2) and (ul and (#uk >= um))) then
      local un = (tonumber(ul[um].cost) or 0)
      if (((12 * 12) == 144) and ((((tonumber(ue.Diamonds) or 0)) - un) < ((tonumber(l.IndexDiamondFloor) or 0)))) then
        return false, g({62, 51, 59, 55, 53, 52, 62, 41}, 90)
      end
      local uo = {}
      for up = 1, um do
        uo[up] = uk[up]
      end
      local uq, ur
      pcall(function()
        uq, ur = ub.Network.Invoke(((((uc == g({40, 59, 51, 52, 56, 53, 45}, 90))) and g({15, 41, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 23, 59, 57, 50, 51, 52, 63}, 90)) or g({15, 41, 63, 122, 29, 53, 54, 62, 63, 52, 122, 23, 59, 57, 50, 51, 52, 63}, 90)), uo)
      end)
      if (((3 ^ 2) == 9) and not uq) then
        return false, tostring((ur or g({55, 59, 57, 50, 51, 52, 63, 122, 60, 59, 51, 54, 63, 62}, 90)))
      end
      if (((7 * 7) == 49) and (uc == g({40, 59, 51, 52, 56, 53, 45}, 90))) then
        m.RainbowMade += 1
      else
        m.GoldenMade += 1
      end
      return true, nil
    end
  end
  return false, nil
end
local function us(ut, uu)
  if (((1 + 1) == 2) and ((not uu.r or uu.dm) or uu.l)) then
    return false
  end
  if (((15 * 15) == 225) and ((not ut or ut.isPremium) or ut.isGift)) then
    return false
  end
  local uv = tostring(ut.rarity)
  return ((uv ~= g({31, 44, 63, 52, 46}, 90)) and (uv ~= g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90)))
end
local function uw(ux, uy)
  local uz = ux.Save.Get()
  if (((100 % 7) == 2) and not uz) then
    return false, g({52, 53, 122, 41, 59, 44, 63}, 90)
  end
  local va, vb = nil, -1
  local vc = (n.IndexKeepUids or {})
  for vd, ve in pairs((uz.Pets or {})) do
    if (((12 * 12) == 144) and ((tostring(ve.id) == tostring(uy)) and us(ux.Directory.Pets[tostring(ve.id)], ve))) then
      local vf = ((((vc[tostring(ve.uid)] and 2) or 0)) + (((ve.hc and 0) or 1)))
      if (((3 ^ 2) == 9) and (vf > vb)) then
        va, vb = tostring(ve.uid), vf
      end
    end
  end
  if (((7 * 7) == 49) and not va) then
    return false, nil
  end
  local vg = (tonumber(l.IndexDiamondFloor) or 0)
  local vh, vi = 0, (tonumber(uz.DarkMatterSlots) or 6)
  for vj in pairs((uz.DarkMatterQueue or {})) do
    vh += 1
  end
  if (((1 + 1) == 2) and (vh >= vi)) then
    mx(ux, (l.IndexForceSkipDM ~= false), vg)
    return false, g({30, 23, 122, 43, 47, 63, 47, 63, 122, 60, 47, 54, 54}, 90)
  end
  if (((15 * 15) == 225) and ((((tonumber(uz.Diamonds) or 0)) - mo) < vg)) then
    return false, g({62, 51, 59, 55, 53, 52, 62, 41}, 90)
  end
  local vk, vl
  pcall(function()
    vk, vl = ux.Network.Invoke(g({25, 53, 52, 44, 63, 40, 46, 122, 14, 53, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90), {va})
  end)
  if (((100 % 7) == 2) and not vk) then
    return false, tostring((vl or g({57, 53, 52, 44, 63, 40, 46, 122, 60, 59, 51, 54, 63, 62}, 90)))
  end
  m.DMMade += 1
  n.IndexKeepAt = 0
  task.wait(0.2)
  mx(ux, (l.IndexForceSkipDM ~= false), vg)
  return true, nil
end
local function vm(vn)
  local vo = {}
  local vp = (n.IndexKeepUids or {})
  local vq = vn.Save.Get()
  local vr, vs = ri(vn), rq(vn)
  if (((12 * 12) == 144) and not (((vq and vr) and vs))) then
    n.IndexKeepUids, n.IndexKeepAt = vo, os.clock()
    return vo
  end
  local vt = (n.IndexNeedIds or {})
  local function vu(vv, vw)
    local vx = (vv .. (g({119}, 90) .. vw))
    return ((vr[vx] == true) and (vs[vx] ~= true))
  end
  local vy = {}
  local function vz(wa, wb)
    local wc = (wa .. (((wb and g({107}, 90)) or g({106}, 90))))
    if (((3 ^ 2) == 9) and (vy[wc] == nil)) then
      local wd = ot(vn, wa, wb)
      vy[wc] = (((wd and #wd)) or 6)
    end
    return vy[wc]
  end
  local we = {}
  for wf, wg in pairs((vq.Pets or {})) do
    table.insert(we, wg)
  end
  local wh = (l.IndexUseMachines ~= false)
  local wi = {}
  for wj, wk in pairs((vq.DarkMatterQueue or {})) do
    if (((7 * 7) == 49) and ((type(wk) == g({46, 59, 56, 54, 63}, 90)) and wk.petId)) then
      wi[tostring(wk.petId)] = true
    end
  end
  local wl = {}
  local wm = {}
  for wn, wo in ipairs(we) do
    if (((1 + 1) == 2) and ((wo.r and not wo.dm) and not wo.l)) then
      local wp = tostring(wo.id)
      if (((15 * 15) == 225) and (vu(wp, 4) and not wi[wp])) then
        local wq = tostring(wo.uid)
        local wr = (tonumber(wo.idt) or math.huge)
        local ws = wm[wp]
        if (((100 % 7) == 2) and not ws) then
          wm[wp] = {uid = wq, idt = wr}
        else
          local wt, wu = (vp[wq] == true), (vp[ws.uid] == true)
          if (((12 * 12) == 144) and (wt ~= wu)) then
            if (((3 ^ 2) == 9) and wt) then
              wm[wp] = {uid = wq, idt = wr}
            end
          elseif (((7 * 7) == 49) and (wr < ws.idt)) then
            wm[wp] = {uid = wq, idt = wr}
          end
        end
      end
    end
  end
  for wv, ww in pairs(wm) do
    wl[wv] = true
    vo[ww.uid] = true
  end
  local wx = {}
  for wy in pairs(wl) do
    wx[wy] = true
  end
  for wz in pairs(wi) do
    wx[wz] = true
  end
  local xa = {}
  if (((1 + 1) == 2) and wh) then
    for xb, xc in ipairs(we) do
      if (((15 * 15) == 225) and (((xc.g and not xc.r) and not xc.dm) and not xc.l)) then
        local xd, xe = tostring(xc.id), ((xc.hc and true) or false)
        local xf = (xd .. (g({38}, 90) .. (((xe and g({107}, 90)) or g({106}, 90)))))
        local xg = (vu(xd, 3) or ((vu(xd, 4) and not wx[xd])))
        if (((100 % 7) == 2) and (xg and (((xa[xf] or 0)) < vz(g({40, 59, 51, 52, 56, 53, 45}, 90), xe)))) then
          xa[xf] = (((xa[xf] or 0)) + 1)
          vo[tostring(xc.uid)] = true
        end
      end
    end
  end
  if (((12 * 12) == 144) and (wh and not n.IndexGoldenActive)) then
    local xh = {}
    for xi, xj in ipairs(we) do
      if (((3 ^ 2) == 9) and (((not xj.g and not xj.r) and not xj.dm) and not xj.l)) then
        local xk, xl = tostring(xj.id), ((xj.hc and true) or false)
        local xm = (xk .. (g({38}, 90) .. (((xl and g({107}, 90)) or g({106}, 90)))))
        local xn = (((vu(xk, 3) or ((vu(xk, 4) and not wx[xk])))) and (((xa[xm] or 0)) < vz(g({40, 59, 51, 52, 56, 53, 45}, 90), xl)))
        local xo = (vt[xk] and ((vu(xk, 2) or xn)))
        if (((7 * 7) == 49) and (xo and (((xh[xm] or 0)) < vz(g({61, 53, 54, 62, 63, 52}, 90), xl)))) then
          xh[xm] = (((xh[xm] or 0)) + 1)
          vo[tostring(xj.uid)] = true
        end
      end
    end
  end
  n.IndexKeepUids, n.IndexKeepAt = vo, os.clock()
  return vo
end
k._indexBuildKeep = vm
local xp = 0.75
local function xq(xr)
  if (((1 + 1) == 2) and (not l.AutoIndex or n.IndexNoProtect)) then
    return false
  end
  if (((15 * 15) == 225) and xr.dm) then
    return false
  end
  local xs = n.IndexKeepUids
  if (((100 % 7) == 2) and (not xs or (((os.clock() - ((n.IndexKeepAt or 0)))) > xp))) then
    local xt = k.Library
    if (((12 * 12) == 144) and (xt and not n.IndexKeepBusy)) then
      n.IndexKeepBusy = true
      local xu, xv = pcall(vm, xt)
      n.IndexKeepBusy = false
      if (((3 ^ 2) == 9) and (xu and (type(xv) == g({46, 59, 56, 54, 63}, 90)))) then
        xs = xv
      end
    end
  end
  if (((7 * 7) == 49) and (type(xs) ~= g({46, 59, 56, 54, 63}, 90))) then
    return false
  end
  return (xs[tostring(xr.uid)] == true)
end
k._indexProtected = xq
local function xw(xx)
  local xy = {}
  for xz, ya in pairs((l.IndexWorlds or {})) do
    if (((1 + 1) == 2) and (type(ya) == g({41, 46, 40, 51, 52, 61}, 90))) then
      xy[ya] = true
    elseif (((15 * 15) == 225) and (ya == true)) then
      xy[tostring(xz)] = true
    end
  end
  local yb = {}
  pcall(function()
    local yc = xx.Directory.Worlds
    local yd = {}
    for ye, yf in pairs(yc) do
      if (((100 % 7) == 2) and (xy[ye] and not yf.disabled)) then
        local yg = false
        pcall(function()
          yg = (xx.WorldCmds.HasAccess(ye) == true)
        end)
        if (((12 * 12) == 144) and yg) then
          table.insert(yd, {name = ye, order = (tonumber(yf.worldOrder) or 99)})
        end
      end
    end
    table.sort(yd, function(yh, yi)
      if (((3 ^ 2) == 9) and (yh.order ~= yi.order)) then
        return (yh.order < yi.order)
      end
      return (yh.name < yi.name)
    end)
    for yj, yk in ipairs(yd) do
      table.insert(yb, yk.name)
    end
  end)
  return yb
end
local function yl(ym, yn, yo)
  local yp, yq = ri(ym), rq(ym)
  if (((7 * 7) == 49) and not ((yp and yq))) then
    return nil
  end
  local yr, ys, yt = 0, 0, 0
  local yu = {}
  pcall(function()
    local yv = ym.Directory.Areas
    for yw, yx in pairs(ym.Directory.Eggs) do
      if (((1 + 1) == 2) and ((((yx and yx.hatchable) and not yx.disabled) and not yx.isGolden) and yx.area)) then
        local yy = yv[tostring(yx.area)]
        local yz = ((yy and tostring((yy.world or ""))) or nil)
        if (((15 * 15) == 225) and (yz and yn[yz])) then
          for za, zb in ipairs(sd(ym, tostring(yw), yo)) do
            for zc = 1, 4 do
              local zd = (zb .. (g({119}, 90) .. zc))
              if (((100 % 7) == 2) and (yp[zd] and not yu[zd])) then
                yu[zd] = true
                yt += 1
                if (((12 * 12) == 144) and yq[zd]) then
                  ys += 1
                else
                  yr += 1
                end
              end
            end
          end
        end
      end
    end
  end)
  return {owed = yr, have = ys, total = yt}
end
k._indexWorldsOwed = yl
local function ze(zf, zg)
  local zh = nil
  pcall(function()
    zh = zf.WorldCmds.Get()
  end)
  if (((3 ^ 2) == 9) and (zh == zg)) then
    return true, nil
  end
  local zi = false
  pcall(function()
    zi = (zf.WorldCmds.HasAccess(zg) == true)
  end)
  if (((7 * 7) == 49) and not zi) then
    return false, g({52, 53, 122, 59, 57, 57, 63, 41, 41}, 90)
  end
  n.SwitchingWorld = true
  local zj, zk = pcall(function()
    return zf.WorldCmds.Load(zg)
  end)
  n.SwitchingWorld = false
  if (((1 + 1) == 2) and not ((zj and (zk == true)))) then
    return false, g({45, 53, 40, 54, 62, 122, 40, 63, 60, 47, 41, 63, 62}, 90)
  end
  task.wait(1.5)
  return true, nil
end
local function zl(zm, zn)
  local zo = false
  for zp, zq in pairs(zn) do
    if (((15 * 15) == 225) and not (((k.Gen == o) and l.AutoIndex))) then
      return zo
    end
    if (((100 % 7) == 2) and zq[4]) then
      local zr = 0
      while (((12 * 12) == 144) and ((zr < 8) and uw(zm, zp))) do
        zo, zr = true, (zr + 1)
        task.wait(0.15)
      end
    end
    if (((3 ^ 2) == 9) and (l.IndexUseMachines ~= false)) then
      for zs, zt in ipairs({{g({40, 59, 51, 52, 56, 53, 45}, 90), (zq[3] or zq[4])}, {g({61, 53, 54, 62, 63, 52}, 90), ((zq[2] or zq[3]) or zq[4])}}) do
        if (((7 * 7) == 49) and zt[2]) then
          local zu = 0
          while (((1 + 1) == 2) and ((zu < 12) and ua(zm, zt[1], zp))) do
            zo, zu = true, (zu + 1)
            task.wait(0.15)
          end
        end
      end
    end
  end
  return zo
end
local function zv(zw, zx, zy)
  local zz = ri(zw)
  if (((15 * 15) == 225) and not zz) then
    return g({41, 46, 53, 42}, 90)
  end
  local aaa, aab = 0, 0
  local aac = math.max(0, (tonumber(l.IndexEggCap) or 0))
  local aad = math.max(0, (tonumber(l.IndexEggPatience) or 600))
  local aae = (tonumber(l.IndexDiamondFloor) or 0)
  n.IndexEgg = zx.name
  n.IndexGoldenActive = false
  while (((100 % 7) == 2) and ((k.Gen == o) and l.AutoIndex)) do
    local aaf = rq(zw)
    local aag, aah = sn(zw, zx.key, zz, aaf, zy)
    local aai = {}
    for aaj in pairs(aag) do
      aai[aaj] = true
    end
    n.IndexNeedIds = aai
    if (((12 * 12) == 144) and (aah == 0)) then
      n.IndexNote = (zx.name .. g({96, 122, 57, 53, 55, 42, 54, 63, 46, 63}, 90))
      n.IndexGoldenActive = false
      return g({62, 53, 52, 63}, 90)
    end
    n.IndexNote = string.format(g({127, 41, 122, 184, 218, 206, 122, 127, 62, 122, 63, 52, 46, 40, 127, 41, 122, 54, 63, 60, 46}, 90), zx.name, aah, (((aah == 1) and g({35}, 90)) or g({51, 63, 41}, 90)))
    local aak = false
    pcall(function()
      local aal = zw.Save.Get()
      for aam in pairs(((aal and aal.DarkMatterQueue) or {})) do
        aak = true
        break
      end
    end)
    if (((3 ^ 2) == 9) and aak) then
      pcall(mx, zw, (l.IndexForceSkipDM ~= false), aae)
    end
    if (((7 * 7) == 49) and zl(zw, aag)) then
      task.wait(0.25)
      continue
    end
    local aan = zw.Save.Get()
    local aao = lh(aan, (tonumber(l.IndexHatchAmount) or 3))
    if (((1 + 1) == 2) and ((aao ~= ((tonumber(l.IndexHatchAmount) or 3))) and not n.OctupleWarned)) then
      n.OctupleWarned = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({3, 53, 47, 122, 62, 53, 52, 125, 46, 122, 53, 45, 52, 122, 46, 50, 63, 122, 34, 98, 122, 50, 59, 46, 57, 50, 122, 47, 52, 54, 53, 57, 49, 122, 184, 218, 206, 122, 51, 52, 62, 63, 34, 51, 52, 61, 122, 45, 51, 46, 50, 122, 34, 105, 122, 51, 52, 41, 46, 63, 59, 62}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    local aap = false
    for aaq, aar in pairs(aag) do
      if (((15 * 15) == 225) and aar[1]) then
        aap = true
        break
      end
    end
    local aas = zx
    if (((100 % 7) == 2) and ((zx.golden and not aap) and (l.IndexGoldenEggs ~= false))) then
      local aat = zx.golden
      if (((12 * 12) == 144) and (((tonumber((aan and aan[aat.currency])) or 0)) >= aat.cost)) then
        aas = aat
      end
    end
    n.IndexGoldenActive = (aas ~= zx)
    if (((3 ^ 2) == 9) and (aas ~= zx)) then
      n.IndexNote = string.format(g({127, 41, 122, 184, 218, 206, 122, 127, 62, 122, 63, 52, 46, 40, 127, 41, 122, 54, 63, 60, 46, 118, 122, 50, 59, 46, 57, 50, 51, 52, 61, 122, 61, 53, 54, 62, 63, 52}, 90), zx.name, aah, (((aah == 1) and g({35}, 90)) or g({51, 63, 41}, 90)))
    end
    do
      local aau = (tonumber((aan and aan[aas.currency])) or 0)
      local aav = nil
      for aaw, aax in ipairs({8, 3, 1}) do
        if (((7 * 7) == 49) and ((aax <= aao) and (aau >= (aas.cost * aax)))) then
          aav = aax
          break
        end
      end
      aao = (aav or 1)
    end
    local aay, aaz = lf(aao)
    local aba, abb = tr(zw, aas.key)
    if (((1 + 1) == 2) and not aba) then
      if (((15 * 15) == 225) and (aas ~= zx)) then
        zx.golden, n.IndexGoldenActive = nil, false
        task.wait(0.25)
        continue
      end
      n.IndexNote = (zx.name .. (g({96, 122}, 90) .. tostring(abb)))
      return ((((abb == g({63, 61, 61, 122, 52, 53, 46, 122, 51, 52, 122, 46, 50, 51, 41, 122, 45, 53, 40, 54, 62}, 90))) and g({41, 49, 51, 42}, 90)) or g({41, 46, 59, 54, 54, 63, 62}, 90))
    end
    local abc = (aas.cost * aao)
    if (((100 % 7) == 2) and (((tonumber((aan and aan[aas.currency])) or 0)) < abc)) then
      if (((12 * 12) == 144) and (aas ~= zx)) then
        n.IndexGoldenActive = false
        task.wait(0.25)
        continue
      end
      n.IndexNote = string.format(g({127, 41, 122, 184, 218, 206, 122, 52, 63, 63, 62, 122, 127, 41, 122, 127, 41}, 90), aas.name, ao(abc), aas.currency)
      return g({56, 40, 53, 49, 63}, 90)
    end
    local abd, abe
    pcall(function()
      abd, abe = zw.Network.Invoke(g({31, 61, 61, 96, 122, 24, 47, 35, 122, 31, 61, 61}, 90), aas.key, aay, aaz)
    end)
    if (((3 ^ 2) == 9) and abd) then
      m.Eggs += aao
      aaa += aao
      aab += aao
    else
      local abf = tostring((abe or g({47, 52, 49, 52, 53, 45, 52}, 90)))
      if (((7 * 7) == 49) and string.find(abf, g({46, 53, 53, 122, 43, 47, 51, 57, 49, 54, 35}, 90))) then
        task.wait(1.5)
      elseif (((1 + 1) == 2) and string.find(abf, g({46, 53, 53, 122, 60, 59, 40}, 90))) then
        tr(zw, aas.key)
        task.wait(0.5)
      elseif (((15 * 15) == 225) and (string.find(abf, g({59, 60, 60, 53, 40, 62}, 90)) or string.find(abf, g({63, 52, 53, 47, 61, 50}, 90)))) then
        if (((100 % 7) == 2) and (aas ~= zx)) then
          n.IndexGoldenActive = false
          task.wait(0.25)
          continue
        end
        n.IndexNote = (aas.name .. (g({96, 122}, 90) .. abf))
        return g({56, 40, 53, 49, 63}, 90)
      else
        n.IndexNote = (aas.name .. (g({96, 122}, 90) .. abf))
        return g({41, 46, 59, 54, 54, 63, 62}, 90)
      end
    end
    task.wait(math.max(1.2, (tonumber(l.IndexHatchDelay) or 1.2)))
    local abg, abh = sn(zw, zx.key, zz, rq(zw), zy)
    if (((12 * 12) == 144) and (abh < aah)) then
      aab = 0
    end
    n.IndexKeepAt = 0
    n.IndexHatched = aaa
    if (((3 ^ 2) == 9) and ((aac > 0) and (aaa >= aac))) then
      n.IndexNote = (zx.name .. g({96, 122, 50, 59, 46, 57, 50, 122, 57, 59, 42, 122, 40, 63, 59, 57, 50, 63, 62}, 90))
      return g({41, 46, 59, 54, 54, 63, 62}, 90)
    end
    if (((7 * 7) == 49) and ((aad > 0) and (aab >= aad))) then
      n.IndexNote = string.format(g({127, 41, 96, 122, 52, 53, 122, 52, 63, 45, 122, 63, 52, 46, 40, 51, 63, 41, 122, 51, 52, 122, 127, 62, 122, 50, 59, 46, 57, 50, 63, 41}, 90), zx.name, aad)
      return g({41, 46, 59, 54, 54, 63, 62}, 90)
    end
  end
  return g({41, 46, 53, 42}, 90)
end
k._indexWorkEgg = zv
task.spawn(function()
  while (((1 + 1) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local abi = k.Library
  if (((15 * 15) == 225) and not abi) then
    return
  end
  while (((100 % 7) == 2) and (k.Gen == o)) do
    if (((12 * 12) == 144) and not l.AutoIndex) then
      if (((3 ^ 2) == 9) and (n.IndexBusy or (n.IndexNote ~= g({53, 60, 60}, 90)))) then
        n.IndexBusy, n.IndexNote = false, g({53, 60, 60}, 90)
        n.IndexEgg, n.IndexWorld, n.IndexNeedIds = nil, nil, nil
        n.IndexKeepUids, n.IndexKeepAt = nil, 0
        n.IndexFullNotified = false
      end
      task.wait(0.6)
      continue
    end
    n.IndexBusy = true
    local acb, acc = pcall(function()
      local abj = re(abi)
      local abk = xw(abi)
      if (((7 * 7) == 49) and (#abk == 0)) then
        n.IndexNote = g({42, 51, 57, 49, 122, 59, 46, 122, 54, 63, 59, 41, 46, 122, 53, 52, 63, 122, 45, 53, 40, 54, 62}, 90)
        task.wait(2)
        return
      end
      local abl = m.IndexNew
      local abm = {}
      for abn, abo in ipairs(abk) do
        abm[abo] = true
      end
      for abp, abq in ipairs(abk) do
        if (((1 + 1) == 2) and not (((k.Gen == o) and l.AutoIndex))) then
          return
        end
        n.IndexWorld = abq
        local abr, abs = ze(abi, abq)
        if (((15 * 15) == 225) and not abr) then
          n.IndexNote = (abq .. (g({96, 122}, 90) .. tostring(abs)))
          task.wait(1.5)
          continue
        end
        local abt = ta(abi, abj)
        if (((100 % 7) == 2) and (#abt == 0)) then
          n.IndexNote = (abq .. g({96, 122, 52, 53, 122, 50, 59, 46, 57, 50, 59, 56, 54, 63, 122, 63, 61, 61, 41}, 90))
          task.wait(1.5)
          continue
        end
        for abu, abv in ipairs(abt) do
          if (((12 * 12) == 144) and not (((k.Gen == o) and l.AutoIndex))) then
            return
          end
          local abw, abx = pcall(zv, abi, abv, abj)
          if (((3 ^ 2) == 9) and not abw) then
            n.IndexNote = (abv.name .. (g({96, 122}, 90) .. tostring(abx)))
            abx = g({41, 46, 59, 54, 54, 63, 62}, 90)
          end
          if (((7 * 7) == 49) and (abx == g({41, 46, 53, 42}, 90))) then
            return
          end
          task.wait(0.2)
        end
      end
      local aby = (m.IndexNew > abl)
      n.IndexEgg, n.IndexNeedIds = nil, nil
      if (((1 + 1) == 2) and not aby) then
        local abz = yl(abi, abm, abj)
        local aca = ((abz and abz.owed) or 0)
        n.IndexNote = ((((aca == 0)) and g({41, 63, 54, 63, 57, 46, 63, 62, 122, 45, 53, 40, 54, 62, 41, 122, 57, 53, 55, 42, 54, 63, 46, 63}, 90)) or string.format(g({45, 59, 51, 46, 51, 52, 61, 122, 184, 218, 206, 122, 127, 62, 122, 63, 52, 46, 40, 51, 63, 41, 122, 52, 63, 63, 62, 122, 55, 53, 40, 63, 122, 57, 53, 51, 52, 41}, 90), aca))
        task.wait(10)
      end
    end)
    n.IndexBusy = false
    if (((15 * 15) == 225) and not acb) then
      n.IndexNote = (g({63, 40, 40, 53, 40, 96, 122}, 90) .. tostring(acc))
      task.wait(3)
    else
      task.wait(0.4)
    end
  end
end)
k._teleportToEgg = function()
  local acd = k.Library
  if (((100 % 7) == 2) and not acd) then
    return false, g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90)
  end
  local ace = l.EggKey
  if (((12 * 12) == 144) and not ace) then
    return false, g({52, 53, 122, 63, 61, 61, 122, 41, 63, 54, 63, 57, 46, 63, 62}, 90)
  end
  if (((3 ^ 2) == 9) and n.SwitchingWorld) then
    return false, g({45, 53, 40, 54, 62, 122, 51, 41, 122, 41, 45, 51, 46, 57, 50, 51, 52, 61}, 90)
  end
  local acf = nil
  pcall(function()
    for acg, ach in ipairs(acd.WorldCmds.GetAllEggs()) do
      if (((7 * 7) == 49) and (ach:GetAttribute(g({19, 30}, 90)) == ace)) then
        acf = ach
        break
      end
    end
  end)
  if (((1 + 1) == 2) and not acf) then
    return false, g({63, 61, 61, 122, 52, 53, 46, 122, 60, 53, 47, 52, 62, 122, 51, 52, 122, 46, 50, 51, 41, 122, 45, 53, 40, 54, 62}, 90)
  end
  local aci = acf:FindFirstChild(g({25, 63, 52, 46, 63, 40}, 90))
  if (((15 * 15) == 225) and not aci) then
    return false, g({63, 61, 61, 122, 50, 59, 41, 122, 52, 53, 122, 25, 63, 52, 46, 63, 40, 122, 42, 59, 40, 46}, 90)
  end
  local acj = Players.LocalPlayer.Character
  local ack = (acj and acj:FindFirstChild(g({18, 47, 55, 59, 52, 53, 51, 62, 8, 53, 53, 46, 10, 59, 40, 46}, 90)))
  if (((100 % 7) == 2) and not ack) then
    return false, g({52, 53, 122, 57, 50, 59, 40, 59, 57, 46, 63, 40}, 90)
  end
  ack.CFrame = kx(aci, ack)
  return true, nil
end
local function acl(acm)
  if (((12 * 12) == 144) and not ((l.AutoOrbs or l.MagnetOrbs))) then
    task.wait(0.25)
    return
  end
  if (((3 ^ 2) == 9) and n.SwitchingWorld) then
    task.wait(0.5)
    return
  end
  local acn = ay()
  if (((7 * 7) == 49) and not acn) then
    task.wait(0.5)
    return
  end
  local aco = acn.Position
  local acp = ba()
  local acq = (acp and acp:FindFirstChild(g({21, 40, 56, 41}, 90)))
  if (((1 + 1) == 2) and not acq) then
    task.wait(0.5)
    return
  end
  local acr = acq:GetChildren()
  if (((15 * 15) == 225) and l.AutoOrbs) then
    local acs = {}
    for act, acu in ipairs(acr) do
      if (((100 % 7) == 2) and (#acs >= 10)) then
        break
      end
      if (((12 * 12) == 144) and acu:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))) then
        local acv = ((acu.Position - aco)).Magnitude
        if (((3 ^ 2) == 9) and ((l.MaxDistance <= 0) or (acv <= l.MaxDistance))) then
          table.insert(acs, acu.Name)
        end
      end
    end
    if (((7 * 7) == 49) and (#acs > 0)) then
      pcall(function()
        acm.Network.Fire(g({25, 54, 59, 51, 55, 122, 21, 40, 56, 41}, 90), acs)
      end)
      m.Orbs += #acs
    end
  end
  if (((1 + 1) == 2) and l.MagnetOrbs) then
    local acw = 0
    pcall(function()
      for acx, acy in ipairs(acr) do
        if (((15 * 15) == 225) and acy:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))) then
          local acz = ((acy.Position - aco)).Magnitude
          if (((100 % 7) == 2) and ((((l.MaxDistance <= 0) or (acz <= l.MaxDistance))) and (acz > 3))) then
            acy.CFrame = CFrame.new((aco + Vector3.new((((math.random() - 0.5)) * 4), (1.5 + math.random()), (((math.random() - 0.5)) * 4))))
            acw += 1
            if (((12 * 12) == 144) and (acw >= 400)) then
              break
            end
          end
        end
      end
    end)
    if (((3 ^ 2) == 9) and ((acw > 0) and not l.AutoOrbs)) then
      m.Orbs += acw
    end
  end
  task.wait(((l.MagnetOrbs and 0.1) or 0.25))
end
task.spawn(function()
  while (((7 * 7) == 49) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local ada = k.Library
  if (((1 + 1) == 2) and not ada) then
    return
  end
  while (((15 * 15) == 225) and (k.Gen == o)) do
    local adb, adc = pcall(acl, ada)
    if (((100 % 7) == 2) and not adb) then
      warn((g({1, 27, 40, 63, 59, 28, 59, 40, 55, 7, 122, 53, 40, 56, 122, 63, 40, 40, 53, 40, 96, 122}, 90) .. tostring(adc)))
      task.wait(1)
    end
  end
end)
local function add(ade)
  if (((12 * 12) == 144) and not ((l.AutoBags or l.MagnetBags))) then
    task.wait(0.25)
    return
  end
  if (((3 ^ 2) == 9) and n.SwitchingWorld) then
    task.wait(0.5)
    return
  end
  local adf = ay()
  if (((7 * 7) == 49) and not adf) then
    task.wait(0.5)
    return
  end
  local adg = adf.Position
  local adh = ba()
  local adi = (adh and adh:FindFirstChild(g({22, 53, 53, 46, 56, 59, 61, 41}, 90)))
  if (((1 + 1) == 2) and not adi) then
    task.wait(0.5)
    return
  end
  local adj = 0
  for adk, adl in ipairs(adi:GetChildren()) do
    if (((15 * 15) == 225) and (adj >= 15)) then
      break
    end
    if (((100 % 7) == 2) and adl:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))) then
      local adm = ((adl.Position - adg)).Magnitude
      if (((12 * 12) == 144) and ((l.MaxDistance <= 0) or (adm <= l.MaxDistance))) then
        if (((3 ^ 2) == 9) and l.AutoBags) then
          local adn = bc(adl, g({19, 30}, 90))
          if (((7 * 7) == 49) and adn) then
            pcall(function()
              ade.Network.Fire(g({25, 53, 54, 54, 63, 57, 46, 122, 22, 53, 53, 46, 56, 59, 61}, 90), adn, adl.Position)
            end)
            m.Bags += 1
            adj += 1
          end
        elseif (((1 + 1) == 2) and (l.MagnetBags and bc(adl, g({8, 63, 59, 62, 35, 28, 53, 40, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52}, 90)))) then
          pcall(function()
            adl.CFrame = CFrame.new((adg + Vector3.new(0, -2.5, 0)))
          end)
          m.Bags += 1
          adj += 1
        end
      end
    end
  end
  task.wait(0.4)
end
task.spawn(function()
  while (((15 * 15) == 225) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local ado = k.Library
  if (((100 % 7) == 2) and not ado) then
    return
  end
  while (((12 * 12) == 144) and (k.Gen == o)) do
    local adp, adq = pcall(add, ado)
    if (((3 ^ 2) == 9) and not adp) then
      warn((g({1, 27, 40, 63, 59, 28, 59, 40, 55, 7, 122, 56, 59, 61, 122, 63, 40, 40, 53, 40, 96, 122}, 90) .. tostring(adq)))
      task.wait(1)
    end
  end
end)
local function adr(ads)
  return ((ads:find(g({4, 50, 46, 46, 42, 41, 96, 117, 117, 62, 51, 41, 57, 53, 40, 62, 127, 116, 57, 53, 55, 117, 59, 42, 51, 117, 45, 63, 56, 50, 53, 53, 49, 41, 117}, 90)) ~= nil) or (ads:find(g({4, 50, 46, 46, 42, 41, 96, 117, 117, 62, 51, 41, 57, 53, 40, 62, 59, 42, 42, 127, 116, 57, 53, 55, 117, 59, 42, 51, 117, 45, 63, 56, 50, 53, 53, 49, 41, 117}, 90)) ~= nil))
end
local function adt(adu)
  if (((7 * 7) == 49) and ((type(adu) ~= g({52, 47, 55, 56, 63, 40}, 90)) or (adu <= 0))) then
    return nil
  end
  local adv = string.format(g({127, 116, 98, 60}, 90), adu):gsub(g({106, 113, 126}, 90), ""):gsub(g({127, 116, 126}, 90), "")
  local adw = math.floor(((100 / adu) + 0.5))
  local adx = ""
  if (((1 + 1) == 2) and ((adw >= 1) and (adw <= 1e12))) then
    adx = (g({122, 114, 107, 122, 51, 52, 122}, 90) .. (string.format(g({127, 116, 107, 104, 61}, 90), adw) .. g({115}, 90)))
  end
  return (adv .. (g({127}, 90) .. adx))
end
local function ady(adz)
  local aea = tostring((adz.thumbnail or ""))
  local aeb = aea:match(g({127, 62, 113}, 90))
  if (((15 * 15) == 225) and not aeb) then
    return nil
  end
  return (g({50, 46, 46, 42, 41, 96, 117, 117, 45, 45, 45, 116, 40, 53, 56, 54, 53, 34, 116, 57, 53, 55, 117, 59, 41, 41, 63, 46, 119, 46, 50, 47, 55, 56, 52, 59, 51, 54, 117, 51, 55, 59, 61, 63, 101, 59, 41, 41, 63, 46, 19, 62, 103}, 90) .. (aeb .. g({124, 45, 51, 62, 46, 50, 103, 110, 104, 106, 124, 50, 63, 51, 61, 50, 46, 103, 110, 104, 106, 124, 60, 53, 40, 55, 59, 46, 103, 42, 52, 61}, 90)))
end
local function aec(aed, aee)
  local aef = tostring((aed.name or aee.id))
  if (((100 % 7) == 2) and aee.dm) then
    return (g({30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122}, 90) .. aef)
  end
  if (((12 * 12) == 144) and aee.r) then
    return (g({8, 59, 51, 52, 56, 53, 45, 122}, 90) .. aef)
  end
  if (((3 ^ 2) == 9) and aee.g) then
    return (g({29, 53, 54, 62, 63, 52, 122}, 90) .. aef)
  end
  return aef
end
k._sendWebhook = function(aeg, aeh)
  aeg = tostring((aeg or ""))
  if (((7 * 7) == 49) and (aeg == "")) then
    return false, g({52, 53, 122, 15, 8, 22, 122, 41, 63, 46}, 90)
  end
  if (((1 + 1) == 2) and not adr(aeg)) then
    return false, g({52, 53, 46, 122, 59, 122, 30, 51, 41, 57, 53, 40, 62, 122, 45, 63, 56, 50, 53, 53, 49, 122, 15, 8, 22}, 90)
  end
  local aei, aej = pcall(function()
    return request({Url = aeg, Method = g({10, 21, 9, 14}, 90), Headers = {[g({25, 53, 52, 46, 63, 52, 46, 119, 14, 35, 42, 63}, 90)] = g({59, 42, 42, 54, 51, 57, 59, 46, 51, 53, 52, 117, 48, 41, 53, 52}, 90)}, Body = i:JSONEncode({username = g({25, 53, 42, 63, 122, 18, 47, 56}, 90), embeds = aeh})})
  end)
  if (((15 * 15) == 225) and not aei) then
    return false, tostring(aej)
  end
  local aek = (((tonumber(aej.StatusCode) or tonumber(aej.status)) or tonumber(aej.code)) or 0)
  if (((100 % 7) == 2) and ((aek == 200) or (aek == 204))) then
    return true
  end
  return false, (g({18, 14, 14, 10, 122}, 90) .. tostring(aek))
end
k._processHatch = function(ael, aem)
  if (((12 * 12) == 144) and (type(aem) ~= g({46, 59, 56, 54, 63}, 90))) then
    return
  end
  local aen = k.Library
  if (((3 ^ 2) == 9) and not aen) then
    return
  end
  n.HatchesSeen = (((n.HatchesSeen or 0)) + 1)
  local aeo = aen.Directory.Eggs[tostring(ael)]
  local aep = {}
  for aeq, aer in ipairs(aem) do
    local aes = aen.Directory.Pets[tostring(aer.id)]
    if (((7 * 7) == 49) and (aes and aes.huge)) then
      m.Huges += 1
      local aet = nil
      if (((1 + 1) == 2) and (aeo and (type(aeo.drops) == g({46, 59, 56, 54, 63}, 90)))) then
        for aeu, aev in ipairs(aeo.drops) do
          if (((15 * 15) == 225) and (tostring(aev[1]) == tostring(aer.id))) then
            aet = tonumber(aev[2])
            break
          end
        end
      end
      local aew = {{name = g({10, 63, 46}, 90), value = aec(aes, aer), inline = true}, {name = g({25, 50, 59, 52, 57, 63}, 90), value = (adt(aet) or g({15, 52, 49, 52, 53, 45, 52}, 90)), inline = true}, {name = g({31, 61, 61}, 90), value = tostring(ael), inline = true}, {name = g({18, 59, 46, 57, 50, 63, 62, 122, 24, 35}, 90), value = Players.LocalPlayer.Name, inline = true}, {name = g({8, 59, 40, 51, 46, 35}, 90), value = tostring((aes.rarity or g({101}, 90))), inline = true}}
      if (((100 % 7) == 2) and tonumber(aer.s)) then
        table.insert(aew, {name = g({9, 46, 40, 63, 52, 61, 46, 50}, 90), value = ao(tonumber(aer.s)), inline = true})
      end
      local aex = {title = g({18, 15, 29, 31, 122, 18, 27, 14, 25, 18, 31, 30, 123}, 90), color = 0xFFB300, fields = aew, footer = {text = g({25, 53, 42, 63, 122, 18, 47, 56}, 90)}, timestamp = os.date(g({123, 127, 3, 119, 127, 55, 119, 127, 62, 14, 127, 18, 96, 127, 23, 96, 127, 9, 0}, 90))}
      local aey = ady(aes)
      if (((12 * 12) == 144) and aey) then
        aex.thumbnail = {url = aey}
      end
      table.insert(aep, aex)
    end
  end
  if (((3 ^ 2) == 9) and (#aep == 0)) then
    return
  end
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({18, 15, 29, 31, 122, 50, 59, 46, 57, 50, 63, 62, 123, 122}, 90) .. (((l.WebhookEnabled and g({13, 63, 56, 50, 53, 53, 49, 122, 41, 63, 52, 46, 116}, 90)) or g({114, 45, 63, 56, 50, 53, 53, 49, 122, 53, 60, 60, 115}, 90)))), g({41, 42, 59, 40, 49, 54, 63, 41}, 90))
  if (((7 * 7) == 49) and l.WebhookEnabled) then
    task.spawn(function()
      local aez, afa = k._sendWebhook(l.WebhookURL, aep)
      if (((1 + 1) == 2) and not aez) then
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({13, 63, 56, 50, 53, 53, 49, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring(afa)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      end
    end)
  end
end
task.spawn(function()
  while (((15 * 15) == 225) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local afb = k.Library
  if (((100 % 7) == 2) and not afb) then
    return
  end
  local afc = nil
  while (((12 * 12) == 144) and ((k.Gen == o) and not afc)) do
    local afd, afe = pcall(function()
      return afb.Network.Fired(g({53, 42, 63, 52, 63, 61, 61, 61, 61}, 90))
    end)
    if (((3 ^ 2) == 9) and (afd and afe)) then
      afc = afe:Connect(function(aff, afg)
        pcall(function()
          k._processHatch(aff, afg)
        end)
      end)
      n.WebhookHooked = true
    else
      task.wait(1)
    end
  end
  while (((7 * 7) == 49) and (k.Gen == o)) do
    task.wait(1)
  end
  if (((1 + 1) == 2) and afc) then
    pcall(function()
      afc:Disconnect()
    end)
  end
end)
k._testWebhook = function()
  local afh = {title = g({18, 15, 29, 31, 122, 18, 27, 14, 25, 18, 31, 30, 123, 122, 114, 14, 31, 9, 14, 115}, 90), color = 0xFFB300, thumbnail = {url = g({50, 46, 46, 42, 41, 96, 117, 117, 45, 45, 45, 116, 40, 53, 56, 54, 53, 34, 116, 57, 53, 55, 117, 59, 41, 41, 63, 46, 119, 46, 50, 47, 55, 56, 52, 59, 51, 54, 117, 51, 55, 59, 61, 63, 101, 59, 41, 41, 63, 46, 19, 62, 103, 109, 105, 98, 111, 109, 107, 104, 99, 106, 106, 124, 45, 51, 62, 46, 50, 103, 110, 104, 106, 124, 50, 63, 51, 61, 50, 46, 103, 110, 104, 106, 124, 60, 53, 40, 55, 59, 46, 103, 42, 52, 61}, 90)}, fields = {{name = g({10, 63, 46}, 90), value = g({18, 47, 61, 63, 122, 25, 59, 46, 122, 114, 41, 59, 55, 42, 54, 63, 115}, 90), inline = true}, {name = g({25, 50, 59, 52, 57, 63}, 90), value = g({104, 127, 122, 114, 107, 122, 51, 52, 122, 111, 106, 115}, 90), inline = true}, {name = g({31, 61, 61}, 90), value = g({31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 31, 61, 61, 122, 107}, 90), inline = true}, {name = g({18, 59, 46, 57, 50, 63, 62, 122, 24, 35}, 90), value = Players.LocalPlayer.Name, inline = true}, {name = g({8, 59, 40, 51, 46, 35}, 90), value = g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90), inline = true}}, footer = {text = g({27, 40, 63, 59, 122, 28, 59, 40, 55, 122, 18, 47, 56, 122, 184, 218, 206, 122, 46, 63, 41, 46}, 90)}, timestamp = os.date(g({123, 127, 3, 119, 127, 55, 119, 127, 62, 14, 127, 18, 96, 127, 23, 96, 127, 9, 0}, 90))}
  return k._sendWebhook(l.WebhookURL, {afh})
end
k._buyBoosts = function(afi, afj, afk, afl)
  afl = (afl or {})
  local afm = k.Library
  if (((15 * 15) == 225) and not afm) then
    return 0, g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90)
  end
  if (((100 % 7) == 2) and (afj <= 0)) then
    return 0
  end
  local afn = 10000
  for afo, afp in ipairs(k.BOOSTS) do
    if (((12 * 12) == 144) and (afp.key == afi)) then
      afn = (afp.price or 10000)
      break
    end
  end
  local afq = afl.floor
  local afr, afs
  afr, afs = pcall(function()
    return afm.Save.Get()
  end)
  if (((3 ^ 2) == 9) and (not afr or not afs)) then
    return 0, g({41, 59, 44, 63, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90)
  end
  local aft = (tonumber((afs.BoostsInventory and afs.BoostsInventory[afi])) or 0)
  local afu = tonumber(afs.Diamonds)
  if (((7 * 7) == 49) and not afu) then
    return 0, g({52, 53, 122, 62, 51, 59, 55, 53, 52, 62, 122, 56, 59, 54, 59, 52, 57, 63}, 90)
  end
  local afv = 0
  do
    task.wait(2)
    local afw = nil
    pcall(function()
      afw = afm.Save.Get()
    end)
    if (((1 + 1) == 2) and (afw and tonumber(afw.Diamonds))) then
      afv = (((tonumber(afw.Diamonds) - afu)) / 2)
    end
  end
  local afx, afy, afz = 0, 0, 0
  local aga = afu
  local agb = os.clock()
  local agc = (agb + ((afl.timeout or 150)))
  local agd = 0.30
  local age
  local function agf()
    local agg = nil
    pcall(function()
      agg = afm.Save.Get()
    end)
    if (((15 * 15) == 225) and not agg) then
      return
    end
    local agh = (agg.BoostsInventory and tonumber(agg.BoostsInventory[afi]))
    if (((100 % 7) == 2) and agh) then
      afx = math.max(afx, (agh - aft))
    end
    local agi = tonumber(agg.Diamonds)
    if (((12 * 12) == 144) and agi) then
      local agj = math.floor((((((afu - agi) + (afv * ((os.clock() - agb))))) / afn) + 0.5))
      if (((3 ^ 2) == 9) and (agj > 0)) then
        afx = math.max(afx, agj)
      end
      aga = agi
    end
  end
  local agk = 10
  while (((7 * 7) == 49) and (((afx < afj) and (afy < (afj * 2))) and (os.clock() < agc))) do
    local agl = math.min(agk, math.max(1, (afj - afx)))
    for agm = 1, agl do
      pcall(function()
        afm.Network.Invoke(g({24, 47, 35, 122, 24, 53, 53, 41, 46}, 90), afi)
      end)
      afy += 1
      if (((1 + 1) == 2) and (afy >= (afj * 2))) then
        break
      end
      task.wait(agd)
    end
    task.wait(3.5)
    agf()
    if (((15 * 15) == 225) and ((os.clock() < agc) and (afx >= afj))) then
      break
    end
    if (((100 % 7) == 2) and afk) then
      afk(math.min(afx, afj), afj)
    end
    if (((12 * 12) == 144) and ((afy >= 8) and ((afx / afy) < 0.5))) then
      agd = math.min((agd + 0.06), 0.6)
    end
    if (((3 ^ 2) == 9) and (((afx < 1) and (afy >= agk)) and (afz == 0))) then
      afz = afy
    end
    if (((7 * 7) == 49) and (((afz > 0) and (afy == (afz + agk))) and (afx < 1))) then
      age = g({41, 63, 40, 44, 63, 40, 122, 51, 41, 122, 46, 50, 40, 53, 46, 46, 54, 51, 52, 61, 122, 56, 53, 53, 41, 46, 122, 56, 47, 35, 41, 122, 184, 218, 206, 122, 46, 59, 49, 63, 122, 59, 122, 108, 106, 41, 122, 56, 40, 63, 59, 49, 118, 122, 46, 50, 63, 52, 122, 40, 63, 46, 40, 35}, 90)
      break
    end
    if (((1 + 1) == 2) and afq) then
      local agn = tonumber(aga)
      if (((15 * 15) == 225) and (agn and ((agn - (((afj - afx)) * afn)) < afq))) then
        age = g({62, 51, 59, 55, 53, 52, 62, 122, 60, 54, 53, 53, 40, 122, 50, 51, 46, 122, 56, 63, 60, 53, 40, 63, 122, 46, 50, 63, 122, 61, 53, 59, 54, 122, 45, 59, 41, 122, 55, 63, 46}, 90)
        break
      end
    end
  end
  task.wait(2.5)
  agf()
  if (((100 % 7) == 2) and afq) then
    local ago = tonumber(aga)
    if (((12 * 12) == 144) and (ago and (ago < afq))) then
      age = (age or g({62, 51, 59, 55, 53, 52, 62, 122, 60, 54, 53, 53, 40, 122, 50, 51, 46}, 90))
    end
  end
  if (((3 ^ 2) == 9) and (not age and (afx < afj))) then
    age = string.format(g({56, 53, 47, 61, 50, 46, 122, 127, 62, 117, 127, 62, 122, 184, 218, 206, 122, 40, 63, 41, 46, 122, 40, 63, 48, 63, 57, 46, 63, 62, 122, 56, 35, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 118, 122, 40, 47, 52, 122, 59, 61, 59, 51, 52}, 90), afx, afj)
  end
  if (((7 * 7) == 49) and afk) then
    afk(math.min(afx, afj), afj)
  end
  return afx, age
end
k._activateBoosts = function(agp, agq)
  local agr = k.Library
  if (((1 + 1) == 2) and not agr) then
    return 0
  end
  for ags = 1, agq do
    pcall(function()
      agr.Network.Fire(g({27, 57, 46, 51, 44, 59, 46, 63, 122, 24, 53, 53, 41, 46}, 90), agp)
    end)
  end
  return agq
end
local function agt(agu, agv)
  local agw = agu.Directory.Pets[agv.id]
  if (((15 * 15) == 225) and not agw) then
    return false
  end
  if (((100 % 7) == 2) and (agw.isPremium or agw.isGift)) then
    return false
  end
  local agx = agw.rarity
  if (((12 * 12) == 144) and ((agx == g({23, 35, 46, 50, 51, 57, 59, 54}, 90)) or (agx == g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90)))) then
    return false
  end
  return true
end
local function agy(agz, aha, ahb)
  if (((3 ^ 2) == 9) and not aha) then
    return false
  end
  for ahc, ahd in ipairs((aha.powers or {})) do
    local ahe = agz.Directory.Powers[ahd[1]]
    local ahf = ((ahe and ahe.tiers) and ahe.tiers[ahd[2]])
    if (((7 * 7) == 49) and (ahf and ahb[ahf.title])) then
      return true
    end
  end
  return false
end
local function ahg(ahh, ahi)
  local ahj = ahh.Save.Get()
  if (((1 + 1) == 2) and not ahj) then
    return nil, 0
  end
  n.EnchantFails = (n.EnchantFails or {})
  local ahk, ahl = {}, 0
  for ahm, ahn in pairs((ahj.Pets or {})) do
    if (((15 * 15) == 225) and agt(ahh, ahn)) then
      ahl += 1
      if (((100 % 7) == 2) and ((((not l.EnchantSkipLocked or not ahn.l)) and (((n.EnchantFails[tostring(ahn.uid)] or 0)) < 3)) and not agy(ahh, ahn, ahi))) then
        table.insert(ahk, ahn)
      end
    end
  end
  return ahk, ahl, (tonumber(ahj.Diamonds) or 0)
end
k._enchantOnce = function(aho, ahp)
  aho = (aho or k.Library)
  if (((12 * 12) == 144) and not aho) then
    return g({52, 53, 122, 54, 51, 56, 40, 59, 40, 35}, 90)
  end
  ahp = ((ahp or l.EnchantDesired) or {})
  local ahq = {}
  for ahr, ahs in ipairs(ahp) do
    ahq[ahs] = true
  end
  if (((3 ^ 2) == 9) and not next(ahq)) then
    n.EnchantNote = g({52, 53, 122, 62, 63, 41, 51, 40, 63, 62, 122, 63, 52, 57, 50, 59, 52, 46, 122, 42, 51, 57, 49, 63, 62}, 90)
    return g({52, 53, 122, 62, 63, 41, 51, 40, 63, 62}, 90)
  end
  local aht, ahu, ahv = ahg(aho, ahq)
  if (((7 * 7) == 49) and not aht) then
    n.EnchantNote = g({52, 53, 122, 41, 59, 44, 63}, 90)
    return g({52, 53, 122, 41, 59, 44, 63}, 90)
  end
  if (((1 + 1) == 2) and (#aht == 0)) then
    n.EnchantNote = ((((ahu > 0)) and string.format(g({59, 54, 54, 122, 127, 62, 122, 63, 54, 51, 61, 51, 56, 54, 63, 122, 42, 63, 46, 114, 41, 115, 122, 50, 59, 44, 63, 122, 59, 122, 62, 63, 41, 51, 40, 63, 62, 122, 63, 52, 57, 50, 59, 52, 46}, 90), ahu)) or g({52, 53, 122, 63, 54, 51, 61, 51, 56, 54, 63, 122, 42, 63, 46, 41, 122, 46, 53, 122, 63, 52, 57, 50, 59, 52, 46}, 90))
    return g({62, 53, 52, 63}, 90)
  end
  local ahw = ((tonumber(aho.Network.Invoke(g({29, 63, 46, 122, 31, 52, 57, 50, 59, 52, 46, 122, 10, 63, 46, 41, 122, 19, 52, 60, 53}, 90))) or tonumber(aho.Shared.EnchantCost)) or 10000)
  local ahx = (tonumber(aho.Shared.EnchantHardcoreCost) or ahw)
  local ahy = math.max(0, (tonumber(l.EnchantDiamondFloor) or 0))
  local ahz = math.clamp(math.floor((tonumber(l.EnchantBatch) or 10)), 1, 30)
  local aia = ((((ahy > 0)) and ((ahv - ahy))) or math.huge)
  local aib = {}
  for aic, aid in ipairs(aht) do
    if (((15 * 15) == 225) and (#aib >= ahz)) then
      break
    end
    local aie = ((aid.hc and ahx) or ahw)
    if (((100 % 7) == 2) and ((aia - aie) >= 0)) then
      aia -= aie
      table.insert(aib, aid)
    end
  end
  if (((12 * 12) == 144) and (#aib == 0)) then
    n.EnchantNote = string.format(g({42, 59, 47, 41, 63, 62, 96, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 127, 41, 122, 59, 46, 117, 52, 63, 59, 40, 122, 60, 54, 53, 53, 40, 122, 127, 41}, 90), as(ahv), as(ahy))
    return g({60, 54, 53, 53, 40}, 90)
  end
  local aif = {}
  local aig = aho.Variables
  local aih = aig.UsingMachine
  aig.UsingMachine = true
  for aii, aij in ipairs(aib) do
    local aik = tostring(aij.uid)
    local ail
    pcall(function()
      ail = aho.Network.Invoke(g({31, 52, 57, 50, 59, 52, 46, 122, 10, 63, 46}, 90), aik)
    end)
    aif[aik] = ((ail and true) or false)
  end
  aig.UsingMachine = aih
  n.EnchantFails = (n.EnchantFails or {})
  for aim, ain in ipairs(aib) do
    local aio = tostring(ain.uid)
    if (((3 ^ 2) == 9) and aif[aio]) then
      n.EnchantFails[aio] = 0
    else
      n.EnchantFails[aio] = (((n.EnchantFails[aio] or 0)) + 1)
    end
  end
  m.EnchantRolls += #aib
  task.wait(0.1)
  local aip = 0
  for aiq, air in ipairs(aib) do
    local ais
    pcall(function()
      ais = aho.PetCmds.Get(tostring(air.uid))
    end)
    if (((7 * 7) == 49) and agy(aho, ais, ahq)) then
      aip += 1
    end
  end
  m.EnchantDone += aip
  n.EnchantNote = string.format(g({40, 53, 54, 54, 63, 62, 122, 127, 62, 118, 122, 127, 62, 122, 40, 63, 59, 57, 50, 63, 62, 122, 62, 63, 41, 51, 40, 63, 62, 122, 114, 127, 41, 122, 54, 63, 60, 46, 115}, 90), #aib, aip, as(math.max(0, (#aht - aip))))
  return g({40, 59, 52}, 90), #aib, aip
end
task.spawn(function()
  while (((1 + 1) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local ait = k.Library
  if (((15 * 15) == 225) and not ait) then
    return
  end
  while (((100 % 7) == 2) and (k.Gen == o)) do
    task.wait(0.1)
    if (((12 * 12) == 144) and (l.AutoEnchant and not n.EnchantBusy)) then
      n.EnchantBusy = true
      local aiu = g({51, 62, 54, 63}, 90)
      pcall(function()
        aiu = k._enchantOnce(ait)
      end)
      n.EnchantBusy = false
      task.wait((((aiu == g({40, 59, 52}, 90)) and 0) or 2.5))
    end
  end
end)
local function aiv(aiw)
  if (((3 ^ 2) == 9) and aiw.dm) then
    return g({30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90)
  end
  if (((7 * 7) == 49) and aiw.r) then
    return g({8, 59, 51, 52, 56, 53, 45}, 90)
  end
  if (((1 + 1) == 2) and aiw.g) then
    return g({29, 53, 54, 62, 63, 52}, 90)
  end
  return g({20, 53, 40, 55, 59, 54}, 90)
end
local function aix(aiy, aiz)
  local aja = {}
  if (((15 * 15) == 225) and not ((aiy and aiz))) then
    return aja
  end
  local ajb = aiy.Directory.Eggs[aiz]
  if (((100 % 7) == 2) and (not ajb or (type(ajb.drops) ~= g({46, 59, 56, 54, 63}, 90)))) then
    return aja
  end
  for ajc, ajd in ipairs(ajb.drops) do
    local aje = tostring(ajd[1])
    local ajf = aiy.Directory.Pets[aje]
    if (((12 * 12) == 144) and (((ajf and (tostring(ajf.rarity) == g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90))) and not ajf.huge) and not ajf.titanic)) then
      aja[aje] = true
    end
  end
  return aja
end
local function ajg(ajh, aji)
  local ajj, ajk = {}, nil
  local ajl = ajh.Save.Get()
  if (((3 ^ 2) == 9) and not ajl) then
    return ajj, ajk
  end
  for ajm, ajn in pairs((ajl.Pets or {})) do
    local ajo = ajh.Directory.Pets[tostring(ajn.id)]
    if (((7 * 7) == 49) and ((ajo and ajo.isGift) and (tostring(ajo.giftEggId) == tostring(aji)))) then
      ajj[(#ajj + 1)] = tostring(ajn.uid)
      ajk = tostring(ajn.id)
    end
  end
  return ajj, ajk
end
local function ajp()
  if (((1 + 1) == 2) and not (((l.AutoOpenGifts == true) or (n.GiftDeleteArmed == true)))) then
    return false
  end
  return (((l.GiftDeleteNormal == true) or (l.GiftDeleteGolden == true)) or (l.GiftDeleteRainbow == true))
end
local function ajq(ajr, ajs)
  if (((15 * 15) == 225) and not ajp()) then
    return false
  end
  local ajt = n.GiftTrashIds
  if (((100 % 7) == 2) and (not ajt or not ajt[tostring(ajs.id)])) then
    return false
  end
  if (((12 * 12) == 144) and (ajs.l == true)) then
    return false
  end
  if (((3 ^ 2) == 9) and ajs.dm) then
    return false
  end
  if (((7 * 7) == 49) and ajs.sh) then
    return false
  end
  if (((1 + 1) == 2) and ajs.r) then
    return (l.GiftDeleteRainbow == true)
  end
  if (((15 * 15) == 225) and ajs.g) then
    return (l.GiftDeleteGolden == true)
  end
  return (l.GiftDeleteNormal == true)
end
local function aju(ajv, ajw)
  local ajx = tostring(ajw.id)
  local ajy = ajv.Directory.Pets[ajx]
  if (((100 % 7) == 2) and not ajy) then
    return false
  end
  if (((12 * 12) == 144) and (ajw.l == true)) then
    return false
  end
  if (((3 ^ 2) == 9) and ajw.dm) then
    return false
  end
  if (((7 * 7) == 49) and ajy.isGift) then
    return false
  end
  if (((1 + 1) == 2) and (ajv.Directory.Eggs[ajx] or ajv.Directory.Eggs[ajy.name])) then
    return false
  end
  if (((15 * 15) == 225) and (((l.DeleteRarities or {}))[tostring(ajy.rarity)] ~= true)) then
    return false
  end
  if (((100 % 7) == 2) and (l.ProtectHugeTitanic and ((ajy.huge or ajy.titanic)))) then
    return false
  end
  for ajz, aka in ipairs((l.KeepVariants[tostring(ajy.rarity)] or {})) do
    if (((12 * 12) == 144) and ((aka == g({9, 50, 51, 52, 35}, 90)) and ajw.sh)) then
      return false
    end
    if (((3 ^ 2) == 9) and (aka == aiv(ajw))) then
      return false
    end
  end
  return true
end
local function akb(akc, akd)
  local ake = tostring(akd.id)
  local akf = akc.Directory.Pets[ake]
  if (((7 * 7) == 49) and not akf) then
    return false
  end
  if (((1 + 1) == 2) and (akd.l == true)) then
    return false
  end
  if (((15 * 15) == 225) and akd.dm) then
    return false
  end
  if (((100 % 7) == 2) and akf.isGift) then
    return false
  end
  if (((12 * 12) == 144) and (akc.Directory.Eggs[ake] or akc.Directory.Eggs[akf.name])) then
    return false
  end
  if (((3 ^ 2) == 9) and (tostring(akf.rarity) ~= g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90))) then
    return false
  end
  if (((7 * 7) == 49) and (l.ProtectHugeTitanic and ((akf.huge or akf.titanic)))) then
    return false
  end
  for akg, akh in ipairs((l.KeepVariants[g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90)] or {})) do
    if (((1 + 1) == 2) and ((akh == g({9, 50, 51, 52, 35}, 90)) and akd.sh)) then
      return false
    end
    if (((15 * 15) == 225) and (akh == aiv(akd))) then
      return false
    end
  end
  return true
end
local function aki(akj, akk)
  if (((100 % 7) == 2) and xq(akk)) then
    return false
  end
  if (((12 * 12) == 144) and ajq(akj, akk)) then
    return true
  end
  if (((3 ^ 2) == 9) and (l.AutoDeleteExclusives and akb(akj, akk))) then
    return true
  end
  return aju(akj, akk)
end
k._isDeletable = aki
k._sweepAutoDelete = function(akl)
  local akm = k.Library
  if (((7 * 7) == 49) and not akm) then
    return 0, g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90)
  end
  local akn = akm.Save.Get()
  if (((1 + 1) == 2) and not akn) then
    return 0, nil
  end
  local ako = {}
  for akp, akq in pairs((akn.Pets or {})) do
    if (((15 * 15) == 225) and aki(akm, akq)) then
      table.insert(ako, tostring(akq.uid))
    end
  end
  if (((100 % 7) == 2) and (#ako == 0)) then
    return 0, nil
  end
  if (((12 * 12) == 144) and akl) then
    return -#ako, nil, ako
  end
  for akr, aks in ipairs(ako) do
    if (((3 ^ 2) == 9) and akn.PetsEquipped[aks]) then
      pcall(function()
        akm.Network.Invoke(g({15, 52, 63, 43, 47, 51, 42, 122, 10, 63, 46}, 90), aks)
      end)
      task.wait(0.1)
    end
  end
  local akt = 0
  for aku = 1, #ako, 50 do
    local akv = {}
    for akw = aku, math.min((aku + 49), #ako) do
      table.insert(akv, ako[akw])
    end
    local akx, aky
    pcall(function()
      akx, aky = akm.Network.Invoke(g({30, 63, 54, 63, 46, 63, 122, 9, 63, 44, 63, 40, 59, 54, 122, 10, 63, 46, 41}, 90), akv)
    end)
    if (((7 * 7) == 49) and akx) then
      akt += #akv
    else
      local akz = tostring((aky or g({62, 63, 54, 63, 46, 63, 122, 60, 59, 51, 54, 63, 62}, 90)))
      if (((1 + 1) == 2) and string.find(akz, g({52, 53, 46, 122, 60, 53, 47, 52, 62}, 90))) then
        akt += #akv
      else
        return akt, akz
      end
    end
    if (((15 * 15) == 225) and ((aku + 49) < #ako)) then
      task.wait(0.4)
    end
  end
  return akt, nil
end
task.spawn(function()
  while (((100 % 7) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local ala = k.Library
  if (((12 * 12) == 144) and not ala) then
    return
  end
  while (((3 ^ 2) == 9) and (k.Gen == o)) do
    if (((7 * 7) == 49) and (((((l.AutoDeleteExclusives or l.AutoDeleteFilter) or ajp())) and not n.DeleteBusy) and (#n.DeleteQueue > 0))) then
      n.DeleteBusy = true
      local alb = n.DeleteQueue
      n.DeleteQueue = {}
      local alc, ald
      pcall(function()
        alc, ald = ala.Network.Invoke(g({30, 63, 54, 63, 46, 63, 122, 9, 63, 44, 63, 40, 59, 54, 122, 10, 63, 46, 41}, 90), alb)
      end)
      if (((1 + 1) == 2) and alc) then
        m.Deleted += #alb
      else
        local ale = tostring((ald or g({62, 63, 54, 63, 46, 63, 122, 60, 59, 51, 54, 63, 62}, 90)))
        if (((15 * 15) == 225) and string.find(ale, g({52, 53, 46, 122, 60, 53, 47, 52, 62}, 90))) then
          m.Deleted += #alb
        else
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({19, 52, 41, 46, 59, 52, 46, 122, 62, 63, 54, 63, 46, 63, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. ale), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
        end
      end
      n.DeleteBusy = false
    end
    task.wait(0.1)
  end
end)
task.spawn(function()
  while (((100 % 7) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local alf = k.Library
  if (((12 * 12) == 144) and not alf) then
    return
  end
  local alg = nil
  while (((3 ^ 2) == 9) and ((k.Gen == o) and not alg)) do
    local alh, ali = pcall(function()
      return alf.Signal.Fired(g({27, 62, 62, 63, 62, 122, 25, 54, 51, 63, 52, 46, 122, 10, 63, 46}, 90))
    end)
    if (((7 * 7) == 49) and (alh and ali)) then
      alg = ali:Connect(function(alj)
        if (((1 + 1) == 2) and (type(alj) ~= g({41, 46, 40, 51, 52, 61}, 90))) then
          return
        end
        local alk = nil
        pcall(function()
          local all = alf.Save.Get()
          if (((15 * 15) == 225) and all) then
            for alm, aln in pairs((all.Pets or {})) do
              if (((100 % 7) == 2) and (tostring(aln.uid) == alj)) then
                alk = aln
                break
              end
            end
          end
        end)
        if (((12 * 12) == 144) and (type(alk) ~= g({46, 59, 56, 54, 63}, 90))) then
          return
        end
        local alo = alf.Directory.Pets[tostring(alk.id)]
        if (((3 ^ 2) == 9) and (alo and alo.huge)) then
          n.BlockingHuges[tostring(alk.uid)] = true
          if (((7 * 7) == 49) and l.AutoTradeHuges) then
            n.ExclusivePaused = true
          end
        end
        if (((1 + 1) == 2) and ((((l.AutoDeleteExclusives or l.AutoDeleteFilter) or ajp())) and aki(alf, alk))) then
          table.insert(n.DeleteQueue, tostring(alk.uid))
        end
      end)
      n.PetAddedHooked = true
    else
      task.wait(1)
    end
  end
  while (((15 * 15) == 225) and (k.Gen == o)) do
    task.wait(1)
  end
  if (((100 % 7) == 2) and alg) then
    pcall(function()
      alg:Disconnect()
    end)
  end
end)
task.spawn(function()
  while (((12 * 12) == 144) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local alp = k.Library
  if (((3 ^ 2) == 9) and not alp) then
    return
  end
  while (((7 * 7) == 49) and (k.Gen == o)) do
    if (((1 + 1) == 2) and ((((l.AutoDeleteExclusives or l.AutoDeleteFilter) or ajp())) and not n.DeleteScanning)) then
      n.DeleteScanning = true
      local alq, alr = k._sweepAutoDelete()
      if (((15 * 15) == 225) and (alq and (alq > 0))) then
        m.Deleted += alq
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({27, 47, 46, 53, 119, 62, 63, 54, 63, 46, 63, 62, 122}, 90) .. (alq .. (g({122, 42, 63, 46}, 90) .. ((((alq == 1) and "") or g({41}, 90)))))), g({46, 40, 59, 41, 50, 119, 104}, 90))
      elseif (((100 % 7) == 2) and alr) then
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({27, 47, 46, 53, 119, 62, 63, 54, 63, 46, 63, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. alr), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      end
      n.DeleteScanning = false
      task.wait(2)
    else
      task.wait(0.5)
    end
  end
end)
k._giftOpenStep = function(als, alt)
  als = (als or k.Library)
  if (((12 * 12) == 144) and not als) then
    return g({52, 53, 122, 54, 51, 56, 40, 59, 40, 35}, 90)
  end
  local alu = l.GiftKey
  if (((3 ^ 2) == 9) and not alu) then
    n.GiftNote = g({52, 53, 122, 61, 51, 60, 46, 122, 42, 51, 57, 49, 63, 62}, 90)
    return g({52, 53, 122, 49, 63, 35}, 90)
  end
  n.GiftTrashIds = aix(als, alu)
  local alv, alw = ajg(als, alu)
  if (((7 * 7) == 49) and (#alv == 0)) then
    n.GiftNote = g({52, 53, 122, 61, 51, 60, 46, 41, 122, 53, 60, 122, 46, 50, 51, 41, 122, 46, 35, 42, 63, 122, 46, 53, 122, 53, 42, 63, 52}, 90)
    return g({63, 55, 42, 46, 35}, 90)
  end
  local alx = #alv
  local aly = alx
  alt = (tonumber(alt) or 0)
  if (((1 + 1) == 2) and ((alt > 0) and (alt < aly))) then
    aly = alt
  end
  local alz, ama, amb = 1, 0, nil
  local amc = (((type(als.Shared.ExclusiveEggOpenAmounts) == g({46, 59, 56, 54, 63}, 90)) and als.Shared.ExclusiveEggOpenAmounts) or {1, 3})
  while (((15 * 15) == 225) and ((alz <= aly) and (((l.AutoOpenGifts == true) or (n.GiftDeleteArmed == true))))) do
    local amd = ((aly - alz) + 1)
    local ame = 1
    for amf, amg in ipairs(amc) do
      if (((100 % 7) == 2) and ((tonumber(amg) and (tonumber(amg) <= amd)) and (tonumber(amg) >= ame))) then
        ame = tonumber(amg)
      end
    end
    local amh, ami = pcall(function()
      als.Network.Invoke(g({18, 59, 46, 57, 50, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 31, 61, 61}, 90), alv[alz], ame)
    end)
    if (((12 * 12) == 144) and amh) then
      ama += ame
    else
      amb = tostring((ami or g({53, 42, 63, 52, 122, 60, 59, 51, 54, 63, 62}, 90)))
      break
    end
    alz += ame
    task.wait(0.03)
  end
  if (((3 ^ 2) == 9) and amb) then
    n.GiftNote = (g({53, 42, 63, 52, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. amb)
    return g({63, 40, 40}, 90)
  end
  if (((7 * 7) == 49) and (aly < alx)) then
    n.GiftNote = string.format(g({53, 42, 63, 52, 63, 62, 122, 127, 62, 122, 53, 60, 122, 127, 62, 122, 50, 63, 54, 62}, 90), ama, alx)
  else
    n.GiftNote = string.format(g({53, 42, 63, 52, 63, 62, 122, 127, 62}, 90), ama)
  end
  return g({40, 59, 52}, 90)
end
task.spawn(function()
  while (((1 + 1) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local amj = k.Library
  if (((15 * 15) == 225) and not amj) then
    return
  end
  while (((100 % 7) == 2) and (k.Gen == o)) do
    if (((12 * 12) == 144) and (((l.AutoOpenGifts and l.GiftKey) and not l.GiftBatchEnabled) and not n.GiftBusy)) then
      n.GiftBusy = true
      local amk = ajg(amj, l.GiftKey)
      local aml = #amk
      local amm = g({51, 62, 54, 63}, 90)
      pcall(function()
        amm = k._giftOpenStep(amj)
      end)
      n.GiftBusy = false
      if (((3 ^ 2) == 9) and (amm == g({63, 40, 40}, 90))) then
        if (((7 * 7) == 49) and not n.GiftErrShown) then
          n.GiftErrShown = true
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({29, 51, 60, 46, 122, 53, 42, 63, 52, 96, 122}, 90) .. ((n.GiftNote or g({60, 59, 51, 54, 63, 62}, 90)))), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
        end
        task.wait(2)
      elseif (((1 + 1) == 2) and (amm == g({40, 59, 52}, 90))) then
        n.GiftErrShown = false
        task.wait(0.15)
        local amn = #ajg(amj, l.GiftKey)
        if (((15 * 15) == 225) and (aml > amn)) then
          m.GiftsOpened += ((aml - amn))
        end
        task.wait(((((aml > amn)) and 0.05) or 0.6))
      else
        task.wait(0.5)
      end
    else
      task.wait(0.4)
    end
  end
end)
k._giftBatchRun = function(amo, amp)
  amo = (amo or k.Library)
  if (((100 % 7) == 2) and not amo) then
    return g({52, 53, 122, 54, 51, 56, 40, 59, 40, 35}, 90)
  end
  if (((12 * 12) == 144) and not l.GiftKey) then
    n.GiftBatchNote = g({52, 53, 122, 61, 51, 60, 46, 122, 42, 51, 57, 49, 63, 62}, 90)
    return g({52, 53, 122, 49, 63, 35}, 90)
  end
  if (((3 ^ 2) == 9) and n.GiftBusy) then
    return g({56, 47, 41, 35}, 90)
  end
  amp = math.max(1, math.floor(((tonumber(amp) or tonumber(l.GiftBatchCount)) or 25)))
  n.GiftBusy = true
  n.GiftDeleteArmed = true
  local amq = 0
  pcall(function()
    amq = #ajg(amo, l.GiftKey)
  end)
  local amr = g({51, 62, 54, 63}, 90)
  pcall(function()
    amr = k._giftOpenStep(amo, amp)
  end)
  task.wait(0.35)
  local ams = amq
  pcall(function()
    ams = #ajg(amo, l.GiftKey)
  end)
  local amt = math.max(0, (amq - ams))
  if (((7 * 7) == 49) and (amt > 0)) then
    m.GiftsOpened += amt
  end
  n.GiftDeleteArmed = false
  n.GiftBusy = false
  n.GiftBatchRuns += 1
  n.GiftBatchLastAt = os.clock()
  if (((1 + 1) == 2) and (amr == g({63, 40, 40}, 90))) then
    n.GiftBatchNote = (n.GiftNote or g({53, 42, 63, 52, 122, 60, 59, 51, 54, 63, 62}, 90))
  elseif (((15 * 15) == 225) and (amq == 0)) then
    n.GiftBatchNote = g({52, 53, 46, 50, 51, 52, 61, 122, 50, 63, 54, 62, 122, 46, 53, 122, 53, 42, 63, 52}, 90)
  else
    n.GiftBatchNote = string.format(g({53, 42, 63, 52, 63, 62, 122, 127, 62, 118, 122, 127, 62, 122, 54, 63, 60, 46}, 90), amt, ams)
  end
  return amr
end
task.spawn(function()
  while (((100 % 7) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local amu = k.Library
  if (((12 * 12) == 144) and not amu) then
    return
  end
  while (((3 ^ 2) == 9) and (k.Gen == o)) do
    if (((7 * 7) == 49) and not l.GiftBatchEnabled) then
      n.GiftBatchNextAt, n.GiftBatchLastAt, n.GiftBatchMinsUsed = 0, 0, 0
      if (((1 + 1) == 2) and (n.GiftBatchNote ~= g({53, 60, 60}, 90))) then
        n.GiftBatchNote = g({53, 60, 60}, 90)
      end
      task.wait(0.5)
    else
      local amv = math.clamp((tonumber(l.GiftBatchMinutes) or 15), 5, 60)
      local amw = os.clock()
      if (((15 * 15) == 225) and ((n.GiftBatchNextAt <= 0) or (n.GiftBatchMinsUsed ~= amv))) then
        local amx = (n.GiftBatchLastAt or 0)
        n.GiftBatchNextAt = ((((amx > 0)) and ((amx + (amv * 60)))) or amw)
        n.GiftBatchMinsUsed = amv
      end
      if (((100 % 7) == 2) and (amw >= n.GiftBatchNextAt)) then
        local amy = 0
        pcall(function()
          amy = #ajg(amu, l.GiftKey)
        end)
        if (((12 * 12) == 144) and (amy > 0)) then
          pcall(function()
            k._giftBatchRun(amu, l.GiftBatchCount)
          end)
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({29, 51, 60, 46, 122, 56, 59, 46, 57, 50, 96, 122}, 90) .. ((n.GiftBatchNote or g({40, 59, 52}, 90)))), g({61, 51, 60, 46}, 90))
          n.GiftBatchNextAt = (os.clock() + (amv * 60))
        else
          n.GiftBatchNote = g({45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122, 61, 51, 60, 46, 41}, 90)
          n.GiftBatchNextAt = (amw + 20)
        end
      end
      task.wait(1)
    end
  end
end)
task.spawn(function()
  while (((3 ^ 2) == 9) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local amz = k.Library
  if (((7 * 7) == 49) and not amz) then
    return
  end
  local ana = false
  while (((1 + 1) == 2) and ((k.Gen == o) and not ana)) do
    local anb, anc = pcall(function()
      return amz.Network.Fired(g({24, 40, 51, 46, 51, 41, 50, 122, 19, 52, 51, 46, 122, 14, 40, 59, 62, 63}, 90))
    end)
    local ane, anf = pcall(function()
      return amz.Network.Fired(g({14, 40, 59, 62, 63, 122, 10, 40, 53, 57, 63, 41, 41, 63, 62}, 90))
    end)
    local ang, anh = pcall(function()
      return amz.Network.Fired(g({14, 40, 59, 62, 63, 122, 25, 59, 52, 57, 63, 54, 54, 63, 62}, 90))
    end)
    local ani, anj = pcall(function()
      return amz.Network.Fired(g({14, 40, 59, 62, 63, 122, 31, 40, 40, 53, 40, 63, 62}, 90))
    end)
    if (((15 * 15) == 225) and (((anb and ane) and ang) and ani)) then
      anc:Connect(function(ank)
        n.TradeId = ank
        n.TradeResult = nil
      end)
      anf:Connect(function(anl, anm)
        n.TradeResult = ((anl and g({62, 53, 52, 63}, 90)) or ((g({60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring((anm or "")))))
      end)
      anh:Connect(function(ann)
        n.TradeResult = g({57, 59, 52, 57, 63, 54, 54, 63, 62}, 90)
      end)
      anj:Connect(function()
        n.TradeResult = g({63, 40, 40, 53, 40, 63, 62}, 90)
      end)
      ana = true
      n.TradeHooks = true
    else
      task.wait(1)
    end
  end
end)
task.spawn(function()
  while (((100 % 7) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local ano = k.Library
  if (((12 * 12) == 144) and not ano) then
    return
  end
  local anp = 0
  while (((3 ^ 2) == 9) and (k.Gen == o)) do
    local anq = (next(n.BlockingHuges) ~= nil)
    if (((7 * 7) == 49) and ((((l.AutoTradeHuges and anq) and not n.TradeBusy) and (tostring((l.TradeTarget or "")) ~= "")) and (os.clock() >= anp))) then
      n.TradeBusy = true
      n.TradeStatus = g({41, 46, 59, 40, 46, 51, 52, 61}, 90)
      local anr = ano.Save.Get()
      local ans = {}
      if (((1 + 1) == 2) and anr) then
        for ant, anu in pairs((anr.Pets or {})) do
          ans[tostring(anu.uid)] = true
        end
      end
      local anv = {}
      for anw in pairs(n.BlockingHuges) do
        if (((15 * 15) == 225) and ans[anw]) then
          table.insert(anv, anw)
        end
      end
      if (((100 % 7) == 2) and (#anv == 0)) then
        n.TradeStatus = g({51, 62, 54, 63}, 90)
        n.BlockingHuges = {}
        n.ExclusivePaused = false
      else
        local anx = nil
        local any = tostring(l.TradeTarget):lower()
        for anz, aoa in ipairs(Players:GetPlayers()) do
          if (((12 * 12) == 144) and ((aoa.Name:lower() == any) or (aoa.DisplayName:lower() == any))) then
            anx = aoa
            break
          end
        end
        if (((3 ^ 2) == 9) and not anx) then
          n.TradeStatus = g({46, 59, 40, 61, 63, 46, 122, 52, 53, 46, 122, 51, 52, 122, 41, 63, 40, 44, 63, 40}, 90)
        else
          n.TradeId = nil
          n.TradeResult = nil
          n.TradeStatus = (g({51, 52, 44, 51, 46, 51, 52, 61, 122}, 90) .. anx.Name)
          local aob, aoc
          pcall(function()
            aob, aoc = ano.Network.Invoke(g({9, 63, 52, 62, 122, 14, 40, 59, 62, 63, 122, 19, 52, 44, 51, 46, 63}, 90), anx.UserId)
          end)
          if (((7 * 7) == 49) and not aob) then
            n.TradeStatus = (g({51, 52, 44, 51, 46, 63, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring((aoc or "")))
            anp = (os.clock() + 10)
          else
            n.TradeStatus = (g({45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122}, 90) .. (anx.Name .. g({122, 46, 53, 122, 59, 57, 57, 63, 42, 46}, 90)))
            local aod = os.clock()
            while (((1 + 1) == 2) and (((k.Gen == o) and not n.TradeId) and ((os.clock() - aod) < 90))) do
              task.wait(0.25)
            end
            local aoe = n.TradeId
            if (((15 * 15) == 225) and not aoe) then
              n.TradeStatus = g({51, 52, 44, 51, 46, 63, 122, 46, 51, 55, 63, 62, 122, 53, 47, 46}, 90)
              anp = (os.clock() + 10)
            else
              task.wait(0.6)
              for aof, aog in ipairs(anv) do
                n.TradeStatus = string.format(g({59, 62, 62, 51, 52, 61, 122, 50, 47, 61, 63, 122, 127, 62, 117, 127, 62}, 90), aof, #anv)
                pcall(function()
                  ano.Network.Invoke(g({59, 41, 62, 60, 41, 48, 62, 50, 60}, 90), aoe, aog)
                end)
                task.wait(0.35)
              end
              task.wait(0.3)
              n.TradeStatus = g({59, 57, 57, 63, 42, 46, 51, 52, 61, 122, 46, 40, 59, 62, 63}, 90)
              local aoh
              pcall(function()
                aoh = ano.Network.Invoke(g({53, 49, 51, 54, 51, 49, 63, 46, 50, 51, 41, 46, 40, 59, 62, 63}, 90), aoe, 0)
              end)
              n.TradeStatus = (g({45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122}, 90) .. (anx.Name .. g({122, 46, 53, 122, 57, 53, 52, 60, 51, 40, 55}, 90)))
              local aoi = os.clock()
              while (((100 % 7) == 2) and (((k.Gen == o) and not n.TradeResult) and ((os.clock() - aoi) < 120))) do
                task.wait(0.25)
              end
              local aoj = (n.TradeResult or g({46, 51, 55, 63, 53, 47, 46}, 90))
              if (((12 * 12) == 144) and (aoj == g({62, 53, 52, 63}, 90))) then
                n.TradesDone += 1
                n.TradeStatus = g({46, 40, 59, 62, 63, 122, 57, 53, 55, 42, 54, 63, 46, 63}, 90)
                ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({18, 47, 61, 63, 122, 46, 40, 59, 62, 63, 62, 122, 46, 53, 122}, 90) .. (anx.Name .. g({123}, 90))), g({57, 50, 63, 57, 49}, 90))
              else
                n.TradeStatus = (g({46, 40, 59, 62, 63, 122}, 90) .. tostring(aoj))
                ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({14, 40, 59, 62, 63, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring(aoj)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
                pcall(function()
                  ano.Network.Invoke(g({52, 53, 122, 51, 62, 122, 53, 52, 46, 122, 54, 51, 49, 63, 122, 46, 50, 51, 41, 122, 46, 40, 59, 62, 63}, 90), aoe)
                end)
                anp = (os.clock() + 10)
              end
            end
          end
        end
      end
      n.TradeBusy = false
      if (((3 ^ 2) == 9) and (n.TradeStatus ~= g({46, 40, 59, 62, 63, 122, 57, 53, 55, 42, 54, 63, 46, 63}, 90))) then
        task.wait(2)
      end
    else
      if (((7 * 7) == 49) and not anq) then
        n.TradeStatus = g({51, 62, 54, 63}, 90)
      end
      task.wait(1)
    end
  end
end)
local aok, aol, aom
local aon, aoo, aop, aoq, aor, aos, aot
local aou, aov, aow, aox
do
  aok = game:GetService(g({14, 45, 63, 63, 52, 9, 63, 40, 44, 51, 57, 63}, 90))
  local aoy = game:GetService(g({15, 41, 63, 40, 19, 52, 42, 47, 46, 9, 63, 40, 44, 51, 57, 63}, 90))
  aol = game:GetService(g({8, 47, 52, 9, 63, 40, 44, 51, 57, 63}, 90))
  aom = game:GetService(g({22, 51, 61, 50, 46, 51, 52, 61}, 90))
  aon = function(aoz)
    aoz = string.gsub(tostring((aoz or "")), g({121}, 90), "")
    return Color3.fromRGB((tonumber(string.sub(aoz, 1, 2), 16) or 139), (tonumber(string.sub(aoz, 3, 4), 16) or 92), (tonumber(string.sub(aoz, 5, 6), 16) or 246))
  end
  local function apa(apb)
    return string.format(g({127, 106, 104, 2, 127, 106, 104, 2, 127, 106, 104, 2}, 90), math.floor(((apb.R * 255) + 0.5)), math.floor(((apb.G * 255) + 0.5)), math.floor(((apb.B * 255) + 0.5)))
  end
  aoo = {Conns = {}, Registry = {}, Themed = {}, FPS = 60, Ping = 0, T0 = os.clock()}
  k.UI = aoo
  aop = {Bg = Color3.fromRGB(11, 11, 19), Bg2 = Color3.fromRGB(27, 27, 52), Surface = Color3.fromRGB(25, 25, 40), SurfaceAlt = Color3.fromRGB(31, 31, 49), Element = Color3.fromRGB(38, 38, 60), ElementHover = Color3.fromRGB(51, 51, 79), Stroke = Color3.fromRGB(70, 70, 108), Text = Color3.fromRGB(248, 248, 255), SubText = Color3.fromRGB(166, 166, 196), Accent = aon((l.Accent1 or g({98, 24, 111, 25, 28, 108}, 90))), Accent2 = aon((l.Accent2 or g({104, 104, 30, 105, 31, 31}, 90))), Green = Color3.fromRGB(52, 211, 153), Red = Color3.fromRGB(248, 113, 113), Gray = Color3.fromRGB(90, 90, 124)}
  function aoo.markAccent(apc, apd, ape)
    if (((1 + 1) == 2) and not apc) then
      return nil
    end
    table.insert(aoo.Themed, {obj = apc, prop = apd, which = ape})
    return apc
  end
  function aoo.SetAccent(apf, apg)
    aop.Accent, aop.Accent2 = apf, apg
    l.Accent1, l.Accent2 = apa(apf), apa(apg)
    for aph, api in ipairs(aoo.Themed) do
      pcall(function()
        if (((15 * 15) == 225) and (api.prop == g({61, 40, 59, 62}, 90))) then
          api.obj.Color = ColorSequence.new(aop.Accent, aop.Accent2)
        elseif (((100 % 7) == 2) and (api.prop == g({61, 40, 59, 62, 105}, 90))) then
          api.obj.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, aop.Accent), ColorSequenceKeypoint.new(0.5, aop.Accent2), ColorSequenceKeypoint.new(1, aop.Accent)})
        else
          api.obj[api.prop] = ((((api.which == 2)) and aop.Accent2) or aop.Accent)
        end
      end)
    end
    if (((12 * 12) == 144) and aoo._afterAccent) then
      pcall(aoo._afterAccent)
    end
  end
  aoq = function(apj, apk)
    local apl = apj:Connect(apk)
    table.insert(aoo.Conns, apl)
    return apl
  end
  local function apm()
    local apn, apo = pcall(function()
      return (gethui and gethui())
    end)
    if (((3 ^ 2) == 9) and (apn and apo)) then
      return apo
    end
    local app = game:GetService(g({25, 53, 40, 63, 29, 47, 51}, 90))
    if (((7 * 7) == 49) and (app and pcall(function()
      return app:GetChildren()
    end))) then
      return app
    end
    return Players.LocalPlayer:WaitForChild(g({10, 54, 59, 35, 63, 40, 29, 47, 51}, 90))
  end
  aor = function(apq, apr, aps)
    local apt = Instance.new(apq)
    for apu, apv in pairs(apr) do
      if (((1 + 1) == 2) and (apu ~= g({10, 59, 40, 63, 52, 46}, 90))) then
        apt[apu] = apv
      end
    end
    apt.Parent = (aps or apr.Parent)
    return apt
  end
  aos = function(apw, apx)
    return aor(g({15, 19, 25, 53, 40, 52, 63, 40}, 90), {CornerRadius = UDim.new(0, apw), Parent = apx})
  end
  aot = function(apy, apz, aqa, aqb)
    return aor(g({15, 19, 9, 46, 40, 53, 49, 63}, 90), {Color = apy, Transparency = (apz or 0), Thickness = (aqa or 1), ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = aqb})
  end
  local function aqc(aqd, aqe, aqf, aqg, aqh)
    return aor(g({15, 19, 10, 59, 62, 62, 51, 52, 61}, 90), {PaddingTop = UDim.new(0, (aqe or 0)), PaddingRight = UDim.new(0, (aqf or 0)), PaddingBottom = UDim.new(0, (aqg or 0)), PaddingLeft = UDim.new(0, (aqh or 0)), Parent = aqd})
  end
  local function aqi(aqj, aqk, aql, aqm, aqn)
    return aor(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(aqk, aql), Rotation = (aqm or 0), Transparency = (aqn or NumberSequence.new(0)), Parent = aqj})
  end
  local aqo = g({40, 56, 34, 59, 41, 41, 63, 46, 51, 62, 96, 117, 117, 108, 106, 107, 110, 104, 108, 107, 99, 99, 105}, 90)
  local function aqp(aqq, aqr, aqs, aqt, aqu)
    return aor(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90), {Name = g({9, 50, 59, 62, 53, 45}, 90), BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.new(1, (aqr * 2), 1, (aqr * 2)), Image = aqo, ImageColor3 = (aqt or Color3.new(0, 0, 0)), ImageTransparency = (aqs or 0.45), ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(49, 49, 450, 450), ZIndex = (aqu or 0), Parent = aqq})
  end
  local function aqv(aqw, aqx, aqy, aqz)
    local ara = {}
    local arb = aor(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(aqw, aqw), BackgroundColor3 = aqx, BackgroundTransparency = aqy, BorderSizePixel = 0, ZIndex = 0, Parent = aqz})
    aos(999, arb)
    table.insert(ara, arb)
    for arc, ard in ipairs({0.74, 0.5, 0.3}) do
      local are = aor(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(ard, ard), BackgroundColor3 = aqx, BackgroundTransparency = aqy, BorderSizePixel = 0, ZIndex = 0, Parent = arb})
      aos(999, are)
      table.insert(ara, are)
    end
    return {root = arb, layers = ara}
  end
  local arf = {t = 0, jobs = {}}
  local function arg(arh)
    table.insert(arf.jobs, arh)
    return arh
  end
  aoq(aol.RenderStepped, function(ari)
    if (((15 * 15) == 225) and (not n.UIVisible or (l.UIMotion == false))) then
      return
    end
    local arj = math.clamp((((tonumber(l.UIAnimSpeed) or 100)) / 100), 0.1, 3)
    arf.t += (ari * arj)
    local ark = arf.jobs
    for arl = 1, #ark do
      pcall(ark[arl], arf.t, ari)
    end
  end)
  do
    local arm, arn = 0, 0
    aoq(aol.Heartbeat, function(aro)
      arm += 1
      arn += aro
      if (((100 % 7) == 2) and (arn >= 0.5)) then
        aoo.FPS = math.floor(((arm / arn) + 0.5))
        arm, arn = 0, 0
        pcall(function()
          aoo.Ping = math.floor(((Players.LocalPlayer:GetNetworkPing() * 1000) + 0.5))
        end)
        if (((12 * 12) == 144) and aoo._onStats) then
          pcall(aoo._onStats, aoo.FPS, aoo.Ping)
        end
      end
    end)
  end
  local function arp(arq, arr)
    aoq(arq.InputBegan, function(ars)
      if (((3 ^ 2) == 9) and ((ars.UserInputType ~= Enum.UserInputType.MouseButton1) and (ars.UserInputType ~= Enum.UserInputType.Touch))) then
        return
      end
      pcall(function()
        local art = arq.AbsolutePosition
        local aru = aor(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset((ars.Position.X - art.X), (ars.Position.Y - art.Y)), Size = UDim2.fromOffset(8, 8), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.8, BorderSizePixel = 0, ZIndex = (arq.ZIndex + 20), Parent = arq})
        aos(999, aru)
        local arv = ((math.max(arq.AbsoluteSize.X, arq.AbsoluteSize.Y) * (((arr and 2.2) or 2.8))) + 24)
        aok:Create(aru, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.fromOffset(arv, arv), BackgroundTransparency = 1}):Play()
        task.delay(0.55, function()
          aru:Destroy()
        end)
      end)
    end)
  end
  local arw = aor(g({9, 57, 40, 63, 63, 52, 29, 47, 51}, 90), {Name = g({25, 53, 42, 63, 18, 47, 56, 29, 47, 51}, 90), ResetOnSpawn = false, IgnoreGuiInset = true, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 1000, Parent = apm()})
  k.ScreenGui = arw
  local arx = aor(g({28, 40, 59, 55, 63}, 90), {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -16, 0, 16), Size = UDim2.fromOffset(320, 620), ZIndex = 200, Parent = arw})
  aor(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90), {Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder, HorizontalAlignment = Enum.HorizontalAlignment.Right, Parent = arx})
  local ary = {check = {g = g({184, 198, 201}, 90), c = aop.Green}, [g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90)] = {g = g({123}, 90), c = aop.Red}, clock = {g = g({184, 205, 237}, 90), c = aop.Accent2}, info = {g = g({51}, 90), c = aop.Accent2}, paintbrush = {g = g({184, 198, 252}, 90), c = aop.Accent}}
  function aoo.Notify(arz)
    pcall(function()
      local asa = (arz.Duration or 3)
      local asb = (arz.Content and (#tostring(arz.Content) > 46))
      local asc = aor(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(310, ((asb and 84) or 66)), BackgroundTransparency = 1, BorderSizePixel = 0, Parent = arx})
      local asd = aor(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromScale(1, 1), Position = UDim2.fromOffset(340, 0), BackgroundColor3 = aop.Surface, BackgroundTransparency = 0.06, BorderSizePixel = 0, Parent = asc})
      aos(12, asd)
      aot(aop.Stroke, 0.35, 1, asd)
      local ase = (ary[arz.Icon] or {g = g({184, 198, 252}, 90), c = aop.Accent})
      local asf = aor(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.new(0, 3, 1, -16), Position = UDim2.new(0, 6, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = ase.c, BorderSizePixel = 0, Parent = asd})
      aos(999, asf)
      local asg = aor(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(26, 26), Position = UDim2.new(0, 18, 0, 12), BackgroundColor3 = ase.c, BackgroundTransparency = 0.82, BorderSizePixel = 0, Parent = asd})
      aos(999, asg)
      aot(ase.c, 0.55, 1, asg)
      aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 13, TextColor3 = ase.c, Text = ase.g, Parent = asg})
      aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 54, 0, 12), Size = UDim2.new(1, -66, 0, 16), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 13, TextColor3 = aop.Text, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring((arz.Title or "")), Parent = asd})
      if (((7 * 7) == 49) and arz.Content) then
        aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 54, 0, 29), Size = UDim2.new(1, -66, 0, ((asb and 40) or 22)), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 11.5, TextColor3 = aop.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true, Text = tostring(arz.Content), Parent = asd})
      end
      local ash = aor(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.new(1, -28, 0, 2), Position = UDim2.new(0, 14, 1, -6), AnchorPoint = Vector2.new(0, 1), BackgroundColor3 = ase.c, BorderSizePixel = 0, BackgroundTransparency = 0.3, Parent = asd})
      aos(999, ash)
      aok:Create(ash, TweenInfo.new(asa, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 0, 2)}):Play()
      aok:Create(asd, TweenInfo.new(0.42, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(0, 0)}):Play()
      task.delay(asa, function()
        aok:Create(asd, TweenInfo.new(0.26, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.fromOffset(340, 0)}):Play()
        task.delay(0.3, function()
          asc:Destroy()
        end)
      end)
    end)
  end
  while (((1 + 1) == 2) and not n.Ready) do
    task.wait(0.1)
  end
  local asi, asj = 720, 540
  local ask = aor(g({28, 40, 59, 55, 63}, 90), {Name = g({25, 53, 42, 63, 13, 51, 52}, 90), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(asi, asj), BackgroundTransparency = 1, Visible = false, Parent = arw})
  local asl = aor(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = math.clamp((((tonumber(l.UIScale) or 100)) / 100), 0.7, 1.4), Parent = ask})
  local asm = aor(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 1, Parent = ask})
  local asn = aqp(ask, 40, 0.52, Color3.new(0, 0, 0), 0)
  local aso = aqp(ask, 16, 0.86, aop.Accent, 0)
  aoo.markAccent(aso, g({19, 55, 59, 61, 63, 25, 53, 54, 53, 40, 105}, 90))
  local asp = aor(g({28, 40, 59, 55, 63}, 90), {Name = g({8, 53, 53, 46}, 90), Size = UDim2.fromScale(1, 1), BackgroundColor3 = aop.Bg, BorderSizePixel = 0, ClipsDescendants = true, ZIndex = 2, Parent = ask})
  aos(16, asp)
  local asq = aor(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(aop.Bg, aop.Bg2), Rotation = 115, Parent = asp})
  local asr = aot(aop.Stroke, 0.1, 1.5, asp)
  aoo.markAccent(aor(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, aop.Accent), ColorSequenceKeypoint.new(0.5, aop.Accent2), ColorSequenceKeypoint.new(1, aop.Accent)}), Rotation = 35, Parent = asr}), g({61, 40, 59, 62, 105}, 90))
  local ass = aor(g({28, 40, 59, 55, 63}, 90), {Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62}, 90), Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 0, Parent = asp})
  local ast = {{n = g({23, 51, 62, 52, 51, 61, 50, 46}, 90), a = g({106, 27, 106, 27, 107, 110}, 90), b = g({107, 27, 107, 27, 105, 98}, 90)}, {n = g({21, 56, 41, 51, 62, 51, 59, 52}, 90), a = g({106, 109, 106, 109, 106, 27}, 90), b = g({107, 27, 107, 27, 104, 106}, 90)}, {n = g({21, 57, 63, 59, 52}, 90), a = g({106, 111, 107, 105, 107, 28}, 90), b = g({106, 24, 104, 25, 110, 104}, 90)}, {n = g({10, 54, 47, 55}, 90), a = g({107, 104, 106, 27, 107, 25}, 90), b = g({104, 31, 107, 106, 110, 108}, 90)}, {n = g({28, 53, 40, 63, 41, 46}, 90), a = g({106, 108, 107, 111, 106, 28}, 90), b = g({106, 28, 104, 28, 104, 106}, 90)}, {n = g({31, 55, 56, 63, 40}, 90), a = g({107, 110, 106, 27, 106, 27}, 90), b = g({105, 25, 107, 111, 107, 104}, 90)}, {n = g({9, 54, 59, 46, 63}, 90), a = g({106, 31, 106, 31, 107, 110}, 90), b = g({104, 104, 104, 104, 104, 28}, 90)}, {n = g({27, 57, 57, 63, 52, 46}, 90), a = g({106, 27, 106, 27, 107, 110}, 90), b = g({107, 27, 107, 27, 105, 98}, 90)}}
  local asu = {g({27, 47, 40, 53, 40, 59}, 90), g({20, 63, 56, 47, 54, 59}, 90), g({13, 59, 44, 63, 41}, 90), g({9, 46, 59, 40, 60, 51, 63, 54, 62}, 90), g({29, 40, 59, 62, 51, 63, 52, 46}, 90), g({9, 53, 54, 51, 62}, 90)}
  aoo.BgPresets, aoo.BgStyles = {}, asu
  aoo.BgSwatches = ast
  for asv, asw in ipairs(ast) do
    table.insert(aoo.BgPresets, asw.n)
  end
  local function asx()
    local asy = tostring((l.UIBgPreset or g({23, 51, 62, 52, 51, 61, 50, 46}, 90)))
    if (((15 * 15) == 225) and (asy == g({27, 57, 57, 63, 52, 46}, 90))) then
      return aop.Accent:Lerp(Color3.new(0, 0, 0), 0.9), aop.Accent2:Lerp(Color3.new(0, 0, 0), 0.8)
    end
    for asz, ata in ipairs(ast) do
      if (((100 % 7) == 2) and (ata.n == asy)) then
        return aon(ata.a), aon(ata.b)
      end
    end
    return aon(g({106, 27, 106, 27, 107, 110}, 90)), aon(g({107, 27, 107, 27, 105, 98}, 90))
  end
  local function atb(atc)
    local atd = math.clamp((((tonumber(l.UIBgIntensity) or 100)) / 100), 0, 2)
    return math.clamp((1 - (((1 - atc)) * atd)), 0, 1)
  end
  local ate
  local atf = {}
  aoo._afterAccent = function()
    for atg, ath in ipairs(atf) do
      pcall(ath)
    end
  end
  table.insert(atf, function()
    if (((12 * 12) == 144) and ate) then
      ate()
    end
  end)
  function aoo.SetBackground(ati)
    l.UIBgPreset = tostring(ati)
    if (((3 ^ 2) == 9) and ate) then
      ate()
    end
  end
  function aoo.SetBgStyle(atj)
    l.UIBgStyle = tostring(atj)
    if (((7 * 7) == 49) and ate) then
      ate()
    end
  end
  function aoo.RefreshBackground()
    if (((1 + 1) == 2) and ate) then
      ate()
    end
  end
  function aoo.SetUIScale(atk)
    l.UIScale = (tonumber(atk) or 100)
    asl.Scale = math.clamp((((tonumber(l.UIScale) or 100)) / 100), 0.7, 1.4)
  end
  local atl, atm = {}, nil
  local function atn(ato)
    table.insert(atl, ato)
    return ato
  end
  local function atp()
    for atq, atr in ipairs(atl) do
      pcall(function()
        atr:Destroy()
      end)
    end
    table.clear(atl)
    atm = nil
  end
  local function ats(att, atu)
    local atv = {aop.Accent, aop.Accent2, atu:Lerp(Color3.fromRGB(255, 255, 255), 0.14)}
    local atw = {440, 370, 300}
    local atx = {}
    for aty = 1, 3 do
      local atz = aqv(atw[aty], atv[aty], atb(0.74), ass)
      atn(atz.root)
      atx[aty] = atz.root
    end
    atm = function(aua)
      for aub = 1, 3 do
        local auc = (aub * 1.7)
        atx[aub].Position = UDim2.fromScale((0.5 + (0.4 * math.sin(((aua * ((0.13 + (aub * 0.03)))) + auc)))), (0.5 + (0.42 * math.cos(((aua * ((0.1 + (aub * 0.024)))) + (auc * 1.4))))))
      end
    end
  end
  local function aud(aue, auf)
    local aug = atn(aor(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1.8, 1.8), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0, ZIndex = 0, Parent = ass}))
    local auh = aor(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(aop.Accent, aop.Accent2), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.4, 1), NumberSequenceKeypoint.new(0.5, atb(0.76)), NumberSequenceKeypoint.new(0.6, 1), NumberSequenceKeypoint.new(1, 1)}), Parent = aug})
    local aui = {}
    for auj = 1, 2 do
      local auk = aqv((((auj == 1) and 420) or 330), (((auj == 1) and aop.Accent2) or auf:Lerp(Color3.fromRGB(255, 255, 255), 0.1)), atb(0.76), ass)
      atn(auk.root)
      aui[auj] = auk.root
    end
    atm = function(aul)
      auh.Rotation = (((aul * 16)) % 360)
      aui[1].Position = UDim2.fromScale((0.28 + (0.16 * math.sin((aul * 0.14)))), (0.3 + (0.16 * math.cos((aul * 0.11)))))
      aui[2].Position = UDim2.fromScale((0.74 + (0.16 * math.cos((aul * 0.12)))), (0.72 + (0.14 * math.sin((aul * 0.15)))))
    end
  end
  local function aum(aun, auo)
    local aup = {}
    for auq = 1, 3 do
      local aur = atn(aor(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset((asi * 1.6), (220 + (auq * 70))), Position = UDim2.new(0.5, 0, 1, (70 + (auq * 34))), BackgroundColor3 = ((((auq == 2)) and aop.Accent2) or aop.Accent), BackgroundTransparency = atb((0.8 + (auq * 0.014))), BorderSizePixel = 0, ZIndex = 0, Parent = ass}))
      aos(999, aur)
      aup[auq] = aur
    end
    atm = function(aus)
      for aut = 1, 3 do
        local auu = ((aus * ((0.34 + (aut * 0.13)))) + aut)
        aup[aut].Position = UDim2.new(0.5, (math.sin(auu) * 70), 1, ((70 + (aut * 34)) + (math.sin((auu * 0.8)) * 30)))
        aup[aut].Rotation = (math.sin((auu * 0.5)) * 3)
      end
    end
  end
  local function auv(auw, aux)
    local auy = {}
    for auz = 1, 22 do
      local ava = atn(aor(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(((((auz % 5) == 0) and 3) or 2), ((((auz % 5) == 0) and 3) or 2)), BackgroundColor3 = (((((auz % 4) == 0)) and aop.Accent2) or Color3.fromRGB(255, 255, 255)), BackgroundTransparency = atb(0.42), BorderSizePixel = 0, ZIndex = 0, Parent = ass}))
      aos(999, ava)
      auy[auz] = {f = ava, x = math.random(), y = math.random(), sp = (0.6 + (math.random() * 1.8)), ph = (math.random() * 6.283)}
    end
    local avb = aqv(380, aop.Accent, atb(0.8), ass)
    atn(avb.root)
    avb.root.Position = UDim2.fromScale(0.72, 0.22)
    local tick = 0
    atm = function(avc, avd)
      tick += 1
      local ave = (((tick % 3) == 0))
      local avf = atb(0.38)
      for avg = 1, #auy do
        local avh = auy[avg]
        avh.y -= ((avh.sp * avd) * 0.02)
        if (((15 * 15) == 225) and (avh.y < -0.03)) then
          avh.y, avh.x = 1.03, math.random()
        end
        avh.f.Position = UDim2.fromScale(avh.x, avh.y)
        if (((100 % 7) == 2) and ave) then
          avh.f.BackgroundTransparency = math.clamp((avf + (0.35 * ((0.5 + (0.5 * math.sin(((avc * 2) + avh.ph))))))), 0, 1)
        end
      end
    end
  end
  local function avi(avj, avk)
    local avl = aqv(520, aop.Accent, atb(0.78), ass)
    atn(avl.root)
    avl.root.Position = UDim2.fromScale(0.18, 0.12)
    local avm = aqv(420, aop.Accent2, atb(0.8), ass)
    atn(avm.root)
    avm.root.Position = UDim2.fromScale(0.86, 0.9)
    atm = function(avn)
      asq.Rotation = (115 + (math.sin((avn * 0.22)) * 28))
    end
  end
  ate = function()
    local avo, avp = asx()
    aop.Bg, aop.Bg2 = avo, avp
    asp.BackgroundColor3 = avo
    asq.Color = ColorSequence.new(avo, avp)
    asq.Rotation = 115
    atp()
    local avq = tostring((l.UIBgStyle or g({27, 47, 40, 53, 40, 59}, 90)))
    if (((12 * 12) == 144) and (avq == g({20, 63, 56, 47, 54, 59}, 90))) then
      aud(avo, avp)
    elseif (((3 ^ 2) == 9) and (avq == g({13, 59, 44, 63, 41}, 90))) then
      aum(avo, avp)
    elseif (((7 * 7) == 49) and (avq == g({9, 46, 59, 40, 60, 51, 63, 54, 62}, 90))) then
      auv(avo, avp)
    elseif (((1 + 1) == 2) and (avq == g({29, 40, 59, 62, 51, 63, 52, 46}, 90))) then
      avi(avo, avp)
    elseif (((15 * 15) == 225) and (avq == g({9, 53, 54, 51, 62}, 90))) then
      atm = nil
    else
      ats(avo, avp)
    end
  end
  arg(function(avr, avs)
    if (((100 % 7) == 2) and atm) then
      atm(avr, avs)
    end
  end)
  ate()
  local avt = aor(g({28, 40, 59, 55, 63}, 90), {Name = g({14, 53, 42, 56, 59, 40}, 90), Size = UDim2.new(1, 0, 0, 54), BackgroundTransparency = 1, ZIndex = 5, Parent = asp})
  local avu = aor(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.new(1, -28, 0, 1), Position = UDim2.new(0, 14, 0, 54), BackgroundColor3 = aop.Stroke, BorderSizePixel = 0, ZIndex = 5, Parent = asp})
  aor(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.25), NumberSequenceKeypoint.new(1, 1)}), Parent = avu})
  local avv = aor(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 16, 0, 12), Size = UDim2.fromOffset(30, 30), BackgroundColor3 = aop.Accent, BorderSizePixel = 0, ZIndex = 6, Parent = avt})
  aos(10, avv)
  aoo.markAccent(avv, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
  aoo.markAccent(aqi(avv, aop.Accent, aop.Accent2, 45), g({61, 40, 59, 62}, 90))
  aoo.markAccent(aot(aop.Accent, 0.5, 1, avv), g({25, 53, 54, 53, 40}, 90))
  aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamBlack, TextSize = 15, TextColor3 = Color3.fromRGB(255, 255, 255), Text = g({25}, 90), ZIndex = 7, Parent = avv})
  local avw = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Name = g({22, 53, 61, 53}, 90), Position = UDim2.new(0, 54, 0, 11), Size = UDim2.fromOffset(180, 20), BackgroundTransparency = 1, Font = Enum.Font.GothamBlack, TextSize = 17, TextColor3 = aop.Text, TextXAlignment = Enum.TextXAlignment.Left, RichText = true, Text = g({25, 21, 10, 31, 122, 18, 15, 24}, 90), ZIndex = 6, Parent = avt})
  local function avx()
    avw.Text = string.format(g({102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 121, 127, 41, 120, 100, 25, 21, 10, 31, 102, 117, 60, 53, 52, 46, 100, 122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 121, 127, 41, 120, 100, 18, 15, 24, 102, 117, 60, 53, 52, 46, 100}, 90), apa(aop.Accent), apa(aop.Accent2))
  end
  avx()
  table.insert(atf, avx)
  local avy = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Name = g({9, 47, 56, 46, 51, 46, 54, 63}, 90), Position = UDim2.new(0, 55, 0, 31), Size = UDim2.new(1, -320, 0, 12), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 10.5, TextColor3 = aop.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = g({41, 46, 59, 40, 46, 51, 52, 61, 116, 116, 116}, 90), ZIndex = 6, Parent = avt})
  local avz = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 158, 0, 13), Size = UDim2.fromOffset(40, 17), BackgroundColor3 = aop.Accent, BackgroundTransparency = 0.78, Font = Enum.Font.GothamBold, TextSize = 10, TextColor3 = aop.Text, Text = g({44, 108, 116, 106}, 90), ZIndex = 6, Parent = avt})
  aos(6, avz)
  aoo.markAccent(avz, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
  aoo.markAccent(aot(aop.Accent, 0.6, 1, avz), g({25, 53, 54, 53, 40}, 90))
  local awa = aor(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -114, 0.5, 0), Size = UDim2.fromOffset(104, 26), BackgroundColor3 = aop.Element, BackgroundTransparency = 0.35, BorderSizePixel = 0, ZIndex = 6, Parent = avt})
  aos(8, awa)
  aot(aop.Stroke, 0.55, 1, awa)
  local awb = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 11, TextColor3 = aop.SubText, RichText = true, Text = g({119, 119, 122, 60, 42, 41}, 90), ZIndex = 7, Parent = awa})
  aoo._onStats = function(awc, awd)
    local awe = (((((awc >= 45) and g({105, 110, 30, 105, 99, 99}, 90))) or (((awc >= 25) and g({28, 24, 24, 28, 104, 110}, 90)))) or g({28, 98, 109, 107, 109, 107}, 90))
    awb.Text = string.format(g({102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 121, 127, 41, 120, 100, 127, 62, 102, 117, 60, 53, 52, 46, 100, 122, 60, 42, 41, 122, 122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 121, 110, 27, 110, 27, 108, 98, 120, 100, 38, 102, 117, 60, 53, 52, 46, 100, 122, 122, 127, 62, 122, 55, 41}, 90), awe, awc, awd)
  end
  local function awf(awg, awh, awi, awj)
    local awk = aor(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Position = UDim2.new(1, awg, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromOffset(28, 28), BackgroundColor3 = aop.Element, BackgroundTransparency = 0.25, Font = Enum.Font.GothamBold, TextSize = 14, TextColor3 = aop.SubText, Text = awh, AutoButtonColor = false, ZIndex = 6, Parent = avt})
    aos(8, awk)
    aot(aop.Stroke, 0.55, 1, awk)
    aoq(awk.MouseEnter, function()
      aok:Create(awk, TweenInfo.new(0.14), {BackgroundColor3 = (awi or aop.ElementHover), BackgroundTransparency = 0, TextColor3 = (awj or aop.Text)}):Play()
    end)
    aoq(awk.MouseLeave, function()
      aok:Create(awk, TweenInfo.new(0.14), {BackgroundColor3 = aop.Element, BackgroundTransparency = 0.25, TextColor3 = aop.SubText}):Play()
    end)
    arp(awk)
    return awk
  end
  local awl = nil
  local function awm(awn)
    if (((12 * 12) == 144) and (awn and (l.UIBlur == true))) then
      if (((3 ^ 2) == 9) and not awl) then
        awl = aor(g({24, 54, 47, 40, 31, 60, 60, 63, 57, 46}, 90), {Name = g({25, 53, 42, 63, 18, 47, 56, 24, 54, 47, 40}, 90), Size = 0, Parent = aom})
      end
      aok:Create(awl, TweenInfo.new(0.3), {Size = 14}):Play()
    elseif (((7 * 7) == 49) and awl) then
      local awo = aok:Create(awl, TweenInfo.new(0.25), {Size = 0})
      awo.Completed:Connect(function()
        if (((1 + 1) == 2) and (awl and ((not n.UIVisible or (l.UIBlur ~= true))))) then
          awl:Destroy()
          awl = nil
        end
      end)
      awo:Play()
    end
  end
  aoo.SetBlur = function(awp)
    l.UIBlur = (awp == true)
    awm((n.UIVisible and (awp == true)))
  end
  local awq = TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
  local awr = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
  aou = function(aws)
    n.UIVisible = aws
    if (((15 * 15) == 225) and aws) then
      ask.Visible = true
      asm.Scale = 0.9
      asn.ImageTransparency = 1
      aso.ImageTransparency = 1
      aok:Create(asm, awq, {Scale = 1}):Play()
      aok:Create(asn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.52}):Play()
      aok:Create(aso, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.86}):Play()
      awm(true)
    else
      local awt = aok:Create(asm, awr, {Scale = 0.92})
      awt.Completed:Connect(function()
        if (((100 % 7) == 2) and not n.UIVisible) then
          ask.Visible = false
        end
      end)
      awt:Play()
      aok:Create(asn, awr, {ImageTransparency = 1}):Play()
      aok:Create(aso, awr, {ImageTransparency = 1}):Play()
      awm(false)
    end
    if (((12 * 12) == 144) and k._onUIVisible) then
      k._onUIVisible(aws)
    end
  end
  k._setUIVisible = aou
  local awu = awf(-76, g({184, 218, 201}, 90))
  awu.Activated:Connect(function()
    aou(false)
  end)
  local awv = awf(-42, g({184, 198, 207}, 90), Color3.fromRGB(74, 32, 46), Color3.fromRGB(255, 190, 200))
  awv.Activated:Connect(function()
    aou(false)
  end)
  do
    local aww, awx, awy = false, nil, nil
    aoq(avt.InputBegan, function(awz)
      if (((3 ^ 2) == 9) and ((awz.UserInputType == Enum.UserInputType.MouseButton1) or (awz.UserInputType == Enum.UserInputType.Touch))) then
        aww, awx, awy = true, awz.Position, ask.Position
      end
    end)
    aoq(aoy.InputChanged, function(axa)
      if (((7 * 7) == 49) and (aww and (((axa.UserInputType == Enum.UserInputType.MouseMovement) or (axa.UserInputType == Enum.UserInputType.Touch))))) then
        local axb = (axa.Position - awx)
        local axc = arw.AbsoluteSize
        local axd = (ask.AbsoluteSize / 2)
        local axe = math.clamp((awy.X.Offset + axb.X), (((-axc.X * 0.5) + axd.X) - 60), (((axc.X * 0.5) - axd.X) + 60))
        local axf = math.clamp((awy.Y.Offset + axb.Y), (((-axc.Y * 0.5) + axd.Y) - 10), (((axc.Y * 0.5) - axd.Y) + 10))
        ask.Position = UDim2.new(0.5, axe, 0.5, axf)
      end
    end)
    aoq(aoy.InputEnded, function(axg)
      if (((1 + 1) == 2) and ((axg.UserInputType == Enum.UserInputType.MouseButton1) or (axg.UserInputType == Enum.UserInputType.Touch))) then
        aww = false
      end
    end)
  end
  local axh, axi, axj = 186, 34, 4
  local axk = aor(g({28, 40, 59, 55, 63}, 90), {Name = g({9, 51, 62, 63, 56, 59, 40}, 90), Position = UDim2.new(0, 14, 0, 64), Size = UDim2.new(0, axh, 1, -78), BackgroundColor3 = aop.Surface, BackgroundTransparency = 0.06, BorderSizePixel = 0, ZIndex = 4, Parent = asp})
  aos(14, axk)
  aot(aop.Stroke, 0.4, 1, axk)
  aor(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(aop.SurfaceAlt, aop.Surface), Rotation = 90, Parent = axk})
  do
    local axl = aor(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 8, 0, 8), Size = UDim2.new(1, -16, 0, 54), BackgroundColor3 = aop.Element, BackgroundTransparency = 0.12, BorderSizePixel = 0, ZIndex = 5, Parent = axk})
    aos(11, axl)
    aot(aop.Stroke, 0.4, 1, axl)
    local axm = aor(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 8, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromOffset(38, 38), BackgroundColor3 = aop.SurfaceAlt, BorderSizePixel = 0, ZIndex = 6, Parent = axl})
    aos(999, axm)
    aoo.markAccent(aot(aop.Accent, 0.35, 1.5, axm), g({25, 53, 54, 53, 40}, 90))
    pcall(function()
      axm.Image = string.format(g({40, 56, 34, 46, 50, 47, 55, 56, 96, 117, 117, 46, 35, 42, 63, 103, 27, 44, 59, 46, 59, 40, 18, 63, 59, 62, 9, 50, 53, 46, 124, 51, 62, 103, 127, 62, 124, 45, 103, 110, 98, 124, 50, 103, 110, 98}, 90), Players.LocalPlayer.UserId)
    end)
    aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 54, 0, 11), Size = UDim2.new(1, -62, 0, 15), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12.5, TextColor3 = aop.Text, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 6, Parent = axl, Text = tostring(Players.LocalPlayer.DisplayName)})
    aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 54, 0, 28), Size = UDim2.new(1, -62, 0, 13), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 10.5, TextColor3 = aop.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 6, Parent = axl, Text = (g({26}, 90) .. tostring(Players.LocalPlayer.Name))})
  end
  local axn = aor(g({9, 57, 40, 53, 54, 54, 51, 52, 61, 28, 40, 59, 55, 63}, 90), {Name = g({14, 59, 56, 22, 51, 41, 46}, 90), Position = UDim2.new(0, 8, 0, 70), Size = UDim2.new(1, -16, 1, -82), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 2, ScrollBarImageColor3 = aop.Stroke, ScrollBarImageTransparency = 0.5, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollingDirection = Enum.ScrollingDirection.Y, ZIndex = 5, Parent = axk})
  aor(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90), {Padding = UDim.new(0, axj), SortOrder = Enum.SortOrder.LayoutOrder, Parent = axn})
  local axo = aor(g({28, 40, 59, 55, 63}, 90), {Name = g({10, 51, 54, 54, 22, 59, 35, 63, 40}, 90), Position = axn.Position, Size = axn.Size, BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 8, Parent = axk})
  local axp = aor(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(3, 18), Position = UDim2.new(0, 0, 0, 9), BackgroundColor3 = aop.Accent, BorderSizePixel = 0, Visible = false, ZIndex = 8, Parent = axo})
  local axq = aor(g({20, 47, 55, 56, 63, 40, 12, 59, 54, 47, 63}, 90), {Value = 9, Parent = axo})
  local function axr()
    axp.Position = UDim2.new(0, 0, 0, (axq.Value - axn.CanvasPosition.Y))
  end
  aoq(axq.Changed, axr)
  aoq(axn:GetPropertyChangedSignal(g({25, 59, 52, 44, 59, 41, 10, 53, 41, 51, 46, 51, 53, 52}, 90)), axr)
  aos(999, axp)
  aoo.markAccent(axp, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
  aoo.markAccent(aqi(axp, aop.Accent, aop.Accent2, 90), g({61, 40, 59, 62}, 90))
  local axs = aor(g({28, 40, 59, 55, 63}, 90), {Name = g({25, 53, 52, 46, 63, 52, 46}, 90), Position = UDim2.new(0, ((14 + axh) + 12), 0, 64), Size = UDim2.new(1, (-(((14 + axh) + 12)) - 14), 1, -78), BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 4, Parent = asp})
  local axt = aor(g({28, 40, 59, 55, 63}, 90), {Name = g({10, 53, 42, 47, 42, 41}, 90), Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 60, Parent = asp})
  local function axu()
    local axv = (ask.AbsoluteSize.X / asi)
    return ((((axv > 0.01)) and axv) or 1)
  end
  local function axw(axx)
    local axy = (((axx.AbsolutePosition - asp.AbsolutePosition)) / axu())
    return axy.X, axy.Y
  end
  local axz = {}
  local function aya()
    for ayb = 1, #axz do
      pcall(axz[ayb])
    end
  end
  k._closeDropdowns = aya
  aow = {}
  aox = {}
  k.Window = aow
  aoo.Window = aow
  aoo.Tabs = aox
  function aow:SetAuthor(ayc)
    avy.Text = tostring((ayc or ""))
  end
  function aow:SetSubtitle(ayd)
    avy.Text = tostring((ayd or ""))
  end
  local aye = {}
  local ayf = nil
  aov = function(ayg)
    if (((15 * 15) == 225) and (not ayg or (ayf == ayg))) then
      return
    end
    aya()
    local ayh = ayf
    ayf = ayg
    if (((100 % 7) == 2) and ayh) then
      ayh.setActive(false)
      local ayi = ayh.wrap
      local ayj = aok:Create(ayi, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.fromOffset(-26, 0)})
      ayj.Completed:Connect(function()
        if (((12 * 12) == 144) and (ayf ~= ayh)) then
          ayi.Visible = false
        end
      end)
      ayj:Play()
    end
    ayg.setActive(true)
    ayg.wrap.Position = UDim2.fromOffset(34, 0)
    ayg.wrap.Visible = true
    ayg.scroll.Position = UDim2.fromOffset(0, 10)
    aok:Create(ayg.wrap, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(0, 0)}):Play()
    aok:Create(ayg.scroll, TweenInfo.new(0.34, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(0, 0)}):Play()
    axp.Visible = true
    aok:Create(axq, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Value = (ayg.y + 9)}):Play()
  end
  aoo.SelectTab = aov
  function aow:Tab(ayk)
    ayk = (ayk or {})
    local ayl = (#aox + 1)
    local aym = aor(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Name = (g({14, 59, 56, 5}, 90) .. tostring((ayk.Title or ayl))), LayoutOrder = ayl, Size = UDim2.new(1, 0, 0, axi), BackgroundColor3 = aop.Element, BackgroundTransparency = 1, BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 6, Parent = axn})
    aos(10, aym)
    local ayn = aor(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 9, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromOffset(24, 24), BackgroundColor3 = aop.Accent, BackgroundTransparency = 0.86, BorderSizePixel = 0, ZIndex = 7, Parent = aym})
    aos(8, ayn)
    aoo.markAccent(ayn, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
    aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 12, TextColor3 = aop.Text, Text = tostring((ayk.Icon or g({184, 218, 248}, 90))), ZIndex = 8, Parent = ayn})
    local ayo = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 42, 0, 0), Size = UDim2.new(1, -50, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 12.5, TextColor3 = aop.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring((ayk.Title or g({14, 59, 56}, 90))), ZIndex = 7, Parent = aym})
    local ayp = aor(g({28, 40, 59, 55, 63}, 90), {Name = (g({10, 59, 61, 63, 5}, 90) .. tostring((ayk.Title or ayl))), Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false, ZIndex = 4, Parent = axs})
    local ayq = aor(g({9, 57, 40, 53, 54, 54, 51, 52, 61, 28, 40, 59, 55, 63}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = aop.Stroke, ScrollBarImageTransparency = 0.25, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollingDirection = Enum.ScrollingDirection.Y, Parent = ayp})
    aor(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90), {Padding = UDim.new(0, 9), SortOrder = Enum.SortOrder.LayoutOrder, Parent = ayq})
    aqc(ayq, 2, 10, 18, 2)
    local ayr = false
    local function ays(ayt)
      ayr = ayt
      aok:Create(aym, TweenInfo.new(0.16), {BackgroundTransparency = ((ayt and 0.12) or 1)}):Play()
      aok:Create(ayo, TweenInfo.new(0.16), {TextColor3 = ((ayt and aop.Text) or aop.SubText)}):Play()
      aok:Create(ayn, TweenInfo.new(0.16), {BackgroundTransparency = ((ayt and 0.55) or 0.86)}):Play()
    end
    aoq(aym.MouseEnter, function()
      if (((3 ^ 2) == 9) and not ayr) then
        aok:Create(aym, TweenInfo.new(0.14), {BackgroundTransparency = 0.55}):Play()
      end
    end)
    aoq(aym.MouseLeave, function()
      if (((7 * 7) == 49) and not ayr) then
        aok:Create(aym, TweenInfo.new(0.14), {BackgroundTransparency = 1}):Play()
      end
    end)
    arp(aym)
    local ayu = {Title = tostring((ayk.Title or g({14, 59, 56}, 90))), index = ayl, y = (((ayl - 1)) * ((axi + axj))), btn = aym, wrap = ayp, scroll = ayq, setActive = ays}
    local ayv = setmetatable({_tab = ayu, _page = ayq}, {__index = aye})
    ayu.api = ayv
    table.insert(aox, ayu)
    aoq(aym.Activated, function()
      aov(ayu)
    end)
    return ayv
  end
  local ayw, ayx = 44, 60
  local function ayy(ayz)
    ayz._order = (((ayz._order or 0)) + 1)
    return ayz._order
  end
  aoo.NextOrder, aoo.Grad, aoo.Ripple = ayy, aqi, arp
  aoo.pin = function(aza, azb)
    if (((1 + 1) == 2) and ((aza and aza.Row) and tonumber(azb))) then
      aza.Row.LayoutOrder = tonumber(azb)
    end
    return aza
  end
  local function azc(azd, aze)
    local azf = aor(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {LayoutOrder = ayy(azd), Size = UDim2.new(1, 0, 0, aze), BackgroundColor3 = aop.Surface, BackgroundTransparency = 0.1, BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 5, Parent = azd._page})
    aos(11, azf)
    local azg = aot(aop.Stroke, 0.45, 1, azf)
    aoq(azf.MouseEnter, function()
      aok:Create(azf, TweenInfo.new(0.14), {BackgroundTransparency = 0}):Play()
      aok:Create(azg, TweenInfo.new(0.14), {Transparency = 0.2}):Play()
    end)
    aoq(azf.MouseLeave, function()
      aok:Create(azf, TweenInfo.new(0.14), {BackgroundTransparency = 0.1}):Play()
      aok:Create(azg, TweenInfo.new(0.14), {Transparency = 0.45}):Play()
    end)
    return azf, azg
  end
  local azh = {[g({46, 40, 59, 41, 50, 119, 104}, 90)] = g({170, 197, 205, 203}, 90), [g({41, 50, 53, 42, 42, 51, 52, 61, 119, 57, 59, 40, 46}, 90)] = g({170, 197, 193, 200}, 90), play = g({184, 204, 236}, 90), sparkles = g({184, 198, 242}, 90), gauge = g({184, 205, 206}, 90), send = g({184, 196, 254}, 90), [g({40, 53, 46, 59, 46, 63, 119, 57, 57, 45}, 90)] = g({184, 220, 224}, 90), [g({54, 53, 61, 119, 53, 47, 46}, 90)] = g({184, 213, 225}, 90), check = g({184, 198, 201}, 90), info = g({51}, 90), [g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90)] = g({123}, 90)}
  local function azi(azj, azk, azl)
    local azm = ((azk.Desc ~= nil) and (tostring(azk.Desc) ~= ""))
    local azn = 14
    if (((15 * 15) == 225) and azk.Icon) then
      local azo = aor(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 12, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromOffset(26, 26), BackgroundColor3 = aop.Accent, BackgroundTransparency = 0.85, BorderSizePixel = 0, ZIndex = 6, Parent = azj})
      aos(8, azo)
      aoo.markAccent(azo, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
      aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 13, TextColor3 = aop.Text, ClipsDescendants = true, Text = ((azh[azk.Icon] or (((#tostring(azk.Icon) <= 2) and tostring(azk.Icon)))) or g({184, 218, 248}, 90)), ZIndex = 7, Parent = azo})
      azn = 48
    end
    local azp = (((azl or 70)) + azn)
    local azq = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Name = g({14, 51, 46, 54, 63, 22, 59, 56, 63, 54}, 90), Position = UDim2.new(0, azn, 0, ((azm and 11) or 0)), Size = ((azm and UDim2.new(1, -azp, 0, 16)) or UDim2.new(1, -azp, 1, 0)), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12.5, TextColor3 = aop.Text, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = ((azm and Enum.TextYAlignment.Center) or Enum.TextYAlignment.Center), TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring((azk.Title or "")), ZIndex = 6, Parent = azj})
    local azr = nil
    if (((100 % 7) == 2) and azm) then
      azr = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Name = g({30, 63, 41, 57, 22, 59, 56, 63, 54}, 90), Position = UDim2.new(0, azn, 0, 28), Size = UDim2.new(1, -azp, 0, 24), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 11, TextColor3 = aop.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true, Text = tostring(azk.Desc), ZIndex = 6, Parent = azj})
    end
    return azq, azr
  end
  local function azs(azt, azu)
    azt.SetTitle = function(azv, azw)
      local azx = azu:FindFirstChild(g({14, 51, 46, 54, 63, 22, 59, 56, 63, 54}, 90))
      if (((12 * 12) == 144) and azx) then
        azx.Text = tostring(azw)
      end
    end
    azt.SetDesc = function(azy, azz)
      local baa = azu:FindFirstChild(g({30, 63, 41, 57, 22, 59, 56, 63, 54}, 90))
      if (((3 ^ 2) == 9) and baa) then
        baa.Text = tostring(azz)
      end
    end
    azt.Destroy = function()
      pcall(function()
        azu:Destroy()
      end)
    end
    azt.Row = azu
    return azt
  end
  function aye:Slot()
    return ayy(self)
  end
  function aye:Section(bab)
    local bac = aor(g({28, 40, 59, 55, 63}, 90), {LayoutOrder = ayy(self), Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, ZIndex = 5, Parent = self._page})
    local bad = aor(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 2, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromOffset(3, 14), BackgroundColor3 = aop.Accent, BorderSizePixel = 0, ZIndex = 6, Parent = bac})
    aos(999, bad)
    aoo.markAccent(bad, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
    local bae = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 13, 0, 0), Size = UDim2.new(1, -17, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12.5, TextColor3 = Color3.fromRGB(255, 255, 255), TextXAlignment = Enum.TextXAlignment.Left, Text = string.upper(tostring((bab or ""))), ZIndex = 6, Parent = bac})
    aoo.markAccent(aqi(bae, aop.Accent, aop.Accent2, 0), g({61, 40, 59, 62}, 90))
    return {SetTitle = function(baf, bag)
      bae.Text = string.upper(tostring((bag or "")))
    end}
  end
  function aye:StatGrid(bah)
    local bai = math.ceil((#bah / 2))
    local baj = aor(g({28, 40, 59, 55, 63}, 90), {LayoutOrder = ayy(self), Size = UDim2.new(1, 0, 0, ((bai * 62) - 8)), BackgroundTransparency = 1, ZIndex = 5, Parent = self._page})
    aor(g({15, 19, 29, 40, 51, 62, 22, 59, 35, 53, 47, 46}, 90), {CellSize = UDim2.new(0.5, -4, 0, 54), CellPadding = UDim2.fromOffset(8, 8), SortOrder = Enum.SortOrder.LayoutOrder, Parent = baj})
    local bak = {}
    for bal, bam in ipairs(bah) do
      local ban = aor(g({28, 40, 59, 55, 63}, 90), {LayoutOrder = bal, BackgroundColor3 = aop.Surface, BackgroundTransparency = 0.15, BorderSizePixel = 0, ZIndex = 6, Parent = baj})
      aos(11, ban)
      aot(aop.Stroke, 0.5, 1, ban)
      local bao = aor(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 0, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromOffset(3, 26), BackgroundColor3 = aop.Accent, BorderSizePixel = 0, ZIndex = 7, Parent = ban})
      aos(999, bao)
      aoo.markAccent(bao, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
      aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 14, 0, 9), Size = UDim2.new(1, -22, 0, 12), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 10, TextColor3 = aop.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = string.upper(tostring((bam.Title or ""))), ZIndex = 7, Parent = ban})
      local bap = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 14, 0, 24), Size = UDim2.new(1, -22, 0, 20), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 16, TextColor3 = aop.Text, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = g({106}, 90), ZIndex = 7, Parent = ban})
      bak[(bam.Key or bal)] = function(baq)
        bap.Text = tostring(baq)
      end
    end
    return bak
  end
  function aye:Toggle(bar)
    bar = (bar or {})
    local bas = azc(self, ((bar.Desc and ayx) or ayw))
    azi(bas, bar, 74)
    local bat = aor(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0), Size = UDim2.fromOffset(44, 22), BackgroundColor3 = aop.Element, BackgroundTransparency = 0.1, BorderSizePixel = 0, ZIndex = 6, Parent = bas})
    aos(999, bat)
    local bau = aoo.markAccent(aot(aop.Accent, 0.8, 1, bat), g({25, 53, 54, 53, 40}, 90))
    aoo.markAccent(aqi(bat, aop.Accent, aop.Accent2, 0), g({61, 40, 59, 62}, 90))
    local bav = aor(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 3, 0.5, 0), Size = UDim2.fromOffset(16, 16), BackgroundColor3 = aop.Gray, BorderSizePixel = 0, ZIndex = 7, Parent = bat})
    aos(999, bav)
    local baw = {Value = (bar.Value == true)}
    local function bax(bay)
      local baz = baw.Value
      local bba = ((baz and UDim2.new(1, -19, 0.5, 0)) or UDim2.new(0, 3, 0.5, 0))
      local bbb = ((baz and Color3.fromRGB(255, 255, 255)) or aop.Gray)
      local bbc = ((baz and Color3.fromRGB(255, 255, 255)) or aop.Element)
      local bbd = ((baz and 0) or 0.1)
      local bbe = ((baz and 0.3) or 0.82)
      if (((7 * 7) == 49) and bay) then
        bav.Position, bav.BackgroundColor3 = bba, bbb
        bat.BackgroundColor3, bat.BackgroundTransparency = bbc, bbd
        bau.Transparency = bbe
        return
      end
      aok:Create(bav, TweenInfo.new(0.26, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = bba, BackgroundColor3 = bbb}):Play()
      aok:Create(bat, TweenInfo.new(0.18), {BackgroundColor3 = bbc, BackgroundTransparency = bbd}):Play()
      aok:Create(bau, TweenInfo.new(0.18), {Transparency = bbe}):Play()
    end
    bax(true)
    baw.Set = function(bbf, bbg, bbh, bbi)
      baw.Value = (bbg == true)
      bax((bbi == true))
      if (((1 + 1) == 2) and ((bbh ~= false) and bar.Callback)) then
        task.spawn(bar.Callback, baw.Value)
      end
    end
    azs(baw, bas)
    aoq(bas.Activated, function()
      baw:Set(not baw.Value, true)
    end)
    arp(bas, true)
    table.insert(aoo.Registry, {type = g({46, 53, 61, 61, 54, 63}, 90), set = function(bbj)
      baw:Set(bbj, true)
    end, default = (bar.Value == true)})
    return baw
  end
  local bbk = nil
  local function bbl()
    local bbm = bbk
    if (((15 * 15) == 225) and not bbm) then
      return
    end
    bbk = nil
    pcall(function()
      bbm.catcher:Destroy()
    end)
    if (((100 % 7) == 2) and bbm.onClose) then
      pcall(bbm.onClose)
    end
    local bbn = bbm.wrap
    aok:Create(bbm.scale, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Scale = 0.9}):Play()
    task.delay(0.13, function()
      pcall(function()
        bbn:Destroy()
      end)
    end)
  end
  table.insert(axz, bbl)
  local bbo = 192
  function aye:Dropdown(bbp)
    bbp = (bbp or {})
    local bbq = (bbp.Multi == true)
    local function bbr()
      return (bbp.Values or {})
    end
    local bbs
    if (((12 * 12) == 144) and bbq) then
      bbs = {}
      for bbt, bbu in ipairs((((type(bbp.Value) == g({46, 59, 56, 54, 63}, 90)) and bbp.Value) or {})) do
        bbs[bbu] = true
      end
    else
      bbs = bbp.Value
      if (((3 ^ 2) == 9) and (((bbs == nil) and (bbp.AllowNone ~= true)) and (#bbr() > 0))) then
        bbs = bbr()[1]
      end
    end
    local bbv = azc(self, ((bbp.Desc and ayx) or ayw))
    azi(bbv, bbp, 176)
    local bbw = aor(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0), Size = UDim2.fromOffset(162, 30), BackgroundColor3 = aop.Element, BackgroundTransparency = 0.15, BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 8, Parent = bbv})
    aos(9, bbw)
    local bbx = aot(aop.Stroke, 0.4, 1, bbw)
    local bby = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 10, 0, 0), Size = UDim2.new(1, -30, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 11.5, TextColor3 = aop.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = "", ZIndex = 9, Parent = bbw})
    local bbz = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -8, 0.5, 0), Size = UDim2.fromOffset(12, 12), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = aop.SubText, Text = g({184, 204, 228}, 90), ZIndex = 9, Parent = bbw})
    aoq(bbw.MouseEnter, function()
      aok:Create(bbw, TweenInfo.new(0.14), {BackgroundTransparency = 0}):Play()
      aok:Create(bbx, TweenInfo.new(0.14), {Transparency = 0.15}):Play()
    end)
    aoq(bbw.MouseLeave, function()
      aok:Create(bbw, TweenInfo.new(0.14), {BackgroundTransparency = 0.15}):Play()
      aok:Create(bbx, TweenInfo.new(0.14), {Transparency = 0.4}):Play()
    end)
    arp(bbw)
    local bca = {}
    local function bcb()
      if (((7 * 7) == 49) and bbq) then
        local bcc = {}
        for bcd, bce in ipairs(bbr()) do
          if (((1 + 1) == 2) and bbs[bce]) then
            table.insert(bcc, bce)
          end
        end
        bca.Value = bcc
        bby.Text = (((#bcc > 0) and table.concat(bcc, g({118, 122}, 90))) or (((bbp.AllowNone and g({20, 53, 46, 50, 51, 52, 61}, 90)) or g({9, 63, 54, 63, 57, 46, 184, 218, 252}, 90))))
        bby.TextColor3 = (((#bcc > 0) and aop.Text) or aop.SubText)
      else
        bca.Value = bbs
        bby.Text = tostring((bbs or (((bbp.AllowNone and g({20, 53, 46, 50, 51, 52, 61}, 90)) or g({9, 63, 54, 63, 57, 46, 184, 218, 252}, 90)))))
        bby.TextColor3 = (((bbs ~= nil) and aop.Text) or aop.SubText)
      end
    end
    bcb()
    aoq(bbw.Activated, function()
      if (((15 * 15) == 225) and (bbk and (bbk.owner == bca))) then
        bbl()
        return
      end
      bbl()
      local bcf = bbr()
      local bcg, bch = axw(bbw)
      local bci = math.min(((#bcf * 32) + 12), 226)
      local bcj = ((((bch + 34) + bci)) > ((asj - 10)))
      local bck = math.clamp(((bcg + 162) - bbo), 8, ((asi - bbo) - 8))
      local bcl = aor(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, ZIndex = 51, Parent = axt})
      bcl.Activated:Connect(bbl)
      local bcm = aor(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = ((bcj and Vector2.new(0, 1)) or Vector2.new(0, 0)), Position = ((bcj and UDim2.new(0, bck, 0, (bch - 4))) or UDim2.new(0, bck, 0, (bch + 34))), Size = UDim2.fromOffset(bbo, bci), BackgroundTransparency = 1, ZIndex = 52, Parent = axt})
      local bcn = aor(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 0.92, Parent = bcm})
      local bco = aor(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromScale(1, 1), BackgroundColor3 = aop.SurfaceAlt, BorderSizePixel = 0, ZIndex = 52, Parent = bcm})
      aos(11, bco)
      aoo.markAccent(aot(aop.Accent, 0.55, 1, bco), g({25, 53, 54, 53, 40}, 90))
      local bcp = aor(g({9, 57, 40, 53, 54, 54, 51, 52, 61, 28, 40, 59, 55, 63}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollingDirection = Enum.ScrollingDirection.Y, ScrollBarThickness = 3, ScrollBarImageTransparency = 0.2, ZIndex = 53, Parent = bco})
      aoo.markAccent(bcp, g({9, 57, 40, 53, 54, 54, 24, 59, 40, 19, 55, 59, 61, 63, 25, 53, 54, 53, 40, 105}, 90))
      aor(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90), {Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder, Parent = bcp})
      aqc(bcp, 6, 6, 6, 6)
      for bcq, bcr in ipairs(bcf) do
        local bcs = aor(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Size = UDim2.new(1, -4, 0, 28), BackgroundColor3 = aop.Element, BackgroundTransparency = 0.1, BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 54, LayoutOrder = bcq, Parent = bcp})
        aos(7, bcs)
        local bct = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 9, 0, 0), Size = UDim2.new(1, -32, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 11.5, TextColor3 = aop.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring(bcr), ZIndex = 55, Parent = bcs})
        local bcu = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -8, 0.5, 0), Size = UDim2.fromOffset(14, 14), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = aop.Text, Text = g({184, 198, 201}, 90), Visible = false, ZIndex = 55, Parent = bcs})
        local function bcv()
          local bcw = ((bbq and ((bbs[bcr] == true))) or ((not bbq and (bbs == bcr))))
          bcs.BackgroundColor3 = ((bcw and aop.Accent) or aop.Element)
          bcs.BackgroundTransparency = ((bcw and 0.25) or 0.1)
          bct.TextColor3 = ((bcw and aop.Text) or aop.SubText)
          bcu.Visible = bcw
        end
        bcv()
        bcs.MouseEnter:Connect(function()
          local bcx = ((bbq and ((bbs[bcr] == true))) or ((not bbq and (bbs == bcr))))
          if (((100 % 7) == 2) and not bcx) then
            aok:Create(bcs, TweenInfo.new(0.12), {BackgroundColor3 = aop.ElementHover, BackgroundTransparency = 0}):Play()
          end
        end)
        bcs.MouseLeave:Connect(bcv)
        bcs.Activated:Connect(function()
          if (((12 * 12) == 144) and bbq) then
            bbs[bcr] = ((not bbs[bcr]) or nil)
            bcv()
            bcb()
            if (((3 ^ 2) == 9) and bbp.Callback) then
              task.spawn(bbp.Callback, bca.Value)
            end
          else
            bbs = bcr
            bcb()
            bbl()
            if (((7 * 7) == 49) and bbp.Callback) then
              task.spawn(bbp.Callback, bbs)
            end
          end
        end)
      end
      bbk = {owner = bca, wrap = bcm, scale = bcn, catcher = bcl, onClose = function()
        aok:Create(bbz, TweenInfo.new(0.16), {Rotation = 0}):Play()
      end}
      aok:Create(bbz, TweenInfo.new(0.16), {Rotation = 180}):Play()
      aok:Create(bcn, TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end)
    bca.Set = function(bcy, bcz, bda)
      if (((1 + 1) == 2) and bbq) then
        bbs = {}
        for bdb, bdc in ipairs((((type(bcz) == g({46, 59, 56, 54, 63}, 90)) and bcz) or {})) do
          bbs[bdc] = true
        end
      else
        bbs = bcz
      end
      bcb()
      if (((15 * 15) == 225) and ((bda ~= false) and bbp.Callback)) then
        task.spawn(bbp.Callback, ((bbq and bca.Value) or bbs))
      end
    end
    azs(bca, bbv)
    local bdd = bca.Destroy
    bca.Destroy = function()
      if (((100 % 7) == 2) and (bbk and (bbk.owner == bca))) then
        bbl()
      end
      if (((12 * 12) == 144) and bdd) then
        bdd()
      end
    end
    table.insert(aoo.Registry, {type = g({62, 40, 53, 42, 62, 53, 45, 52}, 90), multi = bbq, default = bbp.Value, set = function(bde)
      bca:Set(bde, true)
    end})
    return bca
  end
  local bdf = {}
  arg(function(bdg)
    for bdh = 1, #bdf do
      local bdi = bdf[bdh]
      if (((3 ^ 2) == 9) and (bdi.tab == ayf)) then
        bdi.grad.Offset = Vector2.new(((((((bdg * 0.42) + bdi.phase)) % 1.7)) - 0.35), 0)
      end
    end
  end)
  local bdj = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.42, 1), NumberSequenceKeypoint.new(0.5, 0.84), NumberSequenceKeypoint.new(0.58, 1), NumberSequenceKeypoint.new(1, 1)})
  function aye:Button(bdk)
    bdk = (bdk or {})
    local bdl = azc(self, ((bdk.Desc and 54) or 44))
    bdl.BackgroundColor3 = aop.Accent
    aoo.markAccent(bdl, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
    aoo.markAccent(aqi(bdl, aop.Accent, aop.Accent2, 25), g({61, 40, 59, 62}, 90))
    local bdm, bdn = azi(bdl, bdk, 46)
    bdm.TextColor3 = Color3.fromRGB(255, 255, 255)
    if (((7 * 7) == 49) and bdn) then
      bdn.TextColor3 = Color3.fromRGB(226, 226, 244)
    end
    local bdo = aor(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0, ZIndex = 7, Parent = bdl})
    aos(11, bdo)
    local bdp = aor(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Transparency = bdj, Rotation = 18, Parent = bdo})
    table.insert(bdf, {grad = bdp, tab = self._tab, phase = (math.random() * 1.7)})
    local bdq = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -16, 0.5, 0), Size = UDim2.fromOffset(18, 18), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 15, TextColor3 = Color3.fromRGB(255, 255, 255), Text = g({184, 218, 224}, 90), ZIndex = 8, Parent = bdl})
    local bdr = aor(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 1, Parent = bdl})
    aoq(bdl.MouseEnter, function()
      aok:Create(bdq, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(1, -11, 0.5, 0)}):Play()
    end)
    aoq(bdl.MouseLeave, function()
      aok:Create(bdq, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(1, -16, 0.5, 0)}):Play()
    end)
    aoq(bdl.MouseButton1Down, function()
      aok:Create(bdr, TweenInfo.new(0.1), {Scale = 0.975}):Play()
    end)
    aoq(bdl.MouseButton1Up, function()
      aok:Create(bdr, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end)
    arp(bdl, true)
    local bds = {}
    azs(bds, bdl)
    aoq(bdl.Activated, function()
      if (((1 + 1) == 2) and bdk.Callback) then
        task.spawn(bdk.Callback)
      end
    end)
    return bds
  end
  local bdt, bdu = nil, nil
  aoq(aoy.InputChanged, function(bdv)
    if (((15 * 15) == 225) and (bdt and (((bdv.UserInputType == Enum.UserInputType.MouseMovement) or (bdv.UserInputType == Enum.UserInputType.Touch))))) then
      bdt(bdv.Position.X)
    end
  end)
  aoq(aoy.InputEnded, function(bdw)
    if (((100 % 7) == 2) and (bdt and (((bdw.UserInputType == Enum.UserInputType.MouseButton1) or (bdw.UserInputType == Enum.UserInputType.Touch))))) then
      bdt = nil
      if (((12 * 12) == 144) and bdu) then
        pcall(bdu)
        bdu = nil
      end
    end
  end)
  function aye:Slider(bdx)
    bdx = (bdx or {})
    local bdy = (bdx.Value or {})
    local bdz = (tonumber(bdy.Min) or 0)
    local bea = (tonumber(bdy.Max) or 100)
    local beb = (tonumber(bdx.Step) or 1)
    if (((3 ^ 2) == 9) and (beb <= 0)) then
      beb = 1
    end
    local bec = ((bdx.Desc ~= nil) and (tostring(bdx.Desc) ~= ""))
    local bed = azc(self, ((bec and 78) or 60))
    local bee = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Name = g({14, 51, 46, 54, 63, 22, 59, 56, 63, 54}, 90), Position = UDim2.new(0, 14, 0, 10), Size = UDim2.new(1, -100, 0, 16), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12.5, TextColor3 = aop.Text, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring((bdx.Title or "")), ZIndex = 6, Parent = bed})
    if (((7 * 7) == 49) and bec) then
      aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Name = g({30, 63, 41, 57, 22, 59, 56, 63, 54}, 90), Position = UDim2.new(0, 14, 0, 27), Size = UDim2.new(1, -100, 0, 22), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 11, TextColor3 = aop.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true, Text = tostring(bdx.Desc), ZIndex = 6, Parent = bed})
    end
    local bef = aor(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -14, 0, 8), Size = UDim2.fromOffset(62, 20), BackgroundColor3 = aop.Accent, BackgroundTransparency = 0.78, BorderSizePixel = 0, ZIndex = 6, Parent = bed})
    aos(7, bef)
    aoo.markAccent(bef, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
    aoo.markAccent(aot(aop.Accent, 0.6, 1, bef), g({25, 53, 54, 53, 40}, 90))
    local beg = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = aop.Text, Text = g({106}, 90), ZIndex = 7, Parent = bef})
    local beh = aor(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 14, 1, -18), Size = UDim2.new(1, -28, 0, 6), BackgroundColor3 = aop.Element, BorderSizePixel = 0, ZIndex = 6, Parent = bed})
    aos(999, beh)
    local bei = aor(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromScale(0, 1), BackgroundColor3 = aop.Accent, BorderSizePixel = 0, ZIndex = 7, Parent = beh})
    aos(999, bei)
    aoo.markAccent(bei, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
    aoo.markAccent(aqi(bei, aop.Accent, aop.Accent2, 0), g({61, 40, 59, 62}, 90))
    local bej = aor(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.fromOffset(14, 14), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0, ZIndex = 8, Parent = beh})
    aos(999, bej)
    aoo.markAccent(aot(aop.Accent, 0.25, 2, bej), g({25, 53, 54, 53, 40}, 90))
    local bek = {Value = (tonumber(bdy.Default) or bdz)}
    local function bel(bem)
      if (((1 + 1) == 2) and (beb < 1)) then
        return string.format(g({127, 116, 104, 60}, 90), bem)
      end
      return tostring(math.floor((bem + 0.5)))
    end
    local function ben(beo, bep, beq)
      local ber = math.clamp((tonumber(beo) or bdz), bdz, bea)
      ber = (bdz + (math.floor(((((ber - bdz)) / beb) + 0.5)) * beb))
      ber = math.clamp(ber, bdz, bea)
      bek.Value = ber
      local bes = ((((bea > bdz)) and (((ber - bdz)) / ((bea - bdz)))) or 0)
      beg.Text = bel(ber)
      if (((15 * 15) == 225) and beq) then
        bei.Size = UDim2.fromScale(bes, 1)
        bej.Position = UDim2.new(bes, 0, 0.5, 0)
      else
        local bet = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        aok:Create(bei, bet, {Size = UDim2.fromScale(bes, 1)}):Play()
        aok:Create(bej, bet, {Position = UDim2.new(bes, 0, 0.5, 0)}):Play()
      end
      if (((100 % 7) == 2) and (bep and bdx.Callback)) then
        task.spawn(bdx.Callback, ber)
      end
    end
    ben(bek.Value, false, true)
    local function beu(bev)
      local bew = beh.AbsoluteSize.X
      if (((12 * 12) == 144) and (bew <= 0)) then
        return
      end
      local bex = math.clamp((((bev - beh.AbsolutePosition.X)) / bew), 0, 1)
      ben((bdz + (bex * ((bea - bdz)))), true, true)
    end
    local function bey(bez)
      if (((3 ^ 2) == 9) and ((bez.UserInputType ~= Enum.UserInputType.MouseButton1) and (bez.UserInputType ~= Enum.UserInputType.Touch))) then
        return
      end
      bdt = beu
      aok:Create(bej, TweenInfo.new(0.12), {Size = UDim2.fromOffset(18, 18)}):Play()
      aok:Create(beh, TweenInfo.new(0.12), {Size = UDim2.new(1, -28, 0, 8)}):Play()
      bdu = function()
        aok:Create(bej, TweenInfo.new(0.16), {Size = UDim2.fromOffset(14, 14)}):Play()
        aok:Create(beh, TweenInfo.new(0.16), {Size = UDim2.new(1, -28, 0, 6)}):Play()
      end
      beu(bez.Position.X)
    end
    aoq(beh.InputBegan, bey)
    aoq(bej.InputBegan, bey)
    aoq(bed.InputBegan, function(bfa)
      if (((7 * 7) == 49) and (bfa.UserInputType ~= Enum.UserInputType.MouseButton1)) then
        return
      end
      local bfb = (bfa.Position.Y - bed.AbsolutePosition.Y)
      if (((1 + 1) == 2) and (bfb >= (bed.AbsoluteSize.Y - 26))) then
        bey(bfa)
      end
    end)
    bek.Set = function(bfc, bfd, bfe)
      ben(bfd, (bfe ~= false), false)
    end
    azs(bek, bed)
    bek.SetTitle = function(bff, bfg)
      bee.Text = tostring(bfg)
    end
    table.insert(aoo.Registry, {type = g({41, 54, 51, 62, 63, 40}, 90), default = (tonumber(bdy.Default) or bdz), set = function(bfh)
      ben((tonumber(bfh) or bdz), true, false)
    end})
    return bek
  end
  function aye:Input(bfi)
    bfi = (bfi or {})
    local bfj = azc(self, ((bfi.Desc and ayx) or ayw))
    azi(bfj, bfi, 184)
    local bfk = aor(g({14, 63, 34, 46, 24, 53, 34}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0), Size = UDim2.fromOffset(170, 30), BackgroundColor3 = aop.Element, BackgroundTransparency = 0.15, BorderSizePixel = 0, Font = Enum.Font.Gotham, TextSize = 11.5, TextColor3 = aop.Text, PlaceholderColor3 = Color3.fromRGB(112, 112, 142), PlaceholderText = tostring((bfi.Placeholder or "")), Text = "", ClearTextOnFocus = false, TextTruncate = Enum.TextTruncate.AtEnd, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8, Parent = bfj})
    aos(9, bfk)
    aqc(bfk, 0, 10, 0, 10)
    local bfl = aot(aop.Stroke, 0.4, 1, bfk)
    local bfm = {Text = "", Value = ""}
    aoq(bfk.Focused, function()
      aok:Create(bfk, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
      aok:Create(bfl, TweenInfo.new(0.15), {Color = aop.Accent, Transparency = 0.1}):Play()
    end)
    aoq(bfk.FocusLost, function(bfn)
      aok:Create(bfk, TweenInfo.new(0.15), {BackgroundTransparency = 0.15}):Play()
      aok:Create(bfl, TweenInfo.new(0.15), {Color = aop.Stroke, Transparency = 0.4}):Play()
      bfm.Text, bfm.Value = bfk.Text, bfk.Text
      if (((15 * 15) == 225) and (bfn and bfi.Callback)) then
        task.spawn(bfi.Callback, bfk.Text)
      end
    end)
    aoq(bfk:GetPropertyChangedSignal(g({14, 63, 34, 46}, 90)), function()
      bfm.Text, bfm.Value = bfk.Text, bfk.Text
    end)
    azs(bfm, bfj)
    bfm.SetText = function(bfo, bfp)
      bfk.Text = tostring((bfp or ""))
      bfm.Text, bfm.Value = bfk.Text, bfk.Text
    end
    return bfm
  end
  aoq(aoy.InputBegan, function(bfq, bfr)
    if (((100 % 7) == 2) and bfr) then
      return
    end
    if (((12 * 12) == 144) and (bfq.UserInputType ~= Enum.UserInputType.Keyboard)) then
      return
    end
    local bfs = bfq.KeyCode
    if (((3 ^ 2) == 9) and n.RebindWaiting) then
      n.RebindWaiting = false
      if (((7 * 7) == 49) and (bfs ~= Enum.KeyCode.Escape)) then
        l.HotkeyName = bfs.Name
        aoo.Notify({Title = g({25, 53, 42, 63, 122, 18, 47, 56}, 90), Content = (g({18, 53, 46, 49, 63, 35, 122, 41, 63, 46, 122, 46, 53, 122}, 90) .. (bfs.Name .. g({122, 114, 17, 122, 59, 54, 41, 53, 122, 45, 53, 40, 49, 41, 115}, 90))), Icon = g({57, 50, 63, 57, 49}, 90), Duration = 2.5})
        k.SaveSettings(true)
      else
        aoo.Notify({Title = g({25, 53, 42, 63, 122, 18, 47, 56}, 90), Content = g({8, 63, 56, 51, 52, 62, 122, 57, 59, 52, 57, 63, 54, 54, 63, 62}, 90), Icon = g({51, 52, 60, 53}, 90), Duration = 2})
      end
      if (((1 + 1) == 2) and k._refreshHotkeyLabel) then
        k._refreshHotkeyLabel()
      end
      return
    end
    if (((15 * 15) == 225) and (bfs == Enum.KeyCode.F8)) then
      if (((100 % 7) == 2) and k._bgPanic) then
        pcall(k._bgPanic)
      end
      return
    end
    if (((12 * 12) == 144) and ((bfs == Enum.KeyCode.K) or (bfs.Name == tostring(l.HotkeyName)))) then
      aou(not n.UIVisible)
    end
  end)
  function aow:Destroy()
    for bft, bfu in ipairs(aoo.Conns) do
      pcall(function()
        bfu:Disconnect()
      end)
    end
    table.clear(aoo.Conns)
    table.clear(arf.jobs)
    pcall(function()
      if (((3 ^ 2) == 9) and awl) then
        awl:Destroy()
      end
    end)
    awl = nil
    pcall(function()
      arw:Destroy()
    end)
    k.ScreenGui = nil
  end
end
local bfv = aow:Tab({Title = g({28, 59, 40, 55}, 90), Icon = g({170, 197, 214, 228}, 90)})
local bfw = aow:Tab({Title = g({31, 61, 61, 41}, 90), Icon = g({170, 197, 255, 192}, 90)})
local bfx = aow:Tab({Title = g({19, 52, 62, 63, 34}, 90), Icon = g({170, 197, 201, 204}, 90)})
local bfy = aow:Tab({Title = g({12, 59, 40, 51, 59, 52, 46, 41}, 90), Icon = g({170, 197, 206, 244}, 90)})
local bfz = aow:Tab({Title = g({29, 51, 60, 46, 41}, 90), Icon = g({170, 197, 212, 219}, 90)})
local bga = aow:Tab({Title = g({25, 53, 54, 54, 63, 57, 46}, 90), Icon = g({170, 197, 253, 232}, 90)})
local bgb = aow:Tab({Title = g({30, 63, 54, 63, 46, 63}, 90), Icon = g({170, 197, 205, 203, 181, 226, 213}, 90)})
local bgc = aow:Tab({Title = g({24, 53, 53, 41, 46, 41}, 90), Icon = g({184, 192, 251}, 90)})
local bgd = aow:Tab({Title = g({31, 52, 57, 50, 59, 52, 46}, 90), Icon = g({184, 198, 242}, 90)})
local bge = aow:Tab({Title = g({27, 54, 63, 40, 46, 41}, 90), Icon = g({170, 197, 206, 206}, 90)})
local bgf = aow:Tab({Title = g({9, 46, 59, 46, 41}, 90), Icon = g({170, 197, 201, 208}, 90)})
local bgg = aow:Tab({Title = g({10, 63, 40, 60, 53, 40, 55, 59, 52, 57, 63}, 90), Icon = g({170, 197, 192, 218}, 90)})
local bgh = aow:Tab({Title = g({9, 63, 46, 46, 51, 52, 61, 41}, 90), Icon = g({184, 192, 195, 181, 226, 213}, 90)})
k._destroyUI = function()
  if (((7 * 7) == 49) and k._destroyWidget) then
    pcall(k._destroyWidget)
  end
  pcall(function()
    aow:Destroy()
  end)
end
aov(aox[1])
task.delay(0.4, function()
  pcall(function()
    k.SaveSettings(true)
  end)
end)
bfv:Section(g({24, 40, 63, 59, 49, 59, 56, 54, 63, 41}, 90))
bfv:Toggle({Title = g({27, 47, 46, 53, 122, 28, 59, 40, 55, 122, 24, 40, 63, 59, 49, 59, 56, 54, 63, 41}, 90), Desc = g({9, 42, 54, 51, 46, 41, 122, 42, 63, 46, 41, 122, 59, 57, 40, 53, 41, 41, 122, 41, 63, 44, 63, 40, 59, 54, 122, 56, 40, 63, 59, 49, 59, 56, 54, 63, 41, 122, 59, 52, 62, 122, 59, 46, 46, 59, 57, 49, 41, 122, 46, 50, 63, 55, 122, 59, 54, 54, 122, 59, 46, 122, 53, 52, 57, 63}, 90), Value = false, Callback = function(bgi)
  l.AutoFarm = bgi
end})
bfv:Slider({Title = g({10, 59, 40, 59, 54, 54, 63, 54, 122, 14, 59, 40, 61, 63, 46, 41}, 90), Desc = g({18, 53, 45, 122, 55, 59, 52, 35, 122, 56, 40, 63, 59, 49, 59, 56, 54, 63, 41, 122, 46, 53, 122, 60, 59, 40, 55, 122, 59, 46, 122, 46, 50, 63, 122, 41, 59, 55, 63, 122, 46, 51, 55, 63}, 90), Value = {Min = 1, Max = 10, Default = (tonumber(l.MultiTargets) or 3)}, Step = 1, Callback = function(bgj)
  l.MultiTargets = bgj
end})
bfv:Toggle({Title = g({28, 59, 40, 55, 122, 13, 50, 53, 54, 63, 122, 27, 40, 63, 59, 122, 27, 46, 122, 21, 52, 57, 63}, 90), Desc = g({19, 61, 52, 53, 40, 63, 41, 122, 10, 59, 40, 59, 54, 54, 63, 54, 122, 14, 59, 40, 61, 63, 46, 41, 122, 113, 122, 62, 51, 41, 46, 59, 52, 57, 63, 122, 184, 218, 206, 122, 42, 47, 46, 41, 122, 59, 122, 42, 63, 46, 122, 53, 52, 122, 31, 12, 31, 8, 3, 122, 56, 40, 63, 59, 49, 59, 56, 54, 63, 122, 51, 52, 122, 46, 50, 63, 122, 59, 40, 63, 59, 122, 41, 51, 55, 47, 54, 46, 59, 52, 63, 53, 47, 41, 54, 35}, 90), Value = (l.FarmAllArea == true), Callback = function(bgk)
  l.FarmAllArea = bgk
end})
bfv:Slider({Title = g({28, 51, 40, 63, 122, 30, 63, 54, 59, 35}, 90), Desc = g({9, 63, 57, 53, 52, 62, 41, 122, 56, 63, 46, 45, 63, 63, 52, 122, 28, 59, 40, 55, 122, 25, 53, 51, 52, 122, 59, 46, 46, 59, 57, 49, 41}, 90), Value = {Min = 0.01, Max = 0.5, Default = 0.05}, Step = 0.01, Callback = function(bgl)
  l.FireDelay = bgl
end})
bfv:Slider({Title = g({23, 59, 34, 122, 28, 51, 40, 63, 41, 117, 9, 63, 57, 122, 114, 17, 51, 57, 49, 122, 9, 59, 60, 63, 46, 35, 115}, 90), Desc = g({18, 59, 40, 62, 122, 57, 59, 42, 122, 53, 52, 122, 46, 53, 46, 59, 54, 122, 28, 59, 40, 55, 122, 25, 53, 51, 52, 122, 40, 59, 46, 63, 116, 122, 27, 56, 53, 44, 63, 122, 36, 107, 106, 106, 117, 41, 122, 46, 50, 51, 41, 122, 59, 57, 57, 53, 47, 52, 46, 122, 61, 63, 46, 41, 122, 62, 51, 41, 57, 53, 52, 52, 63, 57, 46, 63, 62, 122, 184, 218, 206, 122, 40, 59, 51, 41, 63, 122, 59, 46, 122, 35, 53, 47, 40, 122, 53, 45, 52, 122, 40, 51, 41, 49, 116}, 90), Value = {Min = 30, Max = 150, Default = (tonumber(l.SafeFireRate) or 100)}, Step = 10, Callback = function(bgm)
  l.SafeFireRate = bgm
end})
bfv:Slider({Title = g({23, 59, 34, 122, 30, 51, 41, 46, 59, 52, 57, 63}, 90), Desc = g({25, 59, 42, 41, 122, 57, 53, 51, 52, 122, 46, 59, 40, 61, 63, 46, 51, 52, 61, 122, 113, 122, 62, 40, 53, 42, 122, 57, 53, 54, 54, 63, 57, 46, 51, 53, 52, 118, 122, 106, 122, 103, 122, 47, 52, 54, 51, 55, 51, 46, 63, 62}, 90), Value = {Min = 0, Max = 5000, Default = 0}, Step = 50, Callback = function(bgn)
  l.MaxDistance = bgn
end})
bfv:Toggle({Title = g({22, 63, 59, 44, 63, 122, 25, 53, 51, 52, 122, 21, 52, 122, 24, 40, 63, 59, 49}, 90), Value = true, Callback = function(bgo)
  l.LeaveOnBreak = bgo
end})
bfv:Toggle({Title = g({21, 52, 54, 35, 122, 24, 40, 63, 59, 49, 122, 9, 46, 40, 53, 52, 61, 63, 41, 46, 122, 24, 40, 63, 59, 49, 59, 56, 54, 63, 41}, 90), Desc = g({19, 61, 52, 53, 40, 63, 41, 122, 46, 50, 63, 122, 45, 63, 59, 49, 122, 57, 53, 51, 52, 122, 46, 51, 63, 40, 41, 122, 51, 52, 122, 59, 52, 122, 59, 40, 63, 59, 122, 59, 52, 62, 122, 53, 52, 54, 35, 122, 59, 46, 46, 59, 57, 49, 41, 122, 57, 53, 51, 52, 41, 122, 59, 46, 122, 46, 50, 63, 122, 46, 53, 42, 122, 50, 63, 59, 54, 46, 50, 122, 46, 51, 63, 40}, 90), Value = (l.StrongestOnly ~= false), Callback = function(bgp)
  l.StrongestOnly = bgp
end})
bfv:Section(g({27, 40, 63, 59, 122, 124, 122, 13, 53, 40, 54, 62}, 90))
local bgq = bfv:Slot()
local bgr = bfv:Slot()
bfv:Section(g({10, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52}, 90))
local bgs, bgt, bgu
bgs = bfv:Toggle({Title = g({27, 47, 46, 53, 122, 24, 63, 41, 46, 122, 27, 40, 63, 59}, 90), Desc = g({17, 63, 63, 42, 41, 122, 60, 59, 40, 55, 51, 52, 61, 122, 46, 50, 63, 122, 50, 51, 61, 50, 63, 41, 46, 122, 59, 40, 63, 59, 122, 35, 53, 47, 122, 53, 45, 52, 122, 51, 52, 122, 46, 50, 63, 122, 57, 47, 40, 40, 63, 52, 46, 122, 45, 53, 40, 54, 62}, 90), Value = (l.AutoBestArea == true), Callback = function(bgv)
  l.AutoBestArea = bgv
  if (((1 + 1) == 2) and bgv) then
    l.AutoWorldProgress, l.AutoCompleteGame = false, false
    bgt:Set(false, false, true)
    bgu:Set(false, false, true)
  end
end})
bgt = bfv:Toggle({Title = g({13, 53, 40, 54, 62, 122, 10, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52}, 90), Desc = g({28, 59, 40, 55, 41, 122, 47, 52, 46, 51, 54, 122, 63, 44, 63, 40, 35, 122, 59, 40, 63, 59, 122, 53, 60, 122, 46, 50, 63, 122, 45, 53, 40, 54, 62, 122, 51, 41, 122, 53, 45, 52, 63, 62, 122, 114, 56, 47, 35, 41, 122, 61, 59, 46, 63, 41, 115, 118, 122, 46, 50, 63, 52, 122, 55, 53, 44, 63, 41, 122, 46, 53, 122, 46, 50, 63, 122, 52, 63, 34, 46, 122, 45, 53, 40, 54, 62}, 90), Value = (l.AutoWorldProgress == true), Callback = function(bgw)
  l.AutoWorldProgress = bgw
  if (((15 * 15) == 225) and bgw) then
    l.AutoBestArea, l.AutoCompleteGame = false, false
    bgs:Set(false, false, true)
    bgu:Set(false, false, true)
    if (((100 % 7) == 2) and not l.AutoFarm) then
      l.AutoFarm = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52, 122, 63, 52, 59, 56, 54, 63, 62, 122, 27, 47, 46, 53, 122, 28, 59, 40, 55, 122, 60, 53, 40, 122, 35, 53, 47}, 90), g({51, 52, 60, 53}, 90))
    end
  end
end})
bgu = bfv:Toggle({Title = g({27, 47, 46, 53, 122, 25, 53, 55, 42, 54, 63, 46, 63, 122, 29, 59, 55, 63}, 90), Desc = g({28, 51, 34, 63, 62, 122, 40, 53, 47, 46, 63, 96, 122, 9, 42, 59, 45, 52, 122, 119, 100, 122, 28, 59, 52, 46, 59, 41, 35, 122, 119, 100, 122, 109, 116, 111, 24, 122, 28, 59, 52, 46, 59, 41, 35, 122, 25, 53, 51, 52, 41, 122, 119, 100, 122, 56, 59, 57, 49, 122, 46, 53, 122, 9, 42, 59, 45, 52, 122, 60, 53, 40, 122, 19, 57, 63, 122, 14, 63, 57, 50, 122, 119, 100, 122, 14, 63, 57, 50, 122, 119, 100, 122, 18, 59, 57, 49, 63, 40, 122, 10, 53, 40, 46, 59, 54, 122, 43, 47, 63, 41, 46, 41, 122, 119, 100, 122, 12, 53, 51, 62, 122, 119, 100, 122, 27, 34, 53, 54, 53, 46, 54, 122, 21, 57, 63, 59, 52, 122, 119, 100, 122, 10, 51, 34, 63, 54, 116, 122, 19, 61, 52, 53, 40, 63, 41, 122, 61, 59, 55, 63, 42, 59, 41, 41, 119, 53, 52, 54, 35, 122, 59, 40, 63, 59, 41, 122, 114, 12, 19, 10, 115, 116, 122, 28, 53, 40, 57, 63, 41, 122, 27, 47, 46, 53, 122, 28, 59, 40, 55, 122, 53, 52, 116, 122, 30, 51, 41, 59, 56, 54, 63, 41, 122, 51, 46, 41, 63, 54, 60, 122, 45, 50, 63, 52, 122, 62, 53, 52, 63, 116}, 90), Value = (l.AutoCompleteGame == true), Callback = function(bgx)
  l.AutoCompleteGame = bgx
  if (((12 * 12) == 144) and bgx) then
    l.AutoBestArea, l.AutoWorldProgress = false, false
    bgs:Set(false, false, true)
    bgt:Set(false, false, true)
    if (((3 ^ 2) == 9) and (l.ACGResumeFarm == nil)) then
      l.ACGResumeFarm = l.AutoFarm
    end
    if (((7 * 7) == 49) and not l.AutoFarm) then
      l.AutoFarm = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 47, 46, 53, 122, 25, 53, 55, 42, 54, 63, 46, 63, 122, 29, 59, 55, 63, 122, 63, 52, 59, 56, 54, 63, 62, 122, 27, 47, 46, 53, 122, 28, 59, 40, 55}, 90), g({40, 53, 57, 49, 63, 46}, 90))
    end
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 15, 14, 21, 122, 25, 21, 23, 10, 22, 31, 14, 31, 122, 29, 27, 23, 31, 96, 122, 41, 46, 59, 40, 46, 51, 52, 61, 122, 46, 50, 63, 122, 61, 40, 51, 52, 62, 123}, 90), g({46, 40, 53, 42, 50, 35}, 90))
  elseif (((1 + 1) == 2) and (l.ACGResumeFarm ~= nil)) then
    if (((15 * 15) == 225) and (l.ACGResumeFarm == false)) then
      l.AutoFarm = false
    end
    l.ACGResumeFarm = nil
  end
end})
bfv:Button({Title = g({13, 50, 59, 46, 122, 19, 41, 122, 19, 46, 122, 30, 53, 51, 52, 61, 101}, 90), Desc = g({9, 50, 53, 45, 41, 122, 46, 50, 63, 122, 42, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52, 122, 45, 53, 40, 49, 63, 40, 125, 41, 122, 57, 47, 40, 40, 63, 52, 46, 122, 41, 46, 59, 46, 47, 41}, 90), Callback = function()
  local bgy = ((k._progState and k._progState.note) or "")
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({10, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52, 96, 122}, 90) .. ((((bgy ~= "") and bgy) or g({51, 62, 54, 63}, 90)))), g({61, 59, 47, 61, 63}, 90))
end})
bfw:Section(g({18, 59, 46, 57, 50, 51, 52, 61}, 90))
local bgz = bfw:Slot()
bfw:Toggle({Title = g({27, 47, 46, 53, 122, 21, 42, 63, 52, 122, 31, 61, 61, 41}, 90), Desc = g({18, 59, 46, 57, 50, 63, 41, 122, 60, 40, 53, 55, 122, 59, 52, 35, 45, 50, 63, 40, 63, 122, 44, 51, 59, 122, 46, 63, 54, 63, 42, 53, 40, 46, 119, 60, 54, 51, 57, 49, 63, 40}, 90), Value = false, Callback = function(bha)
  l.AutoEggs = bha
  if (((100 % 7) == 2) and not bha) then
    n.EggTpDone = nil
  end
end})
bfw:Dropdown({Title = g({18, 59, 46, 57, 50, 122, 27, 55, 53, 47, 52, 46}, 90), Desc = g({34, 98, 122, 52, 63, 63, 62, 41, 122, 46, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 24, 47, 35, 119, 98, 122, 47, 52, 54, 53, 57, 49, 97, 122, 45, 51, 46, 50, 53, 47, 46, 122, 51, 46, 122, 46, 50, 63, 122, 60, 59, 40, 55, 122, 60, 59, 54, 54, 41, 122, 56, 59, 57, 49, 122, 46, 53, 122, 34, 105, 116}, 90), Values = {g({34, 107}, 90), g({34, 105}, 90), g({34, 98}, 90)}, Value = g({34, 105}, 90), Callback = function(bhb)
  l.EggAmount = ((((bhb == g({34, 98}, 90))) and 8) or (((((bhb == g({34, 105}, 90))) and 3) or 1)))
  n.OctupleWarned = false
end})
bfw:Toggle({Title = g({9, 49, 51, 42, 122, 18, 59, 46, 57, 50, 122, 27, 52, 51, 55, 59, 46, 51, 53, 52}, 90), Desc = g({30, 51, 41, 59, 56, 54, 63, 41, 122, 46, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 57, 47, 46, 41, 57, 63, 52, 63, 122, 54, 51, 41, 46, 63, 52, 63, 40}, 90), Value = true, Callback = function(bhc)
  l.SkipAnim = bhc
end})
bfw:Slider({Title = g({18, 59, 46, 57, 50, 122, 30, 63, 54, 59, 35}, 90), Desc = g({9, 63, 40, 44, 63, 40, 122, 63, 52, 60, 53, 40, 57, 63, 41, 122, 36, 106, 116, 98, 41, 122, 55, 51, 52, 51, 55, 47, 55, 122, 56, 63, 46, 45, 63, 63, 52, 122, 56, 47, 35, 41}, 90), Value = {Min = 0.8, Max = 3, Default = 0.8}, Step = 0.05, Callback = function(bhd)
  l.HatchDelay = bhd
end})
k._deleteToggle = nil
bgb:Section(g({8, 47, 54, 63, 41}, 90))
local bhf = bgb:Toggle({Title = g({27, 47, 46, 53, 119, 30, 63, 54, 63, 46, 63, 122, 28, 51, 54, 46, 63, 40}, 90), Desc = g({30, 63, 54, 63, 46, 63, 41, 122, 50, 59, 46, 57, 50, 63, 62, 122, 42, 63, 46, 41, 122, 53, 60, 122, 46, 50, 63, 122, 42, 51, 57, 49, 63, 62, 122, 40, 59, 40, 51, 46, 51, 63, 41, 122, 44, 51, 59, 122, 46, 50, 63, 122, 50, 47, 56, 122, 184, 218, 206, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 59, 54, 45, 59, 35, 41, 122, 41, 59, 60, 63}, 90), Value = false, Callback = function(bhe)
  l.AutoDeleteFilter = bhe
end})
k._filterToggle = bhf
local bhh = bgb:Toggle({Title = g({27, 47, 46, 53, 119, 30, 63, 54, 63, 46, 63, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 41}, 90), Desc = g({30, 63, 54, 63, 46, 63, 41, 122, 50, 59, 46, 57, 50, 63, 62, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 119, 40, 59, 40, 51, 46, 35, 122, 42, 63, 46, 41, 122, 59, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 114, 63, 34, 57, 63, 42, 46, 122, 18, 47, 61, 63, 41, 117, 14, 51, 46, 59, 52, 51, 57, 41, 118, 122, 54, 53, 57, 49, 63, 62, 118, 122, 59, 52, 62, 122, 35, 53, 47, 40, 122, 49, 63, 42, 46, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 44, 59, 40, 51, 59, 52, 46, 41, 115, 122, 184, 218, 206, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 59, 54, 45, 59, 35, 41, 122, 41, 59, 60, 63}, 90), Value = (l.AutoDeleteExclusives == true), Callback = function(bhg)
  l.AutoDeleteExclusives = bhg
end})
k._exclDeleteToggle = bhh
local function bhi()
  task.spawn(function()
    local bhj = k.Library
    if (((12 * 12) == 144) and not bhj) then
      return
    end
    pcall(function()
      local bhk = bhj.Save.Get()
      if (((3 ^ 2) == 9) and (not bhk or not bhk.AutoDelete)) then
        return
      end
      for bhl, bhm in ipairs(am) do
        bhk.AutoDelete[bhm] = false
      end
      if (((7 * 7) == 49) and bhj.Variables) then
        bhj.Variables.AutoDeleteEnabled = false
      end
    end)
  end)
end
task.spawn(function()
  while (((1 + 1) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  if (((15 * 15) == 225) and (k.Gen == o)) then
    bhi()
  end
end)
bgb:Section(g({8, 59, 40, 51, 46, 51, 63, 41, 122, 14, 53, 122, 30, 63, 54, 63, 46, 63}, 90))
local bhn = {}
for bho, bhp in ipairs(am) do
  bhn[bhp] = bgb:Toggle({Title = bhp, Desc = g({27, 47, 46, 53, 119, 62, 63, 54, 63, 46, 63, 122, 50, 59, 46, 57, 50, 63, 62, 122, 42, 63, 46, 41, 122, 53, 60, 122, 46, 50, 51, 41, 122, 40, 59, 40, 51, 46, 35, 122, 114, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 41, 42, 59, 40, 63, 62, 115}, 90), Value = (l.DeleteRarities[bhp] == true), Callback = function(bhq)
    l.DeleteRarities[bhp] = (bhq or nil)
    bhi()
  end})
end
bgb:Section(g({17, 63, 63, 42, 122, 12, 59, 40, 51, 59, 52, 46, 41, 122, 114, 42, 63, 40, 122, 40, 59, 40, 51, 46, 35, 115}, 90))
for bhr, bhs in ipairs(am) do
  bgb:Dropdown({Title = bhs, Desc = (g({27, 55, 53, 52, 61, 122, 59, 40, 55, 63, 62, 122}, 90) .. (bhs .. g({122, 42, 63, 46, 41, 118, 122, 41, 42, 59, 40, 63, 122, 46, 50, 63, 41, 63, 122, 44, 59, 40, 51, 59, 52, 46, 41}, 90))), Values = {g({20, 53, 40, 55, 59, 54}, 90), g({29, 53, 54, 62, 63, 52}, 90), g({8, 59, 51, 52, 56, 53, 45}, 90), g({30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90), g({9, 50, 51, 52, 35}, 90)}, Multi = true, AllowNone = true, Value = {}, Callback = function(bht)
    local bhu = (((type(bht) == g({46, 59, 56, 54, 63}, 90)) and bht) or {bht})
    l.KeepVariants[bhs] = ((((#bhu > 0)) and bhu) or nil)
  end})
end
k._rarityToggles = bhn
k._runOnHubThread = function(bhv)
  task.spawn(bhv)
end
bgb:Section(g({10, 40, 53, 46, 63, 57, 46, 51, 53, 52, 41}, 90))
bgb:Toggle({Title = g({20, 63, 44, 63, 40, 122, 30, 63, 54, 63, 46, 63, 122, 18, 47, 61, 63, 41, 122, 124, 122, 14, 51, 46, 59, 52, 51, 57, 41}, 90), Desc = g({22, 53, 57, 49, 63, 62, 122, 42, 63, 46, 41, 122, 59, 52, 62, 122, 63, 61, 61, 122, 51, 46, 63, 55, 41, 122, 59, 40, 63, 122, 59, 54, 45, 59, 35, 41, 122, 41, 59, 60, 63, 122, 40, 63, 61, 59, 40, 62, 54, 63, 41, 41, 122, 53, 60, 122, 41, 63, 46, 46, 51, 52, 61, 41}, 90), Value = true, Callback = function(bhw)
  l.ProtectHugeTitanic = bhw
end})
bgb:Section(g({23, 59, 52, 47, 59, 54}, 90))
bgb:Button({Title = g({8, 47, 52, 122, 30, 63, 54, 63, 46, 63, 122, 9, 45, 63, 63, 42, 122, 20, 53, 45}, 90), Desc = g({21, 52, 63, 119, 46, 51, 55, 63, 122, 41, 45, 63, 63, 42, 122, 53, 60, 122, 35, 53, 47, 40, 122, 57, 47, 40, 40, 63, 52, 46, 122, 51, 52, 44, 63, 52, 46, 53, 40, 35}, 90), Icon = g({46, 40, 59, 41, 50, 119, 104}, 90), Callback = function()
  if (((100 % 7) == 2) and n.DeleteScanning) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 122, 62, 63, 54, 63, 46, 63, 122, 41, 45, 63, 63, 42, 122, 51, 41, 122, 59, 54, 40, 63, 59, 62, 35, 122, 40, 47, 52, 52, 51, 52, 61}, 90), g({57, 54, 53, 57, 49}, 90))
    return
  end
  task.spawn(function()
    n.DeleteScanning = true
    local bhx, bhy = k._sweepAutoDelete()
    n.DeleteScanning = false
    if (((12 * 12) == 144) and bhy) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({30, 63, 54, 63, 46, 63, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. bhy), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    elseif (((3 ^ 2) == 9) and (bhx > 0)) then
      m.Deleted += bhx
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({30, 63, 54, 63, 46, 63, 62, 122}, 90) .. (bhx .. (g({122, 42, 63, 46}, 90) .. ((((bhx == 1) and "") or g({41}, 90)))))), g({57, 50, 63, 57, 49}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({20, 53, 122, 62, 63, 54, 63, 46, 59, 56, 54, 63, 122, 42, 63, 46, 41, 122, 60, 53, 47, 52, 62}, 90), g({51, 52, 60, 53}, 90))
    end
  end)
end})
bga:Section(g({10, 51, 57, 49, 47, 42, 41}, 90))
bga:Toggle({Title = g({27, 47, 46, 53, 122, 25, 53, 54, 54, 63, 57, 46, 122, 21, 40, 56, 41}, 90), Desc = g({8, 63, 55, 53, 46, 63, 122, 57, 54, 59, 51, 55, 122, 51, 52, 122, 56, 59, 46, 57, 50, 63, 41, 122, 53, 60, 122, 111, 122, 114, 41, 63, 40, 44, 63, 40, 122, 54, 51, 55, 51, 46, 115}, 90), Value = false, Callback = function(bhz)
  l.AutoOrbs = bhz
end})
bga:Toggle({Title = g({27, 47, 46, 53, 122, 25, 53, 54, 54, 63, 57, 46, 122, 22, 53, 53, 46, 56, 59, 61, 41}, 90), Desc = g({8, 63, 55, 53, 46, 63, 122, 57, 53, 54, 54, 63, 57, 46, 51, 53, 52}, 90), Value = false, Callback = function(bia)
  l.AutoBags = bia
end})
bga:Section(g({23, 59, 61, 52, 63, 46}, 90))
bga:Toggle({Title = g({23, 59, 61, 52, 63, 46, 96, 122, 21, 40, 56, 41}, 90), Desc = g({10, 47, 54, 54, 41, 122, 31, 12, 31, 8, 3, 122, 53, 40, 56, 122, 53, 52, 122, 46, 50, 63, 122, 55, 59, 42, 122, 46, 53, 122, 35, 53, 47, 118, 122, 107, 106, 34, 122, 42, 63, 40, 122, 41, 63, 57, 53, 52, 62}, 90), Value = false, Callback = function(bib)
  l.MagnetOrbs = bib
end})
bga:Toggle({Title = g({23, 59, 61, 52, 63, 46, 96, 122, 22, 53, 53, 46, 56, 59, 61, 41}, 90), Desc = g({14, 63, 54, 63, 42, 53, 40, 46, 41, 122, 54, 53, 53, 46, 56, 59, 61, 41, 122, 46, 53, 122, 35, 53, 47, 40, 122, 60, 63, 63, 46}, 90), Value = false, Callback = function(bic)
  l.MagnetBags = bic
end})
bfz:Section(g({10, 54, 59, 35, 46, 51, 55, 63, 122, 8, 63, 45, 59, 40, 62, 41}, 90))
bfz:Toggle({Title = g({27, 47, 46, 53, 122, 25, 54, 59, 51, 55, 122, 10, 54, 59, 35, 46, 51, 55, 63, 122, 29, 51, 60, 46, 41}, 90), Desc = g({25, 54, 59, 51, 55, 41, 122, 63, 44, 63, 40, 35, 122, 60, 40, 63, 63, 122, 42, 54, 59, 35, 46, 51, 55, 63, 122, 61, 51, 60, 46, 122, 46, 50, 63, 122, 55, 53, 55, 63, 52, 46, 122, 51, 46, 41, 122, 46, 51, 55, 63, 40, 122, 51, 41, 122, 40, 63, 59, 62, 35, 116, 122, 14, 50, 63, 122, 45, 50, 53, 54, 63, 122, 107, 104, 119, 61, 51, 60, 46, 122, 41, 63, 46, 122, 40, 63, 119, 59, 40, 55, 41, 122, 53, 52, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 125, 41, 122, 40, 63, 41, 63, 46, 122, 57, 54, 53, 57, 49, 122, 114, 36, 111, 122, 50, 115, 118, 122, 45, 50, 51, 57, 50, 122, 46, 50, 63, 122, 46, 51, 54, 63, 41, 122, 56, 63, 54, 53, 45, 122, 57, 53, 47, 52, 46, 122, 62, 53, 45, 52, 122, 46, 53, 116}, 90), Value = (l.AutoGifts == true), Callback = function(bid)
  l.AutoGifts = bid
end})
local bie = bfz:StatGrid({{Key = g({25, 54, 59, 51, 55, 63, 62}, 90), Title = g({25, 54, 59, 51, 55, 63, 62, 122, 117, 122, 14, 53, 46, 59, 54}, 90)}, {Key = g({8, 63, 41, 63, 46}, 90), Title = g({9, 63, 46, 122, 8, 63, 41, 63, 46, 41, 122, 19, 52}, 90)}})
k._refreshPlayTiles = function()
  local bif = k.Library
  if (((7 * 7) == 49) and not bif) then
    return
  end
  local big, bih, bii = 0, 0, nil
  pcall(function()
    for bij in pairs((bif.Directory.FreeGifts or {})) do
      big += 1
    end
    local bik = bif.Save.Get()
    if (((1 + 1) == 2) and not bik) then
      return
    end
    local bil = bik.FreeGiftsRedeemed
    if (((15 * 15) == 225) and (type(bil) == g({46, 59, 56, 54, 63}, 90))) then
      bih = #bil
    end
    local bim = tonumber(bik.FreeGiftsResetTime)
    if (((100 % 7) == 2) and bim) then
      bii = (bim - os.time())
    end
  end)
  bie.Claimed(string.format(g({127, 62, 122, 117, 122, 127, 62}, 90), bih, big))
  if (((12 * 12) == 144) and not bii) then
    bie.Reset(g({184, 218, 206}, 90))
  elseif (((3 ^ 2) == 9) and (bii <= 0)) then
    bie.Reset(g({40, 63, 59, 62, 35}, 90))
  else
    bie.Reset(string.format(g({127, 62, 50, 122, 127, 106, 104, 62, 55}, 90), math.floor((bii / 3600)), math.floor(((bii % 3600) / 60))))
  end
end
local bin = {}
for bio, bip in ipairs(k.BOOSTS) do
  bin[bip.key] = bip
end
local biq, bir = {}, {}
for bis, bit in ipairs(k.BOOSTS) do
  local biu = string.format(g({127, 41, 122, 184, 218, 206, 122, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 114, 127, 41, 115}, 90), bit.key, as(bit.price), bit.duration)
  table.insert(biq, biu)
  bir[biu] = bit.key
end
local biv
bgc:Section(g({24, 47, 35, 122, 124, 122, 15, 41, 63}, 90))
local bix = bgc:Dropdown({Title = g({24, 53, 53, 41, 46}, 90), Values = biq, Value = biq[1], Callback = function(biw)
  l.BoostKey = (bir[biw] or k.BOOSTS[1].key)
  biv()
end})
local biz = bgc:Slider({Title = g({27, 55, 53, 47, 52, 46}, 90), Desc = g({18, 53, 45, 122, 55, 59, 52, 35, 122, 46, 53, 122, 56, 47, 35}, 90), Value = {Min = 1, Max = 100, Default = 1}, Step = 1, Callback = function(biy)
  l.BoostAmount = biy
  biv()
end})
local bjg = bgc:Button({Title = g({24, 47, 35}, 90), Desc = g({10, 47, 40, 57, 50, 59, 41, 63, 122, 45, 51, 46, 50, 122, 62, 51, 59, 55, 53, 52, 62, 41}, 90), Icon = g({41, 50, 53, 42, 42, 51, 52, 61, 119, 57, 59, 40, 46}, 90), Callback = function()
  if (((7 * 7) == 49) and n.BoostBusy) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 122, 56, 53, 53, 41, 46, 122, 42, 47, 40, 57, 50, 59, 41, 63, 122, 51, 41, 122, 59, 54, 40, 63, 59, 62, 35, 122, 40, 47, 52, 52, 51, 52, 61}, 90), g({57, 54, 53, 57, 49}, 90))
    return
  end
  local bja = (bin[l.BoostKey] or k.BOOSTS[1])
  local bjb = (l.BoostAmount or 1)
  n.BoostBusy = true
  task.spawn(function()
    pcall(function()
      BuyButton:SetTitle(string.format(g({24, 47, 35, 51, 52, 61, 122, 106, 117, 127, 62, 116, 116, 116}, 90), bjb))
    end)
    local bje, bjf = k._buyBoosts(bja.key, bjb, function(bjc, bjd)
      pcall(function()
        BuyButton:SetTitle(string.format(g({24, 47, 35, 51, 52, 61, 122, 127, 62, 117, 127, 62, 116, 116, 116}, 90), bjc, bjd))
      end)
    end)
    n.BoostBusy = false
    if (((1 + 1) == 2) and bjf) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({24, 53, 47, 61, 50, 46, 122, 127, 62, 117, 127, 62, 122, 34, 122, 127, 41, 122, 184, 218, 206, 122, 127, 41}, 90), bje, bjb, bja.key, bjf), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({24, 53, 47, 61, 50, 46, 122, 127, 62, 122, 34, 122, 127, 41, 122, 60, 53, 40, 122, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41}, 90), bje, bja.key, as((bje * bja.price))), g({57, 50, 63, 57, 49}, 90))
    end
    biv()
  end)
end})
local bji = bgc:Slider({Title = g({15, 41, 63, 122, 27, 55, 53, 47, 52, 46}, 90), Desc = g({18, 53, 45, 122, 55, 59, 52, 35, 122, 53, 45, 52, 63, 62, 122, 56, 53, 53, 41, 46, 41, 122, 46, 53, 122, 59, 57, 46, 51, 44, 59, 46, 63}, 90), Value = {Min = 1, Max = 100, Default = 1}, Step = 1, Callback = function(bjh)
  l.BoostUseAmount = bjh
  biv()
end})
local bjs = bgc:Button({Title = g({15, 41, 63, 122, 60, 40, 53, 55, 122, 19, 52, 44, 63, 52, 46, 53, 40, 35}, 90), Desc = g({27, 57, 46, 51, 44, 59, 46, 63, 122, 56, 53, 53, 41, 46, 41, 122, 35, 53, 47, 122, 59, 54, 40, 63, 59, 62, 35, 122, 53, 45, 52}, 90), Icon = g({42, 54, 59, 35}, 90), Callback = function()
  local bjj = (bin[l.BoostKey] or k.BOOSTS[1])
  local bjk = n.PendingData
  local bjl = (((bjk and bjk.BoostInv) and ((bjk.BoostInv[bjj.key] or 0))) or 0)
  local bjm = math.min((l.BoostUseAmount or 1), bjl)
  if (((15 * 15) == 225) and (bjm <= 0)) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({3, 53, 47, 122, 53, 45, 52, 122, 106, 122, 34, 122}, 90) .. bjj.key), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    return
  end
  task.spawn(function()
    pcall(function()
      UseButton:SetTitle(string.format(g({15, 41, 51, 52, 61, 122, 106, 117, 127, 62, 116, 116, 116}, 90), bjm))
    end)
    k._activateBoosts(bjj.key, bjm)
    pcall(function()
      UseButton:SetTitle(string.format(g({15, 41, 51, 52, 61, 122, 127, 62, 117, 127, 62, 116, 116, 116}, 90), bjm, bjm))
    end)
    local bjn = false
    local bjo = k.Library
    if (((100 % 7) == 2) and bjo) then
      for bjp = 1, 16 do
        task.wait(0.25)
        pcall(function()
          local bjq = bjo.Save.Get()
          local bjr = (tonumber(bjq.BoostsInventory[bjj.key]) or 0)
          if (((12 * 12) == 144) and (bjr <= (bjl - bjm))) then
            bjn = true
          end
        end)
        if (((3 ^ 2) == 9) and bjn) then
          break
        end
      end
    end
    if (((7 * 7) == 49) and bjn) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({27, 57, 46, 51, 44, 59, 46, 63, 62, 122, 127, 62, 122, 34, 122, 127, 41, 122, 114, 127, 41, 122, 63, 59, 57, 50, 115}, 90), bjm, bjj.key, bjj.duration), g({57, 50, 63, 57, 49}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 57, 46, 51, 44, 59, 46, 51, 53, 52, 122, 50, 59, 62, 122, 52, 53, 122, 63, 60, 60, 63, 57, 46, 122, 184, 218, 206, 122, 56, 53, 53, 41, 46, 41, 122, 57, 59, 52, 125, 46, 122, 56, 63, 122, 47, 41, 63, 62, 122, 51, 52, 122, 46, 50, 63, 122, 14, 40, 59, 62, 51, 52, 61, 122, 10, 54, 59, 32, 59}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    task.wait(0.5)
    biv()
  end)
end})
biv = function()
  local bjt = (bin[l.BoostKey] or k.BOOSTS[1])
  local bju = (l.BoostAmount or 1)
  local bjv = (bjt.price * bju)
  local bjw = n.PendingData
  pcall(function()
    biz:SetTitle(string.format(g({27, 55, 53, 47, 52, 46, 122, 184, 218, 206, 122, 9, 47, 56, 46, 53, 46, 59, 54, 96, 122, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41}, 90), as(bjv)))
    local bjx = (bjw and bjw.Diamonds)
    local bjy = ""
    if (((1 + 1) == 2) and bjx) then
      if (((15 * 15) == 225) and (bjx < bjv)) then
        bjy = string.format(g({122, 38, 122, 24, 59, 54, 59, 52, 57, 63, 96, 122, 127, 41, 122, 114, 41, 50, 53, 40, 46, 122, 127, 41, 123, 115}, 90), as(bjx), as((bjv - bjx)))
      else
        bjy = string.format(g({122, 38, 122, 24, 59, 54, 59, 52, 57, 63, 96, 122, 127, 41, 122, 119, 100, 122, 127, 41}, 90), as(bjx), as((bjx - bjv)))
      end
    end
    bjg:SetTitle(string.format(g({24, 47, 35, 122, 127, 62, 122, 34, 122, 127, 41, 122, 103, 122, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41, 127, 41}, 90), bju, bjt.key, as(bjv), bjy))
    local bjz = (((bjw and bjw.BoostInv) and ((bjw.BoostInv[bjt.key] or 0))) or 0)
    local bka = ((bjw and bjw.BoostsActive) and bjw.BoostsActive[bjt.key])
    bjs:SetTitle(string.format(g({15, 41, 63, 122, 127, 62, 122, 34, 122, 127, 41, 122, 114, 53, 45, 52, 63, 62, 96, 122, 127, 62, 115}, 90), (l.BoostUseAmount or 1), bjt.key, bjz))
    local bkb = ((bka and ((g({27, 57, 46, 51, 44, 63, 96, 122}, 90) .. aw(bka)))) or g({20, 53, 46, 122, 59, 57, 46, 51, 44, 63}, 90))
    if (((100 % 7) == 2) and (bjw and (bjw.World == g({14, 40, 59, 62, 51, 52, 61, 122, 10, 54, 59, 32, 59}, 90)))) then
      bkb = (bkb .. g({122, 38, 122, 14, 40, 59, 62, 51, 52, 61, 122, 10, 54, 59, 32, 59, 122, 56, 54, 53, 57, 49, 41, 122, 56, 53, 53, 41, 46, 122, 47, 41, 63}, 90))
    end
    bix:SetDesc(string.format(g({127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41, 118, 122, 54, 59, 41, 46, 41, 122, 127, 41, 122, 184, 218, 206, 122, 127, 41}, 90), as(bjt.price), bjt.duration, bkb))
  end)
end
biv()
function k._diamondPacks()
  local bkc = {}
  pcall(function()
    local bkd = game:GetService(g({8, 63, 42, 54, 51, 57, 59, 46, 63, 62, 9, 46, 53, 40, 59, 61, 63}, 90)):FindFirstChild(g({5, 5, 30, 19, 8, 31, 25, 14, 21, 8, 3}, 90))
    local bke = (bkd and bkd:FindFirstChild(g({9, 50, 53, 42, 25, 53, 52, 60, 51, 61}, 90)))
    if (((12 * 12) == 144) and not bke) then
      return
    end
    local bkf = require(bke)
    local bkg = (bkf and bkf.DiamondPacks)
    if (((3 ^ 2) == 9) and (type(bkg) ~= g({46, 59, 56, 54, 63}, 90))) then
      return
    end
    for bkh = 1, #bkg do
      local bki = bkg[bkh]
      if (((7 * 7) == 49) and ((((type(bki) == g({46, 59, 56, 54, 63}, 90)) and bki.Currency) and tonumber(bki.Cost)) and tonumber(bki.Diamonds))) then
        bkc[(#bkc + 1)] = {index = bkh, currency = tostring(bki.Currency), cost = tonumber(bki.Cost), diamonds = tonumber(bki.Diamonds)}
      end
    end
  end)
  return bkc
end
function k._dpLabel(bkj)
  return string.format(g({121, 127, 62, 122, 122, 127, 41, 122, 127, 41, 122, 122, 119, 100, 122, 122, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41}, 90), bkj.index, ao(bkj.cost), bkj.currency, ao(bkj.diamonds))
end
function k._dpFind(bkk)
  for bkl, bkm in ipairs(k._diamondPacks()) do
    if (((1 + 1) == 2) and (bkm.index == tonumber(bkk))) then
      return bkm
    end
  end
  return nil
end
function k._buyDiamondPack(bkn, bko)
  local bkp, bkq, bkr = pcall(function()
    return bkn.Network.Invoke(g({24, 47, 35, 122, 30, 51, 59, 55, 53, 52, 62, 10, 59, 57, 49}, 90), tonumber(bko))
  end)
  if (((15 * 15) == 225) and not bkp) then
    return false, tostring(bkq)
  end
  if (((100 % 7) == 2) and (bkq == true)) then
    return true, nil
  end
  return false, tostring((bkr or g({40, 63, 60, 47, 41, 63, 62}, 90)))
end
bgc:Section(g({30, 51, 59, 55, 53, 52, 62, 122, 10, 59, 57, 49, 41, 122, 114, 60, 40, 63, 63, 118, 122, 52, 53, 122, 8, 53, 56, 47, 34, 115}, 90))
local bks, bkt, bku = {}, {}, nil
for bkv, bkw in ipairs(k._diamondPacks()) do
  local bkx = k._dpLabel(bkw)
  bks[(#bks + 1)] = bkx
  bkt[bkx] = bkw
  if (((12 * 12) == 144) and (bkw.index == tonumber(l.DiamondPackIndex))) then
    bku = bkx
  end
end
if (((3 ^ 2) == 9) and (#bks == 0)) then
  bks = {g({114, 41, 50, 53, 42, 122, 57, 53, 52, 60, 51, 61, 122, 52, 53, 46, 122, 54, 53, 59, 62, 63, 62, 115}, 90)}
elseif (((7 * 7) == 49) and not bku) then
  bku = bks[#bks]
  l.DiamondPackIndex = ((bkt[bku] and bkt[bku].index) or nil)
end
local bky, bkz
bky = bgc:Dropdown({Title = g({10, 59, 57, 49, 122, 14, 53, 122, 24, 47, 35}, 90), Desc = g({10, 59, 51, 62, 122, 51, 52, 122, 60, 59, 40, 55, 59, 56, 54, 63, 122, 57, 47, 40, 40, 63, 52, 57, 35, 118, 122, 52, 53, 46, 122, 8, 53, 56, 47, 34, 116, 122, 10, 51, 57, 49, 122, 45, 50, 51, 57, 50, 122, 53, 52, 63, 122, 63, 44, 63, 40, 35, 122, 56, 47, 35, 122, 56, 63, 54, 53, 45, 122, 47, 41, 63, 41, 116}, 90), Values = bks, Value = (bku or bks[1]), Callback = function(bla)
  local blb = bkt[bla]
  l.DiamondPackIndex = ((blb and blb.index) or nil)
  n.DPBase = nil
end})
bgc:Button({Title = g({24, 47, 35, 122, 21, 52, 63, 122, 10, 59, 57, 49, 122, 20, 53, 45}, 90), Desc = g({9, 51, 52, 61, 54, 63, 122, 42, 47, 40, 57, 50, 59, 41, 63, 122, 53, 60, 122, 46, 50, 63, 122, 42, 59, 57, 49, 122, 59, 56, 53, 44, 63, 118, 122, 51, 61, 52, 53, 40, 51, 52, 61, 122, 46, 50, 63, 122, 51, 52, 46, 63, 40, 44, 59, 54, 122, 59, 52, 62, 122, 46, 50, 63, 122, 57, 59, 42, 116, 122, 9, 46, 51, 54, 54, 122, 40, 63, 41, 42, 63, 57, 46, 41, 122, 52, 53, 46, 50, 51, 52, 61, 122, 56, 47, 46, 122, 35, 53, 47, 40, 122, 56, 59, 54, 59, 52, 57, 63, 122, 184, 218, 206, 122, 47, 41, 63, 122, 46, 50, 51, 41, 122, 46, 53, 122, 41, 59, 52, 51, 46, 35, 119, 57, 50, 63, 57, 49, 122, 46, 50, 63, 122, 42, 40, 51, 57, 63, 122, 56, 63, 60, 53, 40, 63, 122, 59, 40, 55, 51, 52, 61, 122, 59, 47, 46, 53, 119, 56, 47, 35, 116}, 90), Callback = function()
  task.spawn(function()
    local blc = k.Library
    if (((1 + 1) == 2) and not blc) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    local bld = k._dpFind(l.DiamondPackIndex)
    if (((15 * 15) == 225) and not bld) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 51, 57, 49, 122, 59, 122, 62, 51, 59, 55, 53, 52, 62, 122, 42, 59, 57, 49, 122, 60, 51, 40, 41, 46}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    local ble, blf = k._buyDiamondPack(blc, bld.index)
    if (((100 % 7) == 2) and ble) then
      n.DPBought = (((n.DPBought or 0)) + 1)
      n.DPGained = (((n.DPGained or 0)) + bld.diamonds)
      n.DPNote = g({55, 59, 52, 47, 59, 54, 122, 56, 47, 35}, 90)
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({24, 53, 47, 61, 50, 46, 122, 42, 59, 57, 49, 122, 121, 127, 62, 96, 122, 113, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41}, 90), bld.index, ao(bld.diamonds)), g({61, 63, 55}, 90))
    else
      n.DPNote = tostring(blf)
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({10, 59, 57, 49, 122, 40, 63, 60, 47, 41, 63, 62, 96, 122}, 90) .. tostring(blf)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
  end)
end})
bkz = bgc:Toggle({Title = g({27, 47, 46, 53, 122, 24, 47, 35, 122, 30, 51, 59, 55, 53, 52, 62, 122, 10, 59, 57, 49, 41}, 90), Desc = g({17, 63, 63, 42, 41, 122, 56, 47, 35, 51, 52, 61, 122, 46, 50, 63, 122, 42, 59, 57, 49, 122, 59, 56, 53, 44, 63, 122, 53, 52, 122, 46, 50, 63, 122, 51, 52, 46, 63, 40, 44, 59, 54, 122, 56, 63, 54, 53, 45, 116, 122, 9, 45, 51, 46, 57, 50, 63, 41, 122, 51, 46, 41, 63, 54, 60, 122, 53, 60, 60, 122, 53, 52, 57, 63, 122, 46, 50, 63, 122, 42, 47, 40, 57, 50, 59, 41, 63, 122, 57, 59, 42, 122, 53, 40, 122, 46, 50, 63, 122, 62, 51, 59, 55, 53, 52, 62, 122, 46, 59, 40, 61, 63, 46, 122, 51, 41, 122, 55, 63, 46, 97, 122, 51, 60, 122, 35, 53, 47, 122, 41, 51, 55, 42, 54, 35, 122, 57, 59, 52, 52, 53, 46, 122, 59, 60, 60, 53, 40, 62, 122, 53, 52, 63, 122, 51, 46, 122, 51, 62, 54, 63, 41, 122, 59, 52, 62, 122, 45, 59, 51, 46, 41, 122, 60, 53, 40, 122, 35, 53, 47, 40, 122, 56, 59, 54, 59, 52, 57, 63, 122, 46, 53, 122, 60, 59, 40, 55, 122, 56, 59, 57, 49, 122, 47, 42, 116}, 90), Value = (l.AutoDiamondPacks == true), Callback = function(blg)
  l.AutoDiamondPacks = blg
  if (((12 * 12) == 144) and blg) then
    n.DPBase, n.DPBought, n.DPGained = nil, 0, 0
    n.DPNextAt, n.DPNote = 0, g({41, 46, 59, 40, 46, 51, 52, 61}, 90)
  end
end})
k._dpToggle = bkz
bgc:Slider({Title = g({9, 63, 57, 53, 52, 62, 41, 122, 24, 63, 46, 45, 63, 63, 52, 122, 24, 47, 35, 41}, 90), Desc = g({9, 42, 59, 57, 51, 52, 61, 122, 56, 63, 46, 45, 63, 63, 52, 122, 42, 47, 40, 57, 50, 59, 41, 63, 41, 116, 122, 22, 53, 45, 122, 44, 59, 54, 47, 63, 41, 122, 59, 40, 63, 122, 60, 51, 52, 63, 122, 184, 218, 206, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 122, 57, 50, 59, 40, 61, 63, 41, 122, 42, 63, 40, 122, 57, 59, 54, 54, 118, 122, 46, 50, 63, 40, 63, 122, 51, 41, 122, 52, 53, 122, 62, 51, 41, 57, 53, 47, 52, 46, 122, 60, 53, 40, 122, 50, 59, 55, 55, 63, 40, 51, 52, 61, 122, 51, 46, 116}, 90), Value = {Min = 1, Max = 60, Default = math.clamp((tonumber(l.DiamondPackInterval) or 5), 1, 60)}, Step = 1, Callback = function(blh)
  l.DiamondPackInterval = math.clamp(math.floor((tonumber(blh) or 5)), 1, 60)
end})
bgc:Slider({Title = g({23, 59, 34, 122, 24, 47, 35, 41, 122, 10, 63, 40, 122, 8, 47, 52}, 90), Desc = g({18, 59, 40, 62, 122, 41, 46, 53, 42, 122, 59, 60, 46, 63, 40, 122, 46, 50, 51, 41, 122, 55, 59, 52, 35, 122, 42, 47, 40, 57, 50, 59, 41, 63, 41, 118, 122, 57, 53, 47, 52, 46, 63, 62, 122, 60, 40, 53, 55, 122, 45, 50, 63, 52, 122, 35, 53, 47, 122, 41, 45, 51, 46, 57, 50, 63, 62, 122, 59, 47, 46, 53, 119, 56, 47, 35, 122, 53, 52, 116, 122, 9, 54, 51, 62, 63, 122, 46, 53, 122, 106, 122, 60, 53, 40, 122, 47, 52, 54, 51, 55, 51, 46, 63, 62, 122, 184, 218, 206, 122, 51, 46, 122, 46, 50, 63, 52, 122, 56, 47, 35, 41, 122, 60, 53, 40, 63, 44, 63, 40, 122, 59, 52, 62, 122, 53, 52, 54, 35, 122, 46, 50, 63, 122, 57, 47, 40, 40, 63, 52, 57, 35, 122, 60, 54, 53, 53, 40, 118, 122, 46, 50, 63, 122, 62, 51, 59, 55, 53, 52, 62, 122, 46, 59, 40, 61, 63, 46, 122, 53, 40, 122, 35, 53, 47, 40, 122, 53, 45, 52, 122, 56, 59, 54, 59, 52, 57, 63, 122, 57, 59, 52, 122, 41, 46, 53, 42, 122, 51, 46, 116}, 90), Value = {Min = 0, Max = 1000, Default = math.clamp((tonumber(l.DiamondPackCap) or 0), 0, 1000)}, Step = 1, Callback = function(bli)
  l.DiamondPackCap = math.clamp(math.floor((tonumber(bli) or 0)), 0, 1000)
end})
bgc:Slider({Title = g({17, 63, 63, 42, 122, 127, 122, 21, 60, 122, 25, 47, 40, 40, 63, 52, 57, 35}, 90), Desc = g({28, 54, 53, 53, 40, 122, 60, 53, 40, 122, 46, 50, 63, 122, 42, 59, 57, 49, 125, 41, 122, 53, 45, 52, 122, 57, 47, 40, 40, 63, 52, 57, 35, 118, 122, 59, 41, 122, 59, 122, 42, 63, 40, 57, 63, 52, 46, 59, 61, 63, 122, 53, 60, 122, 45, 50, 59, 46, 122, 35, 53, 47, 122, 50, 63, 54, 62, 122, 45, 50, 63, 52, 122, 59, 47, 46, 53, 119, 56, 47, 35, 122, 41, 46, 59, 40, 46, 63, 62, 116, 122, 27, 46, 122, 106, 122, 51, 46, 122, 41, 42, 63, 52, 62, 41, 122, 62, 53, 45, 52, 122, 46, 53, 122, 46, 50, 63, 122, 54, 59, 41, 46, 122, 57, 53, 51, 52, 97, 122, 59, 46, 122, 111, 106, 122, 51, 46, 122, 41, 46, 53, 42, 41, 122, 53, 52, 57, 63, 122, 50, 59, 54, 60, 122, 35, 53, 47, 40, 122, 41, 46, 59, 40, 46, 51, 52, 61, 122, 56, 59, 54, 59, 52, 57, 63, 122, 51, 41, 122, 61, 53, 52, 63, 116}, 90), Value = {Min = 0, Max = 90, Default = math.clamp((tonumber(l.DiamondPackReservePct) or 0), 0, 90)}, Step = 5, Callback = function(blj)
  l.DiamondPackReservePct = math.clamp(math.floor((tonumber(blj) or 0)), 0, 90)
end})
bgc:Slider({Title = g({9, 46, 53, 42, 122, 27, 46, 122, 30, 51, 59, 55, 53, 52, 62, 41}, 90), Desc = g({9, 46, 53, 42, 41, 122, 53, 52, 57, 63, 122, 35, 53, 47, 40, 122, 62, 51, 59, 55, 53, 52, 62, 122, 57, 53, 47, 52, 46, 122, 40, 63, 59, 57, 50, 63, 41, 122, 46, 50, 51, 41, 116, 122, 22, 63, 59, 44, 63, 122, 59, 46, 122, 106, 122, 60, 53, 40, 122, 52, 53, 122, 46, 59, 40, 61, 63, 46, 116}, 90), Value = {Min = 0, Max = 500000000, Default = math.max(0, math.floor((tonumber(l.DiamondPackTarget) or 0)))}, Step = 5000000, Callback = function(blk)
  l.DiamondPackTarget = math.max(0, math.floor((tonumber(blk) or 0)))
end})
local bll = bgc:StatGrid({{Key = g({20, 63, 34, 46}, 90), Title = g({20, 63, 34, 46, 122, 24, 47, 35, 122, 19, 52}, 90)}, {Key = g({24, 59, 54}, 90), Title = g({25, 59, 52, 122, 27, 60, 60, 53, 40, 62}, 90)}, {Key = g({24, 53, 47, 61, 50, 46}, 90), Title = g({24, 53, 47, 61, 50, 46, 122, 117, 122, 25, 59, 42}, 90)}, {Key = g({29, 59, 51, 52, 63, 62}, 90), Title = g({30, 51, 59, 55, 53, 52, 62, 41, 122, 29, 59, 51, 52, 63, 62}, 90)}})
k._refreshDPTiles = function()
  local blm = k._dpFind(l.DiamondPackIndex)
  local bln = math.clamp(math.floor((tonumber(l.DiamondPackCap) or 0)), 0, 1000)
  bll.Bought(string.format(g({127, 41, 122, 117, 122, 127, 41}, 90), as((n.DPBought or 0)), ((((bln > 0) and as(bln)) or g({184, 210, 196}, 90)))))
  bll.Gained(ao((n.DPGained or 0)))
  if (((3 ^ 2) == 9) and not blm) then
    bll.Bal(g({52, 53, 122, 42, 59, 57, 49}, 90))
  else
    local blo = 0
    pcall(function()
      local blp = (k.Library and k.Library.Save.Get())
      blo = ((blp and ((tonumber(blp[blm.currency]) or 0))) or 0)
    end)
    bll.Bal(string.format(g({127, 62, 34, 122, 114, 127, 41, 122, 127, 41, 115}, 90), math.floor((blo / math.max(1, blm.cost))), ao(blo), blm.currency))
  end
  if (((7 * 7) == 49) and not l.AutoDiamondPacks) then
    bll.Next(tostring((n.DPNote or g({53, 60, 60}, 90))))
  elseif (((1 + 1) == 2) and not blm) then
    bll.Next(g({52, 53, 122, 42, 59, 57, 49}, 90))
  else
    local blq = (((n.DPNextAt or 0)) - os.clock())
    if (((15 * 15) == 225) and ((((n.DPNextAt or 0)) <= 0) or (blq <= 0))) then
      bll.Next(g({52, 53, 45}, 90))
    else
      bll.Next(string.format(g({127, 62, 41}, 90), math.ceil(blq)))
    end
  end
end
bgc:Section(g({10, 53, 46, 51, 53, 52, 122, 17, 63, 63, 42, 63, 40}, 90))
bgc:Dropdown({Title = g({17, 63, 63, 42, 122, 9, 46, 53, 57, 49, 63, 62}, 90), Desc = g({20, 63, 44, 63, 40, 122, 40, 47, 52, 122, 53, 47, 46, 122, 53, 60, 122, 46, 50, 63, 41, 63, 122, 42, 53, 46, 51, 53, 52, 41, 122, 184, 218, 206, 122, 59, 47, 46, 53, 119, 56, 47, 35, 41, 122, 113, 122, 59, 47, 46, 53, 119, 47, 41, 63, 41}, 90), Values = biq, Value = (function()
  local blr = {}
  for bls, blt in ipairs((l.PotionKeepBoosts or {})) do
    for blu, blv in ipairs(biq) do
      if (((100 % 7) == 2) and (bir[blv] == blt)) then
        table.insert(blr, blv)
        break
      end
    end
  end
  return ((((#blr > 0) and blr) or {biq[1]}))
end)(), Multi = true, Callback = function(blw)
  local blx = {}
  for bly, blz in ipairs((((type(blw) == g({46, 59, 56, 54, 63}, 90)) and blw) or {})) do
    local bma = bir[blz]
    if (((12 * 12) == 144) and bma) then
      table.insert(blx, bma)
    end
  end
  l.PotionKeepBoosts = blx
end})
bgc:Slider({Title = g({8, 63, 41, 46, 53, 57, 49, 122, 14, 53}, 90), Desc = g({24, 47, 35, 41, 122, 47, 52, 46, 51, 54, 122, 35, 53, 47, 122, 53, 45, 52, 122, 46, 50, 51, 41, 122, 55, 59, 52, 35, 122, 53, 60, 122, 63, 59, 57, 50, 122, 41, 63, 54, 63, 57, 46, 63, 62, 122, 42, 53, 46, 51, 53, 52}, 90), Value = {Min = 1, Max = 50, Default = (tonumber(l.PotionKeepStock) or 10)}, Step = 1, Callback = function(bmb)
  l.PotionKeepStock = bmb
end})
bgc:Toggle({Title = g({27, 47, 46, 53, 119, 15, 41, 63, 122, 13, 50, 63, 52, 122, 31, 34, 42, 51, 40, 63, 62}, 90), Desc = g({8, 63, 119, 59, 57, 46, 51, 44, 59, 46, 63, 41, 122, 59, 122, 42, 53, 46, 51, 53, 52, 122, 60, 40, 53, 55, 122, 35, 53, 47, 40, 122, 41, 46, 53, 57, 49, 122, 46, 50, 63, 122, 55, 53, 55, 63, 52, 46, 122, 46, 50, 63, 122, 53, 54, 62, 122, 53, 52, 63, 122, 40, 47, 52, 41, 122, 53, 47, 46}, 90), Value = (l.PotionAutoUse ~= false), Callback = function(bmc)
  l.PotionAutoUse = bmc
end})
bgc:Slider({Title = g({30, 51, 59, 55, 53, 52, 62, 122, 28, 54, 53, 53, 40}, 90), Desc = g({10, 53, 46, 51, 53, 52, 122, 17, 63, 63, 42, 63, 40, 122, 41, 46, 53, 42, 41, 122, 56, 47, 35, 51, 52, 61, 122, 51, 60, 122, 51, 46, 122, 45, 53, 47, 54, 62, 122, 62, 40, 53, 42, 122, 35, 53, 47, 122, 56, 63, 54, 53, 45, 122, 46, 50, 51, 41}, 90), Value = {Min = 0, Max = 10000000, Default = (tonumber(l.PotionDiamondFloor) or 100000)}, Step = 10000, Callback = function(bmd)
  l.PotionDiamondFloor = bmd
end})
bgd:Section(g({27, 47, 46, 53, 122, 31, 52, 57, 50, 59, 52, 46}, 90))
local bme, bmf
local bmi = bgd:Dropdown({Title = g({30, 63, 41, 51, 40, 63, 62, 122, 31, 52, 57, 50, 59, 52, 46, 114, 41, 115}, 90), Desc = g({27, 122, 42, 63, 46, 122, 51, 41, 122, 125, 62, 53, 52, 63, 125, 122, 53, 52, 57, 63, 122, 51, 46, 122, 40, 53, 54, 54, 41, 122, 27, 20, 3, 122, 53, 60, 122, 46, 50, 63, 41, 63, 116, 122, 10, 51, 57, 49, 122, 53, 52, 63, 122, 53, 40, 122, 41, 63, 44, 63, 40, 59, 54, 116}, 90), Values = an, Multi = true, AllowNone = true, Value = (l.EnchantDesired or {}), Callback = function(bmg)
  local bmh = (((type(bmg) == g({46, 59, 56, 54, 63}, 90)) and bmg) or ((((bmg ~= nil) and {bmg}) or {})))
  l.EnchantDesired = bmh
end})
bme = bgd:Toggle({Title = g({27, 47, 46, 53, 122, 31, 52, 57, 50, 59, 52, 46}, 90), Desc = g({31, 52, 57, 50, 59, 52, 46, 41, 122, 59, 122, 56, 59, 46, 57, 50, 122, 53, 60, 122, 63, 54, 51, 61, 51, 56, 54, 63, 122, 42, 63, 46, 41, 122, 53, 44, 63, 40, 122, 59, 52, 62, 122, 53, 44, 63, 40, 122, 47, 52, 46, 51, 54, 122, 63, 59, 57, 50, 122, 53, 52, 63, 122, 50, 59, 41, 122, 59, 122, 62, 63, 41, 51, 40, 63, 62, 122, 63, 52, 57, 50, 59, 52, 46, 116, 122, 13, 27, 8, 20, 19, 20, 29, 96, 122, 40, 63, 42, 54, 59, 57, 63, 41, 122, 59, 52, 35, 122, 63, 34, 51, 41, 46, 51, 52, 61, 122, 63, 52, 57, 50, 59, 52, 46, 41, 122, 59, 52, 62, 122, 57, 53, 41, 46, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 42, 63, 40, 122, 40, 53, 54, 54, 116}, 90), Value = (l.AutoEnchant == true), Callback = function(bmj)
  l.AutoEnchant = bmj
  if (((3 ^ 2) == 9) and (bmj and (#((l.EnchantDesired or {})) == 0))) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 51, 57, 49, 122, 59, 122, 30, 63, 41, 51, 40, 63, 62, 122, 31, 52, 57, 50, 59, 52, 46, 122, 60, 51, 40, 41, 46, 122, 184, 218, 206, 122, 63, 52, 57, 50, 59, 52, 46, 122, 51, 62, 54, 63, 41, 122, 47, 52, 46, 51, 54, 122, 35, 53, 47, 122, 62, 53}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
  end
end})
bgd:Slider({Title = g({24, 59, 46, 57, 50, 122, 9, 51, 32, 63}, 90), Desc = g({10, 63, 46, 41, 122, 63, 52, 57, 50, 59, 52, 46, 63, 62, 122, 42, 63, 40, 122, 45, 59, 44, 63, 122, 114, 60, 51, 40, 63, 62, 122, 57, 53, 52, 57, 47, 40, 40, 63, 52, 46, 54, 35, 122, 51, 52, 122, 61, 40, 53, 47, 42, 41, 122, 53, 60, 122, 105, 115}, 90), Value = {Min = 1, Max = 30, Default = math.clamp((tonumber(l.EnchantBatch) or 10), 1, 30)}, Step = 1, Callback = function(bmk)
  l.EnchantBatch = bmk
end})
bgd:Toggle({Title = g({9, 49, 51, 42, 122, 22, 53, 57, 49, 63, 62, 122, 10, 63, 46, 41}, 90), Desc = g({22, 63, 59, 44, 63, 41, 122, 35, 53, 47, 40, 122, 54, 53, 57, 49, 63, 62, 122, 42, 63, 46, 41, 122, 47, 52, 46, 53, 47, 57, 50, 63, 62, 122, 114, 40, 63, 57, 53, 55, 55, 63, 52, 62, 63, 62, 122, 184, 218, 206, 122, 63, 52, 57, 50, 59, 52, 46, 51, 52, 61, 122, 53, 44, 63, 40, 45, 40, 51, 46, 63, 41, 122, 46, 50, 63, 51, 40, 122, 42, 53, 45, 63, 40, 41, 115}, 90), Value = (l.EnchantSkipLocked ~= false), Callback = function(bml)
  l.EnchantSkipLocked = bml
end})
bgd:Slider({Title = g({30, 51, 59, 55, 53, 52, 62, 122, 28, 54, 53, 53, 40}, 90), Desc = g({9, 46, 53, 42, 41, 122, 63, 52, 57, 50, 59, 52, 46, 51, 52, 61, 122, 56, 63, 60, 53, 40, 63, 122, 35, 53, 47, 40, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 45, 53, 47, 54, 62, 122, 62, 40, 53, 42, 122, 56, 63, 54, 53, 45, 122, 46, 50, 51, 41, 122, 114, 106, 122, 103, 122, 52, 53, 122, 54, 51, 55, 51, 46, 115}, 90), Value = {Min = 0, Max = 50000000, Default = (tonumber(l.EnchantDiamondFloor) or 0)}, Step = 10000, Callback = function(bmm)
  l.EnchantDiamondFloor = bmm
end})
bgd:Button({Title = g({31, 52, 57, 50, 59, 52, 46, 122, 20, 53, 45, 122, 114, 53, 52, 63, 122, 45, 59, 44, 63, 115}, 90), Desc = g({8, 47, 52, 41, 122, 59, 122, 41, 51, 52, 61, 54, 63, 122, 56, 59, 46, 57, 50, 122, 51, 55, 55, 63, 62, 51, 59, 46, 63, 54, 35, 118, 122, 45, 51, 46, 50, 53, 47, 46, 122, 46, 47, 40, 52, 51, 52, 61, 122, 27, 47, 46, 53, 122, 31, 52, 57, 50, 59, 52, 46, 122, 53, 52}, 90), Icon = g({41, 42, 59, 40, 49, 54, 63, 41}, 90), Callback = function()
  if (((7 * 7) == 49) and (#((l.EnchantDesired or {})) == 0)) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 51, 57, 49, 122, 59, 122, 30, 63, 41, 51, 40, 63, 62, 122, 31, 52, 57, 50, 59, 52, 46, 122, 60, 51, 40, 41, 46}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    return
  end
  if (((1 + 1) == 2) and n.EnchantBusy) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 52, 122, 63, 52, 57, 50, 59, 52, 46, 122, 45, 59, 44, 63, 122, 51, 41, 122, 59, 54, 40, 63, 59, 62, 35, 122, 40, 47, 52, 52, 51, 52, 61}, 90), g({57, 54, 53, 57, 49}, 90))
    return
  end
  task.spawn(function()
    n.EnchantBusy = true
    local bmn, bmo, bmp = g({51, 62, 54, 63}, 90)
    pcall(function()
      bmn, bmo, bmp = k._enchantOnce(k.Library)
    end)
    n.EnchantBusy = false
    if (((15 * 15) == 225) and (bmn == g({40, 59, 52}, 90))) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({31, 52, 57, 50, 59, 52, 46, 63, 62, 122, 127, 62, 122, 42, 63, 46, 114, 41, 115, 118, 122, 127, 62, 122, 61, 53, 46, 122, 59, 122, 62, 63, 41, 51, 40, 63, 62, 122, 63, 52, 57, 50, 59, 52, 46}, 90), (bmo or 0), (bmp or 0)), g({41, 42, 59, 40, 49, 54, 63, 41}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({31, 52, 57, 50, 59, 52, 46, 96, 122}, 90) .. ((n.EnchantNote or tostring(bmn)))), g({51, 52, 60, 53}, 90))
    end
  end)
end})
bmf = bgd:Button({Title = g({13, 50, 59, 46, 122, 19, 41, 122, 19, 46, 122, 30, 53, 51, 52, 61, 101}, 90), Desc = g({9, 50, 53, 45, 41, 122, 46, 50, 63, 122, 59, 47, 46, 53, 119, 63, 52, 57, 50, 59, 52, 46, 122, 45, 53, 40, 49, 63, 40, 125, 41, 122, 57, 47, 40, 40, 63, 52, 46, 122, 41, 46, 59, 46, 47, 41}, 90), Icon = g({61, 59, 47, 61, 63}, 90), Callback = function()
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({31, 52, 57, 50, 59, 52, 46, 96, 122}, 90) .. ((n.EnchantNote or g({51, 62, 54, 63}, 90)))), g({61, 59, 47, 61, 63}, 90))
end})
bge:Section(g({30, 51, 41, 57, 53, 40, 62, 122, 13, 63, 56, 50, 53, 53, 49}, 90))
bge:Input({Title = g({13, 63, 56, 50, 53, 53, 49, 122, 15, 8, 22}, 90), Desc = g({30, 51, 41, 57, 53, 40, 62, 122, 45, 63, 56, 50, 53, 53, 49, 122, 54, 51, 52, 49, 122, 114, 50, 46, 46, 42, 41, 96, 117, 117, 62, 51, 41, 57, 53, 40, 62, 116, 57, 53, 55, 117, 59, 42, 51, 117, 45, 63, 56, 50, 53, 53, 49, 41, 117, 116, 116, 116, 115}, 90), Placeholder = g({50, 46, 46, 42, 41, 96, 117, 117, 62, 51, 41, 57, 53, 40, 62, 116, 57, 53, 55, 117, 59, 42, 51, 117, 45, 63, 56, 50, 53, 53, 49, 41, 117, 116, 116, 116}, 90), Callback = function(bmq)
  l.WebhookURL = bmq
end})
bge:Toggle({Title = g({20, 53, 46, 51, 60, 35, 122, 21, 52, 122, 18, 47, 61, 63, 122, 18, 59, 46, 57, 50}, 90), Desc = g({10, 53, 41, 46, 41, 122, 59, 52, 122, 63, 55, 56, 63, 62, 122, 45, 51, 46, 50, 122, 42, 63, 46, 118, 122, 57, 50, 59, 52, 57, 63, 118, 122, 51, 55, 59, 61, 63, 122, 59, 52, 62, 122, 47, 41, 63, 40, 52, 59, 55, 63}, 90), Value = false, Callback = function(bmr)
  l.WebhookEnabled = bmr
end})
bge:Section(g({27, 54, 63, 40, 46, 41, 122, 124, 122, 16, 53, 47, 40, 52, 59, 54}, 90))
bge:Toggle({Title = g({17, 51, 57, 49, 122, 27, 54, 63, 40, 46}, 90), Desc = g({30, 23, 41, 122, 35, 53, 47, 122, 46, 50, 63, 122, 55, 53, 55, 63, 52, 46, 122, 46, 50, 51, 41, 122, 59, 57, 57, 53, 47, 52, 46, 122, 61, 63, 46, 41, 122, 49, 51, 57, 49, 63, 62, 122, 53, 40, 122, 62, 51, 41, 57, 53, 52, 52, 63, 57, 46, 63, 62, 122, 114, 45, 51, 46, 50, 122, 41, 63, 41, 41, 51, 53, 52, 122, 46, 53, 46, 59, 54, 41, 115}, 90), Value = (l.KickAlert ~= false), Callback = function(bms)
  l.KickAlert = bms
end})
bge:Toggle({Title = g({14, 40, 59, 62, 63, 122, 16, 53, 47, 40, 52, 59, 54}, 90), Desc = g({22, 53, 61, 41, 122, 63, 44, 63, 40, 35, 122, 57, 53, 55, 42, 54, 63, 46, 63, 62, 122, 46, 40, 59, 62, 63, 122, 46, 53, 122, 30, 51, 41, 57, 53, 40, 62, 122, 60, 40, 53, 55, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 125, 41, 122, 53, 45, 52, 122, 46, 40, 59, 62, 63, 122, 50, 51, 41, 46, 53, 40, 35}, 90), Value = (l.TradeJournal == true), Callback = function(bmt)
  l.TradeJournal = bmt
  if (((100 % 7) == 2) and not bmt) then
    n.TradeSeen = nil
  end
end})
bge:Button({Title = g({9, 63, 52, 62, 122, 14, 63, 41, 46, 122, 13, 63, 56, 50, 53, 53, 49}, 90), Desc = g({10, 53, 41, 46, 41, 122, 59, 122, 41, 59, 55, 42, 54, 63, 122, 18, 47, 61, 63, 122, 63, 55, 56, 63, 62, 122, 46, 53, 122, 57, 50, 63, 57, 49, 122, 46, 50, 63, 122, 15, 8, 22}, 90), Icon = g({41, 63, 52, 62}, 90), Callback = function()
  task.spawn(function()
    local bmu, bmv = k._testWebhook()
    if (((12 * 12) == 144) and bmu) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({14, 63, 41, 46, 122, 45, 63, 56, 50, 53, 53, 49, 122, 41, 63, 52, 46}, 90), g({57, 50, 63, 57, 49}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({13, 63, 56, 50, 53, 53, 49, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring(bmv)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
  end)
end})
bfw:Section(g({14, 63, 54, 63, 42, 53, 40, 46}, 90))
bfw:Toggle({Title = g({14, 63, 54, 63, 42, 53, 40, 46, 122, 14, 53, 122, 31, 61, 61, 122, 13, 50, 63, 52, 122, 18, 59, 46, 57, 50, 51, 52, 61}, 90), Desc = g({14, 63, 54, 63, 42, 53, 40, 46, 41, 122, 35, 53, 47, 122, 52, 63, 34, 46, 122, 46, 53, 122, 46, 50, 63, 122, 41, 63, 54, 63, 57, 46, 63, 62, 122, 63, 61, 61, 122, 21, 20, 25, 31, 122, 45, 50, 63, 52, 122, 50, 59, 46, 57, 50, 51, 52, 61, 122, 41, 46, 59, 40, 46, 41, 122, 114, 59, 52, 62, 122, 59, 60, 46, 63, 40, 122, 63, 59, 57, 50, 122, 45, 53, 40, 54, 62, 122, 41, 45, 51, 46, 57, 50, 115, 116, 122, 3, 53, 47, 122, 57, 59, 52, 122, 45, 59, 54, 49, 122, 59, 45, 59, 35, 122, 60, 40, 63, 63, 54, 35, 122, 59, 60, 46, 63, 40, 45, 59, 40, 62, 41, 116}, 90), Value = (l.EggStay == true), Callback = function(bmw)
  l.EggStay = bmw
  if (((3 ^ 2) == 9) and not bmw) then
    n.EggTpDone = nil
  end
end})
bfw:Button({Title = g({14, 63, 54, 63, 42, 53, 40, 46, 122, 14, 53, 122, 9, 63, 54, 63, 57, 46, 63, 62, 122, 31, 61, 61, 122, 20, 53, 45}, 90), Desc = g({21, 52, 63, 119, 41, 50, 53, 46, 96, 122, 41, 46, 59, 52, 62, 122, 53, 52, 122, 35, 53, 47, 40, 122, 57, 47, 40, 40, 63, 52, 46, 122, 41, 51, 62, 63, 122, 53, 60, 122, 46, 50, 63, 122, 63, 61, 61, 122, 57, 50, 53, 41, 63, 52, 122, 59, 56, 53, 44, 63, 118, 122, 60, 59, 57, 51, 52, 61, 122, 51, 46}, 90), Callback = function()
  task.spawn(function()
    local bmx, bmy = (k._teleportToEgg and k._teleportToEgg())
    if (((7 * 7) == 49) and bmx) then
      local bmz = k.Config.EggKey
      k.State.EggTpDone = ((bmz and ((bmz .. g({26, 55, 59, 52, 47, 59, 54}, 90)))) or nil)
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({14, 63, 54, 63, 42, 53, 40, 46, 63, 62, 122, 46, 53, 122, 63, 61, 61}, 90), g({57, 50, 63, 57, 49}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({14, 63, 54, 63, 42, 53, 40, 46, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring(bmy)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
  end)
end})
bfw:Section(g({31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 31, 61, 61}, 90))
local bnb = bfw:Toggle({Title = g({27, 47, 46, 53, 122, 21, 42, 63, 52, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 31, 61, 61}, 90), Desc = g({24, 47, 35, 41, 122, 46, 50, 63, 122, 63, 34, 57, 54, 47, 41, 51, 44, 63, 122, 63, 61, 61, 122, 114, 35, 53, 47, 40, 122, 41, 63, 54, 63, 57, 46, 63, 62, 122, 63, 61, 61, 118, 122, 30, 51, 59, 55, 53, 52, 62, 41, 115, 122, 53, 52, 122, 59, 122, 54, 53, 53, 42, 116, 122, 10, 59, 47, 41, 63, 41, 122, 45, 50, 51, 54, 63, 122, 59, 122, 18, 47, 61, 63, 122, 51, 41, 122, 43, 47, 63, 47, 63, 62, 122, 60, 53, 40, 122, 46, 40, 59, 62, 63, 118, 122, 40, 63, 41, 47, 55, 63, 41, 122, 53, 52, 57, 63, 122, 51, 46, 125, 41, 122, 46, 40, 59, 62, 63, 62, 116}, 90), Value = (l.AutoOpenExclusive == true), Callback = function(bna)
  l.AutoOpenExclusive = bna
  if (((1 + 1) == 2) and bna) then
    n.ExclusivePaused = false
  end
end})
k._exEggToggle = bnb
bfw:Slider({Title = g({31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 31, 61, 61, 122, 30, 63, 54, 59, 35}, 90), Desc = g({9, 63, 57, 53, 52, 62, 41, 122, 56, 63, 46, 45, 63, 63, 52, 122, 63, 34, 57, 54, 47, 41, 51, 44, 63, 122, 63, 61, 61, 122, 56, 47, 35, 41, 122, 114, 41, 63, 40, 44, 63, 40, 122, 63, 52, 60, 53, 40, 57, 63, 41, 122, 36, 106, 116, 98, 41, 122, 55, 51, 52, 51, 55, 47, 55, 115}, 90), Value = {Min = 0.8, Max = 5, Default = 1}, Step = 0.1, Callback = function(bnc)
  l.ExclusiveOpenDelay = bnc
end})
bfw:Section(g({18, 47, 61, 63, 122, 14, 40, 59, 62, 51, 52, 61}, 90))
bfw:Input({Title = g({14, 40, 59, 62, 63, 122, 18, 47, 61, 63, 41, 122, 14, 53, 122, 114, 47, 41, 63, 40, 52, 59, 55, 63, 115}, 90), Desc = g({23, 47, 41, 46, 122, 56, 63, 122, 51, 52, 122, 46, 50, 51, 41, 122, 41, 63, 40, 44, 63, 40, 116, 122, 14, 50, 63, 35, 122, 59, 57, 57, 63, 42, 46, 122, 46, 50, 63, 122, 51, 52, 44, 51, 46, 63, 122, 113, 122, 46, 40, 59, 62, 63, 122, 53, 52, 122, 46, 50, 63, 51, 40, 122, 41, 51, 62, 63, 116}, 90), Placeholder = g({15, 41, 63, 40, 52, 59, 55, 63}, 90), Callback = function(bnd)
  l.TradeTarget = bnd
end})
local bnf = bfw:Toggle({Title = g({27, 47, 46, 53, 122, 14, 40, 59, 62, 63, 122, 18, 47, 61, 63, 41, 122, 27, 60, 46, 63, 40, 122, 18, 59, 46, 57, 50}, 90), Desc = g({14, 40, 59, 62, 63, 41, 122, 59, 52, 35, 122, 50, 59, 46, 57, 50, 63, 62, 122, 18, 47, 61, 63, 122, 46, 53, 122, 46, 50, 63, 122, 47, 41, 63, 40, 122, 59, 56, 53, 44, 63, 122, 59, 52, 62, 122, 59, 57, 57, 63, 42, 46, 41, 116, 122, 31, 61, 61, 122, 53, 42, 63, 52, 51, 52, 61, 122, 40, 63, 41, 47, 55, 63, 41, 122, 53, 52, 57, 63, 122, 51, 46, 125, 41, 122, 61, 53, 52, 63, 116}, 90), Value = false, Callback = function(bne)
  l.AutoTradeHuges = bne
end})
k._tradeToggle = bnf
bfy:Section(g({29, 53, 54, 62, 63, 52, 122, 124, 122, 8, 59, 51, 52, 56, 53, 45, 122, 23, 59, 57, 50, 51, 52, 63, 41}, 90))
local bnh = bfy:Toggle({Title = g({27, 47, 46, 53, 122, 23, 59, 49, 63, 122, 29, 53, 54, 62, 63, 52, 122, 114, 107, 106, 106, 127, 115}, 90), Desc = g({28, 63, 63, 62, 41, 122, 63, 34, 59, 57, 46, 54, 35, 122, 108, 122, 51, 62, 63, 52, 46, 51, 57, 59, 54, 122, 42, 54, 59, 51, 52, 122, 42, 63, 46, 41, 122, 51, 52, 46, 53, 122, 46, 50, 63, 122, 29, 53, 54, 62, 63, 52, 122, 23, 59, 57, 50, 51, 52, 63, 122, 184, 218, 206, 122, 46, 50, 63, 122, 61, 47, 59, 40, 59, 52, 46, 63, 63, 62, 122, 40, 53, 45, 118, 122, 41, 53, 122, 52, 53, 46, 50, 51, 52, 61, 122, 51, 41, 122, 63, 44, 63, 40, 122, 61, 59, 55, 56, 54, 63, 62, 116, 122, 107, 118, 104, 111, 106, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 42, 63, 40, 122, 29, 53, 54, 62, 63, 52, 116}, 90), Value = (l.AutoGolden == true), Callback = function(bng)
  l.AutoGolden = bng
  if (((15 * 15) == 225) and bng) then
    n.GoldenErrShown = false
    n.GoldenIdleNotified = false
  end
end})
k._goldenToggle = bnh
local bnj = bfy:Toggle({Title = g({27, 47, 46, 53, 122, 23, 59, 49, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 114, 107, 106, 106, 127, 115}, 90), Desc = g({28, 63, 63, 62, 41, 122, 63, 34, 59, 57, 46, 54, 35, 122, 108, 122, 51, 62, 63, 52, 46, 51, 57, 59, 54, 122, 29, 53, 54, 62, 63, 52, 122, 42, 63, 46, 41, 122, 51, 52, 46, 53, 122, 46, 50, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 23, 59, 57, 50, 51, 52, 63, 122, 184, 218, 206, 122, 59, 54, 41, 53, 122, 46, 50, 63, 122, 61, 47, 59, 40, 59, 52, 46, 63, 63, 62, 122, 40, 53, 45, 116, 122, 104, 118, 104, 111, 106, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 42, 63, 40, 122, 8, 59, 51, 52, 56, 53, 45, 116, 122, 8, 47, 52, 122, 46, 50, 51, 41, 122, 45, 51, 46, 50, 122, 27, 47, 46, 53, 122, 29, 53, 54, 62, 63, 52, 122, 46, 53, 122, 57, 50, 59, 51, 52, 122, 42, 54, 59, 51, 52, 122, 42, 63, 46, 41, 122, 59, 54, 54, 122, 46, 50, 63, 122, 45, 59, 35, 122, 46, 53, 122, 8, 59, 51, 52, 56, 53, 45, 116}, 90), Value = (l.AutoRainbow == true), Callback = function(bni)
  l.AutoRainbow = bni
  if (((100 % 7) == 2) and bni) then
    n.RainbowErrShown = false
    n.RainbowIdleNotified = false
  end
end})
k._rainbowToggle = bnj
bfy:Input({Title = g({30, 51, 59, 55, 53, 52, 62, 122, 28, 54, 53, 53, 40}, 90), Desc = g({24, 53, 46, 50, 122, 55, 59, 57, 50, 51, 52, 63, 41, 122, 42, 59, 47, 41, 63, 122, 40, 59, 46, 50, 63, 40, 122, 46, 50, 59, 52, 122, 41, 42, 63, 52, 62, 122, 56, 63, 54, 53, 45, 122, 46, 50, 51, 41, 122, 55, 59, 52, 35, 122, 30, 51, 59, 55, 53, 52, 62, 41, 116, 122, 24, 54, 59, 52, 49, 117, 106, 122, 103, 122, 41, 42, 63, 52, 62, 122, 60, 40, 63, 63, 54, 35, 116, 122, 10, 40, 63, 41, 41, 122, 31, 52, 46, 63, 40, 122, 46, 53, 122, 41, 63, 46, 116}, 90), Placeholder = g({63, 116, 61, 116, 122, 107, 106, 106, 106, 106, 106, 106}, 90), Callback = function(bnk)
  local bnl = tonumber((tostring(bnk):gsub(g({1, 4, 127, 62, 127, 116, 7}, 90), "")))
  l.MachineDiamondFloor = math.max(0, (bnl or 0))
  n.MachineBrokeNotified = false
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({23, 59, 57, 50, 51, 52, 63, 122, 62, 51, 59, 55, 53, 52, 62, 122, 60, 54, 53, 53, 40, 122, 41, 63, 46, 122, 46, 53, 122}, 90) .. tostring(math.floor(l.MachineDiamondFloor))), g({57, 50, 63, 57, 49}, 90))
end})
bfy:Button({Title = g({23, 59, 49, 63, 122, 21, 52, 63, 122, 29, 53, 54, 62, 63, 52, 122, 20, 53, 45}, 90), Desc = g({21, 52, 63, 122, 61, 47, 59, 40, 59, 52, 46, 63, 63, 62, 122, 108, 119, 42, 63, 46, 122, 57, 53, 52, 44, 63, 40, 41, 51, 53, 52, 116, 122, 8, 47, 52, 41, 122, 63, 44, 63, 52, 122, 45, 51, 46, 50, 122, 46, 50, 63, 122, 46, 53, 61, 61, 54, 63, 122, 53, 60, 60, 116}, 90), Callback = function()
  task.spawn(function()
    local bnm = k.Library
    if (((12 * 12) == 144) and not bnm) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    pcall(qc, bnm, g({61, 53, 54, 62, 63, 52}, 90))
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (n.GoldenNote or g({62, 53, 52, 63}, 90)), g({41, 42, 59, 40, 49, 54, 63, 41}, 90))
  end)
end})
bfy:Button({Title = g({23, 59, 49, 63, 122, 21, 52, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 20, 53, 45}, 90), Desc = g({21, 52, 63, 122, 61, 47, 59, 40, 59, 52, 46, 63, 63, 62, 122, 108, 119, 29, 53, 54, 62, 63, 52, 122, 57, 53, 52, 44, 63, 40, 41, 51, 53, 52, 116, 122, 8, 47, 52, 41, 122, 63, 44, 63, 52, 122, 45, 51, 46, 50, 122, 46, 50, 63, 122, 46, 53, 61, 61, 54, 63, 122, 53, 60, 60, 116}, 90), Callback = function()
  task.spawn(function()
    local bnn = k.Library
    if (((3 ^ 2) == 9) and not bnn) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    pcall(qc, bnn, g({40, 59, 51, 52, 56, 53, 45}, 90))
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (n.RainbowNote or g({62, 53, 52, 63}, 90)), g({41, 42, 59, 40, 49, 54, 63, 41}, 90))
  end)
end})
bfy:Section(g({30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90))
local bno = bfy:Slot()
local bnp = {}
local bnq = nil
bfy:Toggle({Title = g({27, 47, 46, 53, 122, 23, 59, 49, 63, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90), Desc = g({25, 53, 52, 44, 63, 40, 46, 41, 122, 35, 53, 47, 40, 122, 8, 59, 51, 52, 56, 53, 45, 122, 53, 60, 122, 46, 50, 63, 122, 42, 63, 46, 122, 59, 56, 53, 44, 63, 122, 53, 52, 63, 122, 59, 46, 122, 59, 122, 46, 51, 55, 63, 122, 114, 107, 96, 107, 122, 184, 220, 200, 122, 63, 59, 57, 50, 122, 56, 63, 57, 53, 55, 63, 41, 122, 51, 46, 41, 122, 53, 45, 52, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 42, 63, 46, 115, 96, 122, 109, 118, 111, 106, 106, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 57, 53, 52, 44, 63, 40, 46, 122, 113, 122, 107, 118, 106, 106, 106, 118, 106, 106, 106, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 41, 49, 51, 42, 122, 42, 63, 40, 122, 42, 63, 46, 118, 122, 51, 52, 41, 46, 59, 52, 46, 122, 57, 54, 59, 51, 55, 116}, 90), Value = (l.AutoDarkMatter == true), Callback = function(bnr)
  l.AutoDarkMatter = bnr
  if (((7 * 7) == 49) and bnr) then
    n.DMIdleNotified = false
  end
end})
bfy:Toggle({Title = g({27, 47, 46, 53, 122, 9, 49, 51, 42, 122, 14, 51, 55, 63, 40, 122, 114, 29, 63, 55, 41, 115}, 90), Desc = g({10, 59, 35, 41, 122, 107, 118, 106, 106, 106, 118, 106, 106, 106, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 42, 63, 40, 122, 41, 54, 53, 46, 122, 46, 53, 122, 41, 49, 51, 42, 122, 46, 50, 63, 122, 46, 51, 55, 63, 40, 122, 59, 52, 62, 122, 57, 54, 59, 51, 55, 122, 51, 52, 41, 46, 59, 52, 46, 54, 35, 116, 122, 21, 60, 60, 122, 103, 122, 54, 63, 46, 122, 46, 50, 63, 122, 46, 51, 55, 63, 40, 41, 122, 40, 47, 52, 122, 60, 53, 40, 122, 60, 40, 63, 63, 116}, 90), Value = (l.DMAutoSkip ~= false), Callback = function(bns)
  l.DMAutoSkip = bns
  n.DMBrokeNotified = false
end})
local bnv = bfy:Input({Title = g({17, 63, 63, 42, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 27, 56, 53, 44, 63}, 90), Desc = g({9, 46, 53, 42, 122, 41, 42, 63, 52, 62, 51, 52, 61, 122, 53, 52, 122, 57, 53, 52, 44, 63, 40, 46, 117, 41, 49, 51, 42, 122, 53, 52, 57, 63, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 45, 53, 47, 54, 62, 122, 62, 40, 53, 42, 122, 56, 63, 54, 53, 45, 122, 46, 50, 51, 41, 116, 122, 10, 40, 63, 41, 41, 122, 31, 52, 46, 63, 40, 122, 46, 53, 122, 41, 63, 46, 116}, 90), Placeholder = g({63, 116, 61, 116, 122, 111, 106, 106, 106, 106, 106, 106}, 90), Callback = function(bnt)
  local bnu = tonumber((tostring(bnt):gsub(g({1, 4, 127, 62, 127, 116, 7}, 90), "")))
  l.DMDiamondFloor = (bnu or 0)
  n.DMBrokeNotified = false
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({30, 51, 59, 55, 53, 52, 62, 122, 60, 54, 53, 53, 40, 122, 41, 63, 46, 122, 46, 53, 122}, 90) .. tostring(math.floor(l.DMDiamondFloor))), g({57, 50, 63, 57, 49}, 90))
end})
pcall(function()
  bnv:SetText(tostring(math.floor((tonumber(l.DMDiamondFloor) or 0))))
end)
bfy:Button({Title = g({25, 53, 52, 44, 63, 40, 46, 122, 21, 52, 63, 122, 10, 63, 46, 122, 20, 53, 45}, 90), Desc = g({21, 52, 63, 122, 42, 63, 46, 96, 122, 57, 53, 52, 44, 63, 40, 46, 118, 122, 41, 49, 51, 42, 122, 46, 51, 55, 63, 40, 122, 45, 51, 46, 50, 122, 30, 51, 59, 55, 53, 52, 62, 41, 118, 122, 57, 54, 59, 51, 55, 116, 122, 8, 47, 52, 41, 122, 63, 44, 63, 52, 122, 45, 51, 46, 50, 122, 46, 50, 63, 122, 46, 53, 61, 61, 54, 63, 122, 53, 60, 60, 116}, 90), Callback = function()
  if (((1 + 1) == 2) and n.DMBusy) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 122, 30, 23, 122, 56, 59, 46, 57, 50, 122, 51, 41, 122, 59, 54, 40, 63, 59, 62, 35, 122, 40, 47, 52, 52, 51, 52, 61}, 90), g({57, 54, 53, 57, 49}, 90))
    return
  end
  task.spawn(function()
    local bnw = k.Library
    if (((15 * 15) == 225) and not bnw) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    n.DMBusy = true
    local bnx = l.AutoDarkMatter
    l.AutoDarkMatter = true
    pcall(k._dmStep, bnw)
    l.AutoDarkMatter = bnx
    n.DMBusy = false
  end)
end})
bfz:Section(g({29, 51, 60, 46, 122, 21, 42, 63, 52, 63, 40}, 90))
local bny = bfz:Slot()
local bnz = {}
local boa = nil
local boc = bfz:Toggle({Title = g({27, 47, 46, 53, 122, 21, 42, 63, 52, 122, 29, 51, 60, 46, 41, 122, 114, 57, 53, 52, 46, 51, 52, 47, 53, 47, 41, 115}, 90), Desc = g({24, 47, 54, 49, 119, 53, 42, 63, 52, 41, 122, 63, 44, 63, 40, 35, 122, 50, 63, 54, 62, 122, 57, 53, 42, 35, 122, 53, 60, 122, 46, 50, 63, 122, 61, 51, 60, 46, 122, 42, 51, 57, 49, 63, 62, 122, 59, 56, 53, 44, 63, 118, 122, 59, 41, 122, 60, 59, 41, 46, 122, 59, 41, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 122, 59, 54, 54, 53, 45, 41, 118, 122, 59, 52, 62, 122, 49, 63, 63, 42, 41, 122, 53, 42, 63, 52, 51, 52, 61, 122, 59, 41, 122, 55, 53, 40, 63, 122, 59, 40, 40, 51, 44, 63, 116, 122, 9, 46, 59, 52, 62, 41, 122, 62, 53, 45, 52, 122, 59, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 45, 50, 51, 54, 63, 122, 46, 50, 63, 122, 46, 51, 55, 63, 62, 122, 56, 59, 46, 57, 50, 122, 53, 42, 63, 52, 63, 40, 122, 56, 63, 54, 53, 45, 122, 51, 41, 122, 53, 52, 116}, 90), Value = (l.AutoOpenGifts == true), Callback = function(bob)
  l.AutoOpenGifts = bob
  if (((100 % 7) == 2) and bob) then
    n.GiftErrShown = false
  end
end})
k._giftToggle = boc
bfz:Button({Title = g({21, 42, 63, 52, 122, 9, 63, 54, 63, 57, 46, 63, 62, 122, 29, 51, 60, 46, 41, 122, 20, 53, 45}, 90), Desc = g({21, 52, 63, 119, 41, 50, 53, 46, 122, 56, 47, 54, 49, 122, 53, 42, 63, 52, 122, 53, 60, 122, 63, 44, 63, 40, 35, 122, 50, 63, 54, 62, 122, 57, 53, 42, 35, 122, 53, 60, 122, 46, 50, 63, 122, 61, 51, 60, 46, 122, 57, 50, 53, 41, 63, 52, 122, 59, 56, 53, 44, 63, 116, 122, 8, 47, 52, 41, 122, 63, 44, 63, 52, 122, 45, 51, 46, 50, 122, 56, 53, 46, 50, 122, 46, 53, 61, 61, 54, 63, 41, 122, 53, 60, 60, 116}, 90), Callback = function()
  if (((12 * 12) == 144) and n.GiftBusy) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 122, 61, 51, 60, 46, 122, 53, 42, 63, 52, 122, 51, 41, 122, 59, 54, 40, 63, 59, 62, 35, 122, 40, 47, 52, 52, 51, 52, 61}, 90), g({57, 54, 53, 57, 49}, 90))
    return
  end
  task.spawn(function()
    local bod = k.Library
    if (((3 ^ 2) == 9) and not bod) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    if (((7 * 7) == 49) and not l.GiftKey) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 51, 57, 49, 122, 59, 122, 61, 51, 60, 46, 122, 46, 35, 42, 63, 122, 60, 51, 40, 41, 46}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    n.GiftBusy = true
    n.GiftDeleteArmed = true
    n.GiftTrashIds = aix(bod, l.GiftKey)
    pcall(k._giftOpenStep, bod)
    task.wait(0.3)
    n.GiftDeleteArmed = false
    n.GiftBusy = false
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (n.GiftNote or g({62, 53, 52, 63}, 90)), g({61, 51, 60, 46}, 90))
  end)
end})
bfz:Section(g({14, 51, 55, 63, 62, 122, 24, 59, 46, 57, 50, 122, 21, 42, 63, 52, 63, 40}, 90))
bfz:Toggle({Title = g({21, 42, 63, 52, 122, 27, 122, 24, 59, 46, 57, 50, 122, 21, 52, 122, 27, 122, 14, 51, 55, 63, 40}, 90), Desc = g({8, 63, 54, 63, 59, 41, 63, 41, 122, 59, 122, 60, 51, 34, 63, 62, 122, 52, 47, 55, 56, 63, 40, 122, 53, 60, 122, 46, 50, 63, 122, 61, 51, 60, 46, 122, 42, 51, 57, 49, 63, 62, 122, 59, 56, 53, 44, 63, 122, 63, 44, 63, 40, 35, 122, 51, 52, 46, 63, 40, 44, 59, 54, 118, 122, 51, 52, 41, 46, 63, 59, 62, 122, 53, 60, 122, 62, 40, 59, 51, 52, 51, 52, 61, 122, 46, 50, 63, 122, 45, 50, 53, 54, 63, 122, 42, 51, 54, 63, 122, 59, 46, 122, 53, 52, 57, 63, 116, 122, 14, 59, 49, 63, 41, 122, 53, 44, 63, 40, 122, 60, 40, 53, 55, 122, 46, 50, 63, 122, 57, 53, 52, 46, 51, 52, 47, 53, 47, 41, 122, 53, 42, 63, 52, 63, 40, 122, 45, 50, 51, 54, 63, 122, 51, 46, 122, 51, 41, 122, 53, 52, 116}, 90), Value = (l.GiftBatchEnabled == true), Callback = function(boe)
  l.GiftBatchEnabled = boe
  if (((1 + 1) == 2) and boe) then
    n.GiftErrShown = false
    n.GiftBatchNextAt, n.GiftBatchLastAt, n.GiftBatchMinsUsed = 0, 0, 0
  end
end})
bfz:Slider({Title = g({24, 59, 46, 57, 50, 122, 19, 52, 46, 63, 40, 44, 59, 54, 122, 114, 55, 51, 52, 47, 46, 63, 41, 115}, 90), Desc = g({18, 53, 45, 122, 54, 53, 52, 61, 122, 46, 53, 122, 45, 59, 51, 46, 122, 56, 63, 46, 45, 63, 63, 52, 122, 56, 59, 46, 57, 50, 63, 41, 116, 122, 25, 50, 59, 52, 61, 51, 52, 61, 122, 46, 50, 51, 41, 122, 40, 63, 119, 46, 51, 55, 63, 41, 122, 46, 50, 63, 122, 57, 53, 47, 52, 46, 62, 53, 45, 52, 122, 59, 61, 59, 51, 52, 41, 46, 122, 46, 50, 63, 122, 54, 59, 41, 46, 122, 56, 59, 46, 57, 50, 122, 41, 46, 40, 59, 51, 61, 50, 46, 122, 59, 45, 59, 35, 116}, 90), Value = {Min = 5, Max = 60, Default = math.clamp((tonumber(l.GiftBatchMinutes) or 15), 5, 60)}, Step = 1, Callback = function(bof)
  l.GiftBatchMinutes = math.clamp(math.floor((tonumber(bof) or 15)), 5, 60)
end})
bfz:Slider({Title = g({29, 51, 60, 46, 41, 122, 10, 63, 40, 122, 24, 59, 46, 57, 50}, 90), Desc = g({18, 53, 45, 122, 55, 59, 52, 35, 122, 61, 51, 60, 46, 41, 122, 46, 53, 122, 53, 42, 63, 52, 122, 63, 59, 57, 50, 122, 46, 51, 55, 63, 122, 46, 50, 63, 122, 46, 51, 55, 63, 40, 122, 60, 51, 40, 63, 41, 116, 122, 19, 60, 122, 35, 53, 47, 122, 50, 53, 54, 62, 122, 60, 63, 45, 63, 40, 122, 46, 50, 59, 52, 122, 46, 50, 51, 41, 118, 122, 51, 46, 122, 53, 42, 63, 52, 41, 122, 45, 50, 59, 46, 122, 35, 53, 47, 122, 50, 59, 44, 63, 116}, 90), Value = {Min = 1, Max = 250, Default = math.max(1, math.floor((tonumber(l.GiftBatchCount) or 25)))}, Step = 1, Callback = function(bog)
  l.GiftBatchCount = math.max(1, math.floor((tonumber(bog) or 25)))
end})
local boh = bfz:StatGrid({{Key = g({20, 63, 34, 46}, 90), Title = g({20, 63, 34, 46, 122, 24, 59, 46, 57, 50, 122, 19, 52}, 90)}, {Key = g({18, 63, 54, 62}, 90), Title = g({29, 51, 60, 46, 41, 122, 18, 63, 54, 62}, 90)}, {Key = g({8, 47, 52, 41}, 90), Title = g({24, 59, 46, 57, 50, 63, 41, 122, 8, 47, 52}, 90)}, {Key = g({22, 59, 41, 46}, 90), Title = g({22, 59, 41, 46, 122, 24, 59, 46, 57, 50}, 90)}})
k._refreshBatchTiles = function()
  local boi = 0
  if (((15 * 15) == 225) and (k.Library and l.GiftKey)) then
    pcall(function()
      boi = #ajg(k.Library, l.GiftKey)
    end)
  end
  boh.Held(as(boi))
  boh.Runs(as((n.GiftBatchRuns or 0)))
  boh.Last(tostring((n.GiftBatchNote or g({53, 60, 60}, 90))))
  if (((100 % 7) == 2) and not l.GiftBatchEnabled) then
    boh.Next(g({53, 60, 60}, 90))
  elseif (((12 * 12) == 144) and not l.GiftKey) then
    boh.Next(g({52, 53, 122, 61, 51, 60, 46}, 90))
  else
    local boj = (((n.GiftBatchNextAt or 0)) - os.clock())
    if (((3 ^ 2) == 9) and ((((n.GiftBatchNextAt or 0)) <= 0) or (boj <= 0))) then
      boh.Next(g({52, 53, 45}, 90))
    else
      boh.Next(string.format(g({127, 62, 96, 127, 106, 104, 62}, 90), math.floor((boj / 60)), math.floor((boj % 60))))
    end
  end
end
bfz:Button({Title = g({21, 42, 63, 52, 122, 21, 52, 63, 122, 24, 59, 46, 57, 50, 122, 20, 53, 45}, 90), Desc = g({28, 51, 40, 63, 41, 122, 59, 122, 41, 51, 52, 61, 54, 63, 122, 56, 59, 46, 57, 50, 122, 53, 60, 122, 46, 50, 63, 122, 41, 51, 32, 63, 122, 59, 56, 53, 44, 63, 122, 51, 55, 55, 63, 62, 51, 59, 46, 63, 54, 35, 118, 122, 45, 51, 46, 50, 53, 47, 46, 122, 45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122, 46, 50, 63, 122, 46, 51, 55, 63, 40, 118, 122, 59, 52, 62, 122, 40, 63, 41, 63, 46, 41, 122, 46, 50, 63, 122, 57, 53, 47, 52, 46, 62, 53, 45, 52, 116}, 90), Callback = function()
  if (((7 * 7) == 49) and n.GiftBusy) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 122, 61, 51, 60, 46, 122, 53, 42, 63, 52, 122, 51, 41, 122, 59, 54, 40, 63, 59, 62, 35, 122, 40, 47, 52, 52, 51, 52, 61}, 90), g({57, 54, 53, 57, 49}, 90))
    return
  end
  task.spawn(function()
    local bok = k.Library
    if (((1 + 1) == 2) and not bok) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    if (((15 * 15) == 225) and not l.GiftKey) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 51, 57, 49, 122, 59, 122, 61, 51, 60, 46, 122, 46, 35, 42, 63, 122, 60, 51, 40, 41, 46}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    n.GiftTrashIds = aix(bok, l.GiftKey)
    pcall(function()
      k._giftBatchRun(bok, l.GiftBatchCount)
    end)
    if (((100 % 7) == 2) and l.GiftBatchEnabled) then
      n.GiftBatchNextAt = (os.clock() + (math.clamp((tonumber(l.GiftBatchMinutes) or 15), 5, 60) * 60))
    end
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({29, 51, 60, 46, 122, 56, 59, 46, 57, 50, 96, 122}, 90) .. ((n.GiftBatchNote or g({40, 59, 52}, 90)))), g({61, 51, 60, 46}, 90))
  end)
end})
bfz:Section(g({30, 40, 53, 42, 122, 25, 54, 63, 59, 52, 47, 42}, 90))
bfz:Toggle({Title = g({30, 63, 54, 63, 46, 63, 122, 20, 53, 40, 55, 59, 54, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 41}, 90), Desc = g({14, 40, 59, 41, 50, 63, 41, 122, 42, 54, 59, 51, 52, 122, 114, 52, 53, 119, 55, 53, 62, 51, 60, 51, 63, 40, 115, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 42, 63, 46, 41, 122, 46, 50, 59, 46, 122, 57, 53, 55, 63, 122, 53, 47, 46, 122, 53, 60, 122, 46, 50, 63, 122, 61, 51, 60, 46, 122, 42, 51, 57, 49, 63, 62, 122, 59, 56, 53, 44, 63, 116, 122, 20, 53, 46, 50, 51, 52, 61, 122, 53, 47, 46, 41, 51, 62, 63, 122, 46, 50, 59, 46, 122, 61, 51, 60, 46, 125, 41, 122, 53, 45, 52, 122, 62, 40, 53, 42, 41, 122, 51, 41, 122, 63, 44, 63, 40, 122, 46, 53, 47, 57, 50, 63, 62, 116}, 90), Value = (l.GiftDeleteNormal ~= false), Callback = function(bol)
  l.GiftDeleteNormal = bol
end})
bfz:Toggle({Title = g({30, 63, 54, 63, 46, 63, 122, 29, 53, 54, 62, 63, 52, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 41}, 90), Desc = g({27, 54, 41, 53, 122, 46, 40, 59, 41, 50, 63, 41, 122, 29, 53, 54, 62, 63, 52, 119, 44, 59, 40, 51, 59, 52, 46, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 41, 122, 60, 40, 53, 55, 122, 46, 50, 59, 46, 122, 61, 51, 60, 46, 116, 122, 21, 60, 60, 122, 56, 35, 122, 62, 63, 60, 59, 47, 54, 46, 122, 184, 218, 206, 122, 29, 53, 54, 62, 63, 52, 41, 122, 59, 40, 63, 122, 45, 53, 40, 46, 50, 122, 49, 63, 63, 42, 51, 52, 61, 116}, 90), Value = (l.GiftDeleteGolden == true), Callback = function(bom)
  l.GiftDeleteGolden = bom
end})
bfz:Toggle({Title = g({30, 63, 54, 63, 46, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 41}, 90), Desc = g({27, 54, 41, 53, 122, 46, 40, 59, 41, 50, 63, 41, 122, 8, 59, 51, 52, 56, 53, 45, 119, 44, 59, 40, 51, 59, 52, 46, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 41, 122, 60, 40, 53, 55, 122, 46, 50, 59, 46, 122, 61, 51, 60, 46, 116, 122, 21, 60, 60, 122, 56, 35, 122, 62, 63, 60, 59, 47, 54, 46, 122, 184, 218, 206, 122, 46, 50, 51, 41, 122, 51, 41, 122, 46, 50, 63, 122, 40, 59, 40, 63, 41, 46, 122, 46, 51, 63, 40, 122, 46, 50, 63, 122, 57, 54, 63, 59, 52, 47, 42, 122, 57, 59, 52, 122, 40, 63, 59, 57, 50, 116}, 90), Value = (l.GiftDeleteRainbow == true), Callback = function(bon)
  l.GiftDeleteRainbow = bon
end})
bfz:Button({Title = g({20, 63, 44, 63, 40, 122, 30, 63, 54, 63, 46, 63, 62, 118, 122, 13, 50, 59, 46, 63, 44, 63, 40, 122, 14, 50, 63, 122, 14, 53, 61, 61, 54, 63, 41, 122, 9, 59, 35}, 90), Desc = g({30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 118, 122, 9, 50, 51, 52, 35, 118, 122, 22, 53, 57, 49, 63, 62, 118, 122, 18, 47, 61, 63, 122, 59, 52, 62, 122, 14, 51, 46, 59, 52, 51, 57, 122, 59, 40, 63, 122, 63, 34, 57, 54, 47, 62, 63, 62, 122, 60, 40, 53, 55, 122, 61, 51, 60, 46, 122, 57, 54, 63, 59, 52, 47, 42, 122, 47, 52, 57, 53, 52, 62, 51, 46, 51, 53, 52, 59, 54, 54, 35, 116, 122, 25, 54, 63, 59, 52, 47, 42, 122, 51, 41, 122, 59, 54, 41, 53, 122, 41, 57, 53, 42, 63, 62, 122, 46, 53, 122, 46, 50, 63, 122, 41, 63, 54, 63, 57, 46, 63, 62, 122, 61, 51, 60, 46, 125, 41, 122, 53, 45, 52, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 62, 40, 53, 42, 41, 118, 122, 41, 53, 122, 42, 63, 46, 41, 122, 60, 40, 53, 55, 122, 59, 52, 35, 45, 50, 63, 40, 63, 122, 63, 54, 41, 63, 122, 59, 40, 63, 122, 41, 59, 60, 63, 116}, 90), Callback = function()
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({30, 23, 122, 117, 122, 9, 50, 51, 52, 35, 122, 117, 122, 22, 53, 57, 49, 63, 62, 122, 117, 122, 18, 47, 61, 63, 122, 117, 122, 14, 51, 46, 59, 52, 51, 57, 122, 59, 40, 63, 122, 59, 54, 45, 59, 35, 41, 122, 49, 63, 42, 46}, 90), g({41, 50, 51, 63, 54, 62}, 90))
end})
bfx:Section(g({25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 19, 52, 62, 63, 34}, 90))
local boo = bfx:Slot()
local boq = bfx:Toggle({Title = g({27, 47, 46, 53, 122, 19, 52, 62, 63, 34, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52}, 90), Desc = g({13, 59, 54, 49, 41, 122, 63, 44, 63, 40, 35, 122, 50, 59, 46, 57, 50, 59, 56, 54, 63, 122, 63, 61, 61, 122, 53, 60, 122, 46, 50, 63, 122, 45, 53, 40, 54, 62, 41, 122, 35, 53, 47, 122, 42, 51, 57, 49, 118, 122, 57, 50, 63, 59, 42, 63, 41, 46, 122, 60, 51, 40, 41, 46, 118, 122, 46, 63, 54, 63, 42, 53, 40, 46, 41, 122, 51, 52, 122, 60, 40, 53, 52, 46, 122, 53, 60, 122, 51, 46, 122, 59, 52, 62, 122, 50, 59, 46, 57, 50, 63, 41, 122, 47, 52, 46, 51, 54, 122, 46, 50, 59, 46, 122, 63, 61, 61, 122, 53, 45, 63, 41, 122, 46, 50, 63, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 52, 53, 46, 50, 51, 52, 61, 122, 184, 218, 206, 122, 63, 44, 63, 40, 35, 122, 42, 63, 46, 118, 122, 59, 52, 62, 122, 20, 53, 40, 55, 59, 54, 117, 29, 53, 54, 62, 63, 52, 117, 8, 59, 51, 52, 56, 53, 45, 117, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 60, 53, 40, 122, 63, 59, 57, 50, 116, 122, 14, 59, 49, 63, 41, 122, 53, 44, 63, 40, 122, 50, 59, 46, 57, 50, 51, 52, 61, 122, 60, 40, 53, 55, 122, 27, 47, 46, 53, 122, 31, 61, 61, 41, 122, 59, 52, 62, 122, 42, 40, 53, 46, 63, 57, 46, 41, 122, 46, 50, 63, 122, 42, 63, 46, 41, 122, 51, 46, 122, 41, 46, 51, 54, 54, 122, 52, 63, 63, 62, 41, 122, 60, 40, 53, 55, 122, 59, 47, 46, 53, 119, 62, 63, 54, 63, 46, 63, 116}, 90), Value = (l.AutoIndex == true), Callback = function(bop)
  l.AutoIndex = bop
  n.IndexNote = ((bop and g({41, 46, 59, 40, 46, 51, 52, 61}, 90)) or g({53, 60, 60}, 90))
  n.IndexFullNotified = false
  n.IndexTargets, n.IndexTotal = nil, 0
  n.IndexKeepUids, n.IndexKeepAt = nil, 0
  n.IndexGoldenActive = false
  n.OctupleWarned = false
  if (((12 * 12) == 144) and bop) then
    if (((3 ^ 2) == 9) and (l.AutoCompleteGame or l.AutoWorldProgress)) then
      l.AutoCompleteGame, l.AutoWorldProgress = false, false
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({14, 47, 40, 52, 63, 62, 122, 53, 60, 60, 122, 27, 47, 46, 53, 122, 25, 53, 55, 42, 54, 63, 46, 63, 122, 29, 59, 55, 63, 122, 117, 122, 13, 53, 40, 54, 62, 122, 10, 40, 53, 61, 40, 63, 41, 41, 122, 184, 218, 206, 122, 46, 50, 63, 35, 122, 60, 51, 61, 50, 46, 122, 46, 50, 63, 122, 51, 52, 62, 63, 34, 122, 53, 44, 63, 40, 122, 45, 53, 40, 54, 62, 122, 46, 40, 59, 44, 63, 54}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    if (((7 * 7) == 49) and (#((l.IndexWorlds or {})) == 0)) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 51, 57, 49, 122, 59, 46, 122, 54, 63, 59, 41, 46, 122, 53, 52, 63, 122, 45, 53, 40, 54, 62, 122, 51, 52, 122, 19, 52, 62, 63, 34, 122, 13, 53, 40, 54, 62, 41}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
  else
    n.IndexNeedIds = nil
    n.IndexGoldenActive = false
  end
end})
k._indexToggle = boq
bfx:Section(g({19, 52, 62, 63, 34, 122, 14, 47, 52, 51, 52, 61}, 90))
bfx:Dropdown({Title = g({18, 59, 46, 57, 50, 122, 27, 55, 53, 47, 52, 46}, 90), Desc = g({18, 53, 45, 122, 55, 59, 52, 35, 122, 63, 61, 61, 41, 122, 42, 63, 40, 122, 56, 47, 35, 122, 45, 50, 51, 54, 63, 122, 51, 52, 62, 63, 34, 51, 52, 61, 116, 122, 23, 53, 40, 63, 122, 42, 63, 46, 41, 122, 42, 63, 40, 122, 41, 63, 57, 53, 52, 62, 118, 122, 55, 53, 40, 63, 122, 57, 53, 51, 52, 122, 56, 47, 40, 52, 116, 122, 34, 98, 122, 52, 63, 63, 62, 41, 122, 46, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 24, 47, 35, 119, 98, 122, 47, 52, 54, 53, 57, 49, 97, 122, 45, 51, 46, 50, 53, 47, 46, 122, 51, 46, 122, 46, 50, 63, 122, 51, 52, 62, 63, 34, 122, 60, 59, 54, 54, 41, 122, 56, 59, 57, 49, 122, 46, 53, 122, 34, 105, 116}, 90), Values = {g({34, 107}, 90), g({34, 105}, 90), g({34, 98}, 90)}, Value = ((((l.IndexHatchAmount == 8)) and g({34, 98}, 90)) or (((((l.IndexHatchAmount == 1)) and g({34, 107}, 90)) or g({34, 105}, 90)))), Callback = function(bor)
  l.IndexHatchAmount = ((((bor == g({34, 98}, 90))) and 8) or (((((bor == g({34, 107}, 90))) and 1) or 3)))
  n.OctupleWarned = false
end})
bfx:Toggle({Title = g({15, 41, 63, 122, 23, 59, 57, 50, 51, 52, 63, 41}, 90), Desc = g({8, 59, 51, 52, 56, 53, 45, 122, 52, 63, 44, 63, 40, 122, 62, 40, 53, 42, 41, 122, 60, 40, 53, 55, 122, 59, 52, 122, 63, 61, 61, 122, 59, 52, 62, 122, 29, 53, 54, 62, 63, 52, 122, 53, 52, 54, 35, 122, 62, 40, 53, 42, 41, 122, 60, 40, 53, 55, 122, 59, 122, 61, 53, 54, 62, 63, 52, 122, 53, 52, 63, 118, 122, 41, 53, 122, 46, 50, 63, 122, 51, 52, 62, 63, 34, 122, 55, 59, 49, 63, 41, 122, 46, 50, 63, 55, 96, 122, 108, 122, 51, 62, 63, 52, 46, 51, 57, 59, 54, 122, 42, 54, 59, 51, 52, 122, 42, 63, 46, 41, 122, 119, 100, 122, 29, 53, 54, 62, 63, 52, 118, 122, 108, 122, 29, 53, 54, 62, 63, 52, 41, 122, 119, 100, 122, 8, 59, 51, 52, 56, 53, 45, 118, 122, 59, 54, 45, 59, 35, 41, 122, 53, 52, 122, 46, 50, 63, 122, 61, 47, 59, 40, 59, 52, 46, 63, 63, 62, 122, 40, 53, 45, 116, 122, 21, 60, 60, 122, 55, 63, 59, 52, 41, 122, 53, 52, 54, 35, 122, 20, 53, 40, 55, 59, 54, 122, 63, 52, 46, 40, 51, 63, 41, 122, 45, 51, 54, 54, 122, 63, 44, 63, 40, 122, 57, 53, 55, 42, 54, 63, 46, 63, 116}, 90), Value = (l.IndexUseMachines ~= false), Callback = function(bos)
  l.IndexUseMachines = bos
end})
bfx:Toggle({Title = g({18, 59, 46, 57, 50, 122, 29, 53, 54, 62, 63, 52, 122, 31, 61, 61, 41}, 90), Desc = g({21, 52, 57, 63, 122, 59, 52, 122, 63, 61, 61, 122, 53, 45, 63, 41, 122, 52, 53, 122, 55, 53, 40, 63, 122, 20, 53, 40, 55, 59, 54, 122, 63, 52, 46, 40, 51, 63, 41, 118, 122, 41, 45, 51, 46, 57, 50, 122, 46, 53, 122, 46, 50, 63, 122, 61, 53, 54, 62, 63, 52, 122, 63, 61, 61, 122, 56, 63, 41, 51, 62, 63, 122, 51, 46, 122, 184, 218, 206, 122, 63, 44, 63, 40, 35, 122, 50, 59, 46, 57, 50, 122, 57, 53, 55, 63, 41, 122, 53, 47, 46, 122, 29, 53, 54, 62, 63, 52, 118, 122, 41, 53, 122, 46, 50, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 55, 59, 57, 50, 51, 52, 63, 122, 61, 63, 46, 41, 122, 60, 63, 62, 122, 51, 52, 122, 53, 52, 63, 122, 41, 46, 63, 42, 122, 51, 52, 41, 46, 63, 59, 62, 122, 53, 60, 122, 41, 51, 34, 122, 42, 54, 59, 51, 52, 122, 42, 63, 46, 41, 122, 42, 63, 40, 122, 29, 53, 54, 62, 63, 52, 116, 122, 25, 53, 41, 46, 41, 122, 59, 56, 53, 47, 46, 122, 99, 34, 122, 46, 50, 63, 122, 57, 53, 51, 52, 41, 122, 42, 63, 40, 122, 50, 59, 46, 57, 50, 122, 59, 52, 62, 122, 52, 63, 63, 62, 41, 122, 46, 50, 63, 122, 61, 53, 54, 62, 63, 52, 122, 63, 61, 61, 122, 46, 53, 122, 56, 63, 122, 41, 46, 59, 52, 62, 51, 52, 61, 122, 51, 52, 122, 46, 50, 63, 122, 45, 53, 40, 54, 62, 116}, 90), Value = (l.IndexGoldenEggs ~= false), Callback = function(bot)
  l.IndexGoldenEggs = bot
  if (((1 + 1) == 2) and not bot) then
    n.IndexGoldenActive = false
  end
end})
bfx:Toggle({Title = g({9, 49, 51, 42, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 14, 51, 55, 63, 40}, 90), Desc = g({10, 59, 35, 41, 122, 107, 118, 106, 106, 106, 118, 106, 106, 106, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 46, 53, 122, 60, 51, 52, 51, 41, 50, 122, 59, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 57, 53, 52, 44, 63, 40, 41, 51, 53, 52, 122, 51, 52, 41, 46, 59, 52, 46, 54, 35, 122, 51, 52, 41, 46, 63, 59, 62, 122, 53, 60, 122, 45, 59, 51, 46, 51, 52, 61, 122, 53, 47, 46, 122, 46, 50, 63, 122, 55, 59, 57, 50, 51, 52, 63, 116, 122, 21, 60, 60, 122, 41, 46, 51, 54, 54, 122, 45, 53, 40, 49, 41, 122, 184, 218, 206, 122, 46, 50, 63, 122, 41, 54, 53, 46, 122, 48, 47, 41, 46, 122, 40, 63, 62, 63, 63, 55, 41, 122, 51, 46, 41, 63, 54, 60, 122, 54, 59, 46, 63, 40, 122, 53, 52, 57, 63, 122, 46, 50, 63, 122, 46, 51, 55, 63, 40, 122, 63, 34, 42, 51, 40, 63, 41, 116}, 90), Value = (l.IndexForceSkipDM ~= false), Callback = function(bou)
  l.IndexForceSkipDM = bou
end})
bfx:Input({Title = g({30, 51, 59, 55, 53, 52, 62, 122, 28, 54, 53, 53, 40}, 90), Desc = g({14, 50, 63, 122, 51, 52, 62, 63, 34, 122, 45, 53, 52, 125, 46, 122, 41, 42, 63, 52, 62, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 56, 63, 54, 53, 45, 122, 46, 50, 51, 41, 122, 56, 59, 54, 59, 52, 57, 63, 122, 114, 55, 59, 57, 50, 51, 52, 63, 41, 122, 59, 52, 62, 122, 46, 51, 55, 63, 40, 122, 41, 49, 51, 42, 41, 122, 56, 53, 46, 50, 115, 116, 122, 24, 54, 59, 52, 49, 117, 106, 122, 103, 122, 41, 42, 63, 52, 62, 122, 60, 40, 63, 63, 54, 35, 116, 122, 10, 40, 63, 41, 41, 122, 31, 52, 46, 63, 40, 122, 46, 53, 122, 41, 63, 46, 116}, 90), Placeholder = g({63, 116, 61, 116, 122, 104, 106, 106, 106, 106, 106, 106}, 90), Callback = function(bov)
  local bow = tonumber((tostring(bov):gsub(g({1, 4, 127, 62, 127, 116, 7}, 90), "")))
  l.IndexDiamondFloor = math.max(0, (bow or 0))
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({19, 52, 62, 63, 34, 122, 62, 51, 59, 55, 53, 52, 62, 122, 60, 54, 53, 53, 40, 122, 41, 63, 46, 122, 46, 53, 122}, 90) .. tostring(math.floor(l.IndexDiamondFloor))), g({57, 50, 63, 57, 49}, 90))
end})
bfx:Input({Title = g({18, 59, 46, 57, 50, 122, 25, 59, 42, 122, 10, 63, 40, 122, 31, 61, 61}, 90), Desc = g({29, 51, 44, 63, 122, 47, 42, 122, 53, 52, 122, 59, 52, 122, 63, 61, 61, 122, 59, 60, 46, 63, 40, 122, 46, 50, 51, 41, 122, 55, 59, 52, 35, 122, 50, 59, 46, 57, 50, 63, 41, 122, 59, 52, 62, 122, 55, 53, 44, 63, 122, 46, 53, 122, 46, 50, 63, 122, 52, 63, 34, 46, 122, 53, 52, 63, 118, 122, 40, 63, 46, 40, 35, 51, 52, 61, 122, 51, 46, 122, 52, 63, 34, 46, 122, 54, 59, 42, 116, 122, 24, 54, 59, 52, 49, 117, 106, 122, 103, 122, 52, 53, 122, 57, 59, 42, 116, 122, 10, 40, 63, 41, 41, 122, 31, 52, 46, 63, 40, 122, 46, 53, 122, 41, 63, 46, 116}, 90), Placeholder = g({106, 122, 103, 122, 47, 52, 54, 51, 55, 51, 46, 63, 62}, 90), Callback = function(box)
  local boy = tonumber((tostring(box):gsub(g({1, 4, 127, 62, 7}, 90), "")))
  l.IndexEggCap = math.max(0, (boy or 0))
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({19, 52, 62, 63, 34, 122, 50, 59, 46, 57, 50, 122, 57, 59, 42, 96, 122}, 90) .. ((((l.IndexEggCap == 0) and g({47, 52, 54, 51, 55, 51, 46, 63, 62}, 90)) or tostring(l.IndexEggCap)))), g({57, 50, 63, 57, 49}, 90))
end})
bfx:Input({Title = g({10, 59, 46, 51, 63, 52, 57, 63, 122, 10, 63, 40, 122, 31, 61, 61}, 90), Desc = g({23, 53, 44, 63, 122, 53, 52, 122, 59, 60, 46, 63, 40, 122, 46, 50, 51, 41, 122, 55, 59, 52, 35, 122, 50, 59, 46, 57, 50, 63, 41, 122, 45, 51, 46, 50, 122, 52, 53, 122, 52, 63, 45, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 63, 52, 46, 40, 35, 116, 122, 29, 47, 59, 40, 62, 41, 122, 59, 61, 59, 51, 52, 41, 46, 122, 59, 52, 122, 63, 61, 61, 122, 45, 50, 53, 41, 63, 122, 54, 59, 41, 46, 122, 42, 63, 46, 122, 51, 41, 122, 59, 122, 107, 119, 51, 52, 119, 59, 119, 55, 51, 54, 54, 51, 53, 52, 122, 62, 40, 53, 42, 116, 122, 30, 63, 60, 59, 47, 54, 46, 122, 108, 106, 106, 116, 122, 10, 40, 63, 41, 41, 122, 31, 52, 46, 63, 40, 122, 46, 53, 122, 41, 63, 46, 116}, 90), Placeholder = g({108, 106, 106}, 90), Callback = function(boz)
  local bpa = tonumber((tostring(boz):gsub(g({1, 4, 127, 62, 7}, 90), "")))
  l.IndexEggPatience = math.max(0, (bpa or 0))
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({19, 52, 62, 63, 34, 122, 42, 59, 46, 51, 63, 52, 57, 63, 96, 122}, 90) .. ((((l.IndexEggPatience == 0) and g({47, 52, 54, 51, 55, 51, 46, 63, 62}, 90)) or (tostring(l.IndexEggPatience) .. g({122, 50, 59, 46, 57, 50, 63, 41}, 90))))), g({57, 50, 63, 57, 49}, 90))
end})
bfx:Slider({Title = g({18, 59, 46, 57, 50, 122, 30, 63, 54, 59, 35}, 90), Desc = g({9, 63, 57, 53, 52, 62, 41, 122, 56, 63, 46, 45, 63, 63, 52, 122, 50, 59, 46, 57, 50, 63, 41, 116, 122, 24, 63, 54, 53, 45, 122, 107, 116, 104, 41, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 122, 41, 46, 59, 40, 46, 41, 122, 59, 52, 41, 45, 63, 40, 51, 52, 61, 122, 120, 35, 53, 47, 122, 59, 40, 63, 122, 62, 53, 51, 52, 61, 122, 46, 50, 51, 41, 122, 46, 53, 53, 122, 43, 47, 51, 57, 49, 54, 35, 120, 116}, 90), Value = {Min = 1.2, Max = 4, Default = (tonumber(l.IndexHatchDelay) or 1.2)}, Step = 0.1, Callback = function(bpb)
  l.IndexHatchDelay = math.max(1.2, (tonumber(bpb) or 1.2))
end})
bfx:Button({Title = g({9, 50, 53, 45, 122, 19, 52, 62, 63, 34, 122, 10, 40, 53, 61, 40, 63, 41, 41}, 90), Desc = g({10, 40, 53, 61, 40, 63, 41, 41, 122, 60, 53, 40, 122, 46, 50, 63, 122, 45, 53, 40, 54, 62, 41, 122, 35, 53, 47, 122, 41, 63, 54, 63, 57, 46, 63, 62, 122, 184, 218, 206, 122, 63, 44, 63, 40, 35, 122, 44, 59, 40, 51, 59, 52, 46, 122, 53, 60, 122, 63, 44, 63, 40, 35, 122, 42, 63, 46, 122, 46, 50, 63, 51, 40, 122, 63, 61, 61, 41, 122, 57, 59, 52, 122, 57, 53, 55, 42, 54, 63, 46, 63, 122, 184, 218, 206, 122, 42, 54, 47, 41, 122, 35, 53, 47, 40, 122, 53, 44, 63, 40, 59, 54, 54, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 46, 53, 46, 59, 54, 116}, 90), Callback = function()
  task.spawn(function()
    local bpc = k.Library
    if (((15 * 15) == 225) and not bpc) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    local bpd = ri(bpc)
    local bpe = rq(bpc)
    if (((100 % 7) == 2) and (not bpd or not bpe)) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({25, 53, 47, 54, 62, 122, 52, 53, 46, 122, 40, 63, 59, 62, 122, 46, 50, 63, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    local bpf, bpg = 0, 0
    for bph in pairs(bpd) do
      bpg += 1
      if (((12 * 12) == 144) and bpe[bph]) then
        bpf += 1
      end
    end
    local bpi = re(bpc)
    local bpj, bpk = {}, {}
    for bpl, bpm in ipairs((l.IndexWorlds or {})) do
      if (((3 ^ 2) == 9) and (type(bpm) == g({41, 46, 40, 51, 52, 61}, 90))) then
        bpj[bpm] = true
        table.insert(bpk, bpm)
      end
    end
    local bpn = bpc.Directory.Areas
    local bpo = {g({20, 53, 40, 55, 59, 54}, 90), g({29, 53, 54, 62, 63, 52}, 90), g({8, 59, 51, 52, 56, 53, 45}, 90), g({30, 59, 40, 49, 23, 59, 46, 46, 63, 40}, 90)}
    local bpp, bpq, bpr = {0, 0, 0, 0}, {0, 0, 0, 0}, {}
    pcall(function()
      for bps, bpt in pairs(bpc.Directory.Eggs) do
        if (((7 * 7) == 49) and ((((bpt and bpt.hatchable) and not bpt.disabled) and not bpt.isGolden) and bpt.area)) then
          local bpu = bpn[tostring(bpt.area)]
          local bpv = ((bpu and tostring((bpu.world or ""))) or nil)
          if (((1 + 1) == 2) and (bpv and bpj[bpv])) then
            for bpw, bpx in ipairs(sd(bpc, tostring(bps), bpi)) do
              for bpy = 1, 4 do
                local bpz = (bpx .. (g({119}, 90) .. bpy))
                if (((15 * 15) == 225) and (bpd[bpz] and not bpr[bpz])) then
                  bpr[bpz] = true
                  bpq[bpy] += 1
                  if (((100 % 7) == 2) and bpe[bpz]) then
                    bpp[bpy] += 1
                  end
                end
              end
            end
          end
        end
      end
    end)
    local bqa, bqb = 0, 0
    for bqc = 1, 4 do
      bqa += bpq[bqc]
      bqb += bpp[bqc]
    end
    if (((12 * 12) == 144) and (#bpk == 0)) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({20, 53, 122, 45, 53, 40, 54, 62, 41, 122, 41, 63, 54, 63, 57, 46, 63, 62, 116, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 53, 44, 63, 40, 59, 54, 54, 96, 122, 127, 62, 122, 117, 122, 127, 62, 122, 114, 127, 62, 122, 54, 63, 60, 46, 115}, 90), bpf, bpg, (bpg - bpf)), g({54, 51, 41, 46, 119, 57, 50, 63, 57, 49, 41}, 90))
      return
    end
    local bqd = {}
    for bqe = 1, 4 do
      if (((3 ^ 2) == 9) and (bpq[bqe] > 0)) then
        table.insert(bqd, string.format(g({127, 41, 122, 127, 62, 117, 127, 62}, 90), bpo[bqe], bpp[bqe], bpq[bqe]))
      end
    end
    local bqf = ((((#bpk <= 3)) and table.concat(bpk, g({118, 122}, 90))) or ((#bpk .. g({122, 45, 53, 40, 54, 62, 41}, 90))))
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({127, 41, 122, 184, 218, 206, 122, 127, 62, 117, 127, 62, 122, 114, 127, 62, 122, 54, 63, 60, 46, 115, 80, 127, 41, 80, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 53, 44, 63, 40, 59, 54, 54, 96, 122, 127, 62, 117, 127, 62}, 90), bqf, bqb, bqa, (bqa - bqb), table.concat(bqd, g({122, 122}, 90)), bpf, bpg), g({54, 51, 41, 46, 119, 57, 50, 63, 57, 49, 41}, 90))
  end)
end})
bgf:Section(g({9, 63, 41, 41, 51, 53, 52, 122, 14, 53, 46, 59, 54, 41}, 90))
local bqg = bgf:StatGrid({{Key = g({25, 53, 51, 52, 41}, 90), Title = g({25, 53, 51, 52, 41, 122, 25, 53, 54, 54, 63, 57, 46, 63, 62}, 90)}, {Key = g({30, 59, 55, 59, 61, 63}, 90), Title = g({30, 59, 55, 59, 61, 63, 122, 30, 63, 59, 54, 46}, 90)}, {Key = g({31, 61, 61, 41}, 90), Title = g({31, 61, 61, 41, 122, 18, 59, 46, 57, 50, 63, 62}, 90)}, {Key = g({18, 47, 61, 63, 41}, 90), Title = g({18, 47, 61, 63, 41, 122, 18, 59, 46, 57, 50, 63, 62}, 90)}, {Key = g({21, 40, 56, 41}, 90), Title = g({21, 40, 56, 41, 122, 25, 53, 54, 54, 63, 57, 46, 63, 62}, 90)}, {Key = g({24, 59, 61, 41}, 90), Title = g({24, 59, 61, 41, 122, 25, 53, 54, 54, 63, 57, 46, 63, 62}, 90)}, {Key = g({30, 63, 54, 63, 46, 63, 62}, 90), Title = g({10, 63, 46, 41, 122, 30, 63, 54, 63, 46, 63, 62}, 90)}, {Key = g({29, 51, 60, 46, 41, 21, 42, 63, 52, 63, 62}, 90), Title = g({29, 51, 60, 46, 41, 122, 21, 42, 63, 52, 63, 62}, 90)}, {Key = g({31, 34, 31, 61, 61, 41, 21, 42, 63, 52, 63, 62}, 90), Title = g({31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 31, 61, 61, 41}, 90)}, {Key = g({19, 52, 62, 63, 34, 20, 63, 45}, 90), Title = g({20, 63, 45, 122, 19, 52, 62, 63, 34, 122, 31, 52, 46, 40, 51, 63, 41}, 90)}, {Key = g({29, 53, 54, 62, 63, 52, 23, 59, 62, 63}, 90), Title = g({29, 53, 54, 62, 63, 52, 41, 122, 23, 59, 62, 63}, 90)}, {Key = g({8, 59, 51, 52, 56, 53, 45, 23, 59, 62, 63}, 90), Title = g({8, 59, 51, 52, 56, 53, 45, 41, 122, 23, 59, 62, 63}, 90)}, {Key = g({30, 23, 23, 59, 62, 63}, 90), Title = g({30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 23, 59, 62, 63}, 90)}, {Key = g({31, 52, 57, 50, 59, 52, 46, 30, 53, 52, 63}, 90), Title = g({31, 52, 57, 50, 59, 52, 46, 41, 122, 27, 42, 42, 54, 51, 63, 62}, 90)}})
k._refreshStatTiles = function()
  for bqh, bqi in pairs(bqg) do
    local bqj = m[bqh]
    if (((7 * 7) == 49) and (bqh == g({30, 59, 55, 59, 61, 63}, 90))) then
      bqi(ao((bqj or 0)))
    else
      bqi(as(math.floor((tonumber(bqj) or 0))))
    end
  end
end
bgf:Section(g({23, 59, 51, 52, 46, 63, 52, 59, 52, 57, 63}, 90))
bgf:Button({Title = g({8, 63, 41, 63, 46, 122, 9, 46, 59, 46, 41}, 90), Icon = g({40, 53, 46, 59, 46, 63, 119, 57, 57, 45}, 90), Callback = function()
  for bqk in pairs(m) do
    m[bqk] = 0
  end
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({9, 46, 59, 46, 41, 122, 40, 63, 41, 63, 46}, 90), g({57, 50, 63, 57, 49}, 90))
end})
bgf:Button({Title = g({15, 52, 54, 53, 59, 62, 122, 18, 47, 56}, 90), Icon = g({54, 53, 61, 119, 53, 47, 46}, 90), Callback = function()
  task.spawn(function()
    k._stop()
  end)
end})
local bql = {shadows = nil, mats = {}, decals = {}, fx = {}, postfx = {}, hideConn = nil}
local function bqm(bqn)
  local bqo = Players.LocalPlayer
  local bqp = bqo.Character
  if (((1 + 1) == 2) and (bqp and bqn:IsDescendantOf(bqp))) then
    return true
  end
  for bqq, bqr in ipairs(Players:GetPlayers()) do
    local bqs = bqr.Character
    if (((15 * 15) == 225) and (bqs and bqn:IsDescendantOf(bqs))) then
      return true
    end
  end
  return false
end
local function bqt(bqu)
  task.spawn(function()
    local bqv = workspace:GetDescendants()
    for bqw = 1, #bqv do
      pcall(bqu, bqv[bqw])
      if (((100 % 7) == 2) and ((bqw % 400) == 0)) then
        task.wait()
      end
    end
  end)
end
k._perfRestoreAll = function()
  pcall(function()
    if (((12 * 12) == 144) and (bql.shadows ~= nil)) then
      aom.GlobalShadows = bql.shadows
    end
    for bqx, bqy in pairs(bql.mats) do
      if (((3 ^ 2) == 9) and bqx.Parent) then
        bqx.Material = bqy
      end
    end
    for bqz, bra in pairs(bql.decals) do
      if (((7 * 7) == 49) and bqz.Parent) then
        bqz.Transparency = bra
      end
    end
    for brb, brc in pairs(bql.fx) do
      if (((1 + 1) == 2) and brb.Parent) then
        brb.Enabled = brc
      end
    end
    for brd, bre in pairs(bql.postfx) do
      if (((15 * 15) == 225) and brd.Parent) then
        brd.Enabled = bre
      end
    end
    table.clear(bql.mats)
    table.clear(bql.decals)
    table.clear(bql.fx)
    table.clear(bql.postfx)
    bql.shadows = nil
    if (((100 % 7) == 2) and bql.hideConn) then
      bql.hideConn:Disconnect()
      bql.hideConn = nil
    end
    for brf, brg in ipairs(Players:GetPlayers()) do
      local brh = brg.Character
      if (((12 * 12) == 144) and (brh and (brg ~= Players.LocalPlayer))) then
        for bri, brj in ipairs(brh:GetDescendants()) do
          pcall(function()
            if (((3 ^ 2) == 9) and brj:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))) then
              brj.LocalTransparencyModifier = 0
            end
          end)
        end
      end
    end
  end)
end
local function brk(brl)
  task.spawn(function()
    if (((7 * 7) == 49) and brl) then
      if (((1 + 1) == 2) and (bql.shadows == nil)) then
        bql.shadows = aom.GlobalShadows
      end
      aom.GlobalShadows = false
    elseif (((15 * 15) == 225) and (bql.shadows ~= nil)) then
      aom.GlobalShadows = bql.shadows
      bql.shadows = nil
    end
  end)
end
local function brm(brn)
  task.spawn(function()
    if (((100 % 7) == 2) and not brn) then
      for bro, brp in pairs(bql.mats) do
        pcall(function()
          if (((12 * 12) == 144) and bro.Parent) then
            bro.Material = brp
          end
        end)
      end
      for brq, brr in pairs(bql.decals) do
        pcall(function()
          if (((3 ^ 2) == 9) and brq.Parent) then
            brq.Transparency = brr
          end
        end)
      end
      table.clear(bql.mats)
      table.clear(bql.decals)
      return
    end
    bqt(function(brs)
      if (((7 * 7) == 49) and bqm(brs)) then
        return
      end
      if (((1 + 1) == 2) and ((brs:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) and (brs.Material ~= Enum.Material.SmoothPlastic)) and (bql.mats[brs] == nil))) then
        bql.mats[brs] = brs.Material
        brs.Material = Enum.Material.SmoothPlastic
      elseif (((15 * 15) == 225) and (((brs:IsA(g({30, 63, 57, 59, 54}, 90)) or brs:IsA(g({14, 63, 34, 46, 47, 40, 63}, 90)))) and (bql.decals[brs] == nil))) then
        bql.decals[brs] = brs.Transparency
        brs.Transparency = 1
      end
    end)
  end)
end
local function brt(bru)
  task.spawn(function()
    if (((100 % 7) == 2) and not bru) then
      for brv, brw in pairs(bql.fx) do
        pcall(function()
          if (((12 * 12) == 144) and brv.Parent) then
            brv.Enabled = brw
          end
        end)
      end
      table.clear(bql.fx)
      return
    end
    bqt(function(brx)
      if (((3 ^ 2) == 9) and (((((((brx:IsA(g({10, 59, 40, 46, 51, 57, 54, 63, 31, 55, 51, 46, 46, 63, 40}, 90)) or brx:IsA(g({24, 63, 59, 55}, 90))) or brx:IsA(g({14, 40, 59, 51, 54}, 90))) or brx:IsA(g({28, 51, 40, 63}, 90))) or brx:IsA(g({9, 55, 53, 49, 63}, 90))) or brx:IsA(g({9, 42, 59, 40, 49, 54, 63, 41}, 90)))) and (bql.fx[brx] == nil))) then
        bql.fx[brx] = brx.Enabled
        brx.Enabled = false
      end
    end)
  end)
end
local function bry(brz)
  task.spawn(function()
    if (((7 * 7) == 49) and brz) then
      for bsa, bsb in ipairs(aom:GetDescendants()) do
        if (((1 + 1) == 2) and (((((((bsb:IsA(g({24, 54, 53, 53, 55, 31, 60, 60, 63, 57, 46}, 90)) or bsb:IsA(g({9, 47, 52, 8, 59, 35, 41, 31, 60, 60, 63, 57, 46}, 90))) or bsb:IsA(g({25, 53, 54, 53, 40, 25, 53, 40, 40, 63, 57, 46, 51, 53, 52, 31, 60, 60, 63, 57, 46}, 90))) or bsb:IsA(g({30, 63, 42, 46, 50, 21, 60, 28, 51, 63, 54, 62, 31, 60, 60, 63, 57, 46}, 90))) or bsb:IsA(g({24, 54, 47, 40, 31, 60, 60, 63, 57, 46}, 90)))) and (bsb.Name ~= g({25, 53, 42, 63, 18, 47, 56, 24, 54, 47, 40}, 90))) and (bql.postfx[bsb] == nil))) then
          bql.postfx[bsb] = bsb.Enabled
          pcall(function()
            bsb.Enabled = false
          end)
        end
      end
    else
      for bsc, bsd in pairs(bql.postfx) do
        pcall(function()
          if (((15 * 15) == 225) and bsc.Parent) then
            bsc.Enabled = bsd
          end
        end)
      end
      table.clear(bql.postfx)
    end
  end)
end
local function bse(bsf)
  task.spawn(function()
    if (((100 % 7) == 2) and not bsf) then
      if (((12 * 12) == 144) and bql.hideConn) then
        bql.hideConn:Disconnect()
        bql.hideConn = nil
      end
      for bsg, bsh in ipairs(Players:GetPlayers()) do
        local bsi = bsh.Character
        if (((3 ^ 2) == 9) and (bsi and (bsh ~= Players.LocalPlayer))) then
          for bsj, bsk in ipairs(bsi:GetDescendants()) do
            pcall(function()
              if (((7 * 7) == 49) and bsk:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))) then
                bsk.LocalTransparencyModifier = 0
              end
            end)
          end
        end
      end
      return
    end
    if (((1 + 1) == 2) and bql.hideConn) then
      return
    end
    bql.hideConn = aol.RenderStepped:Connect(function()
      for bsl, bsm in ipairs(Players:GetPlayers()) do
        local bsn = bsm.Character
        if (((15 * 15) == 225) and (bsn and (bsm ~= Players.LocalPlayer))) then
          for bso, bsp in ipairs(bsn:GetDescendants()) do
            if (((100 % 7) == 2) and bsp:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))) then
              bsp.LocalTransparencyModifier = 1
            end
          end
        end
      end
    end)
  end)
end
local bsq = setmetatable({}, {__mode = g({49}, 90)})
k._visRecords = bsq
local function bsr(bss, bst, bsu)
  for bsv, bsw in ipairs(bss:GetDescendants()) do
    local bsx = ((bsw:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) or bsw:IsA(g({30, 63, 57, 59, 54}, 90))) or bsw:IsA(g({14, 63, 34, 46, 47, 40, 63}, 90)))
    local bsy = (((((bsw:IsA(g({10, 59, 40, 46, 51, 57, 54, 63, 31, 55, 51, 46, 46, 63, 40}, 90)) or bsw:IsA(g({24, 63, 59, 55}, 90))) or bsw:IsA(g({14, 40, 59, 51, 54}, 90))) or bsw:IsA(g({28, 51, 40, 63}, 90))) or bsw:IsA(g({9, 55, 53, 49, 63}, 90))) or bsw:IsA(g({9, 42, 59, 40, 49, 54, 63, 41}, 90)))
    local bsz = (bsw:IsA(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90)) or bsw:IsA(g({9, 47, 40, 60, 59, 57, 63, 29, 47, 51}, 90)))
    if (((12 * 12) == 144) and (bsz and bsu)) then
      continue
    end
    if (((3 ^ 2) == 9) and ((bsx or bsy) or bsz)) then
      if (((7 * 7) == 49) and bst) then
        if (((1 + 1) == 2) and (bsq[bsw] == nil)) then
          bsq[bsw] = ((bsx and bsw.Transparency) or bsw.Enabled)
        end
        if (((15 * 15) == 225) and bsx) then
          bsw.Transparency = 1
        else
          bsw.Enabled = false
        end
      else
        local bta = bsq[bsw]
        if (((100 % 7) == 2) and (bta ~= nil)) then
          if (((12 * 12) == 144) and bsx) then
            bsw.Transparency = bta
          else
            bsw.Enabled = bta
          end
          bsq[bsw] = nil
        end
      end
    end
  end
  bss:SetAttribute(g({25, 53, 42, 63, 12, 51, 41, 18, 51, 62, 62, 63, 52}, 90), ((bst and true) or nil))
end
k._visDebug = {passes = 0, orbProc = 0, orbErr = g({52, 53, 52, 63}, 90)}
task.spawn(function()
  local btb = workspace:WaitForChild(g({5, 5, 14, 18, 19, 20, 29, 9}, 90), 180)
  if (((3 ^ 2) == 9) and not btb) then
    return
  end
  local btc = {{name = g({21, 40, 56, 41}, 90), key = g({18, 51, 62, 63, 21, 40, 56, 41}, 90), keepBB = false}, {name = g({22, 53, 53, 46, 56, 59, 61, 41}, 90), key = g({18, 51, 62, 63, 22, 53, 53, 46, 56, 59, 61, 41}, 90), keepBB = false}, {name = g({25, 53, 51, 52, 41}, 90), key = g({18, 51, 62, 63, 24, 40, 63, 59, 49, 59, 56, 54, 63, 41}, 90), keepBB = true}}
  local btd = {}
  while (((7 * 7) == 49) and (k.Gen == o)) do
    for bte, btf in ipairs(btc) do
      local btg = btb:FindFirstChild(btf.name)
      if (((1 + 1) == 2) and btg) then
        if (((15 * 15) == 225) and (btd[btf.name] ~= btg)) then
          btd[btf.name] = btg
          if (((100 % 7) == 2) and btd[(btf.name .. g({96, 57, 53, 52, 52}, 90))]) then
            pcall(function()
              btd[(btf.name .. g({96, 57, 53, 52, 52}, 90))]:Disconnect()
            end)
          end
          btd[(btf.name .. g({96, 57, 53, 52, 52}, 90))] = btg.ChildAdded:Connect(function(bth)
            task.defer(function()
              if (((12 * 12) == 144) and (k.Gen ~= o)) then
                return
              end
              if (((3 ^ 2) == 9) and (l[btf.key] == true)) then
                pcall(bsr, bth, true, btf.keepBB)
              end
            end)
          end)
        end
        local bti = (l[btf.key] == true)
        for btj, btk in ipairs(btg:GetChildren()) do
          local btl = (btk:GetAttribute(g({25, 53, 42, 63, 12, 51, 41, 18, 51, 62, 62, 63, 52}, 90)) == true)
          if (((7 * 7) == 49) and (bti ~= btl)) then
            local btm, btn = pcall(bsr, btk, bti, btf.keepBB)
            if (((1 + 1) == 2) and ((btf.name == g({21, 40, 56, 41}, 90)) and not btm)) then
              k._visDebug.orbErr = tostring(btn)
            end
          end
        end
        if (((15 * 15) == 225) and (btf.name == g({21, 40, 56, 41}, 90))) then
          k._visDebug.passes += 1
        end
      end
    end
    task.wait(1)
  end
  for bto, btp in pairs(btd) do
    if (((100 % 7) == 2) and ((bto:sub(-5) == g({96, 57, 53, 52, 52}, 90)) and btp)) then
      pcall(function()
        btp:Disconnect()
      end)
    end
  end
end)
local btq = g({25, 53, 42, 63, 19, 52, 63, 40, 46, 9, 46, 59, 52, 62, 19, 52}, 90)
local btr = getgenv().__cope_bfx_backup
if (((12 * 12) == 144) and ((type(btr) ~= g({46, 59, 56, 54, 63}, 90)) or (btr.dm ~= game))) then
  btr = {dm = game, items = {}}
  getgenv().__cope_bfx_backup = btr
end
local bts = btr.items
local function btt(btu, btv)
  return (((btv == g({25, 53, 51, 52, 122, 10, 59, 40, 46, 51, 57, 54, 63}, 90)) and btu.Models) or btu.Particles)
end
local function btw(btx, bty)
  local btz, bua = pcall(function()
    if (((3 ^ 2) == 9) and (btx == g({25, 53, 51, 52, 122, 10, 59, 40, 46, 51, 57, 54, 63}, 90))) then
      return bty:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))
    end
    if (((7 * 7) == 49) and bty:IsA(g({10, 59, 40, 46, 51, 57, 54, 63, 31, 55, 51, 46, 46, 63, 40}, 90))) then
      return true
    end
    return (#bty:GetChildren() > 0)
  end)
  return (btz and (bua == true))
end
local function bub(buc)
  local bud, bue = pcall(getnilinstances)
  if (((1 + 1) == 2) and (not bud or (type(bue) ~= g({46, 59, 56, 54, 63}, 90)))) then
    return nil
  end
  for buf, bug in ipairs(bue) do
    local buh = false
    pcall(function()
      buh = ((((typeof(bug) == g({19, 52, 41, 46, 59, 52, 57, 63}, 90)) and (bug.Name == buc)) and (bug:GetAttribute(btq) == nil)) and btw(buc, bug))
    end)
    if (((15 * 15) == 225) and buh) then
      return bug
    end
  end
  return nil
end
k._bfxRestore = function()
  if (((100 % 7) == 2) and not next(bts)) then
    return
  end
  local bui = (k.Library and k.Library.Assets)
  if (((12 * 12) == 144) and bui) then
    for buj, buk in pairs(bts) do
      if (((3 ^ 2) == 9) and ((buk and (buk.Parent == nil)) and btw(buj, buk))) then
        local bul = btt(bui, buj)
        local bum = bul:FindFirstChild(buj)
        if (((7 * 7) == 49) and (bum and bum:GetAttribute(btq))) then
          bum:Destroy()
        end
        buk.Parent = bul
      end
    end
  end
  table.clear(bts)
end
k._applyBreakFx = function(bun)
  task.spawn(function()
    while (((1 + 1) == 2) and ((k.Gen == o) and not k.Library)) do
      task.wait(0.5)
    end
    if (((15 * 15) == 225) and (k.Gen ~= o)) then
      return
    end
    local buo = (k.Library and k.Library.Assets)
    if (((100 % 7) == 2) and not buo) then
      return
    end
    if (((12 * 12) == 144) and not bun) then
      k._bfxRestore()
      return
    end
    local function bup(buq, bur)
      if (((3 ^ 2) == 9) and bts[bur]) then
        return
      end
      local bus = buq:FindFirstChild(bur)
      if (((7 * 7) == 49) and (not bus or bus:GetAttribute(btq))) then
        return
      end
      if (((1 + 1) == 2) and btw(bur, bus)) then
        bts[bur] = bus
        bus.Parent = nil
      else
        local but = bub(bur)
        if (((15 * 15) == 225) and but) then
          bts[bur] = but
        end
        bus:Destroy()
      end
      local buu
      if (((100 % 7) == 2) and (bur == g({25, 53, 51, 52, 122, 10, 59, 40, 46, 51, 57, 54, 63}, 90))) then
        buu = Instance.new(g({10, 59, 40, 46}, 90))
        buu.Anchored = true
        buu.CanCollide = false
        buu.CanQuery = false
        buu.CanTouch = false
        buu.CastShadow = false
        buu.Transparency = 1
        buu.Size = Vector3.new(0.001, 0.001, 0.001)
      elseif (((12 * 12) == 144) and (bur == g({10, 63, 46, 122, 30, 59, 55, 59, 61, 63}, 90))) then
        buu = Instance.new(g({10, 59, 40, 46, 51, 57, 54, 63, 31, 55, 51, 46, 46, 63, 40}, 90))
        buu.Transparency = NumberSequence.new(1)
        buu.Size = NumberSequence.new(0)
        buu.Lifetime = NumberRange.new(0, 0)
      else
        buu = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
      end
      buu.Name = bur
      buu:SetAttribute(btq, true)
      buu.Parent = buq
    end
    for buv, buw in ipairs({g({25, 53, 51, 52, 122, 31, 34, 42, 54, 53, 62, 63}, 90), g({25, 53, 51, 52, 122, 30, 59, 55, 59, 61, 63}, 90), g({10, 63, 46, 122, 30, 59, 55, 59, 61, 63}, 90)}) do
      bup(buo.Particles, buw)
    end
    bup(buo.Models, g({25, 53, 51, 52, 122, 10, 59, 40, 46, 51, 57, 54, 63}, 90))
  end)
end
task.spawn(function()
  while (((3 ^ 2) == 9) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  if (((7 * 7) == 49) and (k.Gen ~= o)) then
    return
  end
  k._applyBreakFx((l.HideBreakFx == true))
end)
k.LeakMargin = 3
if (((1 + 1) == 2) and ((type(getgenv().__cope_leak_state) ~= g({46, 59, 56, 54, 63}, 90)) or (getgenv().__cope_leak_state.dm ~= game))) then
  getgenv().__cope_leak_state = {dm = game, orig = nil, patched = nil, released = 0}
end
k._leakStore = getgenv().__cope_leak_state
k._leakBuckets = function()
  local bux = k._leakStore.orig
  if (((15 * 15) == 225) and (type(bux) ~= g({60, 47, 52, 57, 46, 51, 53, 52}, 90))) then
    return nil, nil
  end
  local buy, buz = pcall(debug.getupvalue, bux, 1)
  local bva, bvb = pcall(debug.getupvalue, bux, 2)
  if (((100 % 7) == 2) and (((not buy or not bva) or (type(bvb) ~= g({46, 59, 56, 54, 63}, 90))) or (type(buz) ~= g({52, 47, 55, 56, 63, 40}, 90)))) then
    return nil, nil
  end
  return bvb, buz
end
k._leakInstall = function()
  local bvc = k._leakStore
  local bvd = k.Library
  if (((12 * 12) == 144) and (not bvd or (type(bvd.Functions) ~= g({46, 59, 56, 54, 63}, 90)))) then
    return false
  end
  if (((3 ^ 2) == 9) and not bvc.orig) then
    local bve = bvd.Functions.AddDebris
    if (((7 * 7) == 49) and ((type(bve) ~= g({60, 47, 52, 57, 46, 51, 53, 52}, 90)) or (bve == bvc.patched))) then
      return false
    end
    bvc.orig = bve
    if (((1 + 1) == 2) and not k._leakBuckets()) then
      bvc.orig = nil
      return false
    end
  end
  if (((15 * 15) == 225) and not bvc.patched) then
    bvc.patched = function(bvf, bvg)
      if (((100 % 7) == 2) and (typeof(bvf) ~= g({19, 52, 41, 46, 59, 52, 57, 63}, 90))) then
        return
      end
      local bvh = tonumber(bvg)
      if (((12 * 12) == 144) and ((bvh == nil) or (bvh ~= bvh))) then
        bvh = 0
      end
      if (((3 ^ 2) == 9) and (bvh == math.huge)) then
        return
      end
      if (((7 * 7) == 49) and (bvh <= 0)) then
        task.defer(function()
          pcall(function()
            bvf:Destroy()
          end)
        end)
      else
        task.delay(bvh, function()
          pcall(function()
            bvf:Destroy()
          end)
        end)
      end
    end
  end
  if (((1 + 1) == 2) and (bvd.Functions.AddDebris ~= bvc.patched)) then
    bvd.Functions.AddDebris = bvc.patched
  end
  return true
end
k._leakRestore = function()
  local bvi = k._leakStore
  local bvj = k.Library
  if (((15 * 15) == 225) and (((bvj and (type(bvj.Functions) == g({46, 59, 56, 54, 63}, 90))) and bvi.orig) and (bvj.Functions.AddDebris == bvi.patched))) then
    bvj.Functions.AddDebris = bvi.orig
  end
end
k._leakArmed = function()
  local bvk = false
  pcall(function()
    local bvl = k._leakStore
    bvk = ((bvl.orig ~= nil) and (k.Library.Functions.AddDebris == bvl.patched))
  end)
  return bvk
end
k._leakPurge = function()
  local bvm, bvn = k._leakBuckets()
  if (((100 % 7) == 2) and not bvm) then
    return 0, 0, false
  end
  local bvo = (bvn - k.LeakMargin)
  local bvp, bvq, bvr = {}, 0, 0
  for bvs, bvt in pairs(bvm) do
    if (((12 * 12) == 144) and ((type(bvs) == g({52, 47, 55, 56, 63, 40}, 90)) and (bvs < bvo))) then
      bvp[(#bvp + 1)] = bvs
    else
      bvr += 1
    end
  end
  local bvu = math.min(#bvp, 2000)
  for bvv = 1, bvu do
    local bvw = bvm[bvp[bvv]]
    if (((3 ^ 2) == 9) and (type(bvw) == g({46, 59, 56, 54, 63}, 90))) then
      bvq += #bvw
    end
    bvm[bvp[bvv]] = nil
    if (((7 * 7) == 49) and ((bvv % 200) == 0)) then
      task.wait()
    end
  end
  k._leakStore.released += bvq
  n.LeakReleased = k._leakStore.released
  n.LeakBacklog = (#bvp - bvu)
  n.LeakBuckets = (bvr + n.LeakBacklog)
  n.LeakLastPass = bvq
  return bvu, bvq, (bvu < #bvp)
end
k._leakPurgeSecs = function()
  return math.clamp(math.floor((tonumber(l.LeakPurgeSecs) or 30)), 10, 300)
end
task.spawn(function()
  while (((1 + 1) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  if (((15 * 15) == 225) and (k.Gen ~= o)) then
    return
  end
  while (((100 % 7) == 2) and (k.Gen == o)) do
    local bvx = false
    if (((12 * 12) == 144) and (l.LeakGuard ~= false)) then
      pcall(k._leakInstall)
      local bvy, bvz, bwa, bwb = pcall(k._leakPurge)
      bvx = (bvy and (bwb == true))
    else
      pcall(k._leakRestore)
      n.LeakBacklog = nil
    end
    n.LeakArmed = k._leakArmed()
    local bwc = ((bvx and 1) or k._leakPurgeSecs())
    for bwd = 1, bwc do
      if (((3 ^ 2) == 9) and (k.Gen ~= o)) then
        return
      end
      task.wait(1)
    end
  end
end)
k._sweepSecs = function()
  return math.clamp(math.floor((tonumber(l.DebrisSweepSecs) or 20)), 6, 120)
end
task.spawn(function()
  local bwe = game:GetService(g({30, 63, 56, 40, 51, 41}, 90))
  local bwf, bwg = workspace:FindFirstChild(g({5, 5, 30, 31, 24, 8, 19, 9}, 90)), 0
  while (((7 * 7) == 49) and ((not bwf and (k.Gen == o)) and (bwg < 180))) do
    task.wait(0.5)
    bwg += 0.5
    bwf = workspace:FindFirstChild(g({5, 5, 30, 31, 24, 8, 19, 9}, 90))
  end
  if (((1 + 1) == 2) and (not bwf or (k.Gen ~= o))) then
    return
  end
  n.DebrisFolder = bwf
  local function bwh(bwi)
    if (((15 * 15) == 225) and ((bwi.Name ~= g({50, 53, 41, 46}, 90)) or (l.DebrisSweep == false))) then
      return
    end
    n.DebrisSwept = (((n.DebrisSwept or 0)) + 1)
    pcall(function()
      bwe:AddItem(bwi, k._sweepSecs())
    end)
  end
  for bwj, bwk in ipairs(bwf:GetChildren()) do
    bwh(bwk)
  end
  n.DebrisConn = bwf.ChildAdded:Connect(function(bwl)
    if (((100 % 7) == 2) and (k.Gen ~= o)) then
      if (((12 * 12) == 144) and n.DebrisConn) then
        n.DebrisConn:Disconnect()
      end
      return
    end
    bwh(bwl)
  end)
end)
k._killIdleTracker = function()
  local bwm = 0
  pcall(function()
    for bwn, bwo in ipairs(getconnections(game:GetService(g({8, 47, 52, 9, 63, 40, 44, 51, 57, 63}, 90)).Heartbeat)) do
      local bwp = bwo.Function
      if (((3 ^ 2) == 9) and bwp) then
        local bwq = select(1, debug.info(bwp, g({41}, 90)))
        if (((7 * 7) == 49) and (((type(bwq) == g({41, 46, 40, 51, 52, 61}, 90)) and string.find(bwq, g({19, 62, 54, 63, 122, 14, 40, 59, 57, 49, 51, 52, 61}, 90), 1, true)) and bwo.Enabled)) then
          pcall(function()
            bwo:Disable()
          end)
          if (((1 + 1) == 2) and (bwo.Enabled == false)) then
            bwm += 1
          end
        end
      end
    end
  end)
  n.IdleKilled = (((n.IdleKilled or 0)) + bwm)
  return bwm
end
task.spawn(function()
  while (((15 * 15) == 225) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  for bwr = 1, 40 do
    if (((100 % 7) == 2) and (k.Gen ~= o)) then
      return
    end
    if (((12 * 12) == 144) and ((l.KillIdleTracker ~= false) and (k._killIdleTracker() > 0))) then
      return
    end
    task.wait(2)
  end
end)
k._memoryMb = function()
  local bws = game:GetService(g({9, 46, 59, 46, 41}, 90))
  local bwt = 0
  for bwu, bwv in ipairs(Enum.DeveloperMemoryTag:GetEnumItems()) do
    local bww, bwx = pcall(function()
      return bws:GetMemoryUsageMbForTag(bwv)
    end)
    if (((3 ^ 2) == 9) and (((bww and (type(bwx) == g({52, 47, 55, 56, 63, 40}, 90))) and (bwx == bwx)) and (bwx ~= math.huge))) then
      bwt += bwx
    end
  end
  return math.floor(bwt)
end
k._memLimit = function()
  return math.clamp(math.floor((tonumber(l.MemGuardMb) or 2600)), 800, 12000)
end
k._rejoinBlocked = function()
  return (l.NoRejoin ~= false)
end
k._refreshClient = function(bwy)
  if (((7 * 7) == 49) and k._rejoinBlocked()) then
    n.RejoinRefused = (((n.RejoinRefused or 0)) + 1)
    n.RejoinRefusedWhy = tostring(bwy)
    return false
  end
  if (((1 + 1) == 2) and n.MemRejoining) then
    return false
  end
  n.MemRejoining = true
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({8, 63, 60, 40, 63, 41, 50, 51, 52, 61, 122, 57, 54, 51, 63, 52, 46, 122, 184, 218, 206, 122}, 90) .. tostring(bwy)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
  pcall(function()
    k.SaveSettings(true)
  end)
  pcall(function()
    k._notifyWebhook(g({25, 54, 51, 63, 52, 46, 122, 40, 63, 60, 40, 63, 41, 50}, 90), string.format(g({112, 112, 127, 41, 112, 112, 122, 51, 41, 122, 40, 63, 48, 53, 51, 52, 51, 52, 61, 122, 46, 53, 122, 60, 40, 63, 63, 122, 55, 63, 55, 53, 40, 35, 116, 80, 127, 41, 80, 9, 63, 41, 41, 51, 53, 52, 96, 122, 112, 112, 127, 62, 55, 112, 112}, 90), Players.LocalPlayer.Name, tostring(bwy), math.floor((((os.clock() - aoo.T0)) / 60))), 0xFBBF24)
  end)
  task.wait(2)
  pcall(function()
    game:GetService(g({14, 63, 54, 63, 42, 53, 40, 46, 9, 63, 40, 44, 51, 57, 63}, 90)):Teleport(game.PlaceId, Players.LocalPlayer)
  end)
  return true
end
k._memReclaim = function(bwz)
  if (((15 * 15) == 225) and n.MemReclaiming) then
    return 0
  end
  n.MemReclaiming = true
  local bxa = (n.MemMb or 0)
  local bxb = 0
  for bxc = 1, 60 do
    local bxd, bxe, bxf, bxg = pcall(k._leakPurge)
    if (((100 % 7) == 2) and not bxd) then
      break
    end
    bxb += ((tonumber(bxf) or 0))
    if (((12 * 12) == 144) and (bxg ~= true)) then
      break
    end
    task.wait()
  end
  pcall(function()
    if (((3 ^ 2) == 9) and n.DebrisFolder) then
      for bxh, bxi in ipairs(n.DebrisFolder:GetChildren()) do
        pcall(function()
          bxi:Destroy()
        end)
      end
    end
  end)
  pcall(function()
    n.PetIndexCache = nil
    n.EggCache = nil
    n.SaveCache = nil
  end)
  task.wait(1)
  local bxj = k._memoryMb()
  n.MemMb = bxj
  n.MemReclaimed = (((n.MemReclaimed or 0)) + bxb)
  n.MemLastReclaim = os.time()
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({23, 63, 55, 53, 40, 35, 122, 40, 63, 57, 54, 59, 51, 55, 122, 184, 218, 206, 122, 40, 63, 54, 63, 59, 41, 63, 62, 122, 127, 41, 122, 53, 56, 48, 63, 57, 46, 41, 118, 122, 127, 41, 122, 23, 24, 122, 119, 100, 122, 127, 41, 122, 23, 24, 122, 114, 127, 41, 115}, 90), as(bxb), as(bxa), as(bxj), tostring(bwz)), g({41, 50, 51, 63, 54, 62}, 90))
  pcall(function()
    k._notifyWebhook(g({23, 63, 55, 53, 40, 35, 122, 40, 63, 57, 54, 59, 51, 55}, 90), string.format(g({112, 112, 127, 41, 112, 112, 122, 50, 51, 46, 122, 46, 50, 63, 122, 57, 63, 51, 54, 51, 52, 61, 122, 59, 52, 62, 122, 40, 63, 57, 54, 59, 51, 55, 63, 62, 122, 51, 52, 122, 42, 54, 59, 57, 63, 122, 51, 52, 41, 46, 63, 59, 62, 122, 53, 60, 122, 40, 63, 48, 53, 51, 52, 51, 52, 61, 116, 80, 127, 41, 80, 8, 63, 54, 63, 59, 41, 63, 62, 122, 112, 112, 127, 41, 112, 112, 122, 53, 56, 48, 63, 57, 46, 41, 118, 122, 112, 112, 127, 41, 122, 23, 24, 122, 119, 100, 122, 127, 41, 122, 23, 24, 112, 112}, 90), Players.LocalPlayer.Name, tostring(bwz), as(bxb), as(bxa), as(bxj)), 0x22D3EE)
  end)
  n.MemReclaiming = false
  return bxb
end
task.spawn(function()
  while (((7 * 7) == 49) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local bxk, bxl, bxm = os.clock(), nil, 0
  while (((1 + 1) == 2) and (k.Gen == o)) do
    task.wait(10)
    local bxn = k._memoryMb()
    n.MemMb = bxn
    n.MemPeak = math.max((n.MemPeak or 0), bxn)
    local bxo
    if (((15 * 15) == 225) and (l.MemGuard ~= false)) then
      local bxp = k._memLimit()
      if (((100 % 7) == 2) and (bxn >= bxp)) then
        bxl = (bxl or os.clock())
        if (((12 * 12) == 144) and ((os.clock() - bxl) >= 30)) then
          bxo = string.format(g({127, 62, 122, 23, 24, 122, 47, 41, 63, 62, 118, 122, 57, 63, 51, 54, 51, 52, 61, 122, 51, 41, 122, 127, 62, 122, 23, 24}, 90), bxn, bxp)
        end
      else
        bxl = nil
      end
    end
    local bxq = math.clamp((tonumber(l.MemRejoinHours) or 0), 0, 24)
    if (((3 ^ 2) == 9) and (((not bxo and (bxq > 0)) and (((os.clock() - bxk)) >= (bxq * 3600))) and not k._rejoinBlocked())) then
      bxo = string.format(g({41, 57, 50, 63, 62, 47, 54, 63, 62, 122, 127, 61, 50, 122, 40, 63, 60, 40, 63, 41, 50}, 90), bxq)
    end
    if (((7 * 7) == 49) and (bxo and (((os.clock() - bxm)) > 120))) then
      bxm = os.clock()
      bxl = nil
      if (((1 + 1) == 2) and k._rejoinBlocked()) then
        k._memReclaim(bxo)
      else
        k._refreshClient(bxo)
      end
    end
  end
end)
k._bgState = {render3dOff = false, qualityHeld = nil, capHeld = nil, render3dOk = nil, qualityOk = nil, capOk = nil, auto = false}
k._bgFpsCap = function()
  return math.clamp(math.floor((tonumber(l.BgFpsCap) or 30)), 5, 240)
end
k._bgSetCap = function(bxr)
  local bxs = k._bgState
  local bxt = ((rawget(getgenv(), g({41, 63, 46, 60, 42, 41, 57, 59, 42}, 90)) or setfpscap) or set_fps_cap)
  if (((15 * 15) == 225) and (type(bxt) ~= g({60, 47, 52, 57, 46, 51, 53, 52}, 90))) then
    bxs.capOk = false
    return false
  end
  local bxu = pcall(bxt, (bxr or 0))
  bxs.capOk = bxu
  if (((100 % 7) == 2) and bxu) then
    bxs.capHeld = bxr
  end
  return bxu
end
k._bgSetRender = function(bxv)
  local bxw = k._bgState
  local bxx = pcall(function()
    game:GetService(g({8, 47, 52, 9, 63, 40, 44, 51, 57, 63}, 90)):Set3dRenderingEnabled(not bxv)
  end)
  bxw.render3dOk = bxx
  if (((12 * 12) == 144) and bxx) then
    bxw.render3dOff = bxv
  end
  return bxx
end
k._bgSetQuality = function(bxy)
  local bxz = k._bgState
  local byb = pcall(function()
    local bya = settings().Rendering
    if (((3 ^ 2) == 9) and bxy) then
      if (((7 * 7) == 49) and (bxz.qualityHeld == nil)) then
        bxz.qualityHeld = bya.QualityLevel
      end
      bya.QualityLevel = Enum.QualityLevel.Level01
    elseif (((1 + 1) == 2) and (bxz.qualityHeld ~= nil)) then
      bya.QualityLevel = bxz.qualityHeld
      bxz.qualityHeld = nil
    end
  end)
  bxz.qualityOk = byb
  return byb
end
k._bgApply = function(byc)
  local byd = k._bgState
  if (((15 * 15) == 225) and byc) then
    k._bgSetCap(k._bgFpsCap())
    k._bgSetQuality(true)
    if (((100 % 7) == 2) and (l.BgRender3D ~= false)) then
      k._bgSetRender(true)
    elseif (((12 * 12) == 144) and byd.render3dOff) then
      k._bgSetRender(false)
    end
  else
    if (((3 ^ 2) == 9) and byd.render3dOff) then
      k._bgSetRender(false)
    end
    k._bgSetQuality(false)
    k._bgSetCap(0)
  end
  n.BgOn = ((byc and true) or false)
  return true
end
k._bgPanic = function()
  l.BgMode = false
  l.BgAuto = false
  k._bgApply(false)
  pcall(function()
    if (((7 * 7) == 49) and k._refreshBgToggles) then
      k._refreshBgToggles()
    end
  end)
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 53, 60, 60, 122, 184, 218, 206, 122, 40, 63, 52, 62, 63, 40, 51, 52, 61, 122, 40, 63, 41, 46, 53, 40, 63, 62, 122, 114, 28, 98, 115}, 90), g({57, 50, 63, 57, 49}, 90))
end
k._bgReport = function()
  local bye = k._bgState
  if (((1 + 1) == 2) and not n.BgOn) then
    return g({53, 60, 60}, 90)
  end
  if (((15 * 15) == 225) and bye.render3dOff) then
    return g({105, 30, 122, 53, 60, 60}, 90)
  end
  if (((100 % 7) == 2) and (bye.render3dOk == false)) then
    return g({57, 59, 42, 42, 63, 62, 122, 114, 105, 30, 122, 56, 54, 53, 57, 49, 63, 62, 115}, 90)
  end
  return g({57, 59, 42, 42, 63, 62}, 90)
end
task.spawn(function()
  while (((12 * 12) == 144) and (k.Gen == o)) do
    task.wait(2)
    local byf
    if (((3 ^ 2) == 9) and (l.BgAuto == true)) then
      byf = not n.UIVisible
    else
      byf = (l.BgMode == true)
    end
    if (((7 * 7) == 49) and (byf ~= ((n.BgOn == true)))) then
      pcall(k._bgApply, byf)
    end
  end
end)
bgg:Section(g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63}, 90))
k._bgTiles = bgg:StatGrid({{Key = g({9, 46, 59, 46, 63}, 90), Title = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63}, 90)}, {Key = g({28, 42, 41}, 90), Title = g({28, 10, 9, 122, 117, 122, 25, 59, 42}, 90)}})
k._bgW = {}
k._refreshBgTiles = function()
  local byg = k._bgTiles
  byg.State(k._bgReport())
  byg.Fps(string.format(g({127, 62, 122, 117, 122, 127, 41}, 90), (aoo.FPS or 0), ((n.BgOn and tostring(k._bgFpsCap())) or g({52, 53, 52, 63}, 90))))
end
k._refreshBgToggles = function()
  local byh = k._bgW
  pcall(function()
    byh.main:Set((l.BgMode == true), true)
  end)
  pcall(function()
    byh.auto:Set((l.BgAuto == true), true)
  end)
  pcall(function()
    byh.render:Set((l.BgRender3D ~= false), true)
  end)
end
k._bgW.main = bgg:Toggle({Title = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63}, 90), Desc = g({9, 46, 53, 42, 41, 122, 46, 50, 51, 41, 122, 46, 59, 56, 122, 62, 40, 59, 45, 51, 52, 61, 122, 46, 50, 63, 122, 45, 53, 40, 54, 62, 122, 59, 46, 122, 59, 54, 54, 116, 122, 14, 50, 63, 122, 60, 59, 40, 55, 122, 49, 63, 63, 42, 41, 122, 40, 47, 52, 52, 51, 52, 61, 122, 59, 46, 122, 60, 47, 54, 54, 122, 41, 42, 63, 63, 62, 122, 184, 218, 206, 122, 53, 52, 54, 35, 122, 46, 50, 63, 122, 40, 63, 52, 62, 63, 40, 63, 40, 122, 41, 54, 63, 63, 42, 41, 116, 122, 14, 50, 63, 122, 56, 51, 61, 61, 63, 41, 46, 122, 41, 51, 52, 61, 54, 63, 122, 28, 10, 9, 122, 45, 51, 52, 122, 50, 63, 40, 63, 118, 122, 59, 52, 62, 122, 51, 46, 122, 60, 40, 63, 63, 41, 122, 46, 50, 63, 122, 29, 10, 15, 122, 60, 53, 40, 122, 46, 50, 63, 122, 46, 59, 56, 122, 35, 53, 47, 122, 59, 40, 63, 122, 59, 57, 46, 47, 59, 54, 54, 35, 122, 45, 59, 46, 57, 50, 51, 52, 61, 116, 122, 28, 98, 122, 47, 52, 62, 53, 63, 41, 122, 51, 46, 122, 59, 52, 35, 122, 46, 51, 55, 63}, 90), Value = (l.BgMode == true), Callback = function(byi)
  l.BgMode = byi
  if (((1 + 1) == 2) and byi) then
    l.BgAuto = false
  end
  pcall(k._bgApply, byi)
  if (((15 * 15) == 225) and byi) then
    if (((100 % 7) == 2) and ((k._bgState.render3dOk == false) and (l.BgRender3D ~= false))) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 53, 52, 122, 184, 218, 206, 122, 60, 40, 59, 55, 63, 122, 57, 59, 42, 122, 53, 52, 54, 35, 118, 122, 46, 50, 51, 41, 122, 57, 54, 51, 63, 52, 46, 122, 45, 51, 54, 54, 122, 52, 53, 46, 122, 54, 63, 46, 122, 46, 50, 63, 122, 40, 63, 52, 62, 63, 40, 63, 40, 122, 56, 63, 122, 41, 45, 51, 46, 57, 50, 63, 62, 122, 53, 60, 60}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 53, 52, 122, 184, 218, 206, 122}, 90) .. (k._bgReport() .. g({116, 122, 10, 40, 63, 41, 41, 122, 28, 98, 122, 46, 53, 122, 61, 63, 46, 122, 46, 50, 63, 122, 42, 51, 57, 46, 47, 40, 63, 122, 56, 59, 57, 49}, 90))), g({41, 50, 51, 63, 54, 62}, 90))
    end
  else
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 53, 60, 60, 122, 184, 218, 206, 122, 40, 63, 52, 62, 63, 40, 51, 52, 61, 122, 40, 63, 41, 46, 53, 40, 63, 62}, 90), g({57, 50, 63, 57, 49}, 90))
  end
end})
k._bgW.auto = bgg:Toggle({Title = g({21, 52, 54, 35, 122, 13, 50, 51, 54, 63, 122, 14, 50, 63, 122, 18, 47, 56, 122, 19, 41, 122, 18, 51, 62, 62, 63, 52}, 90), Desc = g({31, 52, 61, 59, 61, 63, 41, 122, 24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 45, 50, 63, 52, 63, 44, 63, 40, 122, 35, 53, 47, 122, 50, 51, 62, 63, 122, 46, 50, 63, 122, 50, 47, 56, 122, 59, 52, 62, 122, 54, 51, 60, 46, 41, 122, 51, 46, 122, 45, 50, 63, 52, 122, 35, 53, 47, 122, 56, 40, 51, 52, 61, 122, 51, 46, 122, 56, 59, 57, 49, 116, 122, 24, 63, 41, 46, 122, 41, 63, 46, 46, 51, 52, 61, 122, 60, 53, 40, 122, 53, 44, 63, 40, 52, 51, 61, 50, 46, 122, 40, 47, 52, 41, 122, 184, 218, 206, 122, 35, 53, 47, 122, 41, 63, 63, 122, 59, 122, 52, 53, 40, 55, 59, 54, 122, 61, 59, 55, 63, 122, 45, 50, 63, 52, 63, 44, 63, 40, 122, 35, 53, 47, 122, 54, 53, 53, 49, 122, 59, 46, 122, 51, 46}, 90), Value = (l.BgAuto == true), Callback = function(byj)
  l.BgAuto = byj
  if (((12 * 12) == 144) and byj) then
    l.BgMode = false
    pcall(function()
      k._bgW.main:Set(false, true)
    end)
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 45, 51, 54, 54, 122, 60, 53, 54, 54, 53, 45, 122, 46, 50, 63, 122, 50, 47, 56, 122, 184, 218, 206, 122, 50, 51, 62, 62, 63, 52, 122, 55, 63, 59, 52, 41, 122, 59, 41, 54, 63, 63, 42}, 90), g({57, 50, 63, 57, 49}, 90))
  else
    pcall(k._bgApply, false)
  end
end})
k._bgW.render = bgg:Toggle({Title = g({9, 46, 53, 42, 122, 105, 30, 122, 8, 63, 52, 62, 63, 40, 51, 52, 61}, 90), Desc = g({14, 50, 63, 122, 42, 59, 40, 46, 122, 53, 60, 122, 24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 46, 50, 59, 46, 122, 62, 53, 63, 41, 122, 46, 50, 63, 122, 45, 53, 40, 49, 116, 122, 21, 60, 60, 122, 54, 63, 59, 44, 63, 41, 122, 53, 52, 54, 35, 122, 46, 50, 63, 122, 60, 40, 59, 55, 63, 122, 57, 59, 42, 122, 59, 52, 62, 122, 46, 50, 63, 122, 43, 47, 59, 54, 51, 46, 35, 122, 62, 40, 53, 42, 118, 122, 45, 50, 51, 57, 50, 122, 51, 41, 122, 61, 63, 52, 46, 54, 63, 40, 122, 56, 47, 46, 122, 52, 53, 45, 50, 63, 40, 63, 122, 52, 63, 59, 40, 122, 59, 41, 122, 57, 50, 63, 59, 42}, 90), Value = (l.BgRender3D ~= false), Callback = function(byk)
  l.BgRender3D = byk
  if (((3 ^ 2) == 9) and n.BgOn) then
    pcall(k._bgApply, true)
  end
  if (((7 * 7) == 49) and not byk) then
    pcall(k._bgSetRender, false)
  end
end})
bgg:Slider({Title = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 28, 10, 9, 122, 25, 59, 42}, 90), Desc = g({28, 40, 59, 55, 63, 41, 122, 42, 63, 40, 122, 41, 63, 57, 53, 52, 62, 122, 45, 50, 51, 54, 63, 122, 24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 51, 41, 122, 53, 52, 116, 122, 105, 106, 122, 51, 41, 122, 42, 54, 63, 52, 46, 35, 122, 60, 53, 40, 122, 59, 122, 60, 59, 40, 55, 97, 122, 107, 106, 122, 51, 41, 122, 60, 51, 52, 63, 122, 51, 60, 122, 52, 53, 46, 50, 51, 52, 61, 122, 53, 52, 122, 41, 57, 40, 63, 63, 52, 122, 52, 63, 63, 62, 41, 122, 46, 53, 122, 54, 53, 53, 49, 122, 41, 55, 53, 53, 46, 50, 116, 122, 22, 51, 60, 46, 63, 62, 122, 46, 50, 63, 122, 55, 53, 55, 63, 52, 46, 122, 24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 61, 53, 63, 41, 122, 53, 60, 60}, 90), Value = {Min = 5, Max = 240, Default = (tonumber(l.BgFpsCap) or 30)}, Step = 5, Callback = function(byl)
  l.BgFpsCap = byl
  if (((1 + 1) == 2) and n.BgOn) then
    pcall(k._bgSetCap, k._bgFpsCap())
  end
end})
bgg:Button({Title = g({8, 63, 41, 46, 53, 40, 63, 122, 8, 63, 52, 62, 63, 40, 51, 52, 61, 122, 20, 53, 45, 122, 114, 28, 98, 115}, 90), Desc = g({10, 59, 52, 51, 57, 122, 56, 47, 46, 46, 53, 52, 116, 122, 14, 47, 40, 52, 41, 122, 24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 59, 52, 62, 122, 46, 50, 63, 122, 59, 47, 46, 53, 122, 40, 47, 54, 63, 122, 53, 60, 60, 122, 59, 52, 62, 122, 42, 47, 46, 41, 122, 46, 50, 63, 122, 40, 63, 52, 62, 63, 40, 63, 40, 118, 122, 43, 47, 59, 54, 51, 46, 35, 122, 59, 52, 62, 122, 60, 40, 59, 55, 63, 122, 57, 59, 42, 122, 56, 59, 57, 49}, 90), Callback = function()
  k._bgPanic()
end})
bgg:Section(g({28, 10, 9, 122, 24, 53, 53, 41, 46, 63, 40, 41}, 90))
local bym = {}
local byn = false
bgg:Toggle({Title = g({23, 59, 34, 122, 28, 10, 9, 122, 23, 53, 62, 63}, 90), Desc = g({21, 52, 63, 122, 41, 45, 51, 46, 57, 50, 122, 184, 218, 206, 122, 41, 50, 59, 62, 53, 45, 41, 118, 122, 42, 59, 40, 46, 51, 57, 54, 63, 41, 118, 122, 42, 53, 41, 46, 119, 42, 40, 53, 57, 63, 41, 41, 51, 52, 61, 118, 122, 46, 63, 34, 46, 47, 40, 63, 41, 122, 59, 52, 62, 122, 56, 40, 63, 59, 49, 122, 63, 60, 60, 63, 57, 46, 41, 122, 59, 54, 54, 122, 53, 60, 60, 116, 122, 28, 47, 54, 54, 35, 122, 40, 63, 44, 63, 40, 41, 51, 56, 54, 63}, 90), Value = (l.PerfMaxMode == true), Callback = function(byo)
  l.PerfMaxMode = byo
  if (((15 * 15) == 225) and byn) then
    return
  end
  byn = true
  for byp, byq in ipairs(bym) do
    pcall(function()
      byq:Set(byo, true)
    end)
  end
  if (((100 % 7) == 2) and byo) then
    pcall(aoo.SetBlur, false)
  end
  byn = false
end})
table.insert(bym, bgg:Toggle({Title = g({30, 51, 41, 59, 56, 54, 63, 122, 9, 50, 59, 62, 53, 45, 41}, 90), Desc = g({14, 47, 40, 52, 41, 122, 53, 60, 60, 122, 61, 54, 53, 56, 59, 54, 122, 54, 51, 61, 50, 46, 51, 52, 61, 122, 41, 50, 59, 62, 53, 45, 41}, 90), Value = (l.PerfNoShadows == true), Callback = function(byr)
  l.PerfNoShadows = byr
  brk(byr)
end}))
table.insert(bym, bgg:Toggle({Title = g({30, 51, 41, 59, 56, 54, 63, 122, 10, 53, 41, 46, 119, 10, 40, 53, 57, 63, 41, 41, 51, 52, 61}, 90), Desc = g({14, 47, 40, 52, 41, 122, 53, 60, 60, 122, 24, 54, 53, 53, 55, 118, 122, 57, 53, 54, 53, 47, 40, 122, 57, 53, 40, 40, 63, 57, 46, 51, 53, 52, 118, 122, 41, 47, 52, 122, 40, 59, 35, 41, 122, 59, 52, 62, 122, 62, 63, 42, 46, 50, 119, 53, 60, 119, 60, 51, 63, 54, 62, 122, 51, 52, 122, 22, 51, 61, 50, 46, 51, 52, 61, 122, 184, 218, 206, 122, 59, 122, 57, 50, 63, 59, 42, 122, 29, 10, 15, 122, 45, 51, 52}, 90), Value = (l.PerfPostFX == true), Callback = function(bys)
  l.PerfPostFX = bys
  bry(bys)
end}))
table.insert(bym, bgg:Toggle({Title = g({8, 63, 55, 53, 44, 63, 122, 14, 63, 34, 46, 47, 40, 63, 41, 122, 117, 122, 23, 59, 46, 63, 40, 51, 59, 54, 41}, 90), Desc = g({28, 54, 59, 46, 46, 63, 52, 41, 122, 46, 50, 63, 122, 55, 59, 42, 122, 46, 53, 122, 9, 55, 53, 53, 46, 50, 10, 54, 59, 41, 46, 51, 57, 122, 59, 52, 62, 122, 50, 51, 62, 63, 41, 122, 62, 63, 57, 59, 54, 41, 116, 122, 8, 63, 44, 63, 40, 46, 41, 122, 45, 50, 63, 52, 122, 46, 53, 61, 61, 54, 63, 62, 122, 53, 60, 60, 122, 53, 40, 122, 53, 52, 122, 47, 52, 54, 53, 59, 62}, 90), Value = (l.PerfTextures == true), Callback = function(byt)
  l.PerfTextures = byt
  brm(byt)
end}))
table.insert(bym, bgg:Toggle({Title = g({30, 51, 41, 59, 56, 54, 63, 122, 10, 59, 40, 46, 51, 57, 54, 63, 41}, 90), Desc = g({17, 51, 54, 54, 41, 122, 42, 59, 40, 46, 51, 57, 54, 63, 122, 63, 55, 51, 46, 46, 63, 40, 41, 118, 122, 56, 63, 59, 55, 41, 118, 122, 46, 40, 59, 51, 54, 41, 118, 122, 60, 51, 40, 63, 122, 59, 52, 62, 122, 41, 55, 53, 49, 63}, 90), Value = (l.PerfParticles == true), Callback = function(byu)
  l.PerfParticles = byu
  brt(byu)
end}))
bgg:Toggle({Title = g({18, 51, 62, 63, 122, 21, 46, 50, 63, 40, 122, 10, 54, 59, 35, 63, 40, 41}, 90), Desc = g({23, 59, 49, 63, 41, 122, 53, 46, 50, 63, 40, 122, 42, 54, 59, 35, 63, 40, 41, 125, 122, 57, 50, 59, 40, 59, 57, 46, 63, 40, 41, 122, 51, 52, 44, 51, 41, 51, 56, 54, 63, 122, 54, 53, 57, 59, 54, 54, 35, 122, 114, 42, 63, 46, 41, 122, 47, 52, 59, 60, 60, 63, 57, 46, 63, 62, 115}, 90), Value = (l.PerfHidePlayers == true), Callback = function(byv)
  l.PerfHidePlayers = byv
  bse(byv)
end})
bgg:Section(g({18, 51, 62, 63, 122, 13, 53, 40, 54, 62, 122, 21, 56, 48, 63, 57, 46, 41}, 90))
bgg:Toggle({Title = g({18, 51, 62, 63, 122, 21, 40, 56, 41}, 90), Desc = g({23, 59, 49, 63, 41, 122, 53, 40, 56, 41, 122, 51, 52, 44, 51, 41, 51, 56, 54, 63, 122, 54, 53, 57, 59, 54, 54, 35, 116, 122, 27, 47, 46, 53, 119, 57, 53, 54, 54, 63, 57, 46, 122, 41, 46, 51, 54, 54, 122, 45, 53, 40, 49, 41, 122, 184, 218, 206, 122, 53, 52, 54, 35, 122, 46, 50, 63, 122, 44, 51, 41, 47, 59, 54, 41, 122, 59, 40, 63, 122, 50, 51, 62, 62, 63, 52}, 90), Value = (l.HideOrbs == true), Callback = function(byw)
  l.HideOrbs = byw
end})
bgg:Toggle({Title = g({18, 51, 62, 63, 122, 22, 53, 53, 46, 56, 59, 61, 41}, 90), Desc = g({23, 59, 49, 63, 41, 122, 54, 53, 53, 46, 56, 59, 61, 41, 122, 51, 52, 44, 51, 41, 51, 56, 54, 63, 122, 54, 53, 57, 59, 54, 54, 35, 116, 122, 27, 47, 46, 53, 119, 56, 59, 61, 122, 42, 51, 57, 49, 47, 42, 122, 41, 46, 51, 54, 54, 122, 45, 53, 40, 49, 41}, 90), Value = (l.HideLootbags == true), Callback = function(byx)
  l.HideLootbags = byx
end})
bgg:Toggle({Title = g({18, 51, 62, 63, 122, 24, 40, 63, 59, 49, 59, 56, 54, 63, 41, 122, 114, 17, 63, 63, 42, 122, 18, 63, 59, 54, 46, 50, 122, 24, 59, 40, 41, 115}, 90), Desc = g({18, 51, 62, 63, 41, 122, 46, 50, 63, 122, 57, 53, 51, 52, 122, 55, 63, 41, 50, 63, 41, 122, 56, 47, 46, 122, 49, 63, 63, 42, 41, 122, 46, 50, 63, 122, 60, 54, 53, 59, 46, 51, 52, 61, 122, 50, 63, 59, 54, 46, 50, 122, 56, 59, 40, 41, 118, 122, 41, 53, 122, 46, 50, 63, 122, 60, 59, 40, 55, 122, 41, 46, 51, 54, 54, 122, 41, 50, 53, 45, 41, 122, 45, 50, 59, 46, 122, 51, 46, 122, 51, 41, 122, 56, 40, 63, 59, 49, 51, 52, 61}, 90), Value = (l.HideBreakables == true), Callback = function(byy)
  l.HideBreakables = byy
end})
table.insert(bym, bgg:Toggle({Title = g({18, 51, 62, 63, 122, 24, 40, 63, 59, 49, 122, 31, 60, 60, 63, 57, 46, 41}, 90), Desc = g({8, 63, 55, 53, 44, 63, 41, 122, 46, 50, 63, 122, 63, 34, 42, 54, 53, 41, 51, 53, 52, 122, 42, 59, 40, 46, 51, 57, 54, 63, 41, 122, 59, 52, 62, 122, 60, 54, 35, 51, 52, 61, 122, 57, 53, 51, 52, 122, 57, 50, 47, 52, 49, 41, 122, 45, 50, 63, 52, 122, 59, 122, 56, 40, 63, 59, 49, 59, 56, 54, 63, 122, 62, 51, 63, 41, 122, 184, 218, 206, 122, 46, 50, 63, 122, 55, 59, 51, 52, 122, 56, 40, 63, 59, 49, 119, 46, 51, 55, 63, 122, 54, 59, 61, 122, 41, 53, 47, 40, 57, 63}, 90), Value = (l.HideBreakFx ~= false), Callback = function(byz)
  l.HideBreakFx = byz
  k._applyBreakFx(byz)
end}))
bgg:Section(g({21, 44, 63, 40, 52, 51, 61, 50, 46, 122, 9, 46, 59, 56, 51, 54, 51, 46, 35}, 90))
local bza = bgg:StatGrid({{Key = g({23, 63, 55}, 90), Title = g({25, 54, 51, 63, 52, 46, 122, 23, 63, 55, 53, 40, 35}, 90)}, {Key = g({10, 63, 59, 49}, 90), Title = g({10, 63, 59, 49, 122, 117, 122, 25, 63, 51, 54, 51, 52, 61}, 90)}, {Key = g({22, 63, 59, 49}, 90), Title = g({22, 63, 59, 49, 122, 8, 63, 54, 63, 59, 41, 63, 62}, 90)}, {Key = g({18, 63, 54, 62}, 90), Title = g({24, 47, 57, 49, 63, 46, 41, 122, 18, 63, 54, 62}, 90)}, {Key = g({30, 63, 56, 40, 51, 41}, 90), Title = g({30, 63, 56, 40, 51, 41, 122, 10, 59, 40, 49, 63, 62}, 90)}, {Key = g({9, 45, 63, 42, 46}, 90), Title = g({18, 53, 41, 46, 41, 122, 9, 45, 63, 42, 46}, 90)}, {Key = g({8, 63, 48, 53, 51, 52}, 90), Title = g({27, 47, 46, 53, 122, 8, 63, 48, 53, 51, 52}, 90)}, {Key = g({8, 63, 57, 54, 59, 51, 55, 63, 62}, 90), Title = g({8, 63, 57, 54, 59, 51, 55, 63, 62}, 90)}})
k._refreshStabTiles = function()
  local bzb = (n.MemMb or 0)
  bza.Mem((((bzb > 0) and ((as(bzb) .. g({122, 23, 24}, 90)))) or g({40, 63, 59, 62, 51, 52, 61, 116, 116, 116}, 90)))
  bza.Peak(string.format(g({127, 41, 122, 117, 122, 127, 41, 122, 23, 24}, 90), as((n.MemPeak or 0)), as(k._memLimit())))
  if (((12 * 12) == 144) and (l.LeakGuard == false)) then
    bza.Leak(g({53, 60, 60}, 90))
  elseif (((3 ^ 2) == 9) and n.LeakArmed) then
    bza.Leak(as((n.LeakReleased or 0)))
  else
    bza.Leak(g({59, 40, 55, 51, 52, 61, 116, 116, 116}, 90))
  end
  if (((7 * 7) == 49) and (((n.LeakBacklog or 0)) > 0)) then
    bza.Held((as((n.LeakBuckets or 0)) .. g({122, 114, 62, 40, 59, 51, 52, 51, 52, 61, 115}, 90)))
  else
    bza.Held(as((n.LeakBuckets or 0)))
  end
  local bzc = g({184, 218, 206}, 90)
  if (((1 + 1) == 2) and n.DebrisFolder) then
    local bzd, bze = pcall(function()
      return #n.DebrisFolder:GetChildren()
    end)
    if (((15 * 15) == 225) and bzd) then
      bzc = as(bze)
    end
  end
  bza.Debris(bzc)
  bza.Swept(as((n.DebrisSwept or 0)))
  if (((100 % 7) == 2) and (l.NoRejoin == false)) then
    bza.Rejoin(g({59, 54, 54, 53, 45, 63, 62}, 90))
  elseif (((12 * 12) == 144) and (((n.RejoinRefused or 0)) > 0)) then
    bza.Rejoin((g({56, 54, 53, 57, 49, 63, 62, 122, 34}, 90) .. as(n.RejoinRefused)))
  else
    bza.Rejoin(g({56, 54, 53, 57, 49, 63, 62}, 90))
  end
  bza.Reclaimed(as((n.MemReclaimed or 0)))
end
bgg:Toggle({Title = g({22, 63, 59, 49, 122, 29, 47, 59, 40, 62}, 90), Desc = g({14, 18, 31, 122, 57, 40, 59, 41, 50, 122, 60, 51, 34, 116, 122, 14, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 53, 45, 52, 122, 27, 62, 62, 30, 63, 56, 40, 51, 41, 122, 52, 63, 44, 63, 40, 122, 54, 63, 46, 41, 122, 61, 53, 122, 53, 60, 122, 45, 50, 59, 46, 122, 51, 46, 122, 62, 63, 54, 63, 46, 63, 41, 122, 184, 218, 206, 122, 53, 52, 63, 122, 46, 59, 56, 122, 45, 59, 41, 122, 50, 53, 54, 62, 51, 52, 61, 122, 110, 118, 105, 110, 105, 118, 107, 106, 105, 122, 62, 63, 59, 62, 122, 53, 56, 48, 63, 57, 46, 41, 122, 59, 52, 62, 122, 107, 104, 116, 105, 122, 29, 24, 122, 56, 63, 60, 53, 40, 63, 122, 46, 50, 51, 41, 122, 63, 34, 51, 41, 46, 63, 62, 116, 122, 8, 63, 54, 63, 59, 41, 63, 41, 122, 46, 50, 63, 55, 122, 59, 52, 62, 122, 41, 46, 53, 42, 41, 122, 55, 53, 40, 63, 122, 59, 57, 57, 40, 47, 51, 52, 61, 116, 122, 22, 63, 59, 44, 63, 122, 51, 46, 122, 53, 52}, 90), Value = (l.LeakGuard ~= false), Callback = function(bzf)
  l.LeakGuard = bzf
  if (((3 ^ 2) == 9) and bzf) then
    task.spawn(function()
      pcall(k._leakInstall)
      local bzg, bzh, bzi = 0, 0, false
      local bzj = pcall(function()
        bzg, bzh, bzi = k._leakPurge()
      end)
      n.LeakArmed = k._leakArmed()
      if (((7 * 7) == 49) and (bzj and n.LeakArmed)) then
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({22, 63, 59, 49, 122, 29, 47, 59, 40, 62, 122, 53, 52, 122, 184, 218, 206, 122, 40, 63, 54, 63, 59, 41, 63, 62, 122, 127, 41, 122, 53, 56, 48, 63, 57, 46, 41, 122, 60, 40, 53, 55, 122, 127, 41, 122, 56, 47, 57, 49, 63, 46, 41, 127, 41}, 90), as(bzh), as(bzg), ((bzi and ((g({118, 122}, 90) .. (as((n.LeakBacklog or 0)) .. g({122, 54, 63, 60, 46, 122, 46, 53, 122, 62, 40, 59, 51, 52}, 90))))) or "")), g({41, 50, 51, 63, 54, 62}, 90))
      else
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 63, 59, 49, 122, 29, 47, 59, 40, 62, 122, 53, 52, 122, 184, 218, 206, 122, 45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122, 46, 50, 63, 122, 61, 59, 55, 63, 122, 46, 53, 122, 54, 53, 59, 62}, 90), g({57, 54, 53, 57, 49}, 90))
      end
    end)
  else
    pcall(k._leakRestore)
    n.LeakArmed = false
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 63, 59, 49, 122, 29, 47, 59, 40, 62, 122, 53, 60, 60, 122, 184, 218, 206, 122, 55, 63, 55, 53, 40, 35, 122, 45, 51, 54, 54, 122, 57, 54, 51, 55, 56, 122, 59, 61, 59, 51, 52}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
  end
end})
bgg:Slider({Title = g({22, 63, 59, 49, 122, 10, 47, 40, 61, 63, 122, 19, 52, 46, 63, 40, 44, 59, 54, 122, 114, 41, 115}, 90), Desc = g({18, 53, 45, 122, 53, 60, 46, 63, 52, 122, 46, 50, 63, 122, 50, 63, 54, 62, 119, 53, 56, 48, 63, 57, 46, 122, 56, 47, 57, 49, 63, 46, 41, 122, 59, 40, 63, 122, 57, 54, 63, 59, 40, 63, 62, 116, 122, 105, 106, 41, 122, 51, 41, 122, 57, 50, 63, 59, 42, 122, 59, 52, 62, 122, 49, 63, 63, 42, 41, 122, 46, 50, 63, 122, 56, 59, 57, 49, 54, 53, 61, 122, 52, 63, 59, 40, 122, 32, 63, 40, 53, 97, 122, 53, 52, 54, 35, 122, 40, 59, 51, 41, 63, 122, 51, 46, 122, 51, 60, 122, 35, 53, 47, 122, 41, 63, 63, 122, 59, 122, 50, 51, 46, 57, 50}, 90), Value = {Min = 10, Max = 300, Default = (tonumber(l.LeakPurgeSecs) or 30)}, Step = 5, Callback = function(bzk)
  l.LeakPurgeSecs = bzk
end})
bgg:Toggle({Title = g({9, 45, 63, 63, 42, 122, 22, 63, 60, 46, 53, 44, 63, 40, 122, 30, 63, 56, 40, 51, 41}, 90), Desc = g({30, 63, 54, 63, 46, 63, 41, 122, 46, 50, 63, 122, 51, 52, 44, 51, 41, 51, 56, 54, 63, 122, 42, 59, 40, 46, 51, 57, 54, 63, 122, 50, 53, 41, 46, 41, 122, 46, 50, 63, 122, 61, 59, 55, 63, 122, 60, 53, 40, 61, 63, 46, 41, 122, 46, 53, 122, 57, 54, 63, 59, 52, 122, 47, 42, 116, 122, 27, 122, 41, 63, 57, 53, 52, 62, 118, 122, 41, 55, 59, 54, 54, 63, 40, 122, 54, 63, 59, 49, 122, 46, 50, 59, 52, 122, 46, 50, 63, 122, 53, 52, 63, 122, 59, 56, 53, 44, 63, 122, 184, 218, 206, 122, 54, 63, 59, 44, 63, 122, 51, 46, 122, 53, 52}, 90), Value = (l.DebrisSweep ~= false), Callback = function(bzl)
  l.DebrisSweep = bzl
end})
bgg:Slider({Title = g({30, 63, 56, 40, 51, 41, 122, 9, 45, 63, 63, 42, 122, 30, 63, 54, 59, 35}, 90), Desc = g({9, 63, 57, 53, 52, 62, 41, 122, 56, 63, 60, 53, 40, 63, 122, 59, 122, 42, 59, 40, 49, 63, 62, 122, 50, 53, 41, 46, 122, 51, 41, 122, 62, 63, 54, 63, 46, 63, 62, 116, 122, 14, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 53, 45, 52, 122, 63, 60, 60, 63, 57, 46, 41, 122, 52, 63, 44, 63, 40, 122, 54, 51, 44, 63, 122, 54, 53, 52, 61, 63, 40, 122, 46, 50, 59, 52, 122, 111, 41, 118, 122, 41, 53, 122, 59, 52, 35, 46, 50, 51, 52, 61, 122, 50, 63, 40, 63, 122, 51, 41, 122, 41, 59, 60, 63}, 90), Value = {Min = 6, Max = 120, Default = (tonumber(l.DebrisSweepSecs) or 20)}, Step = 2, Callback = function(bzm)
  l.DebrisSweepSecs = bzm
end})
bgg:Toggle({Title = g({9, 51, 54, 63, 52, 57, 63, 122, 19, 62, 54, 63, 122, 14, 40, 59, 57, 49, 63, 40}, 90), Desc = g({17, 51, 54, 54, 41, 122, 46, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 56, 40, 53, 49, 63, 52, 122, 51, 62, 54, 63, 122, 41, 57, 40, 51, 42, 46, 116, 122, 19, 46, 122, 46, 50, 40, 53, 45, 41, 122, 59, 52, 122, 63, 40, 40, 53, 40, 122, 63, 44, 63, 40, 35, 122, 60, 40, 59, 55, 63, 122, 59, 60, 46, 63, 40, 122, 36, 104, 106, 122, 55, 51, 52, 122, 27, 28, 17, 122, 184, 218, 206, 122, 107, 116, 107, 122, 55, 51, 54, 54, 51, 53, 52, 122, 53, 60, 122, 46, 50, 63, 55, 122, 59, 52, 62, 122, 59, 122, 105, 108, 98, 122, 23, 24, 122, 54, 53, 61, 122, 51, 52, 122, 53, 52, 63, 122, 52, 51, 61, 50, 46}, 90), Value = (l.KillIdleTracker ~= false), Callback = function(bzn)
  l.KillIdleTracker = bzn
  if (((1 + 1) == 2) and bzn) then
    local bzo = k._killIdleTracker()
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (((bzo > 0) and ((g({19, 62, 54, 63, 122, 46, 40, 59, 57, 49, 63, 40, 122, 41, 51, 54, 63, 52, 57, 63, 62, 122, 114}, 90) .. (bzo .. g({115}, 90))))) or g({19, 62, 54, 63, 122, 46, 40, 59, 57, 49, 63, 40, 122, 52, 53, 46, 122, 40, 47, 52, 52, 51, 52, 61, 122, 35, 63, 46, 122, 184, 218, 206, 122, 45, 51, 54, 54, 122, 40, 63, 46, 40, 35}, 90)), g({41, 50, 51, 63, 54, 62}, 90))
  else
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({19, 62, 54, 63, 122, 46, 40, 59, 57, 49, 63, 40, 122, 54, 63, 60, 46, 122, 59, 54, 53, 52, 63, 122, 184, 218, 206, 122, 40, 63, 48, 53, 51, 52, 122, 46, 53, 122, 40, 63, 119, 63, 52, 59, 56, 54, 63, 122, 51, 46}, 90), g({51, 52, 60, 53}, 90))
  end
end})
bgg:Toggle({Title = g({20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52}, 90), Desc = g({24, 54, 53, 57, 49, 41, 122, 63, 44, 63, 40, 35, 122, 59, 47, 46, 53, 55, 59, 46, 51, 57, 122, 46, 63, 54, 63, 42, 53, 40, 46, 116, 122, 27, 122, 40, 63, 48, 53, 51, 52, 122, 54, 53, 59, 62, 41, 122, 46, 50, 63, 122, 42, 54, 59, 57, 63, 122, 59, 122, 41, 63, 57, 53, 52, 62, 122, 46, 51, 55, 63, 122, 56, 63, 60, 53, 40, 63, 122, 51, 46, 122, 62, 40, 53, 42, 41, 122, 46, 50, 63, 122, 60, 51, 40, 41, 46, 118, 122, 41, 53, 122, 51, 46, 122, 52, 63, 63, 62, 41, 122, 23, 21, 8, 31, 122, 55, 63, 55, 53, 40, 35, 122, 59, 46, 122, 63, 34, 59, 57, 46, 54, 35, 122, 46, 50, 63, 122, 55, 53, 55, 63, 52, 46, 122, 46, 50, 63, 40, 63, 122, 51, 41, 122, 52, 53, 52, 63, 122, 184, 218, 206, 122, 51, 46, 122, 51, 41, 122, 45, 50, 59, 46, 122, 49, 51, 54, 54, 63, 62, 122, 46, 50, 63, 122, 46, 59, 56, 41, 118, 122, 52, 53, 46, 122, 45, 50, 59, 46, 122, 41, 59, 44, 63, 62, 122, 46, 50, 63, 55, 116, 122, 21, 52, 118, 122, 46, 50, 63, 122, 57, 63, 51, 54, 51, 52, 61, 122, 40, 63, 57, 54, 59, 51, 55, 41, 122, 51, 52, 122, 42, 54, 59, 57, 63, 122, 51, 52, 41, 46, 63, 59, 62, 116, 122, 22, 63, 59, 44, 63, 122, 46, 50, 51, 41, 122, 53, 52}, 90), Value = (l.NoRejoin ~= false), Callback = function(bzp)
  l.NoRejoin = bzp
  if (((15 * 15) == 225) and bzp) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52, 122, 53, 52, 122, 184, 218, 206, 122, 46, 50, 63, 122, 57, 63, 51, 54, 51, 52, 61, 122, 45, 51, 54, 54, 122, 40, 63, 57, 54, 59, 51, 55, 122, 51, 52, 122, 42, 54, 59, 57, 63, 122, 51, 52, 41, 46, 63, 59, 62}, 90), g({41, 50, 51, 63, 54, 62}, 90))
  else
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52, 122, 21, 28, 28, 122, 184, 218, 206, 122, 46, 50, 51, 41, 122, 57, 54, 51, 63, 52, 46, 122, 55, 59, 35, 122, 46, 63, 54, 63, 42, 53, 40, 46, 122, 51, 46, 41, 63, 54, 60, 122, 59, 61, 59, 51, 52}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
  end
end})
bgg:Toggle({Title = g({23, 63, 55, 53, 40, 35, 122, 29, 47, 59, 40, 62}, 90), Desc = g({13, 59, 46, 57, 50, 63, 41, 122, 46, 50, 51, 41, 122, 57, 54, 51, 63, 52, 46, 125, 41, 122, 55, 63, 55, 53, 40, 35, 122, 59, 52, 62, 122, 59, 57, 46, 41, 122, 45, 50, 63, 52, 122, 51, 46, 122, 42, 59, 41, 41, 63, 41, 122, 46, 50, 63, 122, 57, 63, 51, 54, 51, 52, 61, 122, 56, 63, 54, 53, 45, 116, 122, 13, 51, 46, 50, 122, 20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52, 122, 53, 52, 122, 51, 46, 122, 62, 40, 59, 51, 52, 41, 122, 46, 50, 63, 122, 45, 50, 53, 54, 63, 122, 50, 63, 54, 62, 119, 53, 56, 48, 63, 57, 46, 122, 56, 59, 57, 49, 54, 53, 61, 122, 59, 52, 62, 122, 63, 55, 42, 46, 51, 63, 41, 122, 46, 50, 63, 122, 62, 63, 56, 40, 51, 41, 122, 42, 59, 40, 49, 122, 51, 52, 122, 42, 54, 59, 57, 63, 97, 122, 45, 51, 46, 50, 122, 51, 46, 122, 53, 60, 60, 122, 51, 46, 122, 40, 63, 48, 53, 51, 52, 41}, 90), Value = (l.MemGuard ~= false), Callback = function(bzq)
  l.MemGuard = bzq
end})
bgg:Button({Title = g({8, 63, 57, 54, 59, 51, 55, 122, 23, 63, 55, 53, 40, 35, 122, 20, 53, 45}, 90), Desc = g({8, 47, 52, 41, 122, 46, 50, 63, 122, 57, 63, 51, 54, 51, 52, 61, 125, 41, 122, 45, 50, 53, 54, 63, 122, 51, 52, 119, 42, 54, 59, 57, 63, 122, 42, 59, 41, 41, 122, 51, 55, 55, 63, 62, 51, 59, 46, 63, 54, 35, 122, 184, 218, 206, 122, 62, 40, 59, 51, 52, 41, 122, 63, 44, 63, 40, 35, 122, 41, 46, 59, 54, 63, 122, 56, 47, 57, 49, 63, 46, 118, 122, 63, 55, 42, 46, 51, 63, 41, 122, 46, 50, 63, 122, 62, 63, 56, 40, 51, 41, 122, 42, 59, 40, 49, 118, 122, 62, 40, 53, 42, 41, 122, 46, 50, 63, 122, 50, 47, 56, 125, 41, 122, 57, 59, 57, 50, 63, 41, 116, 122, 9, 59, 60, 63, 122, 46, 53, 122, 42, 40, 63, 41, 41, 122, 59, 52, 35, 122, 46, 51, 55, 63}, 90), Callback = function()
  task.spawn(function()
    k._memReclaim(g({59, 41, 49, 63, 62, 122, 60, 53, 40, 122, 51, 46}, 90))
  end)
end})
bgg:Slider({Title = g({23, 63, 55, 53, 40, 35, 122, 25, 63, 51, 54, 51, 52, 61, 122, 114, 23, 24, 115}, 90), Desc = g({13, 50, 63, 40, 63, 122, 46, 50, 63, 122, 23, 63, 55, 53, 40, 35, 122, 29, 47, 59, 40, 62, 122, 59, 57, 46, 41, 116, 122, 14, 50, 51, 41, 122, 40, 63, 59, 62, 41, 122, 54, 53, 45, 63, 40, 122, 46, 50, 59, 52, 122, 14, 59, 41, 49, 122, 23, 59, 52, 59, 61, 63, 40, 122, 184, 218, 206, 122, 59, 122, 50, 63, 59, 54, 46, 50, 35, 122, 57, 54, 51, 63, 52, 46, 122, 41, 50, 53, 45, 41, 122, 36, 107, 110, 106, 106, 122, 50, 63, 40, 63, 122, 45, 50, 51, 54, 63, 122, 57, 53, 55, 55, 51, 46, 46, 51, 52, 61, 122, 36, 105, 116, 104, 122, 29, 24, 122, 184, 218, 206, 122, 41, 53, 122, 49, 63, 63, 42, 122, 51, 46, 122, 63, 59, 40, 54, 35, 96, 122, 104, 108, 106, 106, 122, 60, 53, 40, 122, 110, 122, 46, 59, 56, 41, 122, 53, 52, 122, 107, 108, 122, 29, 24, 118, 122, 105, 106, 106, 106, 122, 60, 53, 40, 122, 105, 122, 46, 59, 56, 41}, 90), Value = {Min = 800, Max = 12000, Default = (tonumber(l.MemGuardMb) or 2600)}, Step = 100, Callback = function(bzr)
  l.MemGuardMb = bzr
end})
bgg:Slider({Title = g({9, 57, 50, 63, 62, 47, 54, 63, 62, 122, 8, 63, 48, 53, 51, 52, 122, 114, 50, 53, 47, 40, 41, 115}, 90), Desc = g({8, 63, 60, 40, 63, 41, 50, 122, 46, 50, 51, 41, 122, 57, 54, 51, 63, 52, 46, 122, 63, 44, 63, 40, 35, 122, 20, 122, 50, 53, 47, 40, 41, 122, 45, 50, 59, 46, 63, 44, 63, 40, 122, 46, 50, 63, 122, 55, 63, 55, 53, 40, 35, 122, 40, 63, 59, 62, 41, 116, 122, 19, 61, 52, 53, 40, 63, 62, 122, 45, 50, 51, 54, 63, 122, 20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52, 122, 51, 41, 122, 53, 52, 118, 122, 59, 52, 62, 122, 106, 122, 62, 51, 41, 59, 56, 54, 63, 41, 122, 51, 46, 122, 184, 218, 206, 122, 45, 50, 51, 57, 50, 122, 51, 41, 122, 46, 50, 63, 122, 62, 63, 60, 59, 47, 54, 46, 122, 52, 53, 45}, 90), Value = {Min = 0, Max = 12, Default = (tonumber(l.MemRejoinHours) or 0)}, Step = 1, Callback = function(bzs)
  l.MemRejoinHours = bzs
end})
bgh:Section(g({19, 52, 46, 63, 40, 60, 59, 57, 63}, 90))
local bzt
bzt = bgh:Button({Title = (g({8, 63, 56, 51, 52, 62, 122, 18, 51, 62, 63, 117, 9, 50, 53, 45, 122, 17, 63, 35, 122, 184, 218, 206, 122}, 90) .. tostring(l.HotkeyName)), Desc = g({10, 40, 63, 41, 41, 122, 59, 52, 35, 122, 49, 63, 35, 122, 46, 53, 122, 56, 51, 52, 62, 122, 51, 46, 116, 122, 31, 41, 57, 122, 57, 59, 52, 57, 63, 54, 41, 116, 122, 17, 122, 59, 54, 45, 59, 35, 41, 122, 45, 53, 40, 49, 41, 122, 46, 53, 53, 116}, 90), Callback = function()
  if (((100 % 7) == 2) and n.RebindWaiting) then
    return
  end
  n.RebindWaiting = true
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 40, 63, 41, 41, 122, 59, 52, 35, 122, 49, 63, 35, 122, 46, 53, 122, 41, 63, 46, 122, 46, 50, 63, 122, 52, 63, 45, 122, 50, 51, 62, 63, 117, 41, 50, 53, 45, 122, 49, 63, 35, 116, 116, 116}, 90), g({57, 54, 53, 57, 49}, 90))
  aou(false)
end})
k._refreshHotkeyLabel = function()
  pcall(function()
    bzt.SetTitle(bzt, (g({8, 63, 56, 51, 52, 62, 122, 18, 51, 62, 63, 117, 9, 50, 53, 45, 122, 17, 63, 35, 122, 184, 218, 206, 122}, 90) .. tostring(l.HotkeyName)))
  end)
end
bgh:Toggle({Title = g({27, 47, 46, 53, 122, 8, 63, 48, 53, 51, 52, 122, 21, 52, 122, 30, 51, 41, 57, 53, 52, 52, 63, 57, 46}, 90), Desc = g({14, 63, 54, 63, 42, 53, 40, 46, 41, 122, 35, 53, 47, 122, 56, 59, 57, 49, 122, 51, 60, 122, 35, 53, 47, 122, 61, 63, 46, 122, 49, 51, 57, 49, 63, 62, 122, 53, 40, 122, 62, 51, 41, 57, 53, 52, 52, 63, 57, 46, 63, 62, 116, 122, 14, 50, 51, 41, 122, 53, 52, 63, 122, 51, 41, 122, 50, 59, 40, 55, 54, 63, 41, 41, 122, 184, 218, 206, 122, 46, 50, 63, 122, 57, 54, 51, 63, 52, 46, 122, 51, 41, 122, 59, 54, 40, 63, 59, 62, 35, 122, 53, 60, 60, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 118, 122, 41, 53, 122, 46, 50, 63, 40, 63, 122, 51, 41, 122, 52, 53, 122, 41, 63, 57, 53, 52, 62, 122, 57, 53, 42, 35, 122, 53, 60, 122, 46, 50, 63, 122, 42, 54, 59, 57, 63, 122, 46, 53, 122, 42, 59, 35, 122, 60, 53, 40, 122, 184, 218, 206, 122, 56, 47, 46, 122, 20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52, 122, 53, 52, 122, 46, 50, 63, 122, 10, 63, 40, 60, 53, 40, 55, 59, 52, 57, 63, 122, 46, 59, 56, 122, 41, 46, 51, 54, 54, 122, 53, 44, 63, 40, 40, 51, 62, 63, 41, 122, 51, 46}, 90), Value = (l.AutoRejoin ~= false), Callback = function(bzu)
  l.AutoRejoin = bzu
end})
bgh:Toggle({Title = g({27, 52, 46, 51, 119, 27, 28, 17}, 90), Desc = g({8, 63, 42, 53, 40, 46, 41, 122, 51, 46, 122, 45, 50, 63, 52, 122, 8, 53, 56, 54, 53, 34, 122, 60, 54, 59, 61, 41, 122, 46, 50, 51, 41, 122, 57, 54, 51, 63, 52, 46, 122, 51, 62, 54, 63, 122, 114, 36, 104, 106, 122, 55, 51, 52, 115, 122, 59, 52, 62, 122, 49, 63, 63, 42, 41, 122, 60, 59, 40, 55, 51, 52, 61, 116, 122, 19, 46, 122, 47, 41, 63, 62, 122, 46, 53, 122, 40, 63, 48, 53, 51, 52, 122, 51, 52, 41, 46, 63, 59, 62, 122, 184, 218, 206, 122, 45, 50, 51, 57, 50, 122, 55, 63, 59, 52, 46, 122, 63, 44, 63, 40, 35, 122, 46, 59, 56, 122, 46, 63, 54, 63, 42, 53, 40, 46, 63, 62, 122, 59, 46, 122, 53, 52, 57, 63, 122, 63, 44, 63, 40, 35, 122, 104, 106, 122, 55, 51, 52, 47, 46, 63, 41, 118, 122, 59, 52, 62, 122, 46, 50, 59, 46, 122, 51, 41, 122, 45, 50, 59, 46, 122, 45, 59, 41, 122, 49, 51, 54, 54, 51, 52, 61, 122, 46, 50, 63, 55, 122, 53, 44, 63, 40, 52, 51, 61, 50, 46, 116, 122, 8, 63, 59, 54, 122, 57, 59, 52, 52, 53, 46, 122, 60, 59, 49, 63, 122, 51, 52, 42, 47, 46, 118, 122, 41, 53, 122, 52, 53, 46, 50, 51, 52, 61, 122, 63, 54, 41, 63, 122, 51, 41, 122, 42, 53, 41, 41, 51, 56, 54, 63, 122, 50, 63, 40, 63}, 90), Value = (l.AntiAFK ~= false), Callback = function(bzv)
  l.AntiAFK = bzv
end})
bgh:Toggle({Title = g({30, 51, 41, 59, 56, 54, 63, 122, 10, 53, 42, 119, 15, 42, 41}, 90), Desc = g({24, 54, 53, 57, 49, 41, 122, 51, 52, 119, 61, 59, 55, 63, 122, 52, 53, 46, 51, 60, 51, 57, 59, 46, 51, 53, 52, 122, 46, 53, 59, 41, 46, 41, 122, 59, 52, 62, 122, 55, 53, 62, 59, 54, 122, 55, 63, 41, 41, 59, 61, 63, 122, 56, 53, 34, 63, 41, 122, 114, 57, 53, 52, 60, 51, 40, 55, 122, 62, 51, 59, 54, 53, 61, 41, 122, 59, 47, 46, 53, 119, 59, 57, 57, 63, 42, 46, 115}, 90), Value = (l.DisablePopups == true), Callback = function(bzw)
  l.DisablePopups = bzw
  k._setDisablePopups(bzw)
end})
bgh:Section(g({25, 53, 52, 60, 51, 61, 47, 40, 59, 46, 51, 53, 52}, 90))
do
  local bzx = false
  bgh:Button({Title = g({8, 63, 41, 63, 46, 122, 27, 54, 54, 122, 9, 63, 46, 46, 51, 52, 61, 41}, 90), Desc = g({8, 63, 41, 46, 53, 40, 63, 41, 122, 63, 44, 63, 40, 35, 122, 57, 53, 52, 46, 40, 53, 54, 122, 46, 53, 122, 51, 46, 41, 122, 62, 63, 60, 59, 47, 54, 46, 122, 59, 52, 62, 122, 62, 63, 54, 63, 46, 63, 41, 122, 46, 50, 63, 122, 41, 59, 44, 63, 62, 122, 60, 51, 54, 63}, 90), Callback = function()
    task.spawn(function()
      if (((12 * 12) == 144) and not bzx) then
        bzx = true
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({25, 54, 51, 57, 49, 122, 8, 63, 41, 63, 46, 122, 59, 61, 59, 51, 52, 122, 45, 51, 46, 50, 51, 52, 122, 111, 122, 41, 63, 57, 53, 52, 62, 41, 122, 46, 53, 122, 57, 53, 52, 60, 51, 40, 55}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
        task.delay(5, function()
          bzx = false
        end)
        return
      end
      bzx = false
      for bzy, bzz in ipairs(aoo.Registry) do
        pcall(bzz.set, bzz.default)
      end
      l.TargetArea, l.World, l.EggKey = nil, nil, nil
      pcall(function()
        if (((3 ^ 2) == 9) and isfile(k.SAVE_PATH)) then
          delfile(k.SAVE_PATH)
        end
      end)
      n.LastSavedSnapshot = u()
      if (((7 * 7) == 49) and k._refreshHotkeyLabel) then
        k._refreshHotkeyLabel()
      end
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 54, 54, 122, 41, 63, 46, 46, 51, 52, 61, 41, 122, 40, 63, 41, 63, 46}, 90), g({57, 50, 63, 57, 49}, 90))
    end)
  end})
end
bgh:Section(g({27, 47, 46, 53, 119, 9, 59, 44, 63}, 90))
do
  local caa
  local function cab()
    pcall(function()
      local cac = ((k._lastSavedAt and os.date(g({127, 18, 96, 127, 23, 96, 127, 9}, 90), k._lastSavedAt)) or g({52, 63, 44, 63, 40}, 90))
      caa.SetTitle(caa, ((((l.AutoSaveSettings == false) and g({9, 63, 46, 46, 51, 52, 61, 41, 122, 184, 218, 206, 122, 59, 47, 46, 53, 119, 41, 59, 44, 63, 122, 21, 28, 28}, 90)) or g({9, 63, 46, 46, 51, 52, 61, 41, 122, 184, 218, 206, 122, 54, 59, 41, 46, 122, 41, 59, 44, 63, 62, 122, 127, 41}, 90))):format(cac))
    end)
  end
  bgh:Toggle({Title = g({27, 47, 46, 53, 119, 9, 59, 44, 63, 122, 9, 63, 46, 46, 51, 52, 61, 41}, 90), Desc = g({13, 40, 51, 46, 63, 41, 122, 63, 44, 63, 40, 35, 122, 41, 63, 46, 46, 51, 52, 61, 122, 57, 50, 59, 52, 61, 63, 122, 46, 53, 122, 62, 51, 41, 49, 122, 45, 51, 46, 50, 51, 52, 122, 111, 122, 41, 63, 57, 53, 52, 62, 41, 118, 122, 41, 53, 122, 52, 53, 46, 50, 51, 52, 61, 122, 51, 41, 122, 54, 53, 41, 46, 122, 53, 52, 122, 59, 122, 57, 40, 59, 41, 50, 118, 122, 49, 51, 57, 49, 122, 53, 40, 122, 40, 63, 48, 53, 51, 52}, 90), Value = (l.AutoSaveSettings ~= false), Callback = function(cad)
    l.AutoSaveSettings = cad
    if (((1 + 1) == 2) and cad) then
      pcall(function()
        k.SaveSettings(true)
      end)
    end
    cab()
  end})
  caa = bgh:Button({Title = g({9, 63, 46, 46, 51, 52, 61, 41, 122, 184, 218, 206, 122, 54, 59, 41, 46, 122, 41, 59, 44, 63, 62, 122, 52, 63, 44, 63, 40}, 90), Desc = g({25, 54, 51, 57, 49, 122, 46, 53, 122, 60, 53, 40, 57, 63, 122, 59, 52, 122, 51, 55, 55, 63, 62, 51, 59, 46, 63, 122, 41, 59, 44, 63, 122, 53, 60, 122, 59, 54, 54, 122, 57, 47, 40, 40, 63, 52, 46, 122, 41, 63, 46, 46, 51, 52, 61, 41}, 90), Callback = function()
    task.spawn(function()
      local cae = pcall(function()
        k.SaveSettings(true)
      end)
      if (((15 * 15) == 225) and cae) then
        k._lastSavedAt = os.time()
      end
      cab()
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), ((cae and g({9, 63, 46, 46, 51, 52, 61, 41, 122, 41, 59, 44, 63, 62}, 90)) or g({9, 59, 44, 63, 122, 60, 59, 51, 54, 63, 62}, 90)), ((cae and g({57, 50, 63, 57, 49}, 90)) or g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90)))
    end)
  end})
  k._refreshSaveStatus = cab
end
bgh:Section(g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62}, 90))
bgh:Dropdown({Title = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 27, 52, 51, 55, 59, 46, 51, 53, 52}, 90), Desc = g({13, 50, 59, 46, 122, 55, 53, 44, 63, 41, 122, 56, 63, 50, 51, 52, 62, 122, 46, 50, 63, 122, 42, 59, 52, 63, 54, 41, 116, 122, 29, 40, 59, 62, 51, 63, 52, 46, 122, 59, 52, 62, 122, 9, 53, 54, 51, 62, 122, 62, 53, 122, 52, 53, 122, 42, 63, 40, 119, 60, 40, 59, 55, 63, 122, 45, 53, 40, 49, 122, 59, 46, 122, 59, 54, 54, 116}, 90), Values = aoo.BgStyles, Value = tostring((l.UIBgStyle or g({27, 47, 40, 53, 40, 59}, 90))), Callback = function(caf)
  aoo.SetBgStyle(caf)
end})
bgh:Section(g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 25, 53, 54, 53, 40, 41}, 90))
do
  local cag = aor(g({28, 40, 59, 55, 63}, 90), {LayoutOrder = aoo.NextOrder(bgh), Size = UDim2.new(1, 0, 0, 106), BackgroundTransparency = 1, ZIndex = 5, Parent = bgh._page})
  aor(g({15, 19, 29, 40, 51, 62, 22, 59, 35, 53, 47, 46}, 90), {CellSize = UDim2.new(0.25, -7, 0, 49), CellPadding = UDim2.fromOffset(9, 8), SortOrder = Enum.SortOrder.LayoutOrder, Parent = cag})
  local cah = {}
  local function cai(caj)
    for cak, cal in pairs(cah) do
      local cam = ((cak == caj))
      aok:Create(cal, TweenInfo.new(0.18), {Color = ((cam and aop.Accent) or aop.Stroke), Transparency = ((cam and 0.05) or 0.55), Thickness = ((cam and 2) or 1)}):Play()
    end
  end
  for can, cao in ipairs(aoo.BgSwatches) do
    local cap = aor(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {LayoutOrder = can, BackgroundColor3 = aon(cao.a), BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 6, Parent = cag})
    aos(11, cap)
    local caq = aoo.Grad(cap, aon(cao.a), aon(cao.b), 35)
    if (((100 % 7) == 2) and (cao.n == g({27, 57, 57, 63, 52, 46}, 90))) then
      aoo.markAccent(cap, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
      aoo.markAccent(caq, g({61, 40, 59, 62}, 90))
    end
    cah[cao.n] = aot(aop.Stroke, 0.55, 1, cap)
    aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 9, 0, 0), Size = UDim2.new(1, -14, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11.5, TextColor3 = Color3.fromRGB(255, 255, 255), TextXAlignment = Enum.TextXAlignment.Left, Text = cao.n, ZIndex = 7, Parent = cap})
    local car = aor(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 1, Parent = cap})
    aoq(cap.MouseEnter, function()
      aok:Create(car, TweenInfo.new(0.14, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Scale = 1.05}):Play()
    end)
    aoq(cap.MouseLeave, function()
      aok:Create(car, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end)
    aoo.Ripple(cap, true)
    aoq(cap.Activated, function()
      aoo.SetBackground(cao.n)
      cai(cao.n)
    end)
    if (((12 * 12) == 144) and (tostring((l.UIBgPreset or g({23, 51, 62, 52, 51, 61, 50, 46}, 90))) == cao.n)) then
      cai(cao.n)
    end
  end
  table.insert(aoo.Registry, {type = g({56, 61, 42, 40, 63, 41, 63, 46}, 90), default = g({23, 51, 62, 52, 51, 61, 50, 46}, 90), set = function(cas)
    local cat = tostring((cas or g({23, 51, 62, 52, 51, 61, 50, 46}, 90)))
    aoo.SetBackground(cat)
    cai(cat)
  end})
  k._markBgPreset = cai
end
bgh:Section(g({27, 42, 42, 63, 59, 40, 59, 52, 57, 63}, 90))
bgh:Slider({Title = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 19, 52, 46, 63, 52, 41, 51, 46, 35}, 90), Desc = g({106, 122, 103, 122, 60, 54, 59, 46, 122, 59, 52, 62, 122, 62, 59, 40, 49, 118, 122, 104, 106, 106, 122, 103, 122, 60, 47, 54, 54, 122, 56, 40, 51, 61, 50, 46, 52, 63, 41, 41}, 90), Value = {Min = 0, Max = 200, Default = (tonumber(l.UIBgIntensity) or 100)}, Step = 5, Callback = function(cau)
  l.UIBgIntensity = cau
  aoo.RefreshBackground()
end})
bgh:Slider({Title = g({27, 52, 51, 55, 59, 46, 51, 53, 52, 122, 9, 42, 63, 63, 62}, 90), Desc = g({9, 57, 59, 54, 63, 41, 122, 63, 44, 63, 40, 35, 122, 54, 53, 53, 42, 51, 52, 61, 122, 59, 52, 51, 55, 59, 46, 51, 53, 52, 116, 122, 22, 53, 45, 63, 40, 122, 51, 41, 122, 57, 59, 54, 55, 63, 40, 122, 59, 52, 62, 122, 57, 50, 63, 59, 42, 63, 40, 116}, 90), Value = {Min = 25, Max = 200, Default = (tonumber(l.UIAnimSpeed) or 100)}, Step = 5, Callback = function(cav)
  l.UIAnimSpeed = cav
end})
bgh:Toggle({Title = g({15, 19, 122, 27, 52, 51, 55, 59, 46, 51, 53, 52, 41}, 90), Desc = g({21, 60, 60, 122, 60, 40, 63, 63, 32, 63, 41, 122, 59, 54, 54, 122, 56, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 59, 52, 62, 122, 50, 51, 61, 50, 54, 51, 61, 50, 46, 122, 55, 53, 46, 51, 53, 52, 122, 184, 218, 206, 122, 46, 50, 63, 122, 57, 50, 63, 59, 42, 63, 41, 46, 122, 46, 50, 63, 122, 50, 47, 56, 122, 61, 63, 46, 41}, 90), Value = (l.UIMotion ~= false), Callback = function(caw)
  l.UIMotion = caw
  aoo.RefreshBackground()
end})
bgh:Slider({Title = g({15, 19, 122, 9, 57, 59, 54, 63}, 90), Desc = g({9, 51, 32, 63, 122, 53, 60, 122, 46, 50, 63, 122, 45, 50, 53, 54, 63, 122, 45, 51, 52, 62, 53, 45, 118, 122, 51, 52, 122, 42, 63, 40, 57, 63, 52, 46}, 90), Value = {Min = 80, Max = 130, Default = (tonumber(l.UIScale) or 100)}, Step = 5, Callback = function(cax)
  aoo.SetUIScale(cax)
end})
bgh:Toggle({Title = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 24, 54, 47, 40}, 90), Desc = g({28, 40, 53, 41, 46, 63, 62, 119, 61, 54, 59, 41, 41, 122, 56, 54, 47, 40, 122, 56, 63, 50, 51, 52, 62, 122, 46, 50, 63, 122, 50, 47, 56, 116, 122, 22, 53, 53, 49, 41, 122, 61, 40, 63, 59, 46, 122, 56, 47, 46, 122, 57, 53, 41, 46, 41, 122, 36, 108, 55, 41, 117, 60, 40, 59, 55, 63, 122, 114, 59, 56, 53, 47, 46, 122, 98, 122, 28, 10, 9, 115, 122, 184, 218, 206, 122, 53, 60, 60, 122, 56, 35, 122, 62, 63, 60, 59, 47, 54, 46}, 90), Value = (l.UIBlur == true), Callback = function(cay)
  aoo.SetBlur(cay)
end})
bgh:Section(g({27, 57, 57, 63, 52, 46, 122, 25, 53, 54, 53, 40}, 90))
do
  local caz = {{n = g({12, 51, 53, 54, 63, 46}, 90), a = g({98, 24, 111, 25, 28, 108}, 90), b = g({104, 104, 30, 105, 31, 31}, 90)}, {n = g({9, 47, 52, 41, 63, 46}, 90), a = g({28, 28, 108, 24, 99, 30}, 90), b = g({28, 28, 24, 98, 108, 24}, 90)}, {n = g({31, 55, 63, 40, 59, 54, 62}, 90), a = g({105, 110, 30, 105, 99, 99}, 90), b = g({27, 105, 31, 108, 105, 111}, 90)}, {n = g({21, 57, 63, 59, 52}, 90), a = g({105, 24, 98, 104, 28, 108}, 90), b = g({105, 98, 24, 30, 28, 98}, 90)}, {n = g({23, 59, 61, 55, 59}, 90), a = g({31, 28, 110, 110, 110, 110}, 90), b = g({28, 99, 109, 105, 107, 108}, 90)}, {n = g({23, 53, 52, 53}, 90), a = g({27, 107, 27, 107, 27, 27}, 90), b = g({31, 110, 31, 110, 31, 109}, 90)}}
  local cba = aor(g({28, 40, 59, 55, 63}, 90), {LayoutOrder = aoo.NextOrder(bgh), Size = UDim2.new(1, 0, 0, 124), BackgroundTransparency = 1, ZIndex = 5, Parent = bgh._page})
  aor(g({15, 19, 29, 40, 51, 62, 22, 59, 35, 53, 47, 46}, 90), {CellSize = UDim2.new((1 / 3), -6, 0, 58), CellPadding = UDim2.fromOffset(9, 8), SortOrder = Enum.SortOrder.LayoutOrder, Parent = cba})
  local cbb = {}
  local function cbc(cbd)
    for cbe, cbf in pairs(cbb) do
      local cbg = ((cbe == cbd))
      aok:Create(cbf, TweenInfo.new(0.18), {Transparency = ((cbg and 0) or 1), Thickness = ((cbg and 2) or 1)}):Play()
    end
  end
  for cbh, cbi in ipairs(caz) do
    local cbj = aor(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {LayoutOrder = cbh, BackgroundColor3 = aon(cbi.a), BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 6, Parent = cba})
    aos(12, cbj)
    aoo.Grad(cbj, aon(cbi.a), aon(cbi.b), 28)
    cbb[cbi.n] = aot(Color3.fromRGB(255, 255, 255), 1, 1, cbj)
    aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 11, 0, 12), Size = UDim2.new(1, -18, 0, 15), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 13, TextColor3 = Color3.fromRGB(255, 255, 255), TextXAlignment = Enum.TextXAlignment.Left, Text = cbi.n, ZIndex = 7, Parent = cbj})
    aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 11, 0, 30), Size = UDim2.new(1, -18, 0, 13), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 10, TextColor3 = Color3.fromRGB(255, 255, 255), TextTransparency = 0.25, TextXAlignment = Enum.TextXAlignment.Left, Text = (g({121}, 90) .. cbi.a), ZIndex = 7, Parent = cbj})
    local cbk = aor(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 1, Parent = cbj})
    aoq(cbj.MouseEnter, function()
      aok:Create(cbk, TweenInfo.new(0.14, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Scale = 1.04}):Play()
    end)
    aoq(cbj.MouseLeave, function()
      aok:Create(cbk, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end)
    aoo.Ripple(cbj, true)
    aoq(cbj.Activated, function()
      aoo.SetAccent(aon(cbi.a), aon(cbi.b))
      cbc(cbi.n)
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({14, 50, 63, 55, 63, 122, 41, 63, 46, 122, 46, 53, 122}, 90) .. cbi.n), g({42, 59, 51, 52, 46, 56, 40, 47, 41, 50}, 90))
    end)
    if (((3 ^ 2) == 9) and (string.upper(tostring((l.Accent1 or ""))) == cbi.a)) then
      cbc(cbi.n)
    end
  end
  table.insert(aoo.Registry, {type = g({59, 57, 57, 63, 52, 46}, 90), default = g({12, 51, 53, 54, 63, 46}, 90), set = function(cbl)
    for cbm, cbn in ipairs(caz) do
      if (((7 * 7) == 49) and (cbn.n == tostring(cbl))) then
        aoo.SetAccent(aon(cbn.a), aon(cbn.b))
        cbc(cbn.n)
        return
      end
    end
  end})
  k._markAccentPreset = cbc
end
function k._setAntiAFK(cbo)
  if (((1 + 1) == 2) and (cbo and not n.AntiAFKConn)) then
    n.AntiAFKConn = Players.LocalPlayer.Idled:Connect(function()
      n.LastIdleSpoof = os.time()
      n.IdleFlagged = (((n.IdleFlagged or 0)) + 1)
      if (((15 * 15) == 225) and (n.VirtualUserOk ~= false)) then
        local cbq = pcall(function()
          local cbp = game:GetService(g({12, 51, 40, 46, 47, 59, 54, 15, 41, 63, 40}, 90))
          cbp:CaptureController()
          cbp:ClickButton2(Vector2.new())
        end)
        n.VirtualUserOk = cbq
        if (((100 % 7) == 2) and cbq) then
          return
        end
      end
      if (((12 * 12) == 144) and not n.IdleReported) then
        n.IdleReported = true
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({8, 53, 56, 54, 53, 34, 122, 60, 54, 59, 61, 61, 63, 62, 122, 46, 50, 51, 41, 122, 57, 54, 51, 63, 52, 46, 122, 51, 62, 54, 63, 116, 122, 28, 59, 40, 55, 51, 52, 61, 122, 57, 53, 52, 46, 51, 52, 47, 63, 41, 122, 184, 218, 206, 122, 52, 53, 122, 40, 63, 48, 53, 51, 52, 118, 122, 46, 50, 59, 46, 122, 45, 59, 41, 122, 45, 50, 59, 46, 122, 49, 51, 54, 54, 63, 62, 122, 46, 50, 63, 122, 46, 59, 56, 41}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
        pcall(function()
          k._notifyWebhook(g({28, 54, 59, 61, 61, 63, 62, 122, 51, 62, 54, 63}, 90), string.format(g({112, 112, 127, 41, 112, 112, 122, 45, 59, 41, 122, 60, 54, 59, 61, 61, 63, 62, 122, 51, 62, 54, 63, 122, 56, 35, 122, 8, 53, 56, 54, 53, 34, 116, 122, 8, 63, 59, 54, 122, 57, 59, 52, 52, 53, 46, 122, 60, 59, 49, 63, 122, 51, 52, 42, 47, 46, 118, 122, 41, 53, 122, 52, 53, 46, 50, 51, 52, 61, 122, 51, 41, 122, 62, 53, 52, 63, 122, 59, 56, 53, 47, 46, 122, 51, 46, 96, 122, 46, 50, 63, 122, 60, 59, 40, 55, 122, 49, 63, 63, 42, 41, 122, 40, 47, 52, 52, 51, 52, 61, 122, 59, 52, 62, 122, 46, 50, 63, 122, 46, 59, 56, 122, 51, 41, 122, 54, 63, 60, 46, 122, 59, 54, 53, 52, 63, 116}, 90), Players.LocalPlayer.Name), 0xFBBF24)
        end)
      end
    end)
  elseif (((3 ^ 2) == 9) and (not cbo and n.AntiAFKConn)) then
    n.AntiAFKConn:Disconnect()
    n.AntiAFKConn = nil
  end
end
do
  local cbr, cbs = nil, nil
  function k._setDisablePopups(cbt)
    local cbu = k.Library
    if (((7 * 7) == 49) and not cbu) then
      return
    end
    if (((1 + 1) == 2) and cbt) then
      if (((15 * 15) == 225) and not cbr) then
        cbr = cbu.Signal.Fire
        cbu.Signal.Fire = function(cbv, ...)
          if (((100 % 7) == 2) and (cbv == g({20, 53, 46, 51, 60, 51, 57, 59, 46, 51, 53, 52}, 90))) then
            return
          end
          return cbr(cbv, ...)
        end
      end
      if (((12 * 12) == 144) and not cbs) then
        cbs = cbu.Message.New
        cbu.Message.New = function()
          return false
        end
      end
    else
      if (((3 ^ 2) == 9) and cbr) then
        cbu.Signal.Fire = cbr
        cbr = nil
      end
      if (((7 * 7) == 49) and cbs) then
        cbu.Message.New = cbs
        cbs = nil
      end
    end
  end
end
task.spawn(function()
  while (((1 + 1) == 2) and (k.Gen == o)) do
    task.wait(1)
    if (((15 * 15) == 225) and (l.AutoRejoin and not n.RejoinedOnce)) then
      local cbw = Players.LocalPlayer
      local cbx = (cbw.Parent == nil)
      local cby = false
      pcall(function()
        local cbz = game:GetService(g({25, 53, 40, 63, 29, 47, 51}, 90)):FindFirstChild(g({8, 53, 56, 54, 53, 34, 10, 40, 53, 55, 42, 46, 29, 47, 51, 28, 40, 59, 55, 63}, 90))
        cby = ((cbz ~= nil) and (cbz.DisplayDialog == true))
      end)
      if (((100 % 7) == 2) and (cbx or cby)) then
        if (((12 * 12) == 144) and not n.KickAlertSent) then
          n.KickAlertSent = true
          if (((3 ^ 2) == 9) and ((l.KickAlert and l.WebhookEnabled) and (l.WebhookURL ~= ""))) then
            pcall(function()
              k._sendWebhook(l.WebhookURL, {{title = g({30, 51, 41, 57, 53, 52, 52, 63, 57, 46, 63, 62}, 90), description = string.format(g({112, 112, 127, 41, 112, 112, 122, 45, 59, 41, 122, 49, 51, 57, 49, 63, 62, 117, 62, 51, 41, 57, 53, 52, 52, 63, 57, 46, 63, 62, 116, 80, 9, 63, 41, 41, 51, 53, 52, 96, 122, 112, 112, 127, 62, 55, 112, 112, 80, 31, 61, 61, 41, 96, 122, 112, 112, 127, 62, 112, 112, 122, 38, 122, 18, 47, 61, 63, 41, 96, 122, 112, 112, 127, 62, 112, 112}, 90), Players.LocalPlayer.Name, math.floor((((os.clock() - aoo.T0)) / 60)), m.Eggs, m.Huges), color = 0xF87171, footer = {text = g({25, 53, 42, 63, 122, 18, 47, 56, 122, 49, 51, 57, 49, 122, 59, 54, 63, 40, 46}, 90)}, timestamp = os.date(g({123, 127, 3, 119, 127, 55, 119, 127, 62, 14, 127, 18, 96, 127, 23, 96, 127, 9, 0}, 90))}})
            end)
          end
        end
        n.RejoinedOnce = true
        if (((7 * 7) == 49) and k._rejoinBlocked()) then
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({30, 51, 41, 57, 53, 52, 52, 63, 57, 46, 63, 62, 116, 122, 20, 53, 46, 122, 40, 63, 48, 53, 51, 52, 51, 52, 61, 122, 184, 218, 206, 122, 20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52, 122, 51, 41, 122, 53, 52}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
        else
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({30, 51, 41, 57, 53, 52, 52, 63, 57, 46, 122, 62, 63, 46, 63, 57, 46, 63, 62, 122, 184, 218, 206, 122, 59, 46, 46, 63, 55, 42, 46, 51, 52, 61, 122, 40, 63, 48, 53, 51, 52, 116, 116, 116}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
          pcall(function()
            game:GetService(g({14, 63, 54, 63, 42, 53, 40, 46, 9, 63, 40, 44, 51, 57, 63}, 90)):Teleport(game.PlaceId, cbw)
          end)
        end
      end
    end
  end
end)
k._notifyWebhook = function(cca, ccb, ccc)
  if (((1 + 1) == 2) and (not l.WebhookEnabled or (l.WebhookURL == ""))) then
    return false
  end
  local ccd = pcall(function()
    k._sendWebhook(l.WebhookURL, {{title = cca, description = ccb, color = (ccc or 0x8B5CF6), footer = {text = (g({25, 53, 42, 63, 122, 18, 47, 56, 122, 184, 218, 206, 122}, 90) .. Players.LocalPlayer.Name)}, timestamp = os.date(g({123, 127, 3, 119, 127, 55, 119, 127, 62, 14, 127, 18, 96, 127, 23, 96, 127, 9, 0}, 90))}})
  end)
  return ccd
end
k._progState = {note = "", lastBuy = 0}
local function cce(ccf)
  local ccg = {}
  for cch, cci in pairs(ccf.Directory.Worlds) do
    if (((15 * 15) == 225) and (not cci.disabled and (((tonumber(cci.worldOrder) or 0)) >= 1))) then
      table.insert(ccg, {name = cch, order = (tonumber(cci.worldOrder) or 99)})
    end
  end
  table.sort(ccg, function(ccj, cck)
    if (((100 % 7) == 2) and (ccj.order ~= cck.order)) then
      return (ccj.order < cck.order)
    end
    return (ccj.name < cck.name)
  end)
  return ccg
end
local function ccl(ccm, ccn)
  local cco = {}
  for ccp, ccq in pairs(ccm.Directory.Areas) do
    if (((12 * 12) == 144) and ((((ccq.world == ccn) and not ccq.hidden) and not ccq.isShop) and not ccq.isVIP)) then
      table.insert(cco, {name = ccp, id = (tonumber(ccq.id) or 0)})
    end
  end
  table.sort(cco, function(ccr, ccs)
    return (ccr.id < ccs.id)
  end)
  return cco
end
local function cct(ccu, ccv)
  local ccw, ccx = pcall(function()
    return ccu.WorldCmds.HasArea(ccv)
  end)
  return (ccw and (ccx == true))
end
local function ccy(ccz, cda, cdb)
  local cdc = 0
  for cdd, cde in ipairs(ccl(ccz, cda)) do
    local cdf = ccz.Directory.Areas[cde.name]
    if (((3 ^ 2) == 9) and (((cdf and cdf.gate) and not ((cdb and cdb[cde.name]))) and not cct(ccz, cde.name))) then
      cdc += 1
    end
  end
  return cdc
end
local function cdg(cdh, cdi)
  l.TargetArea = nil
  l.World = cdi
  n.SwitchingWorld = true
  local cdj, cdk = pcall(function()
    return cdh.WorldCmds.Load(cdi)
  end)
  n.SwitchingWorld = false
  if (((7 * 7) == 49) and (cdj and (cdk == true))) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({10, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52, 96, 122, 59, 40, 40, 51, 44, 63, 62, 122, 59, 46, 122}, 90) .. tostring(cdi)), g({61, 54, 53, 56, 63}, 90))
    return true
  end
  return false
end
local function cdl(cdm, cdn, cdo)
  local cdp = (cdn or (cdm[1] and cdm[1].name))
  if (((1 + 1) == 2) and ((cdp and l.AutoFarm) and (l.TargetArea ~= cdp))) then
    l.TargetArea = cdp
    cdo.note = (((((cdo.note == "") and "") or (cdo.note .. g({122, 152, 237, 122}, 90)))) .. (g({60, 59, 40, 55, 51, 52, 61, 122}, 90) .. cdp))
  end
end
local function cdq(cdr, cds, cdt, cdu, cdv)
  if (((15 * 15) == 225) and not cdu) then
    return
  end
  if (((100 % 7) == 2) and not cdv) then
    cdt.note = (cdu .. g({96, 122, 52, 53, 122, 61, 59, 46, 63, 122, 184, 218, 206, 122, 52, 63, 63, 62, 41, 122, 55, 59, 52, 47, 59, 54, 117, 43, 47, 63, 41, 46, 122, 47, 52, 54, 53, 57, 49}, 90))
    return
  end
  local cdw = cdr.Directory.Areas[cdu]
  local cdx = (cdw and cdw.gate)
  if (((12 * 12) == 144) and not cdx) then
    cdt.note = (cdu .. g({96, 122, 52, 53, 122, 61, 59, 46, 63, 122, 62, 59, 46, 59}, 90))
    return
  end
  local cdy = (tonumber(cdx.cost) or 0)
  local cdz = (tonumber(cds[cdx.currency]) or 0)
  if (((3 ^ 2) == 9) and (cdz < cdy)) then
    cdt.note = string.format(g({127, 41, 96, 122, 127, 41, 122, 117, 122, 127, 41, 122, 127, 41}, 90), cdu, ao(cdz), ao(cdy), tostring(cdx.currency))
    return
  end
  if (((7 * 7) == 49) and ((os.clock() - cdt.lastBuy) <= 1.5)) then
    return
  end
  cdt.lastBuy = os.clock()
  local cea, ceb = cdr.Network.Invoke(g({24, 47, 35, 122, 27, 40, 63, 59}, 90), cdu)
  if (((1 + 1) == 2) and cea) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({10, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52, 96, 122, 47, 52, 54, 53, 57, 49, 63, 62, 122}, 90) .. cdu), g({57, 50, 63, 57, 49}, 90))
    cdt.note = (g({47, 52, 54, 53, 57, 49, 63, 62, 122}, 90) .. cdu)
  else
    cdt.note = (g({56, 47, 35, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring(ceb))
  end
end
local function cec(ced, cee, cef)
  local ceg = (cee.HackerPortalProgress or {0, -1})
  local ceh = (tonumber(ceg[1]) or 0)
  local cei = (tonumber(ceg[2]) or -1)
  if (((15 * 15) == 225) and (cei <= 0)) then
    ced.Network.Fire(g({9, 46, 59, 40, 46, 122, 18, 59, 57, 49, 63, 40, 122, 10, 53, 40, 46, 59, 54, 122, 11, 47, 63, 41, 46, 41}, 90))
    cef.note = (cef.note .. g({41, 46, 59, 40, 46, 51, 52, 61, 122, 50, 59, 57, 49, 63, 40, 122, 42, 53, 40, 46, 59, 54, 122, 43, 47, 63, 41, 46, 41}, 90))
  elseif (((100 % 7) == 2) and (cei <= 3)) then
    local cej = ced.Shared.HackerPortalQuests
    local cek = (cej and tonumber(cej[cei]))
    if (((12 * 12) == 144) and (cek and (ceh >= cek))) then
      local cel = ced.Network.Invoke(g({28, 51, 52, 51, 41, 50, 122, 18, 59, 57, 49, 63, 40, 122, 10, 53, 40, 46, 59, 54, 122, 11, 47, 63, 41, 46}, 90))
      cef.note = ((cel and string.format(g({127, 41, 42, 53, 40, 46, 59, 54, 122, 43, 47, 63, 41, 46, 122, 41, 46, 59, 61, 63, 122, 127, 62, 122, 60, 51, 52, 51, 41, 50, 63, 62}, 90), cef.note, cei)) or ((cef.note .. g({60, 51, 52, 51, 41, 50, 122, 43, 47, 63, 41, 46, 122, 60, 59, 51, 54, 63, 62}, 90))))
    elseif (((3 ^ 2) == 9) and (cei == 3)) then
      local cem = ((ced.Shared.DarkMatterMachineSettings and ced.Shared.DarkMatterMachineSettings.Normal) or {})
      local cen = math.max(1, #cem)
      local ceo, cep = {}, nil
      for ceq, cer in pairs((cee.Pets or {})) do
        if (((7 * 7) == 49) and (#ceo >= cen)) then
          break
        end
        local ces = (cer.id and ced.Directory.Pets[cer.id])
        if (((1 + 1) == 2) and (((((((((cer.r ~= nil) and not cer.dm) and not cer.l) and ces) and not ces.isPremium) and not ces.isGift) and (ces.rarity ~= g({31, 44, 63, 52, 46}, 90))) and (ces.rarity ~= g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90))) and (((cep == nil) or (cer.id == cep))))) then
          cep = (cep or cer.id)
          table.insert(ceo, cer.uid)
        end
      end
      if (((15 * 15) == 225) and (#ceo > 0)) then
        local cet = (cem[math.min(#ceo, #cem)] or {cost = 0})
        if (((100 % 7) == 2) and (((tonumber(cee.Diamonds) or 0)) >= (((tonumber(cet.cost) or 0)) * 3))) then
          if (((12 * 12) == 144) and (os.clock() < ((cef.dmFailUntil or 0)))) then
            cef.note = (cef.note .. g({30, 23, 122, 57, 53, 52, 44, 63, 40, 46, 122, 57, 53, 53, 54, 51, 52, 61, 122, 62, 53, 45, 52}, 90))
          else
            local ceu, cev = ced.Network.Invoke(g({25, 53, 52, 44, 63, 40, 46, 122, 14, 53, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90), ceo)
            cef.note = ((ceu and string.format(g({127, 41, 30, 23, 122, 55, 59, 57, 50, 51, 52, 63, 96, 122, 57, 53, 52, 44, 63, 40, 46, 51, 52, 61, 122, 127, 62, 122, 42, 63, 46, 41}, 90), cef.note, #ceo)) or ((cef.note .. (g({57, 53, 52, 44, 63, 40, 46, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring(cev)))))
            if (((3 ^ 2) == 9) and not ceu) then
              cef.dmFailUntil = (os.clock() + 30)
            end
          end
        else
          cef.note = string.format(g({127, 41, 30, 23, 122, 55, 59, 57, 50, 51, 52, 63, 122, 52, 63, 63, 62, 41, 122, 127, 62, 122, 62, 51, 59, 55, 53, 52, 62, 41}, 90), cef.note, (tonumber(cet.cost) or 0))
        end
      else
        cef.note = (cef.note .. g({42, 53, 40, 46, 59, 54, 122, 43, 105, 96, 122, 52, 53, 122, 57, 53, 52, 44, 63, 40, 46, 51, 56, 54, 63, 122, 42, 63, 46, 41}, 90))
      end
    else
      cef.note = string.format(g({127, 41, 42, 53, 40, 46, 59, 54, 122, 43, 127, 62, 96, 122, 127, 62, 117, 127, 62, 127, 41}, 90), cef.note, cei, ceh, (cek or -1), ((((cei == 1) and g({122, 57, 50, 63, 41, 46, 41, 122, 114, 59, 47, 46, 53, 119, 60, 59, 40, 55, 115}, 90)) or ((cei == 2) and g({122, 56, 59, 61, 41, 122, 114, 59, 47, 46, 53, 119, 56, 59, 61, 41, 115}, 90))) or ""))
    end
  end
end
task.spawn(function()
  while (((7 * 7) == 49) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local cew = k.Library
  if (((1 + 1) == 2) and not cew) then
    return
  end
  while (((15 * 15) == 225) and (k.Gen == o)) do
    task.wait(2)
    local cex = ((((l.AutoCompleteGame and g({59, 57, 61}, 90))) or ((l.AutoWorldProgress and g({45, 42}, 90)))) or ((l.AutoBestArea and g({56, 59}, 90))))
    if (((100 % 7) == 2) and (cex and not n.SwitchingWorld)) then
      pcall(function()
        local cey = cew.Save.Get()
        if (((12 * 12) == 144) and not cey) then
          return
        end
        local cez = cew.WorldCmds.Get()
        if (((3 ^ 2) == 9) and not cez) then
          return
        end
        local function cfa(cfb)
          local cfc, cfd = pcall(function()
            return cew.WorldCmds.HasArea(cfb)
          end)
          return (cfc and (cfd == true))
        end
        local cfe = ccl(cew, cez)
        local cff, cfg, cfh, cfi = 0, nil, nil, false
        for cfj, cfk in ipairs(cfe) do
          if (((7 * 7) == 49) and cfa(cfk.name)) then
            cfh = cfk.name
          else
            local cfl = cew.Directory.Areas[cfk.name]
            if (((1 + 1) == 2) and (cfl and cfl.gate)) then
              cff += 1
              if (((15 * 15) == 225) and not cfg) then
                cfg = cfk.name
                cfi = true
              end
            end
          end
        end
        local cfm = k._progState
        cfm.note = ""
        if (((100 % 7) == 2) and (cex == g({59, 57, 61}, 90))) then
          local cfn = 7500000000
          local function cfo(cfp)
            if (((12 * 12) == 144) and (cez == cfp)) then
              return true
            end
            if (((3 ^ 2) == 9) and not cew.WorldCmds.HasAccess(cfp)) then
              cfm.note = (g({52, 53, 122, 59, 57, 57, 63, 41, 41, 122, 46, 53, 122}, 90) .. tostring(cfp))
              return false
            end
            if (((7 * 7) == 49) and (os.clock() < ((cfm.travelHoldUntil or 0)))) then
              cfm.note = (g({46, 40, 59, 44, 63, 54, 122, 46, 53, 122}, 90) .. (tostring(cfp) .. g({122, 42, 59, 47, 41, 63, 62}, 90)))
              return false
            end
            cfm.note = (g({46, 40, 59, 44, 63, 54, 51, 52, 61, 122, 46, 53, 122}, 90) .. tostring(cfp))
            if (((1 + 1) == 2) and not cdg(cew, cfp)) then
              cfm.travelHoldUntil = (os.clock() + 5)
              cfm.note = (g({46, 40, 59, 44, 63, 54, 122, 46, 53, 122}, 90) .. (tostring(cfp) .. g({122, 60, 59, 51, 54, 63, 62, 122, 184, 218, 206, 122, 40, 63, 46, 40, 35, 51, 52, 61}, 90)))
            end
            return false
          end
          if (((15 * 15) == 225) and (ccy(cew, g({9, 42, 59, 45, 52}, 90), {[g({19, 57, 63, 122, 14, 63, 57, 50}, 90)] = true}) > 0)) then
            if (((100 % 7) == 2) and cfo(g({9, 42, 59, 45, 52}, 90))) then
              cdl(cfe, cfh, cfm)
              cdq(cew, cey, cfm, cfg, cfi)
            end
            return
          end
          if (((12 * 12) == 144) and (cez ~= g({28, 59, 52, 46, 59, 41, 35}, 90))) then
            cfo(g({28, 59, 52, 46, 59, 41, 35}, 90))
            return
          end
          if (((3 ^ 2) == 9) and (ccy(cew, g({28, 59, 52, 46, 59, 41, 35}, 90)) > 0)) then
            cdl(cfe, cfh, cfm)
            cdq(cew, cey, cfm, cfg, cfi)
            return
          end
          if (((7 * 7) == 49) and not cfa(g({19, 57, 63, 122, 14, 63, 57, 50}, 90))) then
            local cfq = (tonumber(cey[g({28, 59, 52, 46, 59, 41, 35, 122, 25, 53, 51, 52, 41}, 90)]) or 0)
            if (((1 + 1) == 2) and (cfq < cfn)) then
              cdl(cfe, cfh, cfm)
              cfm.note = string.format(g({127, 41, 122, 152, 237, 122, 127, 41, 122, 117, 122, 109, 116, 111, 24, 122, 28, 59, 52, 46, 59, 41, 35, 122, 25, 53, 51, 52, 41}, 90), (((cfm.note == "") and g({61, 40, 51, 52, 62, 51, 52, 61}, 90)) or cfm.note), ao(cfq))
              return
            end
            if (((15 * 15) == 225) and (cez ~= g({9, 42, 59, 45, 52}, 90))) then
              cfo(g({9, 42, 59, 45, 52}, 90))
              return
            end
            cdl(cfe, cfh, cfm)
            cdq(cew, cey, cfm, cfg, cfi)
            return
          end
          if (((100 % 7) == 2) and (cez ~= g({14, 63, 57, 50}, 90))) then
            cfo(g({14, 63, 57, 50}, 90))
            return
          end
          if (((12 * 12) == 144) and (ccy(cew, g({14, 63, 57, 50}, 90)) > 0)) then
            cdl(cfe, cfh, cfm)
            cdq(cew, cey, cfm, cfg, cfi)
            return
          end
          if (((3 ^ 2) == 9) and not cey.HackerPortalUnlocked) then
            cec(cew, cey, cfm)
            return
          end
          if (((7 * 7) == 49) and (cez ~= g({12, 53, 51, 62}, 90))) then
            cfo(g({12, 53, 51, 62}, 90))
            return
          end
          if (((1 + 1) == 2) and not cfa(g({14, 50, 63, 122, 12, 53, 51, 62}, 90))) then
            cfm.note = g({45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122, 125, 14, 50, 63, 122, 12, 53, 51, 62, 125, 122, 59, 40, 63, 59, 122, 61, 40, 59, 52, 46}, 90)
            return
          end
          if (((15 * 15) == 225) and (ccy(cew, g({27, 34, 53, 54, 53, 46, 54, 122, 21, 57, 63, 59, 52}, 90)) > 0)) then
            if (((100 % 7) == 2) and cfo(g({27, 34, 53, 54, 53, 46, 54, 122, 21, 57, 63, 59, 52}, 90))) then
              cdl(cfe, cfh, cfm)
              cdq(cew, cey, cfm, cfg, cfi)
            end
            return
          end
          if (((12 * 12) == 144) and (ccy(cew, g({10, 51, 34, 63, 54}, 90)) > 0)) then
            if (((3 ^ 2) == 9) and cfo(g({10, 51, 34, 63, 54}, 90))) then
              cdl(cfe, cfh, cfm)
              cdq(cew, cey, cfm, cfg, cfi)
            end
            return
          end
          l.AutoCompleteGame = false
          if (((7 * 7) == 49) and (l.ACGResumeFarm == false)) then
            l.AutoFarm = false
          end
          l.ACGResumeFarm = nil
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 15, 14, 21, 122, 25, 21, 23, 10, 22, 31, 14, 31, 122, 29, 27, 23, 31, 122, 60, 51, 52, 51, 41, 50, 63, 62, 122, 184, 218, 206, 122, 10, 51, 34, 63, 54, 122, 57, 53, 55, 42, 54, 63, 46, 63, 123}, 90), g({46, 40, 53, 42, 50, 35}, 90))
          k._notifyWebhook(g({27, 47, 46, 53, 122, 25, 53, 55, 42, 54, 63, 46, 63, 122, 29, 59, 55, 63, 122, 25, 53, 55, 42, 54, 63, 46, 63}, 90), g({31, 44, 63, 40, 35, 122, 45, 53, 40, 54, 62, 122, 57, 53, 55, 42, 54, 63, 46, 63, 62, 122, 46, 50, 40, 53, 47, 61, 50, 122, 112, 112, 10, 51, 34, 63, 54, 112, 112, 123}, 90), 0x34D399)
          return
        end
        if (((1 + 1) == 2) and (cff == 0)) then
          if (((15 * 15) == 225) and (cex == g({45, 42}, 90))) then
            local cfr = cce(cew)
            local cfs, cft = nil, false
            for cfu, cfv in ipairs(cfr) do
              if (((100 % 7) == 2) and cft) then
                cfs = cfv.name
                break
              end
              if (((12 * 12) == 144) and (cfv.name == cez)) then
                cft = true
              end
            end
            if (((3 ^ 2) == 9) and (cfs and cew.WorldCmds.HasAccess(cfs))) then
              cfm.note = (tostring(cez) .. (g({122, 62, 53, 52, 63, 122, 119, 100, 122}, 90) .. tostring(cfs)))
              cdg(cew, cfs)
            elseif (((7 * 7) == 49) and cfs) then
              cfm.note = (g({45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122, 59, 57, 57, 63, 41, 41, 122, 46, 53, 122}, 90) .. tostring(cfs))
            else
              cfm.note = g({52, 53, 122, 60, 47, 40, 46, 50, 63, 40, 122, 45, 53, 40, 54, 62, 41}, 90)
            end
          else
            cfm.note = (tostring(cez) .. g({122, 60, 47, 54, 54, 35, 122, 47, 52, 54, 53, 57, 49, 63, 62}, 90))
          end
          return
        end
        cdl(cfe, cfh, cfm)
        if (((1 + 1) == 2) and (cex == g({45, 42}, 90))) then
          cdq(cew, cey, cfm, cfg, cfi)
        end
        if (((15 * 15) == 225) and (((cex == g({45, 42}, 90)) and (cez == g({14, 63, 57, 50}, 90))) and not cey.HackerPortalUnlocked)) then
          cec(cew, cey, cfm)
        end
        if (((100 % 7) == 2) and (cfm.note == "")) then
          cfm.note = string.format(g({127, 41, 122, 184, 218, 206, 122, 127, 62, 122, 54, 53, 57, 49, 63, 62, 127, 41}, 90), tostring(cez), cff, ((cfg and ((g({96, 122, 52, 63, 34, 46, 122}, 90) .. (cfg .. (((cfi and "") or g({122, 114, 52, 53, 122, 61, 59, 46, 63, 115}, 90))))))) or ""))
        end
      end)
    end
  end
end)
local function cfw(cfx, cfy)
  local cfz = nil
  for cga, cgb in ipairs(ccl(cfx, cfy)) do
    if (((12 * 12) == 144) and cct(cfx, cgb.name)) then
      cfz = cgb.name
    end
  end
  return cfz
end
local function cgc(cgd, cge)
  local cgf = {}
  local cgg = ba()
  local cgh = (cgg and cgg:FindFirstChild(g({25, 53, 51, 52, 41}, 90)))
  if (((3 ^ 2) == 9) and cgh) then
    for cgi, cgj in ipairs(cgh:GetChildren()) do
      local cgk = tostring((bc(cgj, g({27, 40, 63, 59}, 90)) or ""))
      if (((7 * 7) == 49) and (cgk ~= "")) then
        local cgl = (bc(cgj, g({18, 63, 59, 54, 46, 50}, 90)) or 0)
        if (((1 + 1) == 2) and (cgl > 0)) then
          cgf[cgk] = (((cgf[cgk] or 0)) + cgl)
        end
      end
    end
  end
  local cgm, cgn = nil, -1
  for cgo, cgp in pairs(cgf) do
    if (((15 * 15) == 225) and (cgp > cgn)) then
      cgm, cgn = cgo, cgp
    end
  end
  if (((100 % 7) == 2) and cgm) then
    return cgm
  end
  local cgq = ccl(cgd, cge)
  return (cgq[1] and cgq[1].name)
end
task.spawn(function()
  while (((12 * 12) == 144) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local cgr = k.Library
  if (((3 ^ 2) == 9) and not cgr) then
    return
  end
  while (((7 * 7) == 49) and (k.Gen == o)) do
    task.wait(2.5)
    if (((1 + 1) == 2) and ((((l.AutoBestArea == true) and (l.AutoWorldProgress ~= true)) and (l.AutoCompleteGame ~= true)) and not n.SwitchingWorld)) then
      local cgs = nil
      pcall(function()
        cgs = cgr.WorldCmds.Get()
      end)
      if (((15 * 15) == 225) and cgs) then
        local cgt = (cfw(cgr, cgs) or cgc(cgr, cgs))
        if (((100 % 7) == 2) and (cgt and (l.TargetArea ~= cgt))) then
          l.TargetArea = cgt
        end
      end
    end
  end
end)
task.spawn(function()
  while (((12 * 12) == 144) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local cgu = k.Library
  if (((3 ^ 2) == 9) and not cgu) then
    return
  end
  while (((7 * 7) == 49) and (k.Gen == o)) do
    task.wait(20)
    if (((1 + 1) == 2) and l.AutoGifts) then
      pcall(function()
        local cgv = cgu.Save.Get()
        if (((15 * 15) == 225) and not cgv) then
          return
        end
        local cgw = (cgv.FreeGiftsRedeemed or {})
        local cgx, cgy = 0, 0
        for cgz, cha in pairs((cgu.Directory.FreeGifts or {})) do
          local chb = tonumber(cgz)
          if (((100 % 7) == 2) and (((chb and (type(cha) == g({46, 59, 56, 54, 63}, 90))) and (((tonumber(cha.waitTime) or 0)) <= ((tonumber(cgv.FreeGiftsTime) or 0)))) and not table.find(cgw, chb))) then
            cgy += 1
            local chc, chd = pcall(function()
              return select(1, cgu.Network.Invoke(g({8, 63, 62, 63, 63, 55, 122, 28, 40, 63, 63, 122, 29, 51, 60, 46}, 90), chb))
            end)
            if (((12 * 12) == 144) and (chc and (chd ~= false))) then
              cgx += 1
            end
            task.wait(0.15)
          end
        end
        if (((3 ^ 2) == 9) and (cgx > 0)) then
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({10, 54, 59, 35, 46, 51, 55, 63, 122, 61, 51, 60, 46, 41, 96, 122, 57, 54, 59, 51, 55, 63, 62, 122, 127, 62, 122, 53, 60, 122, 127, 62, 122, 40, 63, 59, 62, 35}, 90), cgx, cgy), g({61, 51, 60, 46}, 90))
        end
      end)
    end
  end
end)
task.spawn(function()
  while (((7 * 7) == 49) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local che = k.Library
  if (((1 + 1) == 2) and not che) then
    return
  end
  while (((15 * 15) == 225) and (k.Gen == o)) do
    task.wait(1)
    if (((100 % 7) == 2) and l.AutoDiamondPacks) then
      pcall(function()
        local chf = k._dpFind(l.DiamondPackIndex)
        if (((12 * 12) == 144) and not chf) then
          n.DPNote = g({52, 53, 122, 42, 59, 57, 49, 122, 42, 51, 57, 49, 63, 62}, 90)
          return
        end
        local chg = che.Save.Get()
        if (((3 ^ 2) == 9) and not chg) then
          return
        end
        local chh = math.clamp(math.floor((tonumber(l.DiamondPackCap) or 0)), 0, 1000)
        if (((7 * 7) == 49) and ((chh > 0) and (((n.DPBought or 0)) >= chh))) then
          n.DPNote = string.format(g({57, 59, 42, 122, 40, 63, 59, 57, 50, 63, 62, 122, 114, 127, 62, 115}, 90), chh)
          l.AutoDiamondPacks = false
          if (((1 + 1) == 2) and k._dpToggle) then
            pcall(function()
              k._dpToggle:Set(false, false)
            end)
          end
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({30, 51, 59, 55, 53, 52, 62, 122, 42, 59, 57, 49, 41, 96, 122, 41, 46, 53, 42, 42, 63, 62, 122, 59, 46, 122, 46, 50, 63, 122, 127, 62, 119, 56, 47, 35, 122, 57, 59, 42, 122, 114, 113, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41, 115}, 90), chh, ao((n.DPGained or 0))), g({61, 63, 55}, 90))
          return
        end
        local chi = math.max(0, math.floor((tonumber(l.DiamondPackTarget) or 0)))
        local chj = (tonumber(chg.Diamonds) or 0)
        if (((15 * 15) == 225) and ((chi > 0) and (chj >= chi))) then
          n.DPNote = g({46, 59, 40, 61, 63, 46, 122, 55, 63, 46}, 90)
          l.AutoDiamondPacks = false
          if (((100 % 7) == 2) and k._dpToggle) then
            pcall(function()
              k._dpToggle:Set(false, false)
            end)
          end
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({30, 51, 59, 55, 53, 52, 62, 122, 42, 59, 57, 49, 41, 96, 122, 50, 51, 46, 122, 46, 50, 63, 122, 127, 41, 122, 46, 59, 40, 61, 63, 46}, 90), ao(chi)), g({61, 63, 55}, 90))
          return
        end
        if (((12 * 12) == 144) and (((n.DPNextAt or 0)) > os.clock())) then
          return
        end
        local chk = (tonumber(chg[chf.currency]) or 0)
        if (((3 ^ 2) == 9) and not n.DPBase) then
          n.DPBase = chk
        end
        local chl = math.clamp(math.floor((tonumber(l.DiamondPackReservePct) or 0)), 0, 90)
        local chm = math.floor(((((n.DPBase or chk)) * chl) / 100))
        if (((7 * 7) == 49) and ((chk - chf.cost) < chm)) then
          n.DPNote = ((((chk < chf.cost)) and g({57, 59, 52, 52, 53, 46, 122, 59, 60, 60, 53, 40, 62}, 90)) or string.format(g({59, 46, 122, 127, 62, 127, 127, 122, 60, 54, 53, 53, 40}, 90), chl))
          n.DPNextAt = (os.clock() + 15)
          return
        end
        local chn, cho = k._buyDiamondPack(che, chf.index)
        local chp = math.clamp(math.floor((tonumber(l.DiamondPackInterval) or 5)), 1, 60)
        n.DPNextAt = (os.clock() + chp)
        if (((1 + 1) == 2) and chn) then
          n.DPBought = (((n.DPBought or 0)) + 1)
          n.DPGained = (((n.DPGained or 0)) + chf.diamonds)
          n.DPNote = string.format(g({56, 53, 47, 61, 50, 46, 122, 121, 127, 62}, 90), chf.index)
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({10, 59, 57, 49, 122, 121, 127, 62, 122, 56, 53, 47, 61, 50, 46, 122, 114, 127, 41, 115, 122, 184, 218, 206, 122, 113, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41}, 90), chf.index, ((((chh > 0) and string.format(g({127, 62, 117, 127, 62}, 90), n.DPBought, chh)) or as(n.DPBought))), ao(chf.diamonds)), g({61, 63, 55}, 90))
        else
          n.DPNote = tostring(cho)
          n.DPNextAt = (os.clock() + math.max(chp, 10))
          if (((15 * 15) == 225) and not n.DPErrShown) then
            n.DPErrShown = true
            ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({30, 51, 59, 55, 53, 52, 62, 122, 42, 59, 57, 49, 122, 40, 63, 60, 47, 41, 63, 62, 96, 122}, 90) .. tostring(cho)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
          end
        end
      end)
    end
  end
end)
local chq = {}
task.spawn(function()
  while (((100 % 7) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local chr = k.Library
  if (((12 * 12) == 144) and not chr) then
    return
  end
  while (((3 ^ 2) == 9) and (k.Gen == o)) do
    task.wait(15)
    local chs = l.PotionKeepBoosts
    if (((7 * 7) == 49) and ((type(chs) == g({46, 59, 56, 54, 63}, 90)) and (#chs > 0))) then
      pcall(function()
        local cht = chr.Save.Get()
        if (((1 + 1) == 2) and not cht) then
          return
        end
        local chu = 0
        pcall(function()
          chu = (tonumber(chr.Network.Invoke(g({29, 63, 46, 122, 21, 9, 14, 51, 55, 63}, 90))) or 0)
        end)
        local chv = (cht.BoostsInventory or {})
        local chw = (cht.Boosts or {})
        local chx = (tonumber(l.PotionKeepStock) or 10)
        local chy = (tonumber(l.PotionDiamondFloor) or 0)
        for chz, cia in ipairs(chs) do
          local cib = nil
          for cic, cid in ipairs(k.BOOSTS) do
            if (((15 * 15) == 225) and (cid.key == cia)) then
              cib = cid
              break
            end
          end
          if (((100 % 7) == 2) and cib) then
            local cie = (tonumber(chv[cia]) or 0)
            local cif = (tonumber(chw[cia]) or 0)
            if (((12 * 12) == 144) and ((l.PotionAutoUse and (cie > 0)) and (cif <= chu))) then
              pcall(function()
                chr.Network.Fire(g({27, 57, 46, 51, 44, 59, 46, 63, 122, 24, 53, 53, 41, 46}, 90), cia)
              end)
              cie -= 1
              ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({10, 53, 46, 51, 53, 52, 122, 17, 63, 63, 42, 63, 40, 96, 122, 59, 57, 46, 51, 44, 59, 46, 63, 62, 122}, 90) .. cia), g({60, 54, 59, 41, 49}, 90))
            end
            local cig = (chx - cie)
            if (((3 ^ 2) == 9) and (cig > 0)) then
              local cih = (tonumber(cht.Diamonds) or 0)
              local cii = (cig * ((cib.price or 0)))
              if (((7 * 7) == 49) and ((cih - cii) >= chy)) then
                local cij = select(1, k._buyBoosts(cia, math.min(cig, 25), nil, {floor = chy}))
                if (((1 + 1) == 2) and (cij and (cij > 0))) then
                  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({10, 53, 46, 51, 53, 52, 122, 17, 63, 63, 42, 63, 40, 96, 122, 113, 127, 62, 34, 122, 127, 41}, 90), cij, cia), g({60, 54, 59, 41, 49}, 90))
                end
              else
                chq = (chq or {})
                if (((15 * 15) == 225) and not chq[cia]) then
                  chq[cia] = true
                  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({10, 53, 46, 51, 53, 52, 122, 17, 63, 63, 42, 63, 40, 96, 122, 62, 51, 59, 55, 53, 52, 62, 122, 60, 54, 53, 53, 40, 122, 50, 51, 46, 118, 122, 41, 49, 51, 42, 42, 51, 52, 61, 122}, 90) .. cia), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
                  task.delay(300, function()
                    chq[cia] = nil
                  end)
                end
              end
            end
          end
        end
      end)
    end
  end
end)
local function cik(cil)
  if (((100 % 7) == 2) and (type(cil) ~= g({46, 59, 56, 54, 63}, 90))) then
    return tostring(cil)
  end
  local cim = {}
  for cin, cio in pairs(cil) do
    if (((12 * 12) == 144) and (type(cio) == g({46, 59, 56, 54, 63}, 90))) then
      local cip, ciq = 0, nil
      for cir, cis in pairs(cio) do
        cip += 1
        ciq = (ciq or ((tostring(cir) .. (g({103}, 90) .. ((((type(cis) == g({46, 59, 56, 54, 63}, 90)) and g({101}, 90)) or tostring(cis)))))))
      end
      cim[(#cim + 1)] = (tostring(cin) .. (g({96, 122}, 90) .. (cip .. (g({122, 51, 46, 63, 55, 114, 41, 115}, 90) .. (((ciq and ((g({122, 184, 218, 206, 122, 60, 51, 40, 41, 46, 96, 122}, 90) .. ciq))) or ""))))))
    else
      cim[(#cim + 1)] = (tostring(cin) .. (g({96, 122}, 90) .. tostring(cio)))
    end
  end
  if (((3 ^ 2) == 9) and (#cim == 0)) then
    return g({114, 63, 55, 42, 46, 35, 122, 63, 52, 46, 40, 35, 115}, 90)
  end
  return table.concat(cim, g({80}, 90))
end
task.spawn(function()
  while (((7 * 7) == 49) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local cit = k.Library
  if (((1 + 1) == 2) and not cit) then
    return
  end
  while (((15 * 15) == 225) and (k.Gen == o)) do
    task.wait(6)
    if (((100 % 7) == 2) and ((l.TradeJournal and l.WebhookEnabled) and (l.WebhookURL ~= ""))) then
      pcall(function()
        local ciu = cit.Save.Get()
        local civ = (ciu and ciu.TradeHistory2)
        if (((12 * 12) == 144) and (type(civ) ~= g({46, 59, 56, 54, 63}, 90))) then
          return
        end
        local ciw = #civ
        if (((3 ^ 2) == 9) and (n.TradeSeen == nil)) then
          n.TradeSeen = ciw
          return
        end
        if (((7 * 7) == 49) and (ciw > n.TradeSeen)) then
          for cix = (n.TradeSeen + 1), ciw do
            k._notifyWebhook(g({14, 40, 59, 62, 63, 122, 25, 53, 55, 42, 54, 63, 46, 63, 62}, 90), cik(civ[cix]), 0x22D3EE)
          end
          n.TradeSeen = ciw
        elseif (((1 + 1) == 2) and (ciw < n.TradeSeen)) then
          n.TradeSeen = ciw
        end
      end)
    end
  end
end)
task.spawn(function()
  while (((15 * 15) == 225) and (k.Gen == o)) do
    task.wait(5)
    if (((100 % 7) == 2) and (l.AutoSaveSettings ~= false)) then
      local ciy = false
      pcall(function()
        ciy = k.SaveSettings()
      end)
      if (((12 * 12) == 144) and (ciy and k._refreshSaveStatus)) then
        pcall(k._refreshSaveStatus)
      end
    end
  end
end)
task.delay(2, function()
  brk((l.PerfNoShadows == true))
  brm((l.PerfTextures == true))
  brt((l.PerfParticles == true))
  bry((l.PerfPostFX == true))
  bse((l.PerfHidePlayers == true))
  k._setAntiAFK((l.AntiAFK ~= false))
  k._setDisablePopups((l.DisablePopups == true))
  if (((3 ^ 2) == 9) and (l.BgMode == true)) then
    l.BgMode = false
    if (((7 * 7) == 49) and (l.BgAuto ~= true)) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 41, 46, 59, 40, 46, 41, 122, 53, 60, 60, 122, 59, 60, 46, 63, 40, 122, 59, 122, 54, 53, 59, 62, 122, 184, 218, 206, 122, 46, 47, 40, 52, 122, 51, 46, 122, 56, 59, 57, 49, 122, 53, 52, 118, 122, 53, 40, 122, 47, 41, 63, 122, 120, 21, 52, 54, 35, 122, 13, 50, 51, 54, 63, 122, 14, 50, 63, 122, 18, 47, 56, 122, 19, 41, 122, 18, 51, 62, 62, 63, 52, 120}, 90), g({51, 52, 60, 53}, 90))
    end
  end
end)
k._destroyWidget = nil
do
  local ciz = false
  function k.BuildWidget()
    if (((1 + 1) == 2) and ciz) then
      return
    end
    ciz = true
    task.spawn(function()
      local cja = nil
      for cjb = 1, 120 do
        local cjc, cjd = pcall(function()
          return Players.LocalPlayer.PlayerGui.Main.Left
        end)
        if (((15 * 15) == 225) and (cjc and cjd)) then
          cja = cjd
          break
        end
        task.wait(0.5)
      end
      if (((100 % 7) == 2) and (not cja or not cja.Parent)) then
        return
      end
      local cje = nil
      for cjf = 1, 60 do
        cje = (cja:FindFirstChild(g({14, 53, 53, 54, 41}, 90)) and cja.Tools:FindFirstChild(g({18, 53, 44, 63, 40, 56, 53, 59, 40, 62}, 90)))
        if (((12 * 12) == 144) and cje) then
          break
        end
        task.wait(0.5)
      end
      if (((3 ^ 2) == 9) and not cje) then
        return
      end
      if (((7 * 7) == 49) and (k.Gen ~= o)) then
        return
      end
      local cjg = aor(g({28, 40, 59, 55, 63}, 90), {Name = g({25, 53, 42, 63, 18, 47, 56, 9, 46, 59, 46, 41}, 90), BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Parent = cja})
      local cjh = aor(g({28, 40, 59, 55, 63}, 90), {Name = g({27, 52, 57, 50, 53, 40}, 90), BackgroundTransparency = 1, Size = UDim2.fromOffset(46, 46), Position = UDim2.fromOffset(0, 0), Parent = cjg})
      local cji = aor(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Size = UDim2.fromScale(1, 1), BackgroundColor3 = aop.Bg, BackgroundTransparency = 0.08, Text = "", AutoButtonColor = false, ZIndex = 900, Parent = cjh})
      aos(14, cji)
      aor(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Rotation = 90, Color = ColorSequence.new(aop.Element, aop.Bg), Parent = cji})
      local cjj = aoo.markAccent(aot(aop.Accent, 0.15, 2, cji), g({25, 53, 54, 53, 40}, 90))
      local cjk = aor(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, aop.Accent), ColorSequenceKeypoint.new(0.5, aop.Accent2), ColorSequenceKeypoint.new(1, aop.Accent)}), Parent = cjj})
      aoo.markAccent(cjk, g({61, 40, 59, 62}, 90))
      local cjl = aor(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 6, 0, 3), Size = UDim2.new(1, -12, 0, 12), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.88, BorderSizePixel = 0, ZIndex = 901, Parent = cji})
      aos(999, cjl)
      local cjm = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamBlack, Text = g({25}, 90), TextSize = 20, TextColor3 = aop.Text, ZIndex = 902, Parent = cji})
      aor(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), aop.Accent2), Rotation = 115, Parent = cjm})
      local cjn = aor(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 1, Parent = cji})
      task.spawn(function()
        while (((1 + 1) == 2) and cjg.Parent) do
          cjk.Rotation = (((os.clock() * 120)) % 360)
          cjn.Scale = (1 + (math.sin((os.clock() * 2.2)) * 0.025))
          task.wait(0.05)
        end
      end)
      cji.MouseEnter:Connect(function()
        aok:Create(cji, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
        aok:Create(cjn, TweenInfo.new(0.15), {Scale = 1.06}):Play()
      end)
      cji.MouseLeave:Connect(function()
        aok:Create(cji, TweenInfo.new(0.15), {BackgroundTransparency = 0.08}):Play()
        aok:Create(cjn, TweenInfo.new(0.2), {Scale = 1}):Play()
      end)
      cji.MouseButton1Down:Connect(function()
        aok:Create(cjn, TweenInfo.new(0.08), {Scale = 0.94}):Play()
      end)
      cji.MouseButton1Up:Connect(function()
        aok:Create(cjn, TweenInfo.new(0.1), {Scale = 1}):Play()
      end)
      local cjo, cjp = 178, 206
      local cjq = aor(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(1, 12, 0.5, 0), Size = UDim2.fromOffset(cjo, cjp), BackgroundColor3 = aop.Surface, Visible = false, BorderSizePixel = 0, ZIndex = 950, Parent = cjh})
      aos(14, cjq)
      aot(aop.Stroke, 0.3, 1, cjq)
      local cjr = aor(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 0.92, Parent = cjq})
      local cjs = aor(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 12, 0, 10), Size = UDim2.new(1, -24, 0, 18), BackgroundTransparency = 1, ZIndex = 951, Parent = cjq})
      aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.new(1, -14, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12, RichText = true, TextXAlignment = Enum.TextXAlignment.Left, Text = g({102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 121, 98, 24, 111, 25, 28, 108, 120, 100, 25, 21, 10, 31, 102, 117, 60, 53, 52, 46, 100, 122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 121, 104, 104, 30, 105, 31, 31, 120, 100, 18, 15, 24, 102, 117, 60, 53, 52, 46, 100}, 90), ZIndex = 952, Parent = cjs})
      local cjt = aor(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Size = UDim2.fromOffset(7, 7), BackgroundColor3 = Color3.fromRGB(74, 222, 128), BorderSizePixel = 0, ZIndex = 952, Parent = cjs})
      aos(999, cjt)
      aot(Color3.fromRGB(74, 222, 128), 0.5, 1, cjt)
      local cju = aor(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 12, 0, 34), Size = UDim2.new(1, -24, 0, 1), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.85, BorderSizePixel = 0, ZIndex = 951, Parent = cjq})
      aoo.markAccent(aor(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(aop.Accent, aop.Accent2), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(0.5, 0.5), NumberSequenceKeypoint.new(1, 0.95)}), Parent = cju}), g({61, 40, 59, 62}, 90))
      local cjv = aor(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 12, 0, 42), Size = UDim2.new(1, -24, 1, -50), BackgroundTransparency = 1, ZIndex = 951, Parent = cjq})
      aor(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90), {Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder, Parent = cjv})
      local cjw, cjx, cjy = Color3.fromRGB(74, 222, 128), Color3.fromRGB(251, 191, 36), Color3.fromRGB(248, 113, 113)
      local ckb = {{key = g({60, 42, 41}, 90), label = g({28, 10, 9}, 90), color = function(cjz)
        return cjz
      end}, {key = g({42, 51, 52, 61}, 90), label = g({10, 51, 52, 61}, 90), color = function(cka)
        return cka
      end}, {key = g({41, 63, 41, 41, 51, 53, 52}, 90), label = g({9, 63, 41, 41, 51, 53, 52}, 90)}, {key = g({63, 61, 61, 41}, 90), label = g({31, 61, 61, 41, 122, 18, 59, 46, 57, 50, 63, 62}, 90)}, {key = g({50, 47, 61, 63, 41}, 90), label = g({18, 47, 61, 63, 41, 122, 18, 59, 46, 57, 50, 63, 62}, 90)}, {key = g({62, 51, 59}, 90), label = g({30, 51, 59, 55, 53, 52, 62, 41, 122, 31, 59, 40, 52, 63, 62}, 90), fixed = aop.Accent2}}
      local ckc = {}
      for ckd, cke in ipairs(ckb) do
        local ckf = aor(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.new(1, 0, 0, 25), BackgroundColor3 = aop.Bg, BackgroundTransparency = 0.55, BorderSizePixel = 0, ZIndex = 951, LayoutOrder = ckd, Parent = cjv})
        aos(8, ckf)
        aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 9, 0, 0), Size = UDim2.new(0.6, -9, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 11, TextColor3 = aop.SubText, TextXAlignment = Enum.TextXAlignment.Left, Text = cke.label, ZIndex = 952, Parent = ckf})
        ckc[cke.key] = aor(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -9, 0, 0), Size = UDim2.new(0.4, -9, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = aop.Text, TextXAlignment = Enum.TextXAlignment.Right, Text = g({119}, 90), ZIndex = 952, Parent = ckf})
      end
      local ckg = false
      local function ckh()
        pcall(function()
          local cki = aoo.FPS
          ckc.fps.Text = tostring(cki)
          ckc.fps.TextColor3 = (((((cki >= 50) and cjw)) or (((cki >= 30) and cjx))) or cjy)
          local ckj = aoo.Ping
          ckc.ping.Text = (ckj .. g({122, 55, 41}, 90))
          ckc.ping.TextColor3 = (((((ckj <= 90) and cjw)) or (((ckj <= 170) and cjx))) or cjy)
          ckc.session.TextColor3 = aop.Text
          ckc.session.Text = aw(math.floor((os.clock() - aoo.T0)))
          ckc.eggs.TextColor3 = aop.Text
          ckc.eggs.Text = as(m.Eggs)
          ckc.huges.TextColor3 = aop.Text
          ckc.huges.Text = as(m.Huges)
          ckc.dia.TextColor3 = aop.Accent2
          local ckk = (n.PendingData and n.PendingData.Diamonds)
          if (((15 * 15) == 225) and (ckk and n.DiaStart)) then
            ckc.dia.Text = ao((ckk - n.DiaStart))
          else
            ckc.dia.Text = g({119}, 90)
          end
        end)
      end
      cji.Activated:Connect(function()
        ckg = not ckg
        if (((100 % 7) == 2) and ckg) then
          ckh()
          cjq.Visible = true
          cjr.Scale = 0.92
          aok:Create(cjr, TweenInfo.new(0.24, Enum.EasingStyle.Back), {Scale = 1}):Play()
        else
          aok:Create(cjr, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Scale = 0.9}):Play()
          task.delay(0.16, function()
            if (((12 * 12) == 144) and not ckg) then
              cjq.Visible = false
            end
          end)
        end
      end)
      aoq(aol.Heartbeat, function()
        if (((3 ^ 2) == 9) and (not cje.Parent or not cja.Parent)) then
          return
        end
        cjh.Position = UDim2.fromOffset(math.floor((cje.AbsolutePosition.X - cja.AbsolutePosition.X)), (math.floor((cje.AbsolutePosition.Y - cja.AbsolutePosition.Y)) - 61))
      end)
      task.spawn(function()
        while (((7 * 7) == 49) and (cjg.Parent and (k.Gen == o))) do
          if (((1 + 1) == 2) and ckg) then
            ckh()
          end
          task.wait(0.5)
        end
      end)
      k._destroyWidget = function()
        pcall(function()
          cjg:Destroy()
        end)
        ciz = false
      end
    end)
  end
  task.spawn(function()
    k.BuildWidget()
  end)
end
local ckl = {Area = nil, World = nil, Egg = nil, IndexWorlds = nil}
local ckm = {}
local function ckn(cko)
  if (((15 * 15) == 225) and ckl.Area) then
    ckl.Area:Destroy()
  end
  local ckp = cko.Areas
  if (((100 % 7) == 2) and (#ckp == 0)) then
    return
  end
  table.insert(ckp, 1, g({20, 53, 52, 63}, 90))
  if (((12 * 12) == 144) and ((l.TargetArea ~= nil) and not table.find(ckp, l.TargetArea))) then
    l.TargetArea = (cko.DefaultArea or ckp[#ckp])
  end
  ckl.Area = aoo.pin(bfv:Dropdown({Title = g({14, 59, 40, 61, 63, 46, 122, 27, 40, 63, 59}, 90), Desc = g({3, 53, 47, 40, 122, 47, 52, 54, 53, 57, 49, 63, 62, 122, 59, 40, 63, 59, 41, 122, 114, 54, 51, 44, 63, 115, 97, 122, 20, 53, 52, 63, 122, 51, 62, 54, 63, 41, 122, 46, 50, 63, 122, 60, 59, 40, 55}, 90), Values = ckp, Value = (l.TargetArea or g({20, 53, 52, 63}, 90)), Callback = function(ckq)
    l.TargetArea = ((((ckq == g({20, 53, 52, 63}, 90))) and nil) or ckq)
  end}), bgq)
end
local function ckr(cks)
  if (((3 ^ 2) == 9) and ckl.World) then
    ckl.World:Destroy()
  end
  local ckt = cks.Worlds
  if (((7 * 7) == 49) and (#ckt == 0)) then
    return
  end
  if (((1 + 1) == 2) and (not l.World or not table.find(ckt, l.World))) then
    l.World = (cks.World or ckt[1])
  end
  ckl.World = aoo.pin(bfv:Dropdown({Title = (g({13, 53, 40, 54, 62, 122, 114, 51, 52, 96, 122}, 90) .. (tostring(cks.World) .. g({115}, 90))), Desc = g({9, 45, 51, 46, 57, 50, 122, 45, 53, 40, 54, 62, 41, 97, 122, 60, 59, 40, 55, 51, 52, 61, 122, 40, 63, 41, 47, 55, 63, 41, 122, 59, 60, 46, 63, 40, 122, 54, 53, 59, 62}, 90), Values = ckt, Value = l.World, Callback = function(cku)
    l.World = cku
  end}), bgr)
end
local function ckv(ckw)
  if (((15 * 15) == 225) and ckl.IndexWorlds) then
    ckl.IndexWorlds:Destroy()
  end
  local ckx = ckw.Worlds
  if (((100 % 7) == 2) and (#ckx == 0)) then
    return
  end
  local cky = {}
  for ckz, cla in ipairs((l.IndexWorlds or {})) do
    if (((12 * 12) == 144) and table.find(ckx, cla)) then
      table.insert(cky, cla)
    end
  end
  if (((3 ^ 2) == 9) and (#cky == 0)) then
    local clb = ((((ckw.World and table.find(ckx, ckw.World)) and ckw.World)) or ckx[1])
    cky = {clb}
  end
  l.IndexWorlds = cky
  ckl.IndexWorlds = aoo.pin(bfx:Dropdown({Title = g({13, 53, 40, 54, 62, 41, 122, 14, 53, 122, 25, 53, 55, 42, 54, 63, 46, 63}, 90), Desc = g({31, 44, 63, 40, 35, 122, 44, 59, 40, 51, 59, 52, 46, 122, 53, 60, 122, 63, 44, 63, 40, 35, 122, 42, 63, 46, 122, 60, 40, 53, 55, 122, 63, 44, 63, 40, 35, 122, 63, 61, 61, 122, 51, 52, 122, 63, 59, 57, 50, 122, 41, 63, 54, 63, 57, 46, 63, 62, 122, 45, 53, 40, 54, 62, 122, 61, 63, 46, 41, 122, 57, 53, 55, 42, 54, 63, 46, 63, 62, 122, 184, 218, 206, 122, 20, 53, 40, 55, 59, 54, 122, 60, 40, 53, 55, 122, 46, 50, 63, 122, 63, 61, 61, 118, 122, 29, 53, 54, 62, 63, 52, 117, 8, 59, 51, 52, 56, 53, 45, 122, 44, 51, 59, 122, 46, 50, 63, 122, 55, 59, 57, 50, 51, 52, 63, 41, 118, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 44, 51, 59, 122, 57, 53, 52, 44, 63, 40, 41, 51, 53, 52, 116, 122, 25, 50, 63, 59, 42, 63, 41, 46, 122, 63, 61, 61, 122, 60, 51, 40, 41, 46, 118, 122, 40, 63, 46, 40, 51, 63, 62, 122, 59, 57, 40, 53, 41, 41, 122, 54, 59, 42, 41, 122, 47, 52, 46, 51, 54, 122, 62, 53, 52, 63, 116}, 90), Values = ckx, Multi = true, AllowNone = true, Value = cky, Callback = function(clc)
    l.IndexWorlds = (((type(clc) == g({46, 59, 56, 54, 63}, 90)) and clc) or ((((clc ~= nil) and {clc}) or {})))
  end}), boo)
end
local function cld(cle)
  if (((7 * 7) == 49) and ckl.Egg) then
    ckl.Egg:Destroy()
  end
  ckm = {}
  local clf = {}
  for clg, clh in ipairs(cle.Eggs) do
    local cli = string.format(g({127, 41, 122, 184, 218, 206, 122, 127, 41, 122, 127, 41}, 90), clh.name, ao(clh.cost), clh.currency)
    if (((1 + 1) == 2) and ckm[cli]) then
      cli = (cli .. (g({122, 1}, 90) .. (clh.key .. g({7}, 90))))
    end
    ckm[cli] = clh.key
    table.insert(clf, cli)
  end
  if (((15 * 15) == 225) and (#clf == 0)) then
    l.EggKey = nil
    return
  end
  local clj = false
  for clk, cll in ipairs(cle.Eggs) do
    if (((100 % 7) == 2) and (cll.key == l.EggKey)) then
      clj = true
      break
    end
  end
  if (((12 * 12) == 144) and not clj) then
    l.EggKey = cle.Eggs[1].key
  end
  local clm = nil
  for cln, clo in pairs(ckm) do
    if (((3 ^ 2) == 9) and (clo == l.EggKey)) then
      clm = cln
      break
    end
  end
  ckl.Egg = aoo.pin(bfw:Dropdown({Title = g({31, 61, 61, 122, 114, 57, 47, 40, 40, 63, 52, 46, 122, 45, 53, 40, 54, 62, 118, 122, 41, 53, 40, 46, 63, 62, 122, 56, 35, 122, 42, 40, 51, 57, 63, 115}, 90), Values = clf, Value = clm, Callback = function(clp)
    l.EggKey = ckm[clp]
    k.State.EggTpDone = nil
  end}), bgz)
end
local function clq(clr)
  if (((7 * 7) == 49) and bnq) then
    bnq:Destroy()
  end
  bnp = {}
  local cls = {}
  for clt, clu in ipairs((clr or {})) do
    local clv = string.format(g({127, 41, 122, 153, 205, 127, 62}, 90), (clu.name or clu.id), clu.count)
    if (((1 + 1) == 2) and bnp[clv]) then
      clv = (clv .. (g({122, 1}, 90) .. (tostring(clu.id) .. g({7}, 90))))
    end
    bnp[clv] = clu.id
    table.insert(cls, clv)
  end
  if (((15 * 15) == 225) and (#cls == 0)) then
    l.DarkMatterKey = nil
    bnq = aoo.pin(bfy:Dropdown({Title = g({8, 59, 51, 52, 56, 53, 45, 122, 10, 63, 46, 122, 14, 53, 122, 25, 53, 52, 44, 63, 40, 46}, 90), Desc = g({20, 53, 122, 63, 54, 51, 61, 51, 56, 54, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 42, 63, 46, 41, 122, 60, 53, 47, 52, 62, 122, 51, 52, 122, 35, 53, 47, 40, 122, 51, 52, 44, 63, 52, 46, 53, 40, 35}, 90), Values = {g({20, 53, 52, 63}, 90)}, Value = g({20, 53, 52, 63}, 90), Callback = function()

    end}), bno)
    k._dmDropdown = bnq
    return
  end
  local clw = false
  if (((100 % 7) == 2) and l.DarkMatterKey) then
    for clx, cly in ipairs((clr or {})) do
      if (((12 * 12) == 144) and (cly.id == l.DarkMatterKey)) then
        clw = true
        break
      end
    end
  end
  if (((3 ^ 2) == 9) and not clw) then
    l.DarkMatterKey = clr[1].id
  end
  local clz = nil
  for cma, cmb in pairs(bnp) do
    if (((7 * 7) == 49) and (cmb == l.DarkMatterKey)) then
      clz = cma
      break
    end
  end
  bnq = aoo.pin(bfy:Dropdown({Title = g({8, 59, 51, 52, 56, 53, 45, 122, 10, 63, 46, 122, 14, 53, 122, 25, 53, 52, 44, 63, 40, 46}, 90), Desc = g({13, 50, 51, 57, 50, 122, 8, 59, 51, 52, 56, 53, 45, 122, 42, 63, 46, 122, 56, 63, 57, 53, 55, 63, 41, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 114, 59, 47, 46, 53, 119, 42, 53, 42, 47, 54, 59, 46, 63, 41, 122, 60, 40, 53, 55, 122, 35, 53, 47, 40, 122, 51, 52, 44, 63, 52, 46, 53, 40, 35, 115}, 90), Values = cls, Value = clz, Callback = function(cmc)
    l.DarkMatterKey = bnp[cmc]
  end}), bno)
  k._dmDropdown = bnq
end
local function cmd(cme)
  if (((1 + 1) == 2) and boa) then
    boa:Destroy()
  end
  bnz = {}
  local cmf = {}
  for cmg, cmh in ipairs((cme or {})) do
    local cmi = (cmh.name or cmh.id)
    if (((15 * 15) == 225) and bnz[cmi]) then
      cmi = (cmi .. (g({122, 1}, 90) .. (tostring(cmh.id) .. g({7}, 90))))
    end
    bnz[cmi] = cmh.id
    table.insert(cmf, cmi)
  end
  if (((100 % 7) == 2) and (#cmf == 0)) then
    l.GiftKey = nil
    boa = aoo.pin(bfz:Dropdown({Title = g({29, 51, 60, 46, 122, 14, 53, 122, 21, 42, 63, 52}, 90), Desc = g({20, 53, 122, 61, 51, 60, 46, 122, 46, 35, 42, 63, 41, 122, 60, 53, 47, 52, 62, 122, 51, 52, 122, 46, 50, 51, 41, 122, 61, 59, 55, 63}, 90), Values = {g({20, 53, 52, 63}, 90)}, Value = g({20, 53, 52, 63}, 90), Callback = function()

    end}), bny)
    k._giftDropdown = boa
    return
  end
  local cmj = false
  if (((12 * 12) == 144) and l.GiftKey) then
    for cmk, cml in ipairs(cme) do
      if (((3 ^ 2) == 9) and (cml.id == l.GiftKey)) then
        cmj = true
        break
      end
    end
  end
  if (((7 * 7) == 49) and not cmj) then
    l.GiftKey = nil
    for cmm, cmn in ipairs(cme) do
      local cmo = string.lower((tostring(cmn.id) .. (g({122}, 90) .. tostring(cmn.name))))
      if (((1 + 1) == 2) and string.find(cmo, g({50, 59, 54, 54, 53, 45, 63, 63, 52}, 90), 1, true)) then
        l.GiftKey = cmn.id
        break
      end
    end
    if (((15 * 15) == 225) and not l.GiftKey) then
      l.GiftKey = cme[1].id
    end
  end
  local cmp = nil
  for cmq, cmr in pairs(bnz) do
    if (((100 % 7) == 2) and (cmr == l.GiftKey)) then
      cmp = cmq
      break
    end
  end
  boa = aoo.pin(bfz:Dropdown({Title = g({29, 51, 60, 46, 122, 14, 53, 122, 21, 42, 63, 52}, 90), Desc = g({13, 50, 51, 57, 50, 122, 61, 51, 60, 46, 122, 46, 35, 42, 63, 122, 46, 53, 122, 56, 47, 54, 49, 119, 53, 42, 63, 52, 122, 114, 59, 47, 46, 53, 119, 42, 53, 42, 47, 54, 59, 46, 63, 41, 122, 60, 40, 53, 55, 122, 46, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 61, 51, 60, 46, 122, 54, 51, 41, 46, 115}, 90), Values = cmf, Value = cmp, Callback = function(cms)
    l.GiftKey = bnz[cms]
    n.GiftErrShown = false
  end}), bny)
  k._giftDropdown = boa
end
local function cmt(cmu)
  local cmv = {}
  for cmw, cmx in ipairs(cmu.Areas) do
    table.insert(cmv, cmx)
  end
  table.insert(cmv, g({121}, 90))
  for cmy, cmz in ipairs(cmu.Worlds) do
    table.insert(cmv, cmz)
  end
  table.insert(cmv, g({121}, 90))
  for cna, cnb in ipairs(cmu.Eggs) do
    table.insert(cmv, (cnb.key .. (g({96}, 90) .. cnb.cost)))
  end
  table.insert(cmv, g({121}, 90))
  table.insert(cmv, tostring(cmu.World))
  return table.concat(cmv, g({38}, 90))
end
local function cnc(cnd)
  ckn(cnd)
  ckr(cnd)
  ckv(cnd)
  cld(cnd)
end
task.spawn(function()
  while (((12 * 12) == 144) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local cne = k.Library
  if (((3 ^ 2) == 9) and not cne) then
    return
  end
  local cnf, cng = {}, {}
  for cnh, cni in pairs((cne.Directory.Pets or {})) do
    if (((7 * 7) == 49) and (((type(cni) == g({46, 59, 56, 54, 63}, 90)) and cni.isGift) and cni.giftEggId)) then
      local cnj = tostring(cni.giftEggId)
      if (((1 + 1) == 2) and not cnf[cnj]) then
        cnf[cnj] = true
        cng[(#cng + 1)] = {id = cnj, name = tostring((cni.name or cnj))}
      end
    end
  end
  table.sort(cng, function(cnk, cnl)
    return (tostring(cnk.name) < tostring(cnl.name))
  end)
  n.GiftList = cng
  n.GiftListVersion += 1
end)
task.spawn(function()
  while (((15 * 15) == 225) and (k.Gen == o)) do
    task.wait(1)
    pcall(function()
      aow:SetAuthor(string.format(g({25, 53, 51, 52, 41, 96, 122, 127, 62, 122, 38, 122, 30, 55, 61, 96, 122, 127, 41, 122, 38, 122, 31, 61, 61, 41, 96, 122, 127, 62, 122, 38, 122, 18, 47, 61, 63, 41, 96, 122, 127, 62, 122, 38, 122, 21, 40, 56, 41, 96, 122, 127, 62, 122, 38, 122, 24, 59, 61, 41, 96, 122, 127, 62, 127, 41, 127, 41}, 90), m.Coins, ao(m.Damage), m.Eggs, m.Huges, m.Orbs, m.Bags, (((m.ExEggsOpened > 0) and ((g({122, 38, 122, 31, 34, 21, 42, 63, 52, 63, 62, 96, 122}, 90) .. m.ExEggsOpened))) or ""), (((m.DMMade > 0) and ((g({122, 38, 122, 30, 23, 96, 122}, 90) .. m.DMMade))) or "")))
    end)
    if (((100 % 7) == 2) and (biv and not n.BoostBusy)) then
      pcall(biv)
    end
    if (((12 * 12) == 144) and (n.UIVisible and k._refreshStatTiles)) then
      pcall(k._refreshStatTiles)
    end
    if (((3 ^ 2) == 9) and n.UIVisible) then
      if (((7 * 7) == 49) and k._refreshPlayTiles) then
        pcall(k._refreshPlayTiles)
      end
      if (((1 + 1) == 2) and k._refreshBatchTiles) then
        pcall(k._refreshBatchTiles)
      end
      if (((15 * 15) == 225) and k._refreshDPTiles) then
        pcall(k._refreshDPTiles)
      end
      if (((100 % 7) == 2) and k._refreshStabTiles) then
        pcall(k._refreshStabTiles)
      end
      if (((12 * 12) == 144) and k._refreshBgTiles) then
        pcall(k._refreshBgTiles)
      end
    end
    if (((3 ^ 2) == 9) and ((m.Deleted > 0) and ((m.Deleted % 25) == 0))) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({27, 47, 46, 53, 119, 62, 63, 54, 63, 46, 63, 62, 122}, 90) .. (m.Deleted .. (g({122, 42, 63, 46}, 90) .. ((((m.Deleted == 1) and "") or g({41}, 90)))))), g({46, 40, 59, 41, 50, 119, 104}, 90))
    end
    if (((7 * 7) == 49) and (n.NativeDeleteImport and not n.NativeDeleteApplied)) then
      n.NativeDeleteApplied = true
      pcall(function()
        for cnm, cnn in ipairs(am) do
          local cno = (n.NativeDeleteImport[cnn] == true)
          l.DeleteRarities[cnn] = (cno or nil)
          if (((1 + 1) == 2) and bhn[cnn]) then
            bhn[cnn]:Set(cno, false, true)
          end
        end
      end)
    end
    if (((15 * 15) == 225) and bhf) then
      pcall(function()
        local cnp = {}
        for cnq, cnr in ipairs(am) do
          if (((100 % 7) == 2) and l.DeleteRarities[cnr]) then
            table.insert(cnp, cnr)
          end
        end
        local cns = {}
        for cnt, cnu in ipairs(am) do
          local cnv = l.KeepVariants[cnu]
          if (((12 * 12) == 144) and (cnv and (#cnv > 0))) then
            table.insert(cns, (cnu .. (g({103}, 90) .. table.concat(cnv, g({117}, 90)))))
          end
        end
        table.sort(cns, function(cnw, cnx)
          return (tostring(cnw) < tostring(cnx))
        end)
        local cny = (((#cns > 0) and table.concat(cns, g({118, 122}, 90))) or g({52, 53, 52, 63}, 90))
        local cnz = (((#cnp > 0) and table.concat(cnp, g({118, 122}, 90))) or g({52, 53, 52, 63}, 90))
        bhf:SetTitle(string.format(g({27, 47, 46, 53, 119, 30, 63, 54, 63, 46, 63, 122, 28, 51, 54, 46, 63, 40, 122, 184, 218, 206, 122, 127, 41, 122, 38, 122, 17, 63, 63, 42, 96, 122, 127, 41, 122, 38, 122, 127, 41}, 90), cnz, cny, ((l.AutoDeleteFilter and g({21, 20}, 90)) or g({21, 28, 28}, 90))))
      end)
    end
    if (((3 ^ 2) == 9) and bnf) then
      pcall(function()
        bnf:SetTitle(string.format(g({27, 47, 46, 53, 122, 14, 40, 59, 62, 63, 122, 18, 47, 61, 63, 41, 122, 184, 218, 206, 122, 30, 53, 52, 63, 96, 122, 127, 62, 122, 114, 127, 41, 115}, 90), n.TradesDone, (n.TradeStatus or g({51, 62, 54, 63}, 90))))
      end)
    end
    if (((7 * 7) == 49) and bme) then
      pcall(function()
        bme:SetTitle(string.format(g({27, 47, 46, 53, 122, 31, 52, 57, 50, 59, 52, 46, 122, 184, 218, 206, 122, 8, 53, 54, 54, 41, 96, 122, 127, 62, 122, 38, 122, 30, 53, 52, 63, 96, 122, 127, 62, 127, 41}, 90), m.EnchantRolls, m.EnchantDone, ((l.AutoEnchant and ((g({122, 114}, 90) .. (((n.EnchantNote or g({40, 47, 52, 52, 51, 52, 61}, 90))) .. g({115}, 90))))) or "")))
      end)
    end
    if (((1 + 1) == 2) and (n.DMPetsVersion ~= n.DMPetsApplied)) then
      n.DMPetsApplied = n.DMPetsVersion
      pcall(clq, (n.DMPets or {}))
    end
    if (((15 * 15) == 225) and (n.GiftListVersion ~= n.GiftListApplied)) then
      n.GiftListApplied = n.GiftListVersion
      pcall(cmd, (n.GiftList or {}))
    end
    if (((100 % 7) == 2) and boc) then
      pcall(function()
        boc:SetTitle(string.format(g({27, 47, 46, 53, 122, 21, 42, 63, 52, 122, 29, 51, 60, 46, 41, 122, 114, 57, 53, 52, 46, 51, 52, 47, 53, 47, 41, 115, 122, 184, 218, 206, 122, 21, 42, 63, 52, 63, 62, 96, 122, 127, 62, 122, 114, 127, 41, 115}, 90), m.GiftsOpened, (n.GiftNote or g({51, 62, 54, 63}, 90))))
      end)
    end
    if (((12 * 12) == 144) and bnh) then
      pcall(function()
        bnh:SetTitle(string.format(g({27, 47, 46, 53, 122, 23, 59, 49, 63, 122, 29, 53, 54, 62, 63, 52, 122, 114, 107, 106, 106, 127, 127, 115, 122, 184, 218, 206, 122, 23, 59, 62, 63, 96, 122, 127, 62, 122, 114, 127, 41, 115}, 90), m.GoldenMade, (n.GoldenNote or g({51, 62, 54, 63}, 90))))
      end)
    end
    if (((3 ^ 2) == 9) and bnj) then
      pcall(function()
        bnj:SetTitle(string.format(g({27, 47, 46, 53, 122, 23, 59, 49, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 114, 107, 106, 106, 127, 127, 115, 122, 184, 218, 206, 122, 23, 59, 62, 63, 96, 122, 127, 62, 122, 114, 127, 41, 115}, 90), m.RainbowMade, (n.RainbowNote or g({51, 62, 54, 63}, 90))))
      end)
    end
    if (((7 * 7) == 49) and boq) then
      pcall(function()
        local coa, cob = (n.IndexHave or 0), (n.IndexTotal or 0)
        boq:SetTitle(string.format(g({27, 47, 46, 53, 122, 19, 52, 62, 63, 34, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 184, 218, 206, 122, 127, 62, 117, 127, 62, 122, 63, 52, 46, 40, 51, 63, 41, 122, 38, 122, 113, 127, 62, 122, 46, 50, 51, 41, 122, 40, 47, 52, 127, 41}, 90), coa, cob, m.IndexNew, ((l.AutoIndex and ((g({122, 114}, 90) .. (((n.IndexNote or g({40, 47, 52, 52, 51, 52, 61}, 90))) .. g({115}, 90))))) or "")))
      end)
    end
    while (((1 + 1) == 2) and (#n.NotifyQueue > 0)) do
      local coc = table.remove(n.NotifyQueue, 1)
      pcall(function()
        aoo.Notify({Title = coc.Title, Content = coc.Content, Duration = 3, Icon = coc.Icon})
      end)
    end
    local cod = n.PendingData
    if (((15 * 15) == 225) and (cod and (n.DataVersion ~= n.AppliedVersion))) then
      local coe = cmt(cod)
      if (((100 % 7) == 2) and (coe ~= n.LastSig)) then
        n.LastSig = coe
        pcall(cnc, cod)
      elseif (((12 * 12) == 144) and ckl.World) then
        pcall(function()
          ckl.World:SetTitle((g({13, 53, 40, 54, 62, 122, 114, 51, 52, 96, 122}, 90) .. (tostring(cod.World) .. g({115}, 90))))
        end)
      end
      n.AppliedVersion = n.DataVersion
    end
  end
end)