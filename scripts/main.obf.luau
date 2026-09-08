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
            ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({25, 59, 52, 125, 46, 122, 63, 52, 46, 63, 40, 122}, 90) .. (dg .. (((dl and ((g({122, 8270, 122, 52, 63, 63, 62, 41, 122, 46, 50, 63, 122, 120}, 90) .. (dl .. g({120, 122, 59, 40, 63, 59}, 90))))) or "")))), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
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
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({3, 53, 47, 122, 62, 53, 52, 125, 46, 122, 53, 45, 52, 122, 46, 50, 63, 122, 34, 98, 122, 50, 59, 46, 57, 50, 122, 47, 52, 54, 53, 57, 49, 122, 8270, 122, 47, 41, 51, 52, 61, 122, 34, 105, 122, 51, 52, 41, 46, 63, 59, 62}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
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
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({19, 52, 44, 63, 52, 46, 53, 40, 35, 122, 60, 47, 54, 54, 122, 8270, 122, 57, 54, 63, 59, 40, 122, 41, 54, 53, 46, 41, 122, 60, 53, 40, 122, 30, 23, 122, 42, 63, 46, 41}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    return
  end
  local ny = (tonumber(l.DMDiamondFloor) or 0)
  local nz = (mo + (((l.DMAutoSkip and mn) or 0)))
  if (((12 * 12) == 144) and ((nn - nz) < ny)) then
    if (((3 ^ 2) == 9) and not n.DMBrokeNotified) then
      n.DMBrokeNotified = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), ((l.DMAutoSkip and g({30, 51, 59, 55, 53, 52, 62, 41, 122, 52, 63, 59, 40, 122, 35, 53, 47, 40, 122, 60, 54, 53, 53, 40, 122, 8270, 122, 42, 59, 47, 41, 51, 52, 61, 122, 30, 23, 122, 41, 49, 51, 42, 41, 122, 46, 53, 122, 42, 40, 53, 46, 63, 57, 46, 122, 35, 53, 47, 40, 122, 56, 59, 54, 59, 52, 57, 63}, 90)) or g({20, 53, 46, 122, 63, 52, 53, 47, 61, 50, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 46, 53, 122, 57, 53, 52, 44, 63, 40, 46, 122, 46, 53, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
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
local function os(ot, ou, ov)
  local ow = ((((ou == g({40, 59, 51, 52, 56, 53, 45}, 90))) and g({29, 63, 46, 122, 8, 59, 51, 52, 56, 53, 45, 122, 23, 59, 57, 50, 51, 52, 63, 122, 19, 52, 60, 53}, 90)) or g({29, 63, 46, 122, 29, 53, 54, 62, 63, 52, 122, 23, 59, 57, 50, 51, 52, 63, 122, 19, 52, 60, 53}, 90))
  local ox = nil
  pcall(function()
    ox = ot.Network.Invoke(ow)
  end)
  if (((1 + 1) == 2) and (type(ox) ~= g({46, 59, 56, 54, 63}, 90))) then
    return nil
  end
  local oy = nil
  for oz, pa in pairs(ox) do
    if (((15 * 15) == 225) and ((type(pa) == g({46, 59, 56, 54, 63}, 90)) and (tonumber((pa.chance or 0)) >= 100))) then
      oy = oz
    end
  end
  if (((100 % 7) == 2) and oy) then
    local pb = {}
    for pc = 1, oy do
      pb[pc] = ox[pc]
    end
    return pb
  end
  return ox
end
local function pd(pe, pf, pg)
  if (((12 * 12) == 144) and not pe) then
    return false
  end
  if (((3 ^ 2) == 9) and (pe.isPremium or pe.isGift)) then
    return false
  end
  local ph = tostring(pe.rarity)
  if (((7 * 7) == 49) and ((ph == g({31, 44, 63, 52, 46}, 90)) or (ph == g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90)))) then
    return false
  end
  if (((1 + 1) == 2) and ((pf.l or pf.r) or pf.dm)) then
    return false
  end
  if (((15 * 15) == 225) and (pg == g({40, 59, 51, 52, 56, 53, 45}, 90))) then
    return (pf.g == true)
  end
  return not pf.g
end
local function pi(pj, pk)
  local pl = {}
  local pm = pj.Save.Get()
  if (((100 % 7) == 2) and not pm) then
    return pl
  end
  local pn = {}
  for po, pp in pairs((pm.Pets or {})) do
    local pq = pj.Directory.Pets[tostring(pp.id)]
    if (((12 * 12) == 144) and pd(pq, pp, pk)) then
      local pr = ((pp.hc and true) or false)
      local ps = (tostring(pp.id) .. (g({38}, 90) .. (((pr and g({107}, 90)) or g({106}, 90)))))
      local pt = pn[ps]
      if (((3 ^ 2) == 9) and not pt) then
        pt = {id = tostring(pp.id), hc = pr, uids = {}}
        pn[ps] = pt
        table.insert(pl, pt)
      end
      table.insert(pt.uids, tostring(pp.uid))
    end
  end
  local pu = {}
  for pv, pw in ipairs(pl) do
    local px = os(pj, pk, pw.hc)
    local py = ((px and #px) or 6)
    if (((7 * 7) == 49) and (px and (#pw.uids >= py))) then
      pw.need = py
      pw.cost = (tonumber(px[py].cost) or 0)
      table.insert(pu, pw)
    end
  end
  table.sort(pu, function(pz, qa)
    return (#pz.uids > #qa.uids)
  end)
  return pu
end
local function qb(qc, qd)
  local qe = ((qd == g({40, 59, 51, 52, 56, 53, 45}, 90)))
  local qf = ((qe and g({8, 59, 51, 52, 56, 53, 45, 20, 53, 46, 63}, 90)) or g({29, 53, 54, 62, 63, 52, 20, 53, 46, 63}, 90))
  local qg = ((qe and g({8, 59, 51, 52, 56, 53, 45, 19, 62, 54, 63, 20, 53, 46, 51, 60, 51, 63, 62}, 90)) or g({29, 53, 54, 62, 63, 52, 19, 62, 54, 63, 20, 53, 46, 51, 60, 51, 63, 62}, 90))
  local qh = ((qe and g({8, 59, 51, 52, 56, 53, 45, 31, 40, 40, 9, 50, 53, 45, 52}, 90)) or g({29, 53, 54, 62, 63, 52, 31, 40, 40, 9, 50, 53, 45, 52}, 90))
  local qi = ((qe and g({15, 41, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 23, 59, 57, 50, 51, 52, 63}, 90)) or g({15, 41, 63, 122, 29, 53, 54, 62, 63, 52, 122, 23, 59, 57, 50, 51, 52, 63}, 90))
  local qj = ((qe and g({8, 59, 51, 52, 56, 53, 45}, 90)) or g({29, 53, 54, 62, 63, 52}, 90))
  local qk = pi(qc, qd)
  if (((1 + 1) == 2) and (#qk == 0)) then
    n[qf] = ((qe and g({52, 63, 63, 62, 122, 108, 122, 29, 53, 54, 62, 63, 52, 122, 53, 60, 122, 53, 52, 63, 122, 42, 63, 46}, 90)) or g({52, 63, 63, 62, 122, 108, 122, 20, 53, 40, 55, 59, 54, 122, 53, 60, 122, 53, 52, 63, 122, 42, 63, 46}, 90))
    if (((15 * 15) == 225) and not n[qg]) then
      n[qg] = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), ((qe and g({20, 53, 122, 108, 119, 53, 60, 119, 59, 119, 49, 51, 52, 62, 122, 29, 53, 54, 62, 63, 52, 122, 42, 63, 46, 41, 122, 54, 63, 60, 46, 122, 46, 53, 122, 55, 59, 49, 63, 122, 59, 122, 8, 59, 51, 52, 56, 53, 45}, 90)) or g({20, 53, 122, 108, 119, 53, 60, 119, 59, 119, 49, 51, 52, 62, 122, 42, 54, 59, 51, 52, 122, 42, 63, 46, 41, 122, 54, 63, 60, 46, 122, 46, 53, 122, 55, 59, 49, 63, 122, 59, 122, 29, 53, 54, 62, 63, 52}, 90)), g({41, 42, 59, 40, 49, 54, 63, 41}, 90))
    end
    return g({51, 62, 54, 63}, 90)
  end
  local ql = qk[1]
  local qm = qc.Save.Get()
  local qn = (tonumber((qm and qm.Diamonds)) or 0)
  local qo = (tonumber(l.MachineDiamondFloor) or 0)
  if (((100 % 7) == 2) and ((qn - ql.cost) < qo)) then
    n[qf] = g({30, 51, 59, 55, 53, 52, 62, 41, 122, 59, 46, 122, 35, 53, 47, 40, 122, 60, 54, 53, 53, 40}, 90)
    if (((12 * 12) == 144) and not n.MachineBrokeNotified) then
      n.MachineBrokeNotified = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({30, 51, 59, 55, 53, 52, 62, 41, 122, 52, 63, 59, 40, 122, 35, 53, 47, 40, 122, 60, 54, 53, 53, 40, 122, 8270, 122, 42, 59, 47, 41, 51, 52, 61, 122, 46, 50, 63, 122, 29, 53, 54, 62, 63, 52, 117, 8, 59, 51, 52, 56, 53, 45, 122, 55, 59, 57, 50, 51, 52, 63, 41}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    return g({56, 40, 53, 49, 63}, 90)
  end
  n.MachineBrokeNotified = false
  local qp = {}
  for qq = 1, ql.need do
    qp[qq] = ql.uids[qq]
  end
  local qr, qs
  local qt, qu = pcall(function()
    qr, qs = qc.Network.Invoke(qi, qp)
  end)
  if (((3 ^ 2) == 9) and not qt) then
    qr, qs = false, qu
  end
  if (((7 * 7) == 49) and not qr) then
    n[qf] = (g({60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring((qs or g({47, 52, 49, 52, 53, 45, 52}, 90))))
    if (((1 + 1) == 2) and not n[qh]) then
      n[qh] = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (qj .. (g({122, 55, 59, 57, 50, 51, 52, 63, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring((qs or g({47, 52, 49, 52, 53, 45, 52}, 90))))), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    return g({63, 40, 40}, 90)
  end
  n[qh] = false
  n[qg] = false
  local qv = qc.Directory.Pets[ql.id]
  local qw = ((qv and tostring(qv.name)) or ql.id)
  if (((15 * 15) == 225) and qe) then
    m.RainbowMade += 1
  else
    m.GoldenMade += 1
  end
  n[qf] = string.format(g({55, 59, 62, 63, 122, 127, 41, 127, 41, 122, 127, 41}, 90), ((ql.hc and g({18, 59, 40, 62, 57, 53, 40, 63, 122}, 90)) or ""), qj, qw)
  return g({40, 59, 52}, 90)
end
k._machineStep = qb
for qx, qy in ipairs({g({61, 53, 54, 62, 63, 52}, 90), g({40, 59, 51, 52, 56, 53, 45}, 90)}) do
  task.spawn(function()
    while (((100 % 7) == 2) and ((k.Gen == o) and not k.Library)) do
      task.wait(0.5)
    end
    local qz = k.Library
    if (((12 * 12) == 144) and not qz) then
      return
    end
    local ra = ((((qy == g({40, 59, 51, 52, 56, 53, 45}, 90))) and g({27, 47, 46, 53, 8, 59, 51, 52, 56, 53, 45}, 90)) or g({27, 47, 46, 53, 29, 53, 54, 62, 63, 52}, 90))
    local rb = ((((qy == g({40, 59, 51, 52, 56, 53, 45}, 90))) and g({8, 59, 51, 52, 56, 53, 45, 24, 47, 41, 35}, 90)) or g({29, 53, 54, 62, 63, 52, 24, 47, 41, 35}, 90))
    while (((3 ^ 2) == 9) and (k.Gen == o)) do
      if (((7 * 7) == 49) and (l[ra] and not n[rb])) then
        n[rb] = true
        local rc = g({51, 62, 54, 63}, 90)
        pcall(function()
          rc = qb(qz, qy)
        end)
        n[rb] = false
        task.wait((((rc == g({40, 59, 52}, 90)) and 0.15) or 2))
      else
        task.wait(0.4)
      end
    end
  end)
end
local function rd(re)
  local rf = false
  pcall(function()
    local rg = (re.Shared and re.Shared.Variables)
    if (((1 + 1) == 2) and ((type(rg) == g({46, 59, 56, 54, 63}, 90)) and (rg.IsHardcore ~= nil))) then
      rf = (rg.IsHardcore == true)
      return
    end
    rg = re.Variables
    if (((15 * 15) == 225) and (type(rg) == g({46, 59, 56, 54, 63}, 90))) then
      rf = (rg.IsHardcore == true)
    end
  end)
  return rf
end
local function rh(ri)
  if (((100 % 7) == 2) and n.IndexTargets) then
    return n.IndexTargets
  end
  local rj, rk = {}, 0
  local ro = pcall(function()
    for rl, rm in ipairs(ri.Shared.GetAllCollectablePets()) do
      local rn = ((rm.isDarkMatter and 4) or (((rm.isRainbow and 3) or (((rm.isGolden and 2) or 1)))))
      rj[(tostring(rm.petId) .. (g({119}, 90) .. rn))] = true
      rk += 1
    end
  end)
  if (((12 * 12) == 144) and (not ro or (rk == 0))) then
    return nil
  end
  n.IndexTargets, n.IndexTotal = rj, rk
  return rj
end
local function rp(rq)
  local rr = n.IndexCollection
  local rs, rt = {}, 0
  pcall(function()
    local ru = rq.Save.Get()
    if (((3 ^ 2) == 9) and not ru) then
      return
    end
    for rv, rw in ipairs((ru.Collection or {})) do
      local rx = tostring(rw)
      if (((7 * 7) == 49) and not rs[rx]) then
        rs[rx] = true
        rt += 1
        if (((1 + 1) == 2) and ((rr and not rr[rx]) and l.AutoIndex)) then
          m.IndexNew += 1
        end
      end
    end
    local ry, rz = 0, (tonumber(ru.MaxSlots) or 0)
    for sa in pairs((ru.Pets or {})) do
      ry += 1
    end
    local sb = ((rz > 0) and (ry > ((rz - 60))))
    if (((15 * 15) == 225) and ((sb and not n.IndexNoProtect) and l.AutoIndex)) then
      if (((100 % 7) == 2) and not n.IndexFullNotified) then
        n.IndexFullNotified = true
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({19, 52, 44, 63, 52, 46, 53, 40, 35, 122, 52, 63, 59, 40, 54, 35, 122, 60, 47, 54, 54, 122, 8270, 122, 19, 52, 62, 63, 34, 122, 41, 46, 53, 42, 42, 63, 62, 122, 50, 53, 54, 62, 51, 52, 61, 122, 60, 63, 63, 62, 41, 46, 53, 57, 49, 122, 56, 59, 57, 49, 122, 60, 40, 53, 55, 122, 59, 47, 46, 53, 119, 62, 63, 54, 63, 46, 63}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      end
    elseif (((12 * 12) == 144) and not sb) then
      n.IndexFullNotified = false
    end
    n.IndexNoProtect = sb
  end)
  n.IndexCollection = rs
  n.IndexHave = rt
  return rs
end
local function sc(sd, se, sf)
  local sg, sh = {}, {}
  local si = sd.Directory.Eggs[se]
  if (((3 ^ 2) == 9) and (not si or (type(si.drops) ~= g({46, 59, 56, 54, 63}, 90)))) then
    return sg
  end
  for sj, sk in ipairs(si.drops) do
    local sl = tostring(sk[1])
    if (((7 * 7) == 49) and (((((tonumber(sk[2]) or 0)) > 0) and ((not sk[3] or sf))) and not sh[sl])) then
      sh[sl] = true
      table.insert(sg, sl)
    end
  end
  return sg
end
local function sm(sn, so, sp, sq, sr)
  local ss, st = {}, 0
  for su, sv in ipairs(sc(sn, so, sr)) do
    local sw = nil
    for sx = 1, 4 do
      local sy = (sv .. (g({119}, 90) .. sx))
      if (((1 + 1) == 2) and (sp[sy] and not sq[sy])) then
        sw = (sw or {})
        sw[sx] = true
        st += 1
      end
    end
    if (((15 * 15) == 225) and sw) then
      ss[sv] = sw
    end
  end
  return ss, st
end
local function sz(ta, tb, tc)
  local td, te = {}, {}
  pcall(function()
    for tf, tg in ipairs(ta.WorldCmds.GetAllEggs()) do
      local th = tg:GetAttribute(g({19, 30}, 90))
      local ti = (th and ta.Directory.Eggs[th])
      if (((100 % 7) == 2) and (((ti and ti.hatchable) and not ti.disabled) and (tg:GetAttribute(g({15, 52, 54, 53, 57, 49, 63, 62}, 90)) ~= false))) then
        local tj = ((tonumber(((tb and ti.hardcoreCost) or ti.cost)) or tonumber(ti.cost)) or 0)
        local tk = {key = tostring(th), name = tostring((ti.displayName or th)), cost = tj, currency = tostring((ti.currency or "")), area = ((ti.area and tostring(ti.area)) or nil)}
        if (((12 * 12) == 144) and ti.isGolden) then
          local tl = (((type(ti.drops) == g({41, 46, 40, 51, 52, 61}, 90)) and ti.drops) or ti.eggRequired)
          if (((3 ^ 2) == 9) and (tl and (tl ~= ""))) then
            te[tostring(tl)] = tk
          end
        elseif (((7 * 7) == 49) and (not tc or ((tk.area and tc[tk.area])))) then
          table.insert(td, tk)
        end
      end
    end
  end)
  for tm, tn in ipairs(td) do
    tn.golden = te[tn.key]
  end
  table.sort(td, function(to, tp)
    if (((1 + 1) == 2) and (to.cost ~= tp.cost)) then
      return (to.cost < tp.cost)
    end
    return (to.key < tp.key)
  end)
  return td
end
k._indexWorldEggs = sz
local function tq(tr, ts)
  if (((15 * 15) == 225) and n.SwitchingWorld) then
    return false, g({45, 53, 40, 54, 62, 122, 51, 41, 122, 41, 45, 51, 46, 57, 50, 51, 52, 61}, 90)
  end
  local tt = nil
  pcall(function()
    for tu, tv in ipairs(tr.WorldCmds.GetAllEggs()) do
      if (((100 % 7) == 2) and (tostring(tv:GetAttribute(g({19, 30}, 90))) == tostring(ts))) then
        tt = tv
        break
      end
    end
  end)
  if (((12 * 12) == 144) and not tt) then
    return false, g({63, 61, 61, 122, 52, 53, 46, 122, 51, 52, 122, 46, 50, 51, 41, 122, 45, 53, 40, 54, 62}, 90)
  end
  local tw = tt:FindFirstChild(g({25, 63, 52, 46, 63, 40}, 90))
  if (((3 ^ 2) == 9) and not tw) then
    return false, g({63, 61, 61, 122, 50, 59, 41, 122, 52, 53, 122, 25, 63, 52, 46, 63, 40, 122, 42, 59, 40, 46}, 90)
  end
  local tx = ay()
  if (((7 * 7) == 49) and not tx) then
    return false, g({52, 53, 122, 57, 50, 59, 40, 59, 57, 46, 63, 40}, 90)
  end
  local ty = pcall(function()
    tx.CFrame = kx(tw, tx)
  end)
  return ty, (((not ty) and g({46, 63, 54, 63, 42, 53, 40, 46, 122, 60, 59, 51, 54, 63, 62}, 90)) or nil)
end
local function tz(ua, ub, uc)
  local ud = ua.Save.Get()
  if (((1 + 1) == 2) and not ud) then
    return false, g({52, 53, 122, 41, 59, 44, 63}, 90)
  end
  local ue = {[false] = {}, [true] = {}}
  for uf, ug in pairs((ud.Pets or {})) do
    if (((15 * 15) == 225) and ((tostring(ug.id) == tostring(uc)) and pd(ua.Directory.Pets[tostring(ug.id)], ug, ub))) then
      table.insert(ue[((ug.hc and true) or false)], tostring(ug.uid))
    end
  end
  for uh, ui in ipairs({false, true}) do
    local uj = ue[ui]
    local uk = os(ua, ub, ui)
    local ul = ((uk and #uk) or 6)
    if (((100 % 7) == 2) and (uk and (#uj >= ul))) then
      local um = (tonumber(uk[ul].cost) or 0)
      if (((12 * 12) == 144) and ((((tonumber(ud.Diamonds) or 0)) - um) < ((tonumber(l.IndexDiamondFloor) or 0)))) then
        return false, g({62, 51, 59, 55, 53, 52, 62, 41}, 90)
      end
      local un = {}
      for uo = 1, ul do
        un[uo] = uj[uo]
      end
      local up, uq
      pcall(function()
        up, uq = ua.Network.Invoke(((((ub == g({40, 59, 51, 52, 56, 53, 45}, 90))) and g({15, 41, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 23, 59, 57, 50, 51, 52, 63}, 90)) or g({15, 41, 63, 122, 29, 53, 54, 62, 63, 52, 122, 23, 59, 57, 50, 51, 52, 63}, 90)), un)
      end)
      if (((3 ^ 2) == 9) and not up) then
        return false, tostring((uq or g({55, 59, 57, 50, 51, 52, 63, 122, 60, 59, 51, 54, 63, 62}, 90)))
      end
      if (((7 * 7) == 49) and (ub == g({40, 59, 51, 52, 56, 53, 45}, 90))) then
        m.RainbowMade += 1
      else
        m.GoldenMade += 1
      end
      return true, nil
    end
  end
  return false, nil
end
local function ur(us, ut)
  if (((1 + 1) == 2) and ((not ut.r or ut.dm) or ut.l)) then
    return false
  end
  if (((15 * 15) == 225) and ((not us or us.isPremium) or us.isGift)) then
    return false
  end
  local uu = tostring(us.rarity)
  return ((uu ~= g({31, 44, 63, 52, 46}, 90)) and (uu ~= g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90)))
end
local function uv(uw, ux)
  local uy = uw.Save.Get()
  if (((100 % 7) == 2) and not uy) then
    return false, g({52, 53, 122, 41, 59, 44, 63}, 90)
  end
  local uz, va = nil, -1
  local vb = (n.IndexKeepUids or {})
  for vc, vd in pairs((uy.Pets or {})) do
    if (((12 * 12) == 144) and ((tostring(vd.id) == tostring(ux)) and ur(uw.Directory.Pets[tostring(vd.id)], vd))) then
      local ve = ((((vb[tostring(vd.uid)] and 2) or 0)) + (((vd.hc and 0) or 1)))
      if (((3 ^ 2) == 9) and (ve > va)) then
        uz, va = tostring(vd.uid), ve
      end
    end
  end
  if (((7 * 7) == 49) and not uz) then
    return false, nil
  end
  local vf = (tonumber(l.IndexDiamondFloor) or 0)
  local vg, vh = 0, (tonumber(uy.DarkMatterSlots) or 6)
  for vi in pairs((uy.DarkMatterQueue or {})) do
    vg += 1
  end
  if (((1 + 1) == 2) and (vg >= vh)) then
    mx(uw, (l.IndexForceSkipDM ~= false), vf)
    return false, g({30, 23, 122, 43, 47, 63, 47, 63, 122, 60, 47, 54, 54}, 90)
  end
  if (((15 * 15) == 225) and ((((tonumber(uy.Diamonds) or 0)) - mo) < vf)) then
    return false, g({62, 51, 59, 55, 53, 52, 62, 41}, 90)
  end
  local vj, vk
  pcall(function()
    vj, vk = uw.Network.Invoke(g({25, 53, 52, 44, 63, 40, 46, 122, 14, 53, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90), {uz})
  end)
  if (((100 % 7) == 2) and not vj) then
    return false, tostring((vk or g({57, 53, 52, 44, 63, 40, 46, 122, 60, 59, 51, 54, 63, 62}, 90)))
  end
  m.DMMade += 1
  n.IndexKeepAt = 0
  task.wait(0.2)
  mx(uw, (l.IndexForceSkipDM ~= false), vf)
  return true, nil
end
local function vl(vm)
  local vn = {}
  local vo = (n.IndexKeepUids or {})
  local vp = vm.Save.Get()
  local vq, vr = rh(vm), rp(vm)
  if (((12 * 12) == 144) and not (((vp and vq) and vr))) then
    n.IndexKeepUids, n.IndexKeepAt = vn, os.clock()
    return vn
  end
  local vs = (n.IndexNeedIds or {})
  local function vt(vu, vv)
    local vw = (vu .. (g({119}, 90) .. vv))
    return ((vq[vw] == true) and (vr[vw] ~= true))
  end
  local vx = {}
  local function vy(vz, wa)
    local wb = (vz .. (((wa and g({107}, 90)) or g({106}, 90))))
    if (((3 ^ 2) == 9) and (vx[wb] == nil)) then
      local wc = os(vm, vz, wa)
      vx[wb] = (((wc and #wc)) or 6)
    end
    return vx[wb]
  end
  local wd = {}
  for we, wf in pairs((vp.Pets or {})) do
    table.insert(wd, wf)
  end
  local wg = (l.IndexUseMachines ~= false)
  local wh = {}
  for wi, wj in pairs((vp.DarkMatterQueue or {})) do
    if (((7 * 7) == 49) and ((type(wj) == g({46, 59, 56, 54, 63}, 90)) and wj.petId)) then
      wh[tostring(wj.petId)] = true
    end
  end
  local wk = {}
  local wl = {}
  for wm, wn in ipairs(wd) do
    if (((1 + 1) == 2) and ((wn.r and not wn.dm) and not wn.l)) then
      local wo = tostring(wn.id)
      if (((15 * 15) == 225) and (vt(wo, 4) and not wh[wo])) then
        local wp = tostring(wn.uid)
        local wq = (tonumber(wn.idt) or math.huge)
        local wr = wl[wo]
        if (((100 % 7) == 2) and not wr) then
          wl[wo] = {uid = wp, idt = wq}
        else
          local ws, wt = (vo[wp] == true), (vo[wr.uid] == true)
          if (((12 * 12) == 144) and (ws ~= wt)) then
            if (((3 ^ 2) == 9) and ws) then
              wl[wo] = {uid = wp, idt = wq}
            end
          elseif (((7 * 7) == 49) and (wq < wr.idt)) then
            wl[wo] = {uid = wp, idt = wq}
          end
        end
      end
    end
  end
  for wu, wv in pairs(wl) do
    wk[wu] = true
    vn[wv.uid] = true
  end
  local ww = {}
  for wx in pairs(wk) do
    ww[wx] = true
  end
  for wy in pairs(wh) do
    ww[wy] = true
  end
  local wz = {}
  if (((1 + 1) == 2) and wg) then
    for xa, xb in ipairs(wd) do
      if (((15 * 15) == 225) and (((xb.g and not xb.r) and not xb.dm) and not xb.l)) then
        local xc, xd = tostring(xb.id), ((xb.hc and true) or false)
        local xe = (xc .. (g({38}, 90) .. (((xd and g({107}, 90)) or g({106}, 90)))))
        local xf = (vt(xc, 3) or ((vt(xc, 4) and not ww[xc])))
        if (((100 % 7) == 2) and (xf and (((wz[xe] or 0)) < vy(g({40, 59, 51, 52, 56, 53, 45}, 90), xd)))) then
          wz[xe] = (((wz[xe] or 0)) + 1)
          vn[tostring(xb.uid)] = true
        end
      end
    end
  end
  if (((12 * 12) == 144) and (wg and not n.IndexGoldenActive)) then
    local xg = {}
    for xh, xi in ipairs(wd) do
      if (((3 ^ 2) == 9) and (((not xi.g and not xi.r) and not xi.dm) and not xi.l)) then
        local xj, xk = tostring(xi.id), ((xi.hc and true) or false)
        local xl = (xj .. (g({38}, 90) .. (((xk and g({107}, 90)) or g({106}, 90)))))
        local xm = (((vt(xj, 3) or ((vt(xj, 4) and not ww[xj])))) and (((wz[xl] or 0)) < vy(g({40, 59, 51, 52, 56, 53, 45}, 90), xk)))
        local xn = (vs[xj] and ((vt(xj, 2) or xm)))
        if (((7 * 7) == 49) and (xn and (((xg[xl] or 0)) < vy(g({61, 53, 54, 62, 63, 52}, 90), xk)))) then
          xg[xl] = (((xg[xl] or 0)) + 1)
          vn[tostring(xi.uid)] = true
        end
      end
    end
  end
  n.IndexKeepUids, n.IndexKeepAt = vn, os.clock()
  return vn
end
k._indexBuildKeep = vl
local xo = 0.75
local function xp(xq)
  if (((1 + 1) == 2) and (not l.AutoIndex or n.IndexNoProtect)) then
    return false
  end
  if (((15 * 15) == 225) and xq.dm) then
    return false
  end
  local xr = n.IndexKeepUids
  if (((100 % 7) == 2) and (not xr or (((os.clock() - ((n.IndexKeepAt or 0)))) > xo))) then
    local xs = k.Library
    if (((12 * 12) == 144) and (xs and not n.IndexKeepBusy)) then
      n.IndexKeepBusy = true
      local xt, xu = pcall(vl, xs)
      n.IndexKeepBusy = false
      if (((3 ^ 2) == 9) and (xt and (type(xu) == g({46, 59, 56, 54, 63}, 90)))) then
        xr = xu
      end
    end
  end
  if (((7 * 7) == 49) and (type(xr) ~= g({46, 59, 56, 54, 63}, 90))) then
    return false
  end
  return (xr[tostring(xq.uid)] == true)
end
k._indexProtected = xp
local function xv(xw)
  local xx = {}
  for xy, xz in pairs((l.IndexWorlds or {})) do
    if (((1 + 1) == 2) and (type(xz) == g({41, 46, 40, 51, 52, 61}, 90))) then
      xx[xz] = true
    elseif (((15 * 15) == 225) and (xz == true)) then
      xx[tostring(xy)] = true
    end
  end
  local ya = {}
  pcall(function()
    local yb = xw.Directory.Worlds
    local yc = {}
    for yd, ye in pairs(yb) do
      if (((100 % 7) == 2) and (xx[yd] and not ye.disabled)) then
        local yf = false
        pcall(function()
          yf = (xw.WorldCmds.HasAccess(yd) == true)
        end)
        if (((12 * 12) == 144) and yf) then
          table.insert(yc, {name = yd, order = (tonumber(ye.worldOrder) or 99)})
        end
      end
    end
    table.sort(yc, function(yg, yh)
      if (((3 ^ 2) == 9) and (yg.order ~= yh.order)) then
        return (yg.order < yh.order)
      end
      return (yg.name < yh.name)
    end)
    for yi, yj in ipairs(yc) do
      table.insert(ya, yj.name)
    end
  end)
  return ya
end
local function yk(yl, ym, yn)
  local yo, yp = rh(yl), rp(yl)
  if (((7 * 7) == 49) and not ((yo and yp))) then
    return nil
  end
  local yq, yr, ys = 0, 0, 0
  local yt = {}
  pcall(function()
    local yu = yl.Directory.Areas
    for yv, yw in pairs(yl.Directory.Eggs) do
      if (((1 + 1) == 2) and ((((yw and yw.hatchable) and not yw.disabled) and not yw.isGolden) and yw.area)) then
        local yx = yu[tostring(yw.area)]
        local yy = ((yx and tostring((yx.world or ""))) or nil)
        if (((15 * 15) == 225) and (yy and ym[yy])) then
          for yz, za in ipairs(sc(yl, tostring(yv), yn)) do
            for zb = 1, 4 do
              local zc = (za .. (g({119}, 90) .. zb))
              if (((100 % 7) == 2) and (yo[zc] and not yt[zc])) then
                yt[zc] = true
                ys += 1
                if (((12 * 12) == 144) and yp[zc]) then
                  yr += 1
                else
                  yq += 1
                end
              end
            end
          end
        end
      end
    end
  end)
  return {owed = yq, have = yr, total = ys}
end
k._indexWorldsOwed = yk
local function zd(ze, zf)
  local zg = nil
  pcall(function()
    zg = ze.WorldCmds.Get()
  end)
  if (((3 ^ 2) == 9) and (zg == zf)) then
    return true, nil
  end
  local zh = false
  pcall(function()
    zh = (ze.WorldCmds.HasAccess(zf) == true)
  end)
  if (((7 * 7) == 49) and not zh) then
    return false, g({52, 53, 122, 59, 57, 57, 63, 41, 41}, 90)
  end
  n.SwitchingWorld = true
  local zi, zj = pcall(function()
    return ze.WorldCmds.Load(zf)
  end)
  n.SwitchingWorld = false
  if (((1 + 1) == 2) and not ((zi and (zj == true)))) then
    return false, g({45, 53, 40, 54, 62, 122, 40, 63, 60, 47, 41, 63, 62}, 90)
  end
  task.wait(1.5)
  return true, nil
end
local function zk(zl, zm)
  local zn = false
  for zo, zp in pairs(zm) do
    if (((15 * 15) == 225) and not (((k.Gen == o) and l.AutoIndex))) then
      return zn
    end
    if (((100 % 7) == 2) and zp[4]) then
      local zq = 0
      while (((12 * 12) == 144) and ((zq < 8) and uv(zl, zo))) do
        zn, zq = true, (zq + 1)
        task.wait(0.15)
      end
    end
    if (((3 ^ 2) == 9) and (l.IndexUseMachines ~= false)) then
      for zr, zs in ipairs({{g({40, 59, 51, 52, 56, 53, 45}, 90), (zp[3] or zp[4])}, {g({61, 53, 54, 62, 63, 52}, 90), ((zp[2] or zp[3]) or zp[4])}}) do
        if (((7 * 7) == 49) and zs[2]) then
          local zt = 0
          while (((1 + 1) == 2) and ((zt < 12) and tz(zl, zs[1], zo))) do
            zn, zt = true, (zt + 1)
            task.wait(0.15)
          end
        end
      end
    end
  end
  return zn
end
local function zu(zv, zw, zx)
  local zy = rh(zv)
  if (((15 * 15) == 225) and not zy) then
    return g({41, 46, 53, 42}, 90)
  end
  local zz, aaa = 0, 0
  local aab = math.max(0, (tonumber(l.IndexEggCap) or 0))
  local aac = math.max(0, (tonumber(l.IndexEggPatience) or 600))
  local aad = (tonumber(l.IndexDiamondFloor) or 0)
  n.IndexEgg = zw.name
  n.IndexGoldenActive = false
  while (((100 % 7) == 2) and ((k.Gen == o) and l.AutoIndex)) do
    local aae = rp(zv)
    local aaf, aag = sm(zv, zw.key, zy, aae, zx)
    local aah = {}
    for aai in pairs(aaf) do
      aah[aai] = true
    end
    n.IndexNeedIds = aah
    if (((12 * 12) == 144) and (aag == 0)) then
      n.IndexNote = (zw.name .. g({96, 122, 57, 53, 55, 42, 54, 63, 46, 63}, 90))
      n.IndexGoldenActive = false
      return g({62, 53, 52, 63}, 90)
    end
    n.IndexNote = string.format(g({127, 41, 122, 8270, 122, 127, 62, 122, 63, 52, 46, 40, 127, 41, 122, 54, 63, 60, 46}, 90), zw.name, aag, (((aag == 1) and g({35}, 90)) or g({51, 63, 41}, 90)))
    local aaj = false
    pcall(function()
      local aak = zv.Save.Get()
      for aal in pairs(((aak and aak.DarkMatterQueue) or {})) do
        aaj = true
        break
      end
    end)
    if (((3 ^ 2) == 9) and aaj) then
      pcall(mx, zv, (l.IndexForceSkipDM ~= false), aad)
    end
    if (((7 * 7) == 49) and zk(zv, aaf)) then
      task.wait(0.25)
      continue
    end
    local aam = zv.Save.Get()
    local aan = lh(aam, (tonumber(l.IndexHatchAmount) or 3))
    if (((1 + 1) == 2) and ((aan ~= ((tonumber(l.IndexHatchAmount) or 3))) and not n.OctupleWarned)) then
      n.OctupleWarned = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({3, 53, 47, 122, 62, 53, 52, 125, 46, 122, 53, 45, 52, 122, 46, 50, 63, 122, 34, 98, 122, 50, 59, 46, 57, 50, 122, 47, 52, 54, 53, 57, 49, 122, 8270, 122, 51, 52, 62, 63, 34, 51, 52, 61, 122, 45, 51, 46, 50, 122, 34, 105, 122, 51, 52, 41, 46, 63, 59, 62}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    local aao = false
    for aap, aaq in pairs(aaf) do
      if (((15 * 15) == 225) and aaq[1]) then
        aao = true
        break
      end
    end
    local aar = zw
    if (((100 % 7) == 2) and ((zw.golden and not aao) and (l.IndexGoldenEggs ~= false))) then
      local aas = zw.golden
      if (((12 * 12) == 144) and (((tonumber((aam and aam[aas.currency])) or 0)) >= aas.cost)) then
        aar = aas
      end
    end
    n.IndexGoldenActive = (aar ~= zw)
    if (((3 ^ 2) == 9) and (aar ~= zw)) then
      n.IndexNote = string.format(g({127, 41, 122, 8270, 122, 127, 62, 122, 63, 52, 46, 40, 127, 41, 122, 54, 63, 60, 46, 118, 122, 50, 59, 46, 57, 50, 51, 52, 61, 122, 61, 53, 54, 62, 63, 52}, 90), zw.name, aag, (((aag == 1) and g({35}, 90)) or g({51, 63, 41}, 90)))
    end
    do
      local aat = (tonumber((aam and aam[aar.currency])) or 0)
      local aau = nil
      for aav, aaw in ipairs({8, 3, 1}) do
        if (((7 * 7) == 49) and ((aaw <= aan) and (aat >= (aar.cost * aaw)))) then
          aau = aaw
          break
        end
      end
      aan = (aau or 1)
    end
    local aax, aay = lf(aan)
    local aaz, aba = tq(zv, aar.key)
    if (((1 + 1) == 2) and not aaz) then
      if (((15 * 15) == 225) and (aar ~= zw)) then
        zw.golden, n.IndexGoldenActive = nil, false
        task.wait(0.25)
        continue
      end
      n.IndexNote = (zw.name .. (g({96, 122}, 90) .. tostring(aba)))
      return ((((aba == g({63, 61, 61, 122, 52, 53, 46, 122, 51, 52, 122, 46, 50, 51, 41, 122, 45, 53, 40, 54, 62}, 90))) and g({41, 49, 51, 42}, 90)) or g({41, 46, 59, 54, 54, 63, 62}, 90))
    end
    local abb = (aar.cost * aan)
    if (((100 % 7) == 2) and (((tonumber((aam and aam[aar.currency])) or 0)) < abb)) then
      if (((12 * 12) == 144) and (aar ~= zw)) then
        n.IndexGoldenActive = false
        task.wait(0.25)
        continue
      end
      n.IndexNote = string.format(g({127, 41, 122, 8270, 122, 52, 63, 63, 62, 122, 127, 41, 122, 127, 41}, 90), aar.name, ao(abb), aar.currency)
      return g({56, 40, 53, 49, 63}, 90)
    end
    local abc, abd
    pcall(function()
      abc, abd = zv.Network.Invoke(g({31, 61, 61, 96, 122, 24, 47, 35, 122, 31, 61, 61}, 90), aar.key, aax, aay)
    end)
    if (((3 ^ 2) == 9) and abc) then
      m.Eggs += aan
      zz += aan
      aaa += aan
    else
      local abe = tostring((abd or g({47, 52, 49, 52, 53, 45, 52}, 90)))
      if (((7 * 7) == 49) and string.find(abe, g({46, 53, 53, 122, 43, 47, 51, 57, 49, 54, 35}, 90))) then
        task.wait(1.5)
      elseif (((1 + 1) == 2) and string.find(abe, g({46, 53, 53, 122, 60, 59, 40}, 90))) then
        tq(zv, aar.key)
        task.wait(0.5)
      elseif (((15 * 15) == 225) and (string.find(abe, g({59, 60, 60, 53, 40, 62}, 90)) or string.find(abe, g({63, 52, 53, 47, 61, 50}, 90)))) then
        if (((100 % 7) == 2) and (aar ~= zw)) then
          n.IndexGoldenActive = false
          task.wait(0.25)
          continue
        end
        n.IndexNote = (aar.name .. (g({96, 122}, 90) .. abe))
        return g({56, 40, 53, 49, 63}, 90)
      else
        n.IndexNote = (aar.name .. (g({96, 122}, 90) .. abe))
        return g({41, 46, 59, 54, 54, 63, 62}, 90)
      end
    end
    task.wait(math.max(1.2, (tonumber(l.IndexHatchDelay) or 1.2)))
    local abf, abg = sm(zv, zw.key, zy, rp(zv), zx)
    if (((12 * 12) == 144) and (abg < aag)) then
      aaa = 0
    end
    n.IndexKeepAt = 0
    n.IndexHatched = zz
    if (((3 ^ 2) == 9) and ((aab > 0) and (zz >= aab))) then
      n.IndexNote = (zw.name .. g({96, 122, 50, 59, 46, 57, 50, 122, 57, 59, 42, 122, 40, 63, 59, 57, 50, 63, 62}, 90))
      return g({41, 46, 59, 54, 54, 63, 62}, 90)
    end
    if (((7 * 7) == 49) and ((aac > 0) and (aaa >= aac))) then
      n.IndexNote = string.format(g({127, 41, 96, 122, 52, 53, 122, 52, 63, 45, 122, 63, 52, 46, 40, 51, 63, 41, 122, 51, 52, 122, 127, 62, 122, 50, 59, 46, 57, 50, 63, 41}, 90), zw.name, aac)
      return g({41, 46, 59, 54, 54, 63, 62}, 90)
    end
  end
  return g({41, 46, 53, 42}, 90)
end
k._indexWorkEgg = zu
task.spawn(function()
  while (((1 + 1) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local abh = k.Library
  if (((15 * 15) == 225) and not abh) then
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
    local aca, acb = pcall(function()
      local abi = rd(abh)
      local abj = xv(abh)
      if (((7 * 7) == 49) and (#abj == 0)) then
        n.IndexNote = g({42, 51, 57, 49, 122, 59, 46, 122, 54, 63, 59, 41, 46, 122, 53, 52, 63, 122, 45, 53, 40, 54, 62}, 90)
        task.wait(2)
        return
      end
      local abk = m.IndexNew
      local abl = {}
      for abm, abn in ipairs(abj) do
        abl[abn] = true
      end
      for abo, abp in ipairs(abj) do
        if (((1 + 1) == 2) and not (((k.Gen == o) and l.AutoIndex))) then
          return
        end
        n.IndexWorld = abp
        local abq, abr = zd(abh, abp)
        if (((15 * 15) == 225) and not abq) then
          n.IndexNote = (abp .. (g({96, 122}, 90) .. tostring(abr)))
          task.wait(1.5)
          continue
        end
        local abs = sz(abh, abi)
        if (((100 % 7) == 2) and (#abs == 0)) then
          n.IndexNote = (abp .. g({96, 122, 52, 53, 122, 50, 59, 46, 57, 50, 59, 56, 54, 63, 122, 63, 61, 61, 41}, 90))
          task.wait(1.5)
          continue
        end
        for abt, abu in ipairs(abs) do
          if (((12 * 12) == 144) and not (((k.Gen == o) and l.AutoIndex))) then
            return
          end
          local abv, abw = pcall(zu, abh, abu, abi)
          if (((3 ^ 2) == 9) and not abv) then
            n.IndexNote = (abu.name .. (g({96, 122}, 90) .. tostring(abw)))
            abw = g({41, 46, 59, 54, 54, 63, 62}, 90)
          end
          if (((7 * 7) == 49) and (abw == g({41, 46, 53, 42}, 90))) then
            return
          end
          task.wait(0.2)
        end
      end
      local abx = (m.IndexNew > abk)
      n.IndexEgg, n.IndexNeedIds = nil, nil
      if (((1 + 1) == 2) and not abx) then
        local aby = yk(abh, abl, abi)
        local abz = ((aby and aby.owed) or 0)
        n.IndexNote = ((((abz == 0)) and g({41, 63, 54, 63, 57, 46, 63, 62, 122, 45, 53, 40, 54, 62, 41, 122, 57, 53, 55, 42, 54, 63, 46, 63}, 90)) or string.format(g({45, 59, 51, 46, 51, 52, 61, 122, 8270, 122, 127, 62, 122, 63, 52, 46, 40, 51, 63, 41, 122, 52, 63, 63, 62, 122, 55, 53, 40, 63, 122, 57, 53, 51, 52, 41}, 90), abz))
        task.wait(10)
      end
    end)
    n.IndexBusy = false
    if (((15 * 15) == 225) and not aca) then
      n.IndexNote = (g({63, 40, 40, 53, 40, 96, 122}, 90) .. tostring(acb))
      task.wait(3)
    else
      task.wait(0.4)
    end
  end
end)
k._teleportToEgg = function()
  local acc = k.Library
  if (((100 % 7) == 2) and not acc) then
    return false, g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90)
  end
  local acd = l.EggKey
  if (((12 * 12) == 144) and not acd) then
    return false, g({52, 53, 122, 63, 61, 61, 122, 41, 63, 54, 63, 57, 46, 63, 62}, 90)
  end
  if (((3 ^ 2) == 9) and n.SwitchingWorld) then
    return false, g({45, 53, 40, 54, 62, 122, 51, 41, 122, 41, 45, 51, 46, 57, 50, 51, 52, 61}, 90)
  end
  local ace = nil
  pcall(function()
    for acf, acg in ipairs(acc.WorldCmds.GetAllEggs()) do
      if (((7 * 7) == 49) and (acg:GetAttribute(g({19, 30}, 90)) == acd)) then
        ace = acg
        break
      end
    end
  end)
  if (((1 + 1) == 2) and not ace) then
    return false, g({63, 61, 61, 122, 52, 53, 46, 122, 60, 53, 47, 52, 62, 122, 51, 52, 122, 46, 50, 51, 41, 122, 45, 53, 40, 54, 62}, 90)
  end
  local ach = ace:FindFirstChild(g({25, 63, 52, 46, 63, 40}, 90))
  if (((15 * 15) == 225) and not ach) then
    return false, g({63, 61, 61, 122, 50, 59, 41, 122, 52, 53, 122, 25, 63, 52, 46, 63, 40, 122, 42, 59, 40, 46}, 90)
  end
  local aci = Players.LocalPlayer.Character
  local acj = (aci and aci:FindFirstChild(g({18, 47, 55, 59, 52, 53, 51, 62, 8, 53, 53, 46, 10, 59, 40, 46}, 90)))
  if (((100 % 7) == 2) and not acj) then
    return false, g({52, 53, 122, 57, 50, 59, 40, 59, 57, 46, 63, 40}, 90)
  end
  acj.CFrame = kx(ach, acj)
  return true, nil
end
local function ack(acl)
  if (((12 * 12) == 144) and not ((l.AutoOrbs or l.MagnetOrbs))) then
    task.wait(0.25)
    return
  end
  if (((3 ^ 2) == 9) and n.SwitchingWorld) then
    task.wait(0.5)
    return
  end
  local acm = ay()
  if (((7 * 7) == 49) and not acm) then
    task.wait(0.5)
    return
  end
  local acn = acm.Position
  local aco = ba()
  local acp = (aco and aco:FindFirstChild(g({21, 40, 56, 41}, 90)))
  if (((1 + 1) == 2) and not acp) then
    task.wait(0.5)
    return
  end
  local acq = acp:GetChildren()
  if (((15 * 15) == 225) and l.AutoOrbs) then
    local acr = {}
    for acs, act in ipairs(acq) do
      if (((100 % 7) == 2) and (#acr >= 10)) then
        break
      end
      if (((12 * 12) == 144) and act:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))) then
        local acu = ((act.Position - acn)).Magnitude
        if (((3 ^ 2) == 9) and ((l.MaxDistance <= 0) or (acu <= l.MaxDistance))) then
          table.insert(acr, act.Name)
        end
      end
    end
    if (((7 * 7) == 49) and (#acr > 0)) then
      pcall(function()
        acl.Network.Fire(g({25, 54, 59, 51, 55, 122, 21, 40, 56, 41}, 90), acr)
      end)
      m.Orbs += #acr
    end
  end
  if (((1 + 1) == 2) and l.MagnetOrbs) then
    local acv = 0
    pcall(function()
      for acw, acx in ipairs(acq) do
        if (((15 * 15) == 225) and acx:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))) then
          local acy = ((acx.Position - acn)).Magnitude
          if (((100 % 7) == 2) and ((((l.MaxDistance <= 0) or (acy <= l.MaxDistance))) and (acy > 3))) then
            acx.CFrame = CFrame.new((acn + Vector3.new((((math.random() - 0.5)) * 4), (1.5 + math.random()), (((math.random() - 0.5)) * 4))))
            acv += 1
            if (((12 * 12) == 144) and (acv >= 400)) then
              break
            end
          end
        end
      end
    end)
    if (((3 ^ 2) == 9) and ((acv > 0) and not l.AutoOrbs)) then
      m.Orbs += acv
    end
  end
  task.wait(((l.MagnetOrbs and 0.1) or 0.25))
end
task.spawn(function()
  while (((7 * 7) == 49) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local acz = k.Library
  if (((1 + 1) == 2) and not acz) then
    return
  end
  while (((15 * 15) == 225) and (k.Gen == o)) do
    local ada, adb = pcall(ack, acz)
    if (((100 % 7) == 2) and not ada) then
      warn((g({1, 27, 40, 63, 59, 28, 59, 40, 55, 7, 122, 53, 40, 56, 122, 63, 40, 40, 53, 40, 96, 122}, 90) .. tostring(adb)))
      task.wait(1)
    end
  end
end)
local function adc(add)
  if (((12 * 12) == 144) and not ((l.AutoBags or l.MagnetBags))) then
    task.wait(0.25)
    return
  end
  if (((3 ^ 2) == 9) and n.SwitchingWorld) then
    task.wait(0.5)
    return
  end
  local ade = ay()
  if (((7 * 7) == 49) and not ade) then
    task.wait(0.5)
    return
  end
  local adf = ade.Position
  local adg = ba()
  local adh = (adg and adg:FindFirstChild(g({22, 53, 53, 46, 56, 59, 61, 41}, 90)))
  if (((1 + 1) == 2) and not adh) then
    task.wait(0.5)
    return
  end
  local adi = 0
  for adj, adk in ipairs(adh:GetChildren()) do
    if (((15 * 15) == 225) and (adi >= 15)) then
      break
    end
    if (((100 % 7) == 2) and adk:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))) then
      local adl = ((adk.Position - adf)).Magnitude
      if (((12 * 12) == 144) and ((l.MaxDistance <= 0) or (adl <= l.MaxDistance))) then
        if (((3 ^ 2) == 9) and l.AutoBags) then
          local adm = bc(adk, g({19, 30}, 90))
          if (((7 * 7) == 49) and adm) then
            pcall(function()
              add.Network.Fire(g({25, 53, 54, 54, 63, 57, 46, 122, 22, 53, 53, 46, 56, 59, 61}, 90), adm, adk.Position)
            end)
            m.Bags += 1
            adi += 1
          end
        elseif (((1 + 1) == 2) and (l.MagnetBags and bc(adk, g({8, 63, 59, 62, 35, 28, 53, 40, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52}, 90)))) then
          pcall(function()
            adk.CFrame = CFrame.new((adf + Vector3.new(0, -2.5, 0)))
          end)
          m.Bags += 1
          adi += 1
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
  local adn = k.Library
  if (((100 % 7) == 2) and not adn) then
    return
  end
  while (((12 * 12) == 144) and (k.Gen == o)) do
    local ado, adp = pcall(adc, adn)
    if (((3 ^ 2) == 9) and not ado) then
      warn((g({1, 27, 40, 63, 59, 28, 59, 40, 55, 7, 122, 56, 59, 61, 122, 63, 40, 40, 53, 40, 96, 122}, 90) .. tostring(adp)))
      task.wait(1)
    end
  end
end)
local function adq(adr)
  return ((adr:find(g({4, 50, 46, 46, 42, 41, 96, 117, 117, 62, 51, 41, 57, 53, 40, 62, 127, 116, 57, 53, 55, 117, 59, 42, 51, 117, 45, 63, 56, 50, 53, 53, 49, 41, 117}, 90)) ~= nil) or (adr:find(g({4, 50, 46, 46, 42, 41, 96, 117, 117, 62, 51, 41, 57, 53, 40, 62, 59, 42, 42, 127, 116, 57, 53, 55, 117, 59, 42, 51, 117, 45, 63, 56, 50, 53, 53, 49, 41, 117}, 90)) ~= nil))
end
local function ads(adt)
  if (((7 * 7) == 49) and ((type(adt) ~= g({52, 47, 55, 56, 63, 40}, 90)) or (adt <= 0))) then
    return nil
  end
  local adu = string.format(g({127, 116, 98, 60}, 90), adt):gsub(g({106, 113, 126}, 90), ""):gsub(g({127, 116, 126}, 90), "")
  local adv = math.floor(((100 / adt) + 0.5))
  local adw = ""
  if (((1 + 1) == 2) and ((adv >= 1) and (adv <= 1e12))) then
    adw = (g({122, 114, 107, 122, 51, 52, 122}, 90) .. (string.format(g({127, 116, 107, 104, 61}, 90), adv) .. g({115}, 90)))
  end
  return (adu .. (g({127}, 90) .. adw))
end
local function adx(ady)
  local adz = tostring((ady.thumbnail or ""))
  local aea = adz:match(g({127, 62, 113}, 90))
  if (((15 * 15) == 225) and not aea) then
    return nil
  end
  return (g({50, 46, 46, 42, 41, 96, 117, 117, 45, 45, 45, 116, 40, 53, 56, 54, 53, 34, 116, 57, 53, 55, 117, 59, 41, 41, 63, 46, 119, 46, 50, 47, 55, 56, 52, 59, 51, 54, 117, 51, 55, 59, 61, 63, 101, 59, 41, 41, 63, 46, 19, 62, 103}, 90) .. (aea .. g({124, 45, 51, 62, 46, 50, 103, 110, 104, 106, 124, 50, 63, 51, 61, 50, 46, 103, 110, 104, 106, 124, 60, 53, 40, 55, 59, 46, 103, 42, 52, 61}, 90)))
end
local function aeb(aec, aed)
  local aee = tostring((aec.name or aed.id))
  if (((100 % 7) == 2) and aed.dm) then
    return (g({30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122}, 90) .. aee)
  end
  if (((12 * 12) == 144) and aed.r) then
    return (g({8, 59, 51, 52, 56, 53, 45, 122}, 90) .. aee)
  end
  if (((3 ^ 2) == 9) and aed.g) then
    return (g({29, 53, 54, 62, 63, 52, 122}, 90) .. aee)
  end
  return aee
end
k._sendWebhook = function(aef, aeg)
  aef = tostring((aef or ""))
  if (((7 * 7) == 49) and (aef == "")) then
    return false, g({52, 53, 122, 15, 8, 22, 122, 41, 63, 46}, 90)
  end
  if (((1 + 1) == 2) and not adq(aef)) then
    return false, g({52, 53, 46, 122, 59, 122, 30, 51, 41, 57, 53, 40, 62, 122, 45, 63, 56, 50, 53, 53, 49, 122, 15, 8, 22}, 90)
  end
  local aeh, aei = pcall(function()
    return request({Url = aef, Method = g({10, 21, 9, 14}, 90), Headers = {[g({25, 53, 52, 46, 63, 52, 46, 119, 14, 35, 42, 63}, 90)] = g({59, 42, 42, 54, 51, 57, 59, 46, 51, 53, 52, 117, 48, 41, 53, 52}, 90)}, Body = i:JSONEncode({username = g({25, 53, 42, 63, 122, 18, 47, 56}, 90), embeds = aeg})})
  end)
  if (((15 * 15) == 225) and not aeh) then
    return false, tostring(aei)
  end
  local aej = (((tonumber(aei.StatusCode) or tonumber(aei.status)) or tonumber(aei.code)) or 0)
  if (((100 % 7) == 2) and ((aej == 200) or (aej == 204))) then
    return true
  end
  return false, (g({18, 14, 14, 10, 122}, 90) .. tostring(aej))
end
k._processHatch = function(aek, ael)
  if (((12 * 12) == 144) and (type(ael) ~= g({46, 59, 56, 54, 63}, 90))) then
    return
  end
  local aem = k.Library
  if (((3 ^ 2) == 9) and not aem) then
    return
  end
  n.HatchesSeen = (((n.HatchesSeen or 0)) + 1)
  local aen = aem.Directory.Eggs[tostring(aek)]
  local aeo = {}
  for aep, aeq in ipairs(ael) do
    local aer = aem.Directory.Pets[tostring(aeq.id)]
    if (((7 * 7) == 49) and (aer and aer.huge)) then
      m.Huges += 1
      local aes = nil
      if (((1 + 1) == 2) and (aen and (type(aen.drops) == g({46, 59, 56, 54, 63}, 90)))) then
        for aet, aeu in ipairs(aen.drops) do
          if (((15 * 15) == 225) and (tostring(aeu[1]) == tostring(aeq.id))) then
            aes = tonumber(aeu[2])
            break
          end
        end
      end
      local aev = {{name = g({10, 63, 46}, 90), value = aeb(aer, aeq), inline = true}, {name = g({25, 50, 59, 52, 57, 63}, 90), value = (ads(aes) or g({15, 52, 49, 52, 53, 45, 52}, 90)), inline = true}, {name = g({31, 61, 61}, 90), value = tostring(aek), inline = true}, {name = g({18, 59, 46, 57, 50, 63, 62, 122, 24, 35}, 90), value = Players.LocalPlayer.Name, inline = true}, {name = g({8, 59, 40, 51, 46, 35}, 90), value = tostring((aer.rarity or g({101}, 90))), inline = true}}
      if (((100 % 7) == 2) and tonumber(aeq.s)) then
        table.insert(aev, {name = g({9, 46, 40, 63, 52, 61, 46, 50}, 90), value = ao(tonumber(aeq.s)), inline = true})
      end
      local aew = {title = g({18, 15, 29, 31, 122, 18, 27, 14, 25, 18, 31, 30, 123}, 90), color = 0xFFB300, fields = aev, footer = {text = g({25, 53, 42, 63, 122, 18, 47, 56}, 90)}, timestamp = os.date(g({123, 127, 3, 119, 127, 55, 119, 127, 62, 14, 127, 18, 96, 127, 23, 96, 127, 9, 0}, 90))}
      local aex = adx(aer)
      if (((12 * 12) == 144) and aex) then
        aew.thumbnail = {url = aex}
      end
      table.insert(aeo, aew)
    end
  end
  if (((3 ^ 2) == 9) and (#aeo == 0)) then
    return
  end
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({18, 15, 29, 31, 122, 50, 59, 46, 57, 50, 63, 62, 123, 122}, 90) .. (((l.WebhookEnabled and g({13, 63, 56, 50, 53, 53, 49, 122, 41, 63, 52, 46, 116}, 90)) or g({114, 45, 63, 56, 50, 53, 53, 49, 122, 53, 60, 60, 115}, 90)))), g({41, 42, 59, 40, 49, 54, 63, 41}, 90))
  if (((7 * 7) == 49) and l.WebhookEnabled) then
    task.spawn(function()
      local aey, aez = k._sendWebhook(l.WebhookURL, aeo)
      if (((1 + 1) == 2) and not aey) then
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({13, 63, 56, 50, 53, 53, 49, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring(aez)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      end
    end)
  end
end
task.spawn(function()
  while (((15 * 15) == 225) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local afa = k.Library
  if (((100 % 7) == 2) and not afa) then
    return
  end
  local afb = nil
  while (((12 * 12) == 144) and ((k.Gen == o) and not afb)) do
    local afc, afd = pcall(function()
      return afa.Network.Fired(g({53, 42, 63, 52, 63, 61, 61, 61, 61}, 90))
    end)
    if (((3 ^ 2) == 9) and (afc and afd)) then
      afb = afd:Connect(function(afe, aff)
        pcall(function()
          k._processHatch(afe, aff)
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
  if (((1 + 1) == 2) and afb) then
    pcall(function()
      afb:Disconnect()
    end)
  end
end)
k._testWebhook = function()
  local afg = {title = g({18, 15, 29, 31, 122, 18, 27, 14, 25, 18, 31, 30, 123, 122, 114, 14, 31, 9, 14, 115}, 90), color = 0xFFB300, thumbnail = {url = g({50, 46, 46, 42, 41, 96, 117, 117, 45, 45, 45, 116, 40, 53, 56, 54, 53, 34, 116, 57, 53, 55, 117, 59, 41, 41, 63, 46, 119, 46, 50, 47, 55, 56, 52, 59, 51, 54, 117, 51, 55, 59, 61, 63, 101, 59, 41, 41, 63, 46, 19, 62, 103, 109, 105, 98, 111, 109, 107, 104, 99, 106, 106, 124, 45, 51, 62, 46, 50, 103, 110, 104, 106, 124, 50, 63, 51, 61, 50, 46, 103, 110, 104, 106, 124, 60, 53, 40, 55, 59, 46, 103, 42, 52, 61}, 90)}, fields = {{name = g({10, 63, 46}, 90), value = g({18, 47, 61, 63, 122, 25, 59, 46, 122, 114, 41, 59, 55, 42, 54, 63, 115}, 90), inline = true}, {name = g({25, 50, 59, 52, 57, 63}, 90), value = g({104, 127, 122, 114, 107, 122, 51, 52, 122, 111, 106, 115}, 90), inline = true}, {name = g({31, 61, 61}, 90), value = g({31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 31, 61, 61, 122, 107}, 90), inline = true}, {name = g({18, 59, 46, 57, 50, 63, 62, 122, 24, 35}, 90), value = Players.LocalPlayer.Name, inline = true}, {name = g({8, 59, 40, 51, 46, 35}, 90), value = g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90), inline = true}}, footer = {text = g({27, 40, 63, 59, 122, 28, 59, 40, 55, 122, 18, 47, 56, 122, 8270, 122, 46, 63, 41, 46}, 90)}, timestamp = os.date(g({123, 127, 3, 119, 127, 55, 119, 127, 62, 14, 127, 18, 96, 127, 23, 96, 127, 9, 0}, 90))}
  return k._sendWebhook(l.WebhookURL, {afg})
end
k._buyBoosts = function(afh, afi, afj, afk)
  afk = (afk or {})
  local afl = k.Library
  if (((15 * 15) == 225) and not afl) then
    return 0, g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90)
  end
  if (((100 % 7) == 2) and (afi <= 0)) then
    return 0
  end
  local afm = 10000
  for afn, afo in ipairs(k.BOOSTS) do
    if (((12 * 12) == 144) and (afo.key == afh)) then
      afm = (afo.price or 10000)
      break
    end
  end
  local afp = afk.floor
  local afq, afr
  afq, afr = pcall(function()
    return afl.Save.Get()
  end)
  if (((3 ^ 2) == 9) and (not afq or not afr)) then
    return 0, g({41, 59, 44, 63, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90)
  end
  local afs = (tonumber((afr.BoostsInventory and afr.BoostsInventory[afh])) or 0)
  local aft = tonumber(afr.Diamonds)
  if (((7 * 7) == 49) and not aft) then
    return 0, g({52, 53, 122, 62, 51, 59, 55, 53, 52, 62, 122, 56, 59, 54, 59, 52, 57, 63}, 90)
  end
  local afu = 0
  do
    task.wait(2)
    local afv = nil
    pcall(function()
      afv = afl.Save.Get()
    end)
    if (((1 + 1) == 2) and (afv and tonumber(afv.Diamonds))) then
      afu = (((tonumber(afv.Diamonds) - aft)) / 2)
    end
  end
  local afw, afx, afy = 0, 0, 0
  local afz = aft
  local aga = os.clock()
  local agb = (aga + ((afk.timeout or 150)))
  local agc = 0.30
  local agd
  local function age()
    local agf = nil
    pcall(function()
      agf = afl.Save.Get()
    end)
    if (((15 * 15) == 225) and not agf) then
      return
    end
    local agg = (agf.BoostsInventory and tonumber(agf.BoostsInventory[afh]))
    if (((100 % 7) == 2) and agg) then
      afw = math.max(afw, (agg - afs))
    end
    local agh = tonumber(agf.Diamonds)
    if (((12 * 12) == 144) and agh) then
      local agi = math.floor((((((aft - agh) + (afu * ((os.clock() - aga))))) / afm) + 0.5))
      if (((3 ^ 2) == 9) and (agi > 0)) then
        afw = math.max(afw, agi)
      end
      afz = agh
    end
  end
  local agj = 10
  while (((7 * 7) == 49) and (((afw < afi) and (afx < (afi * 2))) and (os.clock() < agb))) do
    local agk = math.min(agj, math.max(1, (afi - afw)))
    for agl = 1, agk do
      pcall(function()
        afl.Network.Invoke(g({24, 47, 35, 122, 24, 53, 53, 41, 46}, 90), afh)
      end)
      afx += 1
      if (((1 + 1) == 2) and (afx >= (afi * 2))) then
        break
      end
      task.wait(agc)
    end
    task.wait(3.5)
    age()
    if (((15 * 15) == 225) and ((os.clock() < agb) and (afw >= afi))) then
      break
    end
    if (((100 % 7) == 2) and afj) then
      afj(math.min(afw, afi), afi)
    end
    if (((12 * 12) == 144) and ((afx >= 8) and ((afw / afx) < 0.5))) then
      agc = math.min((agc + 0.06), 0.6)
    end
    if (((3 ^ 2) == 9) and (((afw < 1) and (afx >= agj)) and (afy == 0))) then
      afy = afx
    end
    if (((7 * 7) == 49) and (((afy > 0) and (afx == (afy + agj))) and (afw < 1))) then
      agd = g({41, 63, 40, 44, 63, 40, 122, 51, 41, 122, 46, 50, 40, 53, 46, 46, 54, 51, 52, 61, 122, 56, 53, 53, 41, 46, 122, 56, 47, 35, 41, 122, 8270, 122, 46, 59, 49, 63, 122, 59, 122, 108, 106, 41, 122, 56, 40, 63, 59, 49, 118, 122, 46, 50, 63, 52, 122, 40, 63, 46, 40, 35}, 90)
      break
    end
    if (((1 + 1) == 2) and afp) then
      local agm = tonumber(afz)
      if (((15 * 15) == 225) and (agm and ((agm - (((afi - afw)) * afm)) < afp))) then
        agd = g({62, 51, 59, 55, 53, 52, 62, 122, 60, 54, 53, 53, 40, 122, 50, 51, 46, 122, 56, 63, 60, 53, 40, 63, 122, 46, 50, 63, 122, 61, 53, 59, 54, 122, 45, 59, 41, 122, 55, 63, 46}, 90)
        break
      end
    end
  end
  task.wait(2.5)
  age()
  if (((100 % 7) == 2) and afp) then
    local agn = tonumber(afz)
    if (((12 * 12) == 144) and (agn and (agn < afp))) then
      agd = (agd or g({62, 51, 59, 55, 53, 52, 62, 122, 60, 54, 53, 53, 40, 122, 50, 51, 46}, 90))
    end
  end
  if (((3 ^ 2) == 9) and (not agd and (afw < afi))) then
    agd = string.format(g({56, 53, 47, 61, 50, 46, 122, 127, 62, 117, 127, 62, 122, 8270, 122, 40, 63, 41, 46, 122, 40, 63, 48, 63, 57, 46, 63, 62, 122, 56, 35, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 118, 122, 40, 47, 52, 122, 59, 61, 59, 51, 52}, 90), afw, afi)
  end
  if (((7 * 7) == 49) and afj) then
    afj(math.min(afw, afi), afi)
  end
  return afw, agd
end
k._activateBoosts = function(ago, agp)
  local agq = k.Library
  if (((1 + 1) == 2) and not agq) then
    return 0
  end
  for agr = 1, agp do
    pcall(function()
      agq.Network.Fire(g({27, 57, 46, 51, 44, 59, 46, 63, 122, 24, 53, 53, 41, 46}, 90), ago)
    end)
  end
  return agp
end
local function ags(agt, agu)
  local agv = agt.Directory.Pets[agu.id]
  if (((15 * 15) == 225) and not agv) then
    return false
  end
  if (((100 % 7) == 2) and (agv.isPremium or agv.isGift)) then
    return false
  end
  local agw = agv.rarity
  if (((12 * 12) == 144) and ((agw == g({23, 35, 46, 50, 51, 57, 59, 54}, 90)) or (agw == g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90)))) then
    return false
  end
  return true
end
local function agx(agy, agz, aha)
  if (((3 ^ 2) == 9) and not agz) then
    return false
  end
  for ahb, ahc in ipairs((agz.powers or {})) do
    local ahd = agy.Directory.Powers[ahc[1]]
    local ahe = ((ahd and ahd.tiers) and ahd.tiers[ahc[2]])
    if (((7 * 7) == 49) and (ahe and aha[ahe.title])) then
      return true
    end
  end
  return false
end
local function ahf(ahg, ahh)
  local ahi = ahg.Save.Get()
  if (((1 + 1) == 2) and not ahi) then
    return nil, 0
  end
  n.EnchantFails = (n.EnchantFails or {})
  local ahj, ahk = {}, 0
  for ahl, ahm in pairs((ahi.Pets or {})) do
    if (((15 * 15) == 225) and ags(ahg, ahm)) then
      ahk += 1
      if (((100 % 7) == 2) and ((((not l.EnchantSkipLocked or not ahm.l)) and (((n.EnchantFails[tostring(ahm.uid)] or 0)) < 3)) and not agx(ahg, ahm, ahh))) then
        table.insert(ahj, ahm)
      end
    end
  end
  return ahj, ahk, (tonumber(ahi.Diamonds) or 0)
end
k._enchantOnce = function(ahn, aho)
  ahn = (ahn or k.Library)
  if (((12 * 12) == 144) and not ahn) then
    return g({52, 53, 122, 54, 51, 56, 40, 59, 40, 35}, 90)
  end
  aho = ((aho or l.EnchantDesired) or {})
  local ahp = {}
  for ahq, ahr in ipairs(aho) do
    ahp[ahr] = true
  end
  if (((3 ^ 2) == 9) and not next(ahp)) then
    n.EnchantNote = g({52, 53, 122, 62, 63, 41, 51, 40, 63, 62, 122, 63, 52, 57, 50, 59, 52, 46, 122, 42, 51, 57, 49, 63, 62}, 90)
    return g({52, 53, 122, 62, 63, 41, 51, 40, 63, 62}, 90)
  end
  local ahs, aht, ahu = ahf(ahn, ahp)
  if (((7 * 7) == 49) and not ahs) then
    n.EnchantNote = g({52, 53, 122, 41, 59, 44, 63}, 90)
    return g({52, 53, 122, 41, 59, 44, 63}, 90)
  end
  if (((1 + 1) == 2) and (#ahs == 0)) then
    n.EnchantNote = ((((aht > 0)) and string.format(g({59, 54, 54, 122, 127, 62, 122, 63, 54, 51, 61, 51, 56, 54, 63, 122, 42, 63, 46, 114, 41, 115, 122, 50, 59, 44, 63, 122, 59, 122, 62, 63, 41, 51, 40, 63, 62, 122, 63, 52, 57, 50, 59, 52, 46}, 90), aht)) or g({52, 53, 122, 63, 54, 51, 61, 51, 56, 54, 63, 122, 42, 63, 46, 41, 122, 46, 53, 122, 63, 52, 57, 50, 59, 52, 46}, 90))
    return g({62, 53, 52, 63}, 90)
  end
  local ahv = ((tonumber(ahn.Network.Invoke(g({29, 63, 46, 122, 31, 52, 57, 50, 59, 52, 46, 122, 10, 63, 46, 41, 122, 19, 52, 60, 53}, 90))) or tonumber(ahn.Shared.EnchantCost)) or 10000)
  local ahw = (tonumber(ahn.Shared.EnchantHardcoreCost) or ahv)
  local ahx = math.max(0, (tonumber(l.EnchantDiamondFloor) or 0))
  local ahy = math.clamp(math.floor((tonumber(l.EnchantBatch) or 10)), 1, 30)
  local ahz = ((((ahx > 0)) and ((ahu - ahx))) or math.huge)
  local aia = {}
  for aib, aic in ipairs(ahs) do
    if (((15 * 15) == 225) and (#aia >= ahy)) then
      break
    end
    local aid = ((aic.hc and ahw) or ahv)
    if (((100 % 7) == 2) and ((ahz - aid) >= 0)) then
      ahz -= aid
      table.insert(aia, aic)
    end
  end
  if (((12 * 12) == 144) and (#aia == 0)) then
    n.EnchantNote = string.format(g({42, 59, 47, 41, 63, 62, 96, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 127, 41, 122, 59, 46, 117, 52, 63, 59, 40, 122, 60, 54, 53, 53, 40, 122, 127, 41}, 90), as(ahu), as(ahx))
    return g({60, 54, 53, 53, 40}, 90)
  end
  local aie = {}
  local aif = ahn.Variables
  local aig = aif.UsingMachine
  aif.UsingMachine = true
  for aih, aii in ipairs(aia) do
    local aij = tostring(aii.uid)
    local aik
    pcall(function()
      aik = ahn.Network.Invoke(g({31, 52, 57, 50, 59, 52, 46, 122, 10, 63, 46}, 90), aij)
    end)
    aie[aij] = ((aik and true) or false)
  end
  aif.UsingMachine = aig
  n.EnchantFails = (n.EnchantFails or {})
  for ail, aim in ipairs(aia) do
    local ain = tostring(aim.uid)
    if (((3 ^ 2) == 9) and aie[ain]) then
      n.EnchantFails[ain] = 0
    else
      n.EnchantFails[ain] = (((n.EnchantFails[ain] or 0)) + 1)
    end
  end
  m.EnchantRolls += #aia
  task.wait(0.1)
  local aio = 0
  for aip, aiq in ipairs(aia) do
    local air
    pcall(function()
      air = ahn.PetCmds.Get(tostring(aiq.uid))
    end)
    if (((7 * 7) == 49) and agx(ahn, air, ahp)) then
      aio += 1
    end
  end
  m.EnchantDone += aio
  n.EnchantNote = string.format(g({40, 53, 54, 54, 63, 62, 122, 127, 62, 118, 122, 127, 62, 122, 40, 63, 59, 57, 50, 63, 62, 122, 62, 63, 41, 51, 40, 63, 62, 122, 114, 127, 41, 122, 54, 63, 60, 46, 115}, 90), #aia, aio, as(math.max(0, (#ahs - aio))))
  return g({40, 59, 52}, 90), #aia, aio
end
task.spawn(function()
  while (((1 + 1) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local ais = k.Library
  if (((15 * 15) == 225) and not ais) then
    return
  end
  while (((100 % 7) == 2) and (k.Gen == o)) do
    task.wait(0.1)
    if (((12 * 12) == 144) and (l.AutoEnchant and not n.EnchantBusy)) then
      n.EnchantBusy = true
      local ait = g({51, 62, 54, 63}, 90)
      pcall(function()
        ait = k._enchantOnce(ais)
      end)
      n.EnchantBusy = false
      task.wait((((ait == g({40, 59, 52}, 90)) and 0) or 2.5))
    end
  end
end)
local function aiu(aiv)
  if (((3 ^ 2) == 9) and aiv.dm) then
    return g({30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90)
  end
  if (((7 * 7) == 49) and aiv.r) then
    return g({8, 59, 51, 52, 56, 53, 45}, 90)
  end
  if (((1 + 1) == 2) and aiv.g) then
    return g({29, 53, 54, 62, 63, 52}, 90)
  end
  return g({20, 53, 40, 55, 59, 54}, 90)
end
local function aiw(aix, aiy)
  local aiz = {}
  if (((15 * 15) == 225) and not ((aix and aiy))) then
    return aiz
  end
  local aja = aix.Directory.Eggs[aiy]
  if (((100 % 7) == 2) and (not aja or (type(aja.drops) ~= g({46, 59, 56, 54, 63}, 90)))) then
    return aiz
  end
  for ajb, ajc in ipairs(aja.drops) do
    local ajd = tostring(ajc[1])
    local aje = aix.Directory.Pets[ajd]
    if (((12 * 12) == 144) and (((aje and (tostring(aje.rarity) == g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90))) and not aje.huge) and not aje.titanic)) then
      aiz[ajd] = true
    end
  end
  return aiz
end
local function ajf(ajg, ajh)
  local aji, ajj = {}, nil
  local ajk = ajg.Save.Get()
  if (((3 ^ 2) == 9) and not ajk) then
    return aji, ajj
  end
  for ajl, ajm in pairs((ajk.Pets or {})) do
    local ajn = ajg.Directory.Pets[tostring(ajm.id)]
    if (((7 * 7) == 49) and ((ajn and ajn.isGift) and (tostring(ajn.giftEggId) == tostring(ajh)))) then
      aji[(#aji + 1)] = tostring(ajm.uid)
      ajj = tostring(ajm.id)
    end
  end
  return aji, ajj
end
local function ajo()
  if (((1 + 1) == 2) and not (((l.AutoOpenGifts == true) or (n.GiftDeleteArmed == true)))) then
    return false
  end
  return (((l.GiftDeleteNormal == true) or (l.GiftDeleteGolden == true)) or (l.GiftDeleteRainbow == true))
end
local function ajp(ajq, ajr)
  if (((15 * 15) == 225) and not ajo()) then
    return false
  end
  local ajs = n.GiftTrashIds
  if (((100 % 7) == 2) and (not ajs or not ajs[tostring(ajr.id)])) then
    return false
  end
  if (((12 * 12) == 144) and (ajr.l == true)) then
    return false
  end
  if (((3 ^ 2) == 9) and ajr.dm) then
    return false
  end
  if (((7 * 7) == 49) and ajr.sh) then
    return false
  end
  if (((1 + 1) == 2) and ajr.r) then
    return (l.GiftDeleteRainbow == true)
  end
  if (((15 * 15) == 225) and ajr.g) then
    return (l.GiftDeleteGolden == true)
  end
  return (l.GiftDeleteNormal == true)
end
local function ajt(aju, ajv)
  local ajw = tostring(ajv.id)
  local ajx = aju.Directory.Pets[ajw]
  if (((100 % 7) == 2) and not ajx) then
    return false
  end
  if (((12 * 12) == 144) and (ajv.l == true)) then
    return false
  end
  if (((3 ^ 2) == 9) and ajv.dm) then
    return false
  end
  if (((7 * 7) == 49) and ajx.isGift) then
    return false
  end
  if (((1 + 1) == 2) and (aju.Directory.Eggs[ajw] or aju.Directory.Eggs[ajx.name])) then
    return false
  end
  if (((15 * 15) == 225) and (((l.DeleteRarities or {}))[tostring(ajx.rarity)] ~= true)) then
    return false
  end
  if (((100 % 7) == 2) and (l.ProtectHugeTitanic and ((ajx.huge or ajx.titanic)))) then
    return false
  end
  for ajy, ajz in ipairs((l.KeepVariants[tostring(ajx.rarity)] or {})) do
    if (((12 * 12) == 144) and ((ajz == g({9, 50, 51, 52, 35}, 90)) and ajv.sh)) then
      return false
    end
    if (((3 ^ 2) == 9) and (ajz == aiu(ajv))) then
      return false
    end
  end
  return true
end
local function aka(akb, akc)
  local akd = tostring(akc.id)
  local ake = akb.Directory.Pets[akd]
  if (((7 * 7) == 49) and not ake) then
    return false
  end
  if (((1 + 1) == 2) and (akc.l == true)) then
    return false
  end
  if (((15 * 15) == 225) and akc.dm) then
    return false
  end
  if (((100 % 7) == 2) and ake.isGift) then
    return false
  end
  if (((12 * 12) == 144) and (akb.Directory.Eggs[akd] or akb.Directory.Eggs[ake.name])) then
    return false
  end
  if (((3 ^ 2) == 9) and (tostring(ake.rarity) ~= g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90))) then
    return false
  end
  if (((7 * 7) == 49) and (l.ProtectHugeTitanic and ((ake.huge or ake.titanic)))) then
    return false
  end
  for akf, akg in ipairs((l.KeepVariants[g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90)] or {})) do
    if (((1 + 1) == 2) and ((akg == g({9, 50, 51, 52, 35}, 90)) and akc.sh)) then
      return false
    end
    if (((15 * 15) == 225) and (akg == aiu(akc))) then
      return false
    end
  end
  return true
end
local function akh(aki, akj)
  if (((100 % 7) == 2) and xp(akj)) then
    return false
  end
  if (((12 * 12) == 144) and ajp(aki, akj)) then
    return true
  end
  if (((3 ^ 2) == 9) and (l.AutoDeleteExclusives and aka(aki, akj))) then
    return true
  end
  return ajt(aki, akj)
end
k._isDeletable = akh
k._sweepAutoDelete = function(akk)
  local akl = k.Library
  if (((7 * 7) == 49) and not akl) then
    return 0, g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90)
  end
  local akm = akl.Save.Get()
  if (((1 + 1) == 2) and not akm) then
    return 0, nil
  end
  local akn = {}
  for ako, akp in pairs((akm.Pets or {})) do
    if (((15 * 15) == 225) and akh(akl, akp)) then
      table.insert(akn, tostring(akp.uid))
    end
  end
  if (((100 % 7) == 2) and (#akn == 0)) then
    return 0, nil
  end
  if (((12 * 12) == 144) and akk) then
    return -#akn, nil, akn
  end
  for akq, akr in ipairs(akn) do
    if (((3 ^ 2) == 9) and akm.PetsEquipped[akr]) then
      pcall(function()
        akl.Network.Invoke(g({15, 52, 63, 43, 47, 51, 42, 122, 10, 63, 46}, 90), akr)
      end)
      task.wait(0.1)
    end
  end
  local aks = 0
  for akt = 1, #akn, 50 do
    local aku = {}
    for akv = akt, math.min((akt + 49), #akn) do
      table.insert(aku, akn[akv])
    end
    local akw, akx
    pcall(function()
      akw, akx = akl.Network.Invoke(g({30, 63, 54, 63, 46, 63, 122, 9, 63, 44, 63, 40, 59, 54, 122, 10, 63, 46, 41}, 90), aku)
    end)
    if (((7 * 7) == 49) and akw) then
      aks += #aku
    else
      local aky = tostring((akx or g({62, 63, 54, 63, 46, 63, 122, 60, 59, 51, 54, 63, 62}, 90)))
      if (((1 + 1) == 2) and string.find(aky, g({52, 53, 46, 122, 60, 53, 47, 52, 62}, 90))) then
        aks += #aku
      else
        return aks, aky
      end
    end
    if (((15 * 15) == 225) and ((akt + 49) < #akn)) then
      task.wait(0.4)
    end
  end
  return aks, nil
end
task.spawn(function()
  while (((100 % 7) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local akz = k.Library
  if (((12 * 12) == 144) and not akz) then
    return
  end
  while (((3 ^ 2) == 9) and (k.Gen == o)) do
    if (((7 * 7) == 49) and (((((l.AutoDeleteExclusives or l.AutoDeleteFilter) or ajo())) and not n.DeleteBusy) and (#n.DeleteQueue > 0))) then
      n.DeleteBusy = true
      local ala = n.DeleteQueue
      n.DeleteQueue = {}
      local alb, alc
      pcall(function()
        alb, alc = akz.Network.Invoke(g({30, 63, 54, 63, 46, 63, 122, 9, 63, 44, 63, 40, 59, 54, 122, 10, 63, 46, 41}, 90), ala)
      end)
      if (((1 + 1) == 2) and alb) then
        m.Deleted += #ala
      else
        local ald = tostring((alc or g({62, 63, 54, 63, 46, 63, 122, 60, 59, 51, 54, 63, 62}, 90)))
        if (((15 * 15) == 225) and string.find(ald, g({52, 53, 46, 122, 60, 53, 47, 52, 62}, 90))) then
          m.Deleted += #ala
        else
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({19, 52, 41, 46, 59, 52, 46, 122, 62, 63, 54, 63, 46, 63, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. ald), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
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
  local ale = k.Library
  if (((12 * 12) == 144) and not ale) then
    return
  end
  local alf = nil
  while (((3 ^ 2) == 9) and ((k.Gen == o) and not alf)) do
    local alg, alh = pcall(function()
      return ale.Signal.Fired(g({27, 62, 62, 63, 62, 122, 25, 54, 51, 63, 52, 46, 122, 10, 63, 46}, 90))
    end)
    if (((7 * 7) == 49) and (alg and alh)) then
      alf = alh:Connect(function(ali)
        if (((1 + 1) == 2) and (type(ali) ~= g({41, 46, 40, 51, 52, 61}, 90))) then
          return
        end
        local alj = nil
        pcall(function()
          local alk = ale.Save.Get()
          if (((15 * 15) == 225) and alk) then
            for all, alm in pairs((alk.Pets or {})) do
              if (((100 % 7) == 2) and (tostring(alm.uid) == ali)) then
                alj = alm
                break
              end
            end
          end
        end)
        if (((12 * 12) == 144) and (type(alj) ~= g({46, 59, 56, 54, 63}, 90))) then
          return
        end
        local aln = ale.Directory.Pets[tostring(alj.id)]
        if (((3 ^ 2) == 9) and (aln and aln.huge)) then
          n.BlockingHuges[tostring(alj.uid)] = true
          if (((7 * 7) == 49) and l.AutoTradeHuges) then
            n.ExclusivePaused = true
          end
        end
        if (((1 + 1) == 2) and ((((l.AutoDeleteExclusives or l.AutoDeleteFilter) or ajo())) and akh(ale, alj))) then
          table.insert(n.DeleteQueue, tostring(alj.uid))
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
  if (((100 % 7) == 2) and alf) then
    pcall(function()
      alf:Disconnect()
    end)
  end
end)
task.spawn(function()
  while (((12 * 12) == 144) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local alo = k.Library
  if (((3 ^ 2) == 9) and not alo) then
    return
  end
  while (((7 * 7) == 49) and (k.Gen == o)) do
    if (((1 + 1) == 2) and ((((l.AutoDeleteExclusives or l.AutoDeleteFilter) or ajo())) and not n.DeleteScanning)) then
      n.DeleteScanning = true
      local alp, alq = k._sweepAutoDelete()
      if (((15 * 15) == 225) and (alp and (alp > 0))) then
        m.Deleted += alp
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({27, 47, 46, 53, 119, 62, 63, 54, 63, 46, 63, 62, 122}, 90) .. (alp .. (g({122, 42, 63, 46}, 90) .. ((((alp == 1) and "") or g({41}, 90)))))), g({46, 40, 59, 41, 50, 119, 104}, 90))
      elseif (((100 % 7) == 2) and alq) then
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({27, 47, 46, 53, 119, 62, 63, 54, 63, 46, 63, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. alq), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      end
      n.DeleteScanning = false
      task.wait(2)
    else
      task.wait(0.5)
    end
  end
end)
k._giftOpenStep = function(alr, als)
  alr = (alr or k.Library)
  if (((12 * 12) == 144) and not alr) then
    return g({52, 53, 122, 54, 51, 56, 40, 59, 40, 35}, 90)
  end
  local alt = l.GiftKey
  if (((3 ^ 2) == 9) and not alt) then
    n.GiftNote = g({52, 53, 122, 61, 51, 60, 46, 122, 42, 51, 57, 49, 63, 62}, 90)
    return g({52, 53, 122, 49, 63, 35}, 90)
  end
  n.GiftTrashIds = aiw(alr, alt)
  local alu, alv = ajf(alr, alt)
  if (((7 * 7) == 49) and (#alu == 0)) then
    n.GiftNote = g({52, 53, 122, 61, 51, 60, 46, 41, 122, 53, 60, 122, 46, 50, 51, 41, 122, 46, 35, 42, 63, 122, 46, 53, 122, 53, 42, 63, 52}, 90)
    return g({63, 55, 42, 46, 35}, 90)
  end
  local alw = #alu
  local alx = alw
  als = (tonumber(als) or 0)
  if (((1 + 1) == 2) and ((als > 0) and (als < alx))) then
    alx = als
  end
  local aly, alz, ama = 1, 0, nil
  local amb = (((type(alr.Shared.ExclusiveEggOpenAmounts) == g({46, 59, 56, 54, 63}, 90)) and alr.Shared.ExclusiveEggOpenAmounts) or {1, 3})
  while (((15 * 15) == 225) and ((aly <= alx) and (((l.AutoOpenGifts == true) or (n.GiftDeleteArmed == true))))) do
    local amc = ((alx - aly) + 1)
    local amd = 1
    for ame, amf in ipairs(amb) do
      if (((100 % 7) == 2) and ((tonumber(amf) and (tonumber(amf) <= amc)) and (tonumber(amf) >= amd))) then
        amd = tonumber(amf)
      end
    end
    local amg, amh = pcall(function()
      alr.Network.Invoke(g({18, 59, 46, 57, 50, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 31, 61, 61}, 90), alu[aly], amd)
    end)
    if (((12 * 12) == 144) and amg) then
      alz += amd
    else
      ama = tostring((amh or g({53, 42, 63, 52, 122, 60, 59, 51, 54, 63, 62}, 90)))
      break
    end
    aly += amd
    task.wait(0.03)
  end
  if (((3 ^ 2) == 9) and ama) then
    n.GiftNote = (g({53, 42, 63, 52, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. ama)
    return g({63, 40, 40}, 90)
  end
  if (((7 * 7) == 49) and (alx < alw)) then
    n.GiftNote = string.format(g({53, 42, 63, 52, 63, 62, 122, 127, 62, 122, 53, 60, 122, 127, 62, 122, 50, 63, 54, 62}, 90), alz, alw)
  else
    n.GiftNote = string.format(g({53, 42, 63, 52, 63, 62, 122, 127, 62}, 90), alz)
  end
  return g({40, 59, 52}, 90)
end
task.spawn(function()
  while (((1 + 1) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local ami = k.Library
  if (((15 * 15) == 225) and not ami) then
    return
  end
  while (((100 % 7) == 2) and (k.Gen == o)) do
    if (((12 * 12) == 144) and (((l.AutoOpenGifts and l.GiftKey) and not l.GiftBatchEnabled) and not n.GiftBusy)) then
      n.GiftBusy = true
      local amj = ajf(ami, l.GiftKey)
      local amk = #amj
      local aml = g({51, 62, 54, 63}, 90)
      pcall(function()
        aml = k._giftOpenStep(ami)
      end)
      n.GiftBusy = false
      if (((3 ^ 2) == 9) and (aml == g({63, 40, 40}, 90))) then
        if (((7 * 7) == 49) and not n.GiftErrShown) then
          n.GiftErrShown = true
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({29, 51, 60, 46, 122, 53, 42, 63, 52, 96, 122}, 90) .. ((n.GiftNote or g({60, 59, 51, 54, 63, 62}, 90)))), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
        end
        task.wait(2)
      elseif (((1 + 1) == 2) and (aml == g({40, 59, 52}, 90))) then
        n.GiftErrShown = false
        task.wait(0.15)
        local amm = #ajf(ami, l.GiftKey)
        if (((15 * 15) == 225) and (amk > amm)) then
          m.GiftsOpened += ((amk - amm))
        end
        task.wait(((((amk > amm)) and 0.05) or 0.6))
      else
        task.wait(0.5)
      end
    else
      task.wait(0.4)
    end
  end
end)
k._giftBatchRun = function(amn, amo)
  amn = (amn or k.Library)
  if (((100 % 7) == 2) and not amn) then
    return g({52, 53, 122, 54, 51, 56, 40, 59, 40, 35}, 90)
  end
  if (((12 * 12) == 144) and not l.GiftKey) then
    n.GiftBatchNote = g({52, 53, 122, 61, 51, 60, 46, 122, 42, 51, 57, 49, 63, 62}, 90)
    return g({52, 53, 122, 49, 63, 35}, 90)
  end
  if (((3 ^ 2) == 9) and n.GiftBusy) then
    return g({56, 47, 41, 35}, 90)
  end
  amo = math.max(1, math.floor(((tonumber(amo) or tonumber(l.GiftBatchCount)) or 25)))
  n.GiftBusy = true
  n.GiftDeleteArmed = true
  local amp = 0
  pcall(function()
    amp = #ajf(amn, l.GiftKey)
  end)
  local amq = g({51, 62, 54, 63}, 90)
  pcall(function()
    amq = k._giftOpenStep(amn, amo)
  end)
  task.wait(0.35)
  local amr = amp
  pcall(function()
    amr = #ajf(amn, l.GiftKey)
  end)
  local ams = math.max(0, (amp - amr))
  if (((7 * 7) == 49) and (ams > 0)) then
    m.GiftsOpened += ams
  end
  n.GiftDeleteArmed = false
  n.GiftBusy = false
  n.GiftBatchRuns += 1
  n.GiftBatchLastAt = os.clock()
  if (((1 + 1) == 2) and (amq == g({63, 40, 40}, 90))) then
    n.GiftBatchNote = (n.GiftNote or g({53, 42, 63, 52, 122, 60, 59, 51, 54, 63, 62}, 90))
  elseif (((15 * 15) == 225) and (amp == 0)) then
    n.GiftBatchNote = g({52, 53, 46, 50, 51, 52, 61, 122, 50, 63, 54, 62, 122, 46, 53, 122, 53, 42, 63, 52}, 90)
  else
    n.GiftBatchNote = string.format(g({53, 42, 63, 52, 63, 62, 122, 127, 62, 118, 122, 127, 62, 122, 54, 63, 60, 46}, 90), ams, amr)
  end
  return amq
end
task.spawn(function()
  while (((100 % 7) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local amt = k.Library
  if (((12 * 12) == 144) and not amt) then
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
      local amu = math.clamp((tonumber(l.GiftBatchMinutes) or 15), 5, 60)
      local amv = os.clock()
      if (((15 * 15) == 225) and ((n.GiftBatchNextAt <= 0) or (n.GiftBatchMinsUsed ~= amu))) then
        local amw = (n.GiftBatchLastAt or 0)
        n.GiftBatchNextAt = ((((amw > 0)) and ((amw + (amu * 60)))) or amv)
        n.GiftBatchMinsUsed = amu
      end
      if (((100 % 7) == 2) and (amv >= n.GiftBatchNextAt)) then
        local amx = 0
        pcall(function()
          amx = #ajf(amt, l.GiftKey)
        end)
        if (((12 * 12) == 144) and (amx > 0)) then
          pcall(function()
            k._giftBatchRun(amt, l.GiftBatchCount)
          end)
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({29, 51, 60, 46, 122, 56, 59, 46, 57, 50, 96, 122}, 90) .. ((n.GiftBatchNote or g({40, 59, 52}, 90)))), g({61, 51, 60, 46}, 90))
          n.GiftBatchNextAt = (os.clock() + (amu * 60))
        else
          n.GiftBatchNote = g({45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122, 61, 51, 60, 46, 41}, 90)
          n.GiftBatchNextAt = (amv + 20)
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
  local amy = k.Library
  if (((7 * 7) == 49) and not amy) then
    return
  end
  local amz = false
  while (((1 + 1) == 2) and ((k.Gen == o) and not amz)) do
    local ana, anb = pcall(function()
      return amy.Network.Fired(g({24, 40, 51, 46, 51, 41, 50, 122, 19, 52, 51, 46, 122, 14, 40, 59, 62, 63}, 90))
    end)
    local anc, ane = pcall(function()
      return amy.Network.Fired(g({14, 40, 59, 62, 63, 122, 10, 40, 53, 57, 63, 41, 41, 63, 62}, 90))
    end)
    local anf, ang = pcall(function()
      return amy.Network.Fired(g({14, 40, 59, 62, 63, 122, 25, 59, 52, 57, 63, 54, 54, 63, 62}, 90))
    end)
    local anh, ani = pcall(function()
      return amy.Network.Fired(g({14, 40, 59, 62, 63, 122, 31, 40, 40, 53, 40, 63, 62}, 90))
    end)
    if (((15 * 15) == 225) and (((ana and anc) and anf) and anh)) then
      anb:Connect(function(anj)
        n.TradeId = anj
        n.TradeResult = nil
      end)
      ane:Connect(function(ank, anl)
        n.TradeResult = ((ank and g({62, 53, 52, 63}, 90)) or ((g({60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring((anl or "")))))
      end)
      ang:Connect(function(anm)
        n.TradeResult = g({57, 59, 52, 57, 63, 54, 54, 63, 62}, 90)
      end)
      ani:Connect(function()
        n.TradeResult = g({63, 40, 40, 53, 40, 63, 62}, 90)
      end)
      amz = true
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
  local ann = k.Library
  if (((12 * 12) == 144) and not ann) then
    return
  end
  local ano = 0
  while (((3 ^ 2) == 9) and (k.Gen == o)) do
    local anp = (next(n.BlockingHuges) ~= nil)
    if (((7 * 7) == 49) and ((((l.AutoTradeHuges and anp) and not n.TradeBusy) and (tostring((l.TradeTarget or "")) ~= "")) and (os.clock() >= ano))) then
      n.TradeBusy = true
      n.TradeStatus = g({41, 46, 59, 40, 46, 51, 52, 61}, 90)
      local anq = ann.Save.Get()
      local anr = {}
      if (((1 + 1) == 2) and anq) then
        for ans, ant in pairs((anq.Pets or {})) do
          anr[tostring(ant.uid)] = true
        end
      end
      local anu = {}
      for anv in pairs(n.BlockingHuges) do
        if (((15 * 15) == 225) and anr[anv]) then
          table.insert(anu, anv)
        end
      end
      if (((100 % 7) == 2) and (#anu == 0)) then
        n.TradeStatus = g({51, 62, 54, 63}, 90)
        n.BlockingHuges = {}
        n.ExclusivePaused = false
      else
        local anw = nil
        local anx = tostring(l.TradeTarget):lower()
        for any, anz in ipairs(Players:GetPlayers()) do
          if (((12 * 12) == 144) and ((anz.Name:lower() == anx) or (anz.DisplayName:lower() == anx))) then
            anw = anz
            break
          end
        end
        if (((3 ^ 2) == 9) and not anw) then
          n.TradeStatus = g({46, 59, 40, 61, 63, 46, 122, 52, 53, 46, 122, 51, 52, 122, 41, 63, 40, 44, 63, 40}, 90)
        else
          n.TradeId = nil
          n.TradeResult = nil
          n.TradeStatus = (g({51, 52, 44, 51, 46, 51, 52, 61, 122}, 90) .. anw.Name)
          local aoa, aob
          pcall(function()
            aoa, aob = ann.Network.Invoke(g({9, 63, 52, 62, 122, 14, 40, 59, 62, 63, 122, 19, 52, 44, 51, 46, 63}, 90), anw.UserId)
          end)
          if (((7 * 7) == 49) and not aoa) then
            n.TradeStatus = (g({51, 52, 44, 51, 46, 63, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring((aob or "")))
            ano = (os.clock() + 10)
          else
            n.TradeStatus = (g({45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122}, 90) .. (anw.Name .. g({122, 46, 53, 122, 59, 57, 57, 63, 42, 46}, 90)))
            local aoc = os.clock()
            while (((1 + 1) == 2) and (((k.Gen == o) and not n.TradeId) and ((os.clock() - aoc) < 90))) do
              task.wait(0.25)
            end
            local aod = n.TradeId
            if (((15 * 15) == 225) and not aod) then
              n.TradeStatus = g({51, 52, 44, 51, 46, 63, 122, 46, 51, 55, 63, 62, 122, 53, 47, 46}, 90)
              ano = (os.clock() + 10)
            else
              task.wait(0.6)
              for aoe, aof in ipairs(anu) do
                n.TradeStatus = string.format(g({59, 62, 62, 51, 52, 61, 122, 50, 47, 61, 63, 122, 127, 62, 117, 127, 62}, 90), aoe, #anu)
                pcall(function()
                  ann.Network.Invoke(g({59, 41, 62, 60, 41, 48, 62, 50, 60}, 90), aod, aof)
                end)
                task.wait(0.35)
              end
              task.wait(0.3)
              n.TradeStatus = g({59, 57, 57, 63, 42, 46, 51, 52, 61, 122, 46, 40, 59, 62, 63}, 90)
              local aog
              pcall(function()
                aog = ann.Network.Invoke(g({53, 49, 51, 54, 51, 49, 63, 46, 50, 51, 41, 46, 40, 59, 62, 63}, 90), aod, 0)
              end)
              n.TradeStatus = (g({45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122}, 90) .. (anw.Name .. g({122, 46, 53, 122, 57, 53, 52, 60, 51, 40, 55}, 90)))
              local aoh = os.clock()
              while (((100 % 7) == 2) and (((k.Gen == o) and not n.TradeResult) and ((os.clock() - aoh) < 120))) do
                task.wait(0.25)
              end
              local aoi = (n.TradeResult or g({46, 51, 55, 63, 53, 47, 46}, 90))
              if (((12 * 12) == 144) and (aoi == g({62, 53, 52, 63}, 90))) then
                n.TradesDone += 1
                n.TradeStatus = g({46, 40, 59, 62, 63, 122, 57, 53, 55, 42, 54, 63, 46, 63}, 90)
                ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({18, 47, 61, 63, 122, 46, 40, 59, 62, 63, 62, 122, 46, 53, 122}, 90) .. (anw.Name .. g({123}, 90))), g({57, 50, 63, 57, 49}, 90))
              else
                n.TradeStatus = (g({46, 40, 59, 62, 63, 122}, 90) .. tostring(aoi))
                ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({14, 40, 59, 62, 63, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring(aoi)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
                pcall(function()
                  ann.Network.Invoke(g({52, 53, 122, 51, 62, 122, 53, 52, 46, 122, 54, 51, 49, 63, 122, 46, 50, 51, 41, 122, 46, 40, 59, 62, 63}, 90), aod)
                end)
                ano = (os.clock() + 10)
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
      if (((7 * 7) == 49) and not anp) then
        n.TradeStatus = g({51, 62, 54, 63}, 90)
      end
      task.wait(1)
    end
  end
end)
local aoj, aok, aol
local aom, aon, aoo, aop, aoq, aor, aos
local aot, aou, aov, aow
do
  aoj = game:GetService(g({14, 45, 63, 63, 52, 9, 63, 40, 44, 51, 57, 63}, 90))
  local aox = game:GetService(g({15, 41, 63, 40, 19, 52, 42, 47, 46, 9, 63, 40, 44, 51, 57, 63}, 90))
  aok = game:GetService(g({8, 47, 52, 9, 63, 40, 44, 51, 57, 63}, 90))
  aol = game:GetService(g({22, 51, 61, 50, 46, 51, 52, 61}, 90))
  aom = function(aoy)
    aoy = string.gsub(tostring((aoy or "")), g({121}, 90), "")
    return Color3.fromRGB((tonumber(string.sub(aoy, 1, 2), 16) or 139), (tonumber(string.sub(aoy, 3, 4), 16) or 92), (tonumber(string.sub(aoy, 5, 6), 16) or 246))
  end
  local function aoz(apa)
    return string.format(g({127, 106, 104, 2, 127, 106, 104, 2, 127, 106, 104, 2}, 90), math.floor(((apa.R * 255) + 0.5)), math.floor(((apa.G * 255) + 0.5)), math.floor(((apa.B * 255) + 0.5)))
  end
  aon = {Conns = {}, Registry = {}, Themed = {}, FPS = 60, Ping = 0, T0 = os.clock()}
  k.UI = aon
  aoo = {Bg = Color3.fromRGB(11, 11, 19), Bg2 = Color3.fromRGB(27, 27, 52), Surface = Color3.fromRGB(25, 25, 40), SurfaceAlt = Color3.fromRGB(31, 31, 49), Element = Color3.fromRGB(38, 38, 60), ElementHover = Color3.fromRGB(51, 51, 79), Stroke = Color3.fromRGB(70, 70, 108), Text = Color3.fromRGB(248, 248, 255), SubText = Color3.fromRGB(166, 166, 196), Accent = aom((l.Accent1 or g({98, 24, 111, 25, 28, 108}, 90))), Accent2 = aom((l.Accent2 or g({104, 104, 30, 105, 31, 31}, 90))), Green = Color3.fromRGB(52, 211, 153), Red = Color3.fromRGB(248, 113, 113), Gray = Color3.fromRGB(90, 90, 124)}
  function aon.markAccent(apb, apc, apd)
    if (((1 + 1) == 2) and not apb) then
      return nil
    end
    table.insert(aon.Themed, {obj = apb, prop = apc, which = apd})
    return apb
  end
  function aon.SetAccent(ape, apf)
    aoo.Accent, aoo.Accent2 = ape, apf
    l.Accent1, l.Accent2 = aoz(ape), aoz(apf)
    for apg, aph in ipairs(aon.Themed) do
      pcall(function()
        if (((15 * 15) == 225) and (aph.prop == g({61, 40, 59, 62}, 90))) then
          aph.obj.Color = ColorSequence.new(aoo.Accent, aoo.Accent2)
        elseif (((100 % 7) == 2) and (aph.prop == g({61, 40, 59, 62, 105}, 90))) then
          aph.obj.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, aoo.Accent), ColorSequenceKeypoint.new(0.5, aoo.Accent2), ColorSequenceKeypoint.new(1, aoo.Accent)})
        else
          aph.obj[aph.prop] = ((((aph.which == 2)) and aoo.Accent2) or aoo.Accent)
        end
      end)
    end
    if (((12 * 12) == 144) and aon._afterAccent) then
      pcall(aon._afterAccent)
    end
  end
  aop = function(api, apj)
    local apk = api:Connect(apj)
    table.insert(aon.Conns, apk)
    return apk
  end
  local function apl()
    local apm, apn = pcall(function()
      return (gethui and gethui())
    end)
    if (((3 ^ 2) == 9) and (apm and apn)) then
      return apn
    end
    local apo = game:GetService(g({25, 53, 40, 63, 29, 47, 51}, 90))
    if (((7 * 7) == 49) and (apo and pcall(function()
      return apo:GetChildren()
    end))) then
      return apo
    end
    return Players.LocalPlayer:WaitForChild(g({10, 54, 59, 35, 63, 40, 29, 47, 51}, 90))
  end
  aoq = function(app, apq, apr)
    local aps = Instance.new(app)
    for apt, apu in pairs(apq) do
      if (((1 + 1) == 2) and (apt ~= g({10, 59, 40, 63, 52, 46}, 90))) then
        aps[apt] = apu
      end
    end
    aps.Parent = (apr or apq.Parent)
    return aps
  end
  aor = function(apv, apw)
    return aoq(g({15, 19, 25, 53, 40, 52, 63, 40}, 90), {CornerRadius = UDim.new(0, apv), Parent = apw})
  end
  aos = function(apx, apy, apz, aqa)
    return aoq(g({15, 19, 9, 46, 40, 53, 49, 63}, 90), {Color = apx, Transparency = (apy or 0), Thickness = (apz or 1), ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = aqa})
  end
  local function aqb(aqc, aqd, aqe, aqf, aqg)
    return aoq(g({15, 19, 10, 59, 62, 62, 51, 52, 61}, 90), {PaddingTop = UDim.new(0, (aqd or 0)), PaddingRight = UDim.new(0, (aqe or 0)), PaddingBottom = UDim.new(0, (aqf or 0)), PaddingLeft = UDim.new(0, (aqg or 0)), Parent = aqc})
  end
  local function aqh(aqi, aqj, aqk, aql, aqm)
    return aoq(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(aqj, aqk), Rotation = (aql or 0), Transparency = (aqm or NumberSequence.new(0)), Parent = aqi})
  end
  local aqn = g({40, 56, 34, 59, 41, 41, 63, 46, 51, 62, 96, 117, 117, 108, 106, 107, 110, 104, 108, 107, 99, 99, 105}, 90)
  local function aqo(aqp, aqq, aqr, aqs, aqt)
    return aoq(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90), {Name = g({9, 50, 59, 62, 53, 45}, 90), BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.new(1, (aqq * 2), 1, (aqq * 2)), Image = aqn, ImageColor3 = (aqs or Color3.new(0, 0, 0)), ImageTransparency = (aqr or 0.45), ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(49, 49, 450, 450), ZIndex = (aqt or 0), Parent = aqp})
  end
  local function aqu(aqv, aqw, aqx, aqy)
    local aqz = {}
    local ara = aoq(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(aqv, aqv), BackgroundColor3 = aqw, BackgroundTransparency = aqx, BorderSizePixel = 0, ZIndex = 0, Parent = aqy})
    aor(999, ara)
    table.insert(aqz, ara)
    for arb, arc in ipairs({0.74, 0.5, 0.3}) do
      local ard = aoq(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(arc, arc), BackgroundColor3 = aqw, BackgroundTransparency = aqx, BorderSizePixel = 0, ZIndex = 0, Parent = ara})
      aor(999, ard)
      table.insert(aqz, ard)
    end
    return {root = ara, layers = aqz}
  end
  local are = {t = 0, jobs = {}}
  local function arf(arg)
    table.insert(are.jobs, arg)
    return arg
  end
  aop(aok.RenderStepped, function(arh)
    if (((15 * 15) == 225) and (not n.UIVisible or (l.UIMotion == false))) then
      return
    end
    local ari = math.clamp((((tonumber(l.UIAnimSpeed) or 100)) / 100), 0.1, 3)
    are.t += (arh * ari)
    local arj = are.jobs
    for ark = 1, #arj do
      pcall(arj[ark], are.t, arh)
    end
  end)
  do
    local arl, arm = 0, 0
    aop(aok.Heartbeat, function(arn)
      arl += 1
      arm += arn
      if (((100 % 7) == 2) and (arm >= 0.5)) then
        aon.FPS = math.floor(((arl / arm) + 0.5))
        arl, arm = 0, 0
        pcall(function()
          aon.Ping = math.floor(((Players.LocalPlayer:GetNetworkPing() * 1000) + 0.5))
        end)
        if (((12 * 12) == 144) and aon._onStats) then
          pcall(aon._onStats, aon.FPS, aon.Ping)
        end
      end
    end)
  end
  local function aro(arp, arq)
    aop(arp.InputBegan, function(arr)
      if (((3 ^ 2) == 9) and ((arr.UserInputType ~= Enum.UserInputType.MouseButton1) and (arr.UserInputType ~= Enum.UserInputType.Touch))) then
        return
      end
      pcall(function()
        local ars = arp.AbsolutePosition
        local art = aoq(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset((arr.Position.X - ars.X), (arr.Position.Y - ars.Y)), Size = UDim2.fromOffset(8, 8), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.8, BorderSizePixel = 0, ZIndex = (arp.ZIndex + 20), Parent = arp})
        aor(999, art)
        local aru = ((math.max(arp.AbsoluteSize.X, arp.AbsoluteSize.Y) * (((arq and 2.2) or 2.8))) + 24)
        aoj:Create(art, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.fromOffset(aru, aru), BackgroundTransparency = 1}):Play()
        task.delay(0.55, function()
          art:Destroy()
        end)
      end)
    end)
  end
  local arv = aoq(g({9, 57, 40, 63, 63, 52, 29, 47, 51}, 90), {Name = g({25, 53, 42, 63, 18, 47, 56, 29, 47, 51}, 90), ResetOnSpawn = false, IgnoreGuiInset = true, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 1000, Parent = apl()})
  k.ScreenGui = arv
  local arw = aoq(g({28, 40, 59, 55, 63}, 90), {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -16, 0, 16), Size = UDim2.fromOffset(320, 620), ZIndex = 200, Parent = arv})
  aoq(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90), {Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder, HorizontalAlignment = Enum.HorizontalAlignment.Right, Parent = arw})
  local arx = {check = {g = g({10057}, 90), c = aoo.Green}, [g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90)] = {g = g({123}, 90), c = aoo.Red}, clock = {g = g({9645}, 90), c = aoo.Accent2}, info = {g = g({51}, 90), c = aoo.Accent2}, paintbrush = {g = g({10108}, 90), c = aoo.Accent}}
  function aon.Notify(ary)
    pcall(function()
      local arz = (ary.Duration or 3)
      local asa = (ary.Content and (#tostring(ary.Content) > 46))
      local asb = aoq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(310, ((asa and 84) or 66)), BackgroundTransparency = 1, BorderSizePixel = 0, Parent = arw})
      local asc = aoq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromScale(1, 1), Position = UDim2.fromOffset(340, 0), BackgroundColor3 = aoo.Surface, BackgroundTransparency = 0.06, BorderSizePixel = 0, Parent = asb})
      aor(12, asc)
      aos(aoo.Stroke, 0.35, 1, asc)
      local asd = (arx[ary.Icon] or {g = g({10108}, 90), c = aoo.Accent})
      local ase = aoq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.new(0, 3, 1, -16), Position = UDim2.new(0, 6, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = asd.c, BorderSizePixel = 0, Parent = asc})
      aor(999, ase)
      local asf = aoq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(26, 26), Position = UDim2.new(0, 18, 0, 12), BackgroundColor3 = asd.c, BackgroundTransparency = 0.82, BorderSizePixel = 0, Parent = asc})
      aor(999, asf)
      aos(asd.c, 0.55, 1, asf)
      aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 13, TextColor3 = asd.c, Text = asd.g, Parent = asf})
      aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 54, 0, 12), Size = UDim2.new(1, -66, 0, 16), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 13, TextColor3 = aoo.Text, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring((ary.Title or "")), Parent = asc})
      if (((7 * 7) == 49) and ary.Content) then
        aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 54, 0, 29), Size = UDim2.new(1, -66, 0, ((asa and 40) or 22)), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 11.5, TextColor3 = aoo.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true, Text = tostring(ary.Content), Parent = asc})
      end
      local asg = aoq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.new(1, -28, 0, 2), Position = UDim2.new(0, 14, 1, -6), AnchorPoint = Vector2.new(0, 1), BackgroundColor3 = asd.c, BorderSizePixel = 0, BackgroundTransparency = 0.3, Parent = asc})
      aor(999, asg)
      aoj:Create(asg, TweenInfo.new(arz, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 0, 2)}):Play()
      aoj:Create(asc, TweenInfo.new(0.42, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(0, 0)}):Play()
      task.delay(arz, function()
        aoj:Create(asc, TweenInfo.new(0.26, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.fromOffset(340, 0)}):Play()
        task.delay(0.3, function()
          asb:Destroy()
        end)
      end)
    end)
  end
  while (((1 + 1) == 2) and not n.Ready) do
    task.wait(0.1)
  end
  local ash, asi = 720, 540
  local asj = aoq(g({28, 40, 59, 55, 63}, 90), {Name = g({25, 53, 42, 63, 13, 51, 52}, 90), AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(ash, asi), BackgroundTransparency = 1, Visible = false, Parent = arv})
  local ask = aoq(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = math.clamp((((tonumber(l.UIScale) or 100)) / 100), 0.7, 1.4), Parent = asj})
  local asl = aoq(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 1, Parent = asj})
  local asm = aqo(asj, 40, 0.52, Color3.new(0, 0, 0), 0)
  local asn = aqo(asj, 16, 0.86, aoo.Accent, 0)
  aon.markAccent(asn, g({19, 55, 59, 61, 63, 25, 53, 54, 53, 40, 105}, 90))
  local aso = aoq(g({28, 40, 59, 55, 63}, 90), {Name = g({8, 53, 53, 46}, 90), Size = UDim2.fromScale(1, 1), BackgroundColor3 = aoo.Bg, BorderSizePixel = 0, ClipsDescendants = true, ZIndex = 2, Parent = asj})
  aor(16, aso)
  local asp = aoq(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(aoo.Bg, aoo.Bg2), Rotation = 115, Parent = aso})
  local asq = aos(aoo.Stroke, 0.1, 1.5, aso)
  aon.markAccent(aoq(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, aoo.Accent), ColorSequenceKeypoint.new(0.5, aoo.Accent2), ColorSequenceKeypoint.new(1, aoo.Accent)}), Rotation = 35, Parent = asq}), g({61, 40, 59, 62, 105}, 90))
  local asr = aoq(g({28, 40, 59, 55, 63}, 90), {Name = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62}, 90), Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 0, Parent = aso})
  local ass = {{n = g({23, 51, 62, 52, 51, 61, 50, 46}, 90), a = g({106, 27, 106, 27, 107, 110}, 90), b = g({107, 27, 107, 27, 105, 98}, 90)}, {n = g({21, 56, 41, 51, 62, 51, 59, 52}, 90), a = g({106, 109, 106, 109, 106, 27}, 90), b = g({107, 27, 107, 27, 104, 106}, 90)}, {n = g({21, 57, 63, 59, 52}, 90), a = g({106, 111, 107, 105, 107, 28}, 90), b = g({106, 24, 104, 25, 110, 104}, 90)}, {n = g({10, 54, 47, 55}, 90), a = g({107, 104, 106, 27, 107, 25}, 90), b = g({104, 31, 107, 106, 110, 108}, 90)}, {n = g({28, 53, 40, 63, 41, 46}, 90), a = g({106, 108, 107, 111, 106, 28}, 90), b = g({106, 28, 104, 28, 104, 106}, 90)}, {n = g({31, 55, 56, 63, 40}, 90), a = g({107, 110, 106, 27, 106, 27}, 90), b = g({105, 25, 107, 111, 107, 104}, 90)}, {n = g({9, 54, 59, 46, 63}, 90), a = g({106, 31, 106, 31, 107, 110}, 90), b = g({104, 104, 104, 104, 104, 28}, 90)}, {n = g({27, 57, 57, 63, 52, 46}, 90), a = g({106, 27, 106, 27, 107, 110}, 90), b = g({107, 27, 107, 27, 105, 98}, 90)}}
  local ast = {g({27, 47, 40, 53, 40, 59}, 90), g({20, 63, 56, 47, 54, 59}, 90), g({13, 59, 44, 63, 41}, 90), g({9, 46, 59, 40, 60, 51, 63, 54, 62}, 90), g({29, 40, 59, 62, 51, 63, 52, 46}, 90), g({9, 53, 54, 51, 62}, 90)}
  aon.BgPresets, aon.BgStyles = {}, ast
  aon.BgSwatches = ass
  for asu, asv in ipairs(ass) do
    table.insert(aon.BgPresets, asv.n)
  end
  local function asw()
    local asx = tostring((l.UIBgPreset or g({23, 51, 62, 52, 51, 61, 50, 46}, 90)))
    if (((15 * 15) == 225) and (asx == g({27, 57, 57, 63, 52, 46}, 90))) then
      return aoo.Accent:Lerp(Color3.new(0, 0, 0), 0.9), aoo.Accent2:Lerp(Color3.new(0, 0, 0), 0.8)
    end
    for asy, asz in ipairs(ass) do
      if (((100 % 7) == 2) and (asz.n == asx)) then
        return aom(asz.a), aom(asz.b)
      end
    end
    return aom(g({106, 27, 106, 27, 107, 110}, 90)), aom(g({107, 27, 107, 27, 105, 98}, 90))
  end
  local function ata(atb)
    local atc = math.clamp((((tonumber(l.UIBgIntensity) or 100)) / 100), 0, 2)
    return math.clamp((1 - (((1 - atb)) * atc)), 0, 1)
  end
  local atd
  local ate = {}
  aon._afterAccent = function()
    for atf, atg in ipairs(ate) do
      pcall(atg)
    end
  end
  table.insert(ate, function()
    if (((12 * 12) == 144) and atd) then
      atd()
    end
  end)
  function aon.SetBackground(ath)
    l.UIBgPreset = tostring(ath)
    if (((3 ^ 2) == 9) and atd) then
      atd()
    end
  end
  function aon.SetBgStyle(ati)
    l.UIBgStyle = tostring(ati)
    if (((7 * 7) == 49) and atd) then
      atd()
    end
  end
  function aon.RefreshBackground()
    if (((1 + 1) == 2) and atd) then
      atd()
    end
  end
  function aon.SetUIScale(atj)
    l.UIScale = (tonumber(atj) or 100)
    ask.Scale = math.clamp((((tonumber(l.UIScale) or 100)) / 100), 0.7, 1.4)
  end
  local atk, atl = {}, nil
  local function atm(atn)
    table.insert(atk, atn)
    return atn
  end
  local function ato()
    for atp, atq in ipairs(atk) do
      pcall(function()
        atq:Destroy()
      end)
    end
    table.clear(atk)
    atl = nil
  end
  local function atr(ats, att)
    local atu = {aoo.Accent, aoo.Accent2, att:Lerp(Color3.fromRGB(255, 255, 255), 0.14)}
    local atv = {440, 370, 300}
    local atw = {}
    for atx = 1, 3 do
      local aty = aqu(atv[atx], atu[atx], ata(0.74), asr)
      atm(aty.root)
      atw[atx] = aty.root
    end
    atl = function(atz)
      for aua = 1, 3 do
        local aub = (aua * 1.7)
        atw[aua].Position = UDim2.fromScale((0.5 + (0.4 * math.sin(((atz * ((0.13 + (aua * 0.03)))) + aub)))), (0.5 + (0.42 * math.cos(((atz * ((0.1 + (aua * 0.024)))) + (aub * 1.4))))))
      end
    end
  end
  local function auc(aud, aue)
    local auf = atm(aoq(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1.8, 1.8), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0, ZIndex = 0, Parent = asr}))
    local aug = aoq(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(aoo.Accent, aoo.Accent2), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.4, 1), NumberSequenceKeypoint.new(0.5, ata(0.76)), NumberSequenceKeypoint.new(0.6, 1), NumberSequenceKeypoint.new(1, 1)}), Parent = auf})
    local auh = {}
    for aui = 1, 2 do
      local auj = aqu((((aui == 1) and 420) or 330), (((aui == 1) and aoo.Accent2) or aue:Lerp(Color3.fromRGB(255, 255, 255), 0.1)), ata(0.76), asr)
      atm(auj.root)
      auh[aui] = auj.root
    end
    atl = function(auk)
      aug.Rotation = (((auk * 16)) % 360)
      auh[1].Position = UDim2.fromScale((0.28 + (0.16 * math.sin((auk * 0.14)))), (0.3 + (0.16 * math.cos((auk * 0.11)))))
      auh[2].Position = UDim2.fromScale((0.74 + (0.16 * math.cos((auk * 0.12)))), (0.72 + (0.14 * math.sin((auk * 0.15)))))
    end
  end
  local function aul(aum, aun)
    local auo = {}
    for aup = 1, 3 do
      local auq = atm(aoq(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset((ash * 1.6), (220 + (aup * 70))), Position = UDim2.new(0.5, 0, 1, (70 + (aup * 34))), BackgroundColor3 = ((((aup == 2)) and aoo.Accent2) or aoo.Accent), BackgroundTransparency = ata((0.8 + (aup * 0.014))), BorderSizePixel = 0, ZIndex = 0, Parent = asr}))
      aor(999, auq)
      auo[aup] = auq
    end
    atl = function(aur)
      for aus = 1, 3 do
        local aut = ((aur * ((0.34 + (aus * 0.13)))) + aus)
        auo[aus].Position = UDim2.new(0.5, (math.sin(aut) * 70), 1, ((70 + (aus * 34)) + (math.sin((aut * 0.8)) * 30)))
        auo[aus].Rotation = (math.sin((aut * 0.5)) * 3)
      end
    end
  end
  local function auu(auv, auw)
    local aux = {}
    for auy = 1, 22 do
      local auz = atm(aoq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(((((auy % 5) == 0) and 3) or 2), ((((auy % 5) == 0) and 3) or 2)), BackgroundColor3 = (((((auy % 4) == 0)) and aoo.Accent2) or Color3.fromRGB(255, 255, 255)), BackgroundTransparency = ata(0.42), BorderSizePixel = 0, ZIndex = 0, Parent = asr}))
      aor(999, auz)
      aux[auy] = {f = auz, x = math.random(), y = math.random(), sp = (0.6 + (math.random() * 1.8)), ph = (math.random() * 6.283)}
    end
    local ava = aqu(380, aoo.Accent, ata(0.8), asr)
    atm(ava.root)
    ava.root.Position = UDim2.fromScale(0.72, 0.22)
    local tick = 0
    atl = function(avb, avc)
      tick += 1
      local avd = (((tick % 3) == 0))
      local ave = ata(0.38)
      for avf = 1, #aux do
        local avg = aux[avf]
        avg.y -= ((avg.sp * avc) * 0.02)
        if (((15 * 15) == 225) and (avg.y < -0.03)) then
          avg.y, avg.x = 1.03, math.random()
        end
        avg.f.Position = UDim2.fromScale(avg.x, avg.y)
        if (((100 % 7) == 2) and avd) then
          avg.f.BackgroundTransparency = math.clamp((ave + (0.35 * ((0.5 + (0.5 * math.sin(((avb * 2) + avg.ph))))))), 0, 1)
        end
      end
    end
  end
  local function avh(avi, avj)
    local avk = aqu(520, aoo.Accent, ata(0.78), asr)
    atm(avk.root)
    avk.root.Position = UDim2.fromScale(0.18, 0.12)
    local avl = aqu(420, aoo.Accent2, ata(0.8), asr)
    atm(avl.root)
    avl.root.Position = UDim2.fromScale(0.86, 0.9)
    atl = function(avm)
      asp.Rotation = (115 + (math.sin((avm * 0.22)) * 28))
    end
  end
  atd = function()
    local avn, avo = asw()
    aoo.Bg, aoo.Bg2 = avn, avo
    aso.BackgroundColor3 = avn
    asp.Color = ColorSequence.new(avn, avo)
    asp.Rotation = 115
    ato()
    local avp = tostring((l.UIBgStyle or g({27, 47, 40, 53, 40, 59}, 90)))
    if (((12 * 12) == 144) and (avp == g({20, 63, 56, 47, 54, 59}, 90))) then
      auc(avn, avo)
    elseif (((3 ^ 2) == 9) and (avp == g({13, 59, 44, 63, 41}, 90))) then
      aul(avn, avo)
    elseif (((7 * 7) == 49) and (avp == g({9, 46, 59, 40, 60, 51, 63, 54, 62}, 90))) then
      auu(avn, avo)
    elseif (((1 + 1) == 2) and (avp == g({29, 40, 59, 62, 51, 63, 52, 46}, 90))) then
      avh(avn, avo)
    elseif (((15 * 15) == 225) and (avp == g({9, 53, 54, 51, 62}, 90))) then
      atl = nil
    else
      atr(avn, avo)
    end
  end
  arf(function(avq, avr)
    if (((100 % 7) == 2) and atl) then
      atl(avq, avr)
    end
  end)
  atd()
  local avs = aoq(g({28, 40, 59, 55, 63}, 90), {Name = g({14, 53, 42, 56, 59, 40}, 90), Size = UDim2.new(1, 0, 0, 54), BackgroundTransparency = 1, ZIndex = 5, Parent = aso})
  local avt = aoq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.new(1, -28, 0, 1), Position = UDim2.new(0, 14, 0, 54), BackgroundColor3 = aoo.Stroke, BorderSizePixel = 0, ZIndex = 5, Parent = aso})
  aoq(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.25), NumberSequenceKeypoint.new(1, 1)}), Parent = avt})
  local avu = aoq(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 16, 0, 12), Size = UDim2.fromOffset(30, 30), BackgroundColor3 = aoo.Accent, BorderSizePixel = 0, ZIndex = 6, Parent = avs})
  aor(10, avu)
  aon.markAccent(avu, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
  aon.markAccent(aqh(avu, aoo.Accent, aoo.Accent2, 45), g({61, 40, 59, 62}, 90))
  aon.markAccent(aos(aoo.Accent, 0.5, 1, avu), g({25, 53, 54, 53, 40}, 90))
  aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamBlack, TextSize = 15, TextColor3 = Color3.fromRGB(255, 255, 255), Text = g({25}, 90), ZIndex = 7, Parent = avu})
  local avv = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Name = g({22, 53, 61, 53}, 90), Position = UDim2.new(0, 54, 0, 11), Size = UDim2.fromOffset(180, 20), BackgroundTransparency = 1, Font = Enum.Font.GothamBlack, TextSize = 17, TextColor3 = aoo.Text, TextXAlignment = Enum.TextXAlignment.Left, RichText = true, Text = g({25, 21, 10, 31, 122, 18, 15, 24}, 90), ZIndex = 6, Parent = avs})
  local function avw()
    avv.Text = string.format(g({102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 121, 127, 41, 120, 100, 25, 21, 10, 31, 102, 117, 60, 53, 52, 46, 100, 122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 121, 127, 41, 120, 100, 18, 15, 24, 102, 117, 60, 53, 52, 46, 100}, 90), aoz(aoo.Accent), aoz(aoo.Accent2))
  end
  avw()
  table.insert(ate, avw)
  local avx = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Name = g({9, 47, 56, 46, 51, 46, 54, 63}, 90), Position = UDim2.new(0, 55, 0, 31), Size = UDim2.new(1, -320, 0, 12), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 10.5, TextColor3 = aoo.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = g({41, 46, 59, 40, 46, 51, 52, 61, 116, 116, 116}, 90), ZIndex = 6, Parent = avs})
  local avy = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 158, 0, 13), Size = UDim2.fromOffset(40, 17), BackgroundColor3 = aoo.Accent, BackgroundTransparency = 0.78, Font = Enum.Font.GothamBold, TextSize = 10, TextColor3 = aoo.Text, Text = g({44, 108, 116, 106}, 90), ZIndex = 6, Parent = avs})
  aor(6, avy)
  aon.markAccent(avy, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
  aon.markAccent(aos(aoo.Accent, 0.6, 1, avy), g({25, 53, 54, 53, 40}, 90))
  local avz = aoq(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -114, 0.5, 0), Size = UDim2.fromOffset(104, 26), BackgroundColor3 = aoo.Element, BackgroundTransparency = 0.35, BorderSizePixel = 0, ZIndex = 6, Parent = avs})
  aor(8, avz)
  aos(aoo.Stroke, 0.55, 1, avz)
  local awa = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 11, TextColor3 = aoo.SubText, RichText = true, Text = g({119, 119, 122, 60, 42, 41}, 90), ZIndex = 7, Parent = avz})
  aon._onStats = function(awb, awc)
    local awd = (((((awb >= 45) and g({105, 110, 30, 105, 99, 99}, 90))) or (((awb >= 25) and g({28, 24, 24, 28, 104, 110}, 90)))) or g({28, 98, 109, 107, 109, 107}, 90))
    awa.Text = string.format(g({102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 121, 127, 41, 120, 100, 127, 62, 102, 117, 60, 53, 52, 46, 100, 122, 60, 42, 41, 122, 122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 121, 110, 27, 110, 27, 108, 98, 120, 100, 38, 102, 117, 60, 53, 52, 46, 100, 122, 122, 127, 62, 122, 55, 41}, 90), awd, awb, awc)
  end
  local function awe(awf, awg, awh, awi)
    local awj = aoq(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Position = UDim2.new(1, awf, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromOffset(28, 28), BackgroundColor3 = aoo.Element, BackgroundTransparency = 0.25, Font = Enum.Font.GothamBold, TextSize = 14, TextColor3 = aoo.SubText, Text = awg, AutoButtonColor = false, ZIndex = 6, Parent = avs})
    aor(8, awj)
    aos(aoo.Stroke, 0.55, 1, awj)
    aop(awj.MouseEnter, function()
      aoj:Create(awj, TweenInfo.new(0.14), {BackgroundColor3 = (awh or aoo.ElementHover), BackgroundTransparency = 0, TextColor3 = (awi or aoo.Text)}):Play()
    end)
    aop(awj.MouseLeave, function()
      aoj:Create(awj, TweenInfo.new(0.14), {BackgroundColor3 = aoo.Element, BackgroundTransparency = 0.25, TextColor3 = aoo.SubText}):Play()
    end)
    aro(awj)
    return awj
  end
  local awk = nil
  local function awl(awm)
    if (((12 * 12) == 144) and (awm and (l.UIBlur == true))) then
      if (((3 ^ 2) == 9) and not awk) then
        awk = aoq(g({24, 54, 47, 40, 31, 60, 60, 63, 57, 46}, 90), {Name = g({25, 53, 42, 63, 18, 47, 56, 24, 54, 47, 40}, 90), Size = 0, Parent = aol})
      end
      aoj:Create(awk, TweenInfo.new(0.3), {Size = 14}):Play()
    elseif (((7 * 7) == 49) and awk) then
      local awn = aoj:Create(awk, TweenInfo.new(0.25), {Size = 0})
      awn.Completed:Connect(function()
        if (((1 + 1) == 2) and (awk and ((not n.UIVisible or (l.UIBlur ~= true))))) then
          awk:Destroy()
          awk = nil
        end
      end)
      awn:Play()
    end
  end
  aon.SetBlur = function(awo)
    l.UIBlur = (awo == true)
    awl((n.UIVisible and (awo == true)))
  end
  local awp = TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
  local awq = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
  aot = function(awr)
    n.UIVisible = awr
    if (((15 * 15) == 225) and awr) then
      asj.Visible = true
      asl.Scale = 0.9
      asm.ImageTransparency = 1
      asn.ImageTransparency = 1
      aoj:Create(asl, awp, {Scale = 1}):Play()
      aoj:Create(asm, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.52}):Play()
      aoj:Create(asn, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.86}):Play()
      awl(true)
    else
      local aws = aoj:Create(asl, awq, {Scale = 0.92})
      aws.Completed:Connect(function()
        if (((100 % 7) == 2) and not n.UIVisible) then
          asj.Visible = false
        end
      end)
      aws:Play()
      aoj:Create(asm, awq, {ImageTransparency = 1}):Play()
      aoj:Create(asn, awq, {ImageTransparency = 1}):Play()
      awl(false)
    end
    if (((12 * 12) == 144) and k._onUIVisible) then
      k._onUIVisible(awr)
    end
  end
  k._setUIVisible = aot
  local awt = awe(-76, g({8265}, 90))
  awt.Activated:Connect(function()
    aot(false)
  end)
  local awu = awe(-42, g({10063}, 90), Color3.fromRGB(74, 32, 46), Color3.fromRGB(255, 190, 200))
  awu.Activated:Connect(function()
    aot(false)
  end)
  do
    local awv, aww, awx = false, nil, nil
    aop(avs.InputBegan, function(awy)
      if (((3 ^ 2) == 9) and ((awy.UserInputType == Enum.UserInputType.MouseButton1) or (awy.UserInputType == Enum.UserInputType.Touch))) then
        awv, aww, awx = true, awy.Position, asj.Position
      end
    end)
    aop(aox.InputChanged, function(awz)
      if (((7 * 7) == 49) and (awv and (((awz.UserInputType == Enum.UserInputType.MouseMovement) or (awz.UserInputType == Enum.UserInputType.Touch))))) then
        local axa = (awz.Position - aww)
        local axb = arv.AbsoluteSize
        local axc = (asj.AbsoluteSize / 2)
        local axd = math.clamp((awx.X.Offset + axa.X), (((-axb.X * 0.5) + axc.X) - 60), (((axb.X * 0.5) - axc.X) + 60))
        local axe = math.clamp((awx.Y.Offset + axa.Y), (((-axb.Y * 0.5) + axc.Y) - 10), (((axb.Y * 0.5) - axc.Y) + 10))
        asj.Position = UDim2.new(0.5, axd, 0.5, axe)
      end
    end)
    aop(aox.InputEnded, function(axf)
      if (((1 + 1) == 2) and ((axf.UserInputType == Enum.UserInputType.MouseButton1) or (axf.UserInputType == Enum.UserInputType.Touch))) then
        awv = false
      end
    end)
  end
  local axg, axh, axi = 186, 34, 4
  local axj = aoq(g({28, 40, 59, 55, 63}, 90), {Name = g({9, 51, 62, 63, 56, 59, 40}, 90), Position = UDim2.new(0, 14, 0, 64), Size = UDim2.new(0, axg, 1, -78), BackgroundColor3 = aoo.Surface, BackgroundTransparency = 0.06, BorderSizePixel = 0, ZIndex = 4, Parent = aso})
  aor(14, axj)
  aos(aoo.Stroke, 0.4, 1, axj)
  aoq(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(aoo.SurfaceAlt, aoo.Surface), Rotation = 90, Parent = axj})
  do
    local axk = aoq(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 8, 0, 8), Size = UDim2.new(1, -16, 0, 54), BackgroundColor3 = aoo.Element, BackgroundTransparency = 0.12, BorderSizePixel = 0, ZIndex = 5, Parent = axj})
    aor(11, axk)
    aos(aoo.Stroke, 0.4, 1, axk)
    local axl = aoq(g({19, 55, 59, 61, 63, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 8, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromOffset(38, 38), BackgroundColor3 = aoo.SurfaceAlt, BorderSizePixel = 0, ZIndex = 6, Parent = axk})
    aor(999, axl)
    aon.markAccent(aos(aoo.Accent, 0.35, 1.5, axl), g({25, 53, 54, 53, 40}, 90))
    pcall(function()
      axl.Image = string.format(g({40, 56, 34, 46, 50, 47, 55, 56, 96, 117, 117, 46, 35, 42, 63, 103, 27, 44, 59, 46, 59, 40, 18, 63, 59, 62, 9, 50, 53, 46, 124, 51, 62, 103, 127, 62, 124, 45, 103, 110, 98, 124, 50, 103, 110, 98}, 90), Players.LocalPlayer.UserId)
    end)
    aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 54, 0, 11), Size = UDim2.new(1, -62, 0, 15), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12.5, TextColor3 = aoo.Text, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 6, Parent = axk, Text = tostring(Players.LocalPlayer.DisplayName)})
    aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 54, 0, 28), Size = UDim2.new(1, -62, 0, 13), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 10.5, TextColor3 = aoo.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 6, Parent = axk, Text = (g({26}, 90) .. tostring(Players.LocalPlayer.Name))})
  end
  local axm = aoq(g({9, 57, 40, 53, 54, 54, 51, 52, 61, 28, 40, 59, 55, 63}, 90), {Name = g({14, 59, 56, 22, 51, 41, 46}, 90), Position = UDim2.new(0, 8, 0, 70), Size = UDim2.new(1, -16, 1, -82), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 2, ScrollBarImageColor3 = aoo.Stroke, ScrollBarImageTransparency = 0.5, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollingDirection = Enum.ScrollingDirection.Y, ZIndex = 5, Parent = axj})
  aoq(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90), {Padding = UDim.new(0, axi), SortOrder = Enum.SortOrder.LayoutOrder, Parent = axm})
  local axn = aoq(g({28, 40, 59, 55, 63}, 90), {Name = g({10, 51, 54, 54, 22, 59, 35, 63, 40}, 90), Position = axm.Position, Size = axm.Size, BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 8, Parent = axj})
  local axo = aoq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromOffset(3, 18), Position = UDim2.new(0, 0, 0, 9), BackgroundColor3 = aoo.Accent, BorderSizePixel = 0, Visible = false, ZIndex = 8, Parent = axn})
  local axp = aoq(g({20, 47, 55, 56, 63, 40, 12, 59, 54, 47, 63}, 90), {Value = 9, Parent = axn})
  local function axq()
    axo.Position = UDim2.new(0, 0, 0, (axp.Value - axm.CanvasPosition.Y))
  end
  aop(axp.Changed, axq)
  aop(axm:GetPropertyChangedSignal(g({25, 59, 52, 44, 59, 41, 10, 53, 41, 51, 46, 51, 53, 52}, 90)), axq)
  aor(999, axo)
  aon.markAccent(axo, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
  aon.markAccent(aqh(axo, aoo.Accent, aoo.Accent2, 90), g({61, 40, 59, 62}, 90))
  local axr = aoq(g({28, 40, 59, 55, 63}, 90), {Name = g({25, 53, 52, 46, 63, 52, 46}, 90), Position = UDim2.new(0, ((14 + axg) + 12), 0, 64), Size = UDim2.new(1, (-(((14 + axg) + 12)) - 14), 1, -78), BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 4, Parent = aso})
  local axs = aoq(g({28, 40, 59, 55, 63}, 90), {Name = g({10, 53, 42, 47, 42, 41}, 90), Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 60, Parent = aso})
  local function axt()
    local axu = (asj.AbsoluteSize.X / ash)
    return ((((axu > 0.01)) and axu) or 1)
  end
  local function axv(axw)
    local axx = (((axw.AbsolutePosition - aso.AbsolutePosition)) / axt())
    return axx.X, axx.Y
  end
  local axy = {}
  local function axz()
    for aya = 1, #axy do
      pcall(axy[aya])
    end
  end
  k._closeDropdowns = axz
  aov = {}
  aow = {}
  k.Window = aov
  aon.Window = aov
  aon.Tabs = aow
  function aov:SetAuthor(ayb)
    avx.Text = tostring((ayb or ""))
  end
  function aov:SetSubtitle(ayc)
    avx.Text = tostring((ayc or ""))
  end
  local ayd = {}
  local aye = nil
  aou = function(ayf)
    if (((15 * 15) == 225) and (not ayf or (aye == ayf))) then
      return
    end
    axz()
    local ayg = aye
    aye = ayf
    if (((100 % 7) == 2) and ayg) then
      ayg.setActive(false)
      local ayh = ayg.wrap
      local ayi = aoj:Create(ayh, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.fromOffset(-26, 0)})
      ayi.Completed:Connect(function()
        if (((12 * 12) == 144) and (aye ~= ayg)) then
          ayh.Visible = false
        end
      end)
      ayi:Play()
    end
    ayf.setActive(true)
    ayf.wrap.Position = UDim2.fromOffset(34, 0)
    ayf.wrap.Visible = true
    ayf.scroll.Position = UDim2.fromOffset(0, 10)
    aoj:Create(ayf.wrap, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(0, 0)}):Play()
    aoj:Create(ayf.scroll, TweenInfo.new(0.34, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(0, 0)}):Play()
    axo.Visible = true
    aoj:Create(axp, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Value = (ayf.y + 9)}):Play()
  end
  aon.SelectTab = aou
  function aov:Tab(ayj)
    ayj = (ayj or {})
    local ayk = (#aow + 1)
    local ayl = aoq(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Name = (g({14, 59, 56, 5}, 90) .. tostring((ayj.Title or ayk))), LayoutOrder = ayk, Size = UDim2.new(1, 0, 0, axh), BackgroundColor3 = aoo.Element, BackgroundTransparency = 1, BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 6, Parent = axm})
    aor(10, ayl)
    local aym = aoq(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 9, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromOffset(24, 24), BackgroundColor3 = aoo.Accent, BackgroundTransparency = 0.86, BorderSizePixel = 0, ZIndex = 7, Parent = ayl})
    aor(8, aym)
    aon.markAccent(aym, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
    aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 12, TextColor3 = aoo.Text, Text = tostring((ayj.Icon or g({8312}, 90))), ZIndex = 8, Parent = aym})
    local ayn = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 42, 0, 0), Size = UDim2.new(1, -50, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 12.5, TextColor3 = aoo.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring((ayj.Title or g({14, 59, 56}, 90))), ZIndex = 7, Parent = ayl})
    local ayo = aoq(g({28, 40, 59, 55, 63}, 90), {Name = (g({10, 59, 61, 63, 5}, 90) .. tostring((ayj.Title or ayk))), Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false, ZIndex = 4, Parent = axr})
    local ayp = aoq(g({9, 57, 40, 53, 54, 54, 51, 52, 61, 28, 40, 59, 55, 63}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = aoo.Stroke, ScrollBarImageTransparency = 0.25, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollingDirection = Enum.ScrollingDirection.Y, Parent = ayo})
    aoq(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90), {Padding = UDim.new(0, 9), SortOrder = Enum.SortOrder.LayoutOrder, Parent = ayp})
    aqb(ayp, 2, 10, 18, 2)
    local ayq = false
    local function ayr(ays)
      ayq = ays
      aoj:Create(ayl, TweenInfo.new(0.16), {BackgroundTransparency = ((ays and 0.12) or 1)}):Play()
      aoj:Create(ayn, TweenInfo.new(0.16), {TextColor3 = ((ays and aoo.Text) or aoo.SubText)}):Play()
      aoj:Create(aym, TweenInfo.new(0.16), {BackgroundTransparency = ((ays and 0.55) or 0.86)}):Play()
    end
    aop(ayl.MouseEnter, function()
      if (((3 ^ 2) == 9) and not ayq) then
        aoj:Create(ayl, TweenInfo.new(0.14), {BackgroundTransparency = 0.55}):Play()
      end
    end)
    aop(ayl.MouseLeave, function()
      if (((7 * 7) == 49) and not ayq) then
        aoj:Create(ayl, TweenInfo.new(0.14), {BackgroundTransparency = 1}):Play()
      end
    end)
    aro(ayl)
    local ayt = {Title = tostring((ayj.Title or g({14, 59, 56}, 90))), index = ayk, y = (((ayk - 1)) * ((axh + axi))), btn = ayl, wrap = ayo, scroll = ayp, setActive = ayr}
    local ayu = setmetatable({_tab = ayt, _page = ayp}, {__index = ayd})
    ayt.api = ayu
    table.insert(aow, ayt)
    aop(ayl.Activated, function()
      aou(ayt)
    end)
    return ayu
  end
  local ayv, ayw = 44, 60
  local function ayx(ayy)
    ayy._order = (((ayy._order or 0)) + 1)
    return ayy._order
  end
  aon.NextOrder, aon.Grad, aon.Ripple = ayx, aqh, aro
  aon.pin = function(ayz, aza)
    if (((1 + 1) == 2) and ((ayz and ayz.Row) and tonumber(aza))) then
      ayz.Row.LayoutOrder = tonumber(aza)
    end
    return ayz
  end
  local function azb(azc, azd)
    local aze = aoq(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {LayoutOrder = ayx(azc), Size = UDim2.new(1, 0, 0, azd), BackgroundColor3 = aoo.Surface, BackgroundTransparency = 0.1, BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 5, Parent = azc._page})
    aor(11, aze)
    local azf = aos(aoo.Stroke, 0.45, 1, aze)
    aop(aze.MouseEnter, function()
      aoj:Create(aze, TweenInfo.new(0.14), {BackgroundTransparency = 0}):Play()
      aoj:Create(azf, TweenInfo.new(0.14), {Transparency = 0.2}):Play()
    end)
    aop(aze.MouseLeave, function()
      aoj:Create(aze, TweenInfo.new(0.14), {BackgroundTransparency = 0.1}):Play()
      aoj:Create(azf, TweenInfo.new(0.14), {Transparency = 0.45}):Play()
    end)
    return aze, azf
  end
  local azg = {[g({46, 40, 59, 41, 50, 119, 104}, 90)] = g({55399, 56715}, 90), [g({41, 50, 53, 42, 42, 51, 52, 61, 119, 57, 59, 40, 46}, 90)] = g({55399, 56968}, 90), play = g({9708}, 90), sparkles = g({10098}, 90), gauge = g({9614}, 90), send = g({10238}, 90), [g({40, 53, 46, 59, 46, 63, 119, 57, 57, 45}, 90)] = g({8672}, 90), [g({54, 53, 61, 119, 53, 47, 46}, 90)] = g({9121}, 90), check = g({10057}, 90), info = g({51}, 90), [g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90)] = g({123}, 90)}
  local function azh(azi, azj, azk)
    local azl = ((azj.Desc ~= nil) and (tostring(azj.Desc) ~= ""))
    local azm = 14
    if (((15 * 15) == 225) and azj.Icon) then
      local azn = aoq(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 12, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromOffset(26, 26), BackgroundColor3 = aoo.Accent, BackgroundTransparency = 0.85, BorderSizePixel = 0, ZIndex = 6, Parent = azi})
      aor(8, azn)
      aon.markAccent(azn, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
      aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 13, TextColor3 = aoo.Text, ClipsDescendants = true, Text = ((azg[azj.Icon] or (((#tostring(azj.Icon) <= 2) and tostring(azj.Icon)))) or g({8312}, 90)), ZIndex = 7, Parent = azn})
      azm = 48
    end
    local azo = (((azk or 70)) + azm)
    local azp = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Name = g({14, 51, 46, 54, 63, 22, 59, 56, 63, 54}, 90), Position = UDim2.new(0, azm, 0, ((azl and 11) or 0)), Size = ((azl and UDim2.new(1, -azo, 0, 16)) or UDim2.new(1, -azo, 1, 0)), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12.5, TextColor3 = aoo.Text, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = ((azl and Enum.TextYAlignment.Center) or Enum.TextYAlignment.Center), TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring((azj.Title or "")), ZIndex = 6, Parent = azi})
    local azq = nil
    if (((100 % 7) == 2) and azl) then
      azq = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Name = g({30, 63, 41, 57, 22, 59, 56, 63, 54}, 90), Position = UDim2.new(0, azm, 0, 28), Size = UDim2.new(1, -azo, 0, 24), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 11, TextColor3 = aoo.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true, Text = tostring(azj.Desc), ZIndex = 6, Parent = azi})
    end
    return azp, azq
  end
  local function azr(azs, azt)
    azs.SetTitle = function(azu, azv)
      local azw = azt:FindFirstChild(g({14, 51, 46, 54, 63, 22, 59, 56, 63, 54}, 90))
      if (((12 * 12) == 144) and azw) then
        azw.Text = tostring(azv)
      end
    end
    azs.SetDesc = function(azx, azy)
      local azz = azt:FindFirstChild(g({30, 63, 41, 57, 22, 59, 56, 63, 54}, 90))
      if (((3 ^ 2) == 9) and azz) then
        azz.Text = tostring(azy)
      end
    end
    azs.Destroy = function()
      pcall(function()
        azt:Destroy()
      end)
    end
    azs.Row = azt
    return azs
  end
  function ayd:Slot()
    return ayx(self)
  end
  function ayd:Section(baa)
    local bab = aoq(g({28, 40, 59, 55, 63}, 90), {LayoutOrder = ayx(self), Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, ZIndex = 5, Parent = self._page})
    local bac = aoq(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 2, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromOffset(3, 14), BackgroundColor3 = aoo.Accent, BorderSizePixel = 0, ZIndex = 6, Parent = bab})
    aor(999, bac)
    aon.markAccent(bac, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
    local bad = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 13, 0, 0), Size = UDim2.new(1, -17, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12.5, TextColor3 = Color3.fromRGB(255, 255, 255), TextXAlignment = Enum.TextXAlignment.Left, Text = string.upper(tostring((baa or ""))), ZIndex = 6, Parent = bab})
    aon.markAccent(aqh(bad, aoo.Accent, aoo.Accent2, 0), g({61, 40, 59, 62}, 90))
    return {SetTitle = function(bae, baf)
      bad.Text = string.upper(tostring((baf or "")))
    end}
  end
  function ayd:StatGrid(bag)
    local bah = math.ceil((#bag / 2))
    local bai = aoq(g({28, 40, 59, 55, 63}, 90), {LayoutOrder = ayx(self), Size = UDim2.new(1, 0, 0, ((bah * 62) - 8)), BackgroundTransparency = 1, ZIndex = 5, Parent = self._page})
    aoq(g({15, 19, 29, 40, 51, 62, 22, 59, 35, 53, 47, 46}, 90), {CellSize = UDim2.new(0.5, -4, 0, 54), CellPadding = UDim2.fromOffset(8, 8), SortOrder = Enum.SortOrder.LayoutOrder, Parent = bai})
    local baj = {}
    for bak, bal in ipairs(bag) do
      local bam = aoq(g({28, 40, 59, 55, 63}, 90), {LayoutOrder = bak, BackgroundColor3 = aoo.Surface, BackgroundTransparency = 0.15, BorderSizePixel = 0, ZIndex = 6, Parent = bai})
      aor(11, bam)
      aos(aoo.Stroke, 0.5, 1, bam)
      local ban = aoq(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 0, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), Size = UDim2.fromOffset(3, 26), BackgroundColor3 = aoo.Accent, BorderSizePixel = 0, ZIndex = 7, Parent = bam})
      aor(999, ban)
      aon.markAccent(ban, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
      aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 14, 0, 9), Size = UDim2.new(1, -22, 0, 12), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 10, TextColor3 = aoo.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = string.upper(tostring((bal.Title or ""))), ZIndex = 7, Parent = bam})
      local bao = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 14, 0, 24), Size = UDim2.new(1, -22, 0, 20), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 16, TextColor3 = aoo.Text, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = g({106}, 90), ZIndex = 7, Parent = bam})
      baj[(bal.Key or bak)] = function(bap)
        bao.Text = tostring(bap)
      end
    end
    return baj
  end
  function ayd:Toggle(baq)
    baq = (baq or {})
    local bar = azb(self, ((baq.Desc and ayw) or ayv))
    azh(bar, baq, 74)
    local bas = aoq(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0), Size = UDim2.fromOffset(44, 22), BackgroundColor3 = aoo.Element, BackgroundTransparency = 0.1, BorderSizePixel = 0, ZIndex = 6, Parent = bar})
    aor(999, bas)
    local bat = aon.markAccent(aos(aoo.Accent, 0.8, 1, bas), g({25, 53, 54, 53, 40}, 90))
    aon.markAccent(aqh(bas, aoo.Accent, aoo.Accent2, 0), g({61, 40, 59, 62}, 90))
    local bau = aoq(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 3, 0.5, 0), Size = UDim2.fromOffset(16, 16), BackgroundColor3 = aoo.Gray, BorderSizePixel = 0, ZIndex = 7, Parent = bas})
    aor(999, bau)
    local bav = {Value = (baq.Value == true)}
    local function baw(bax)
      local bay = bav.Value
      local baz = ((bay and UDim2.new(1, -19, 0.5, 0)) or UDim2.new(0, 3, 0.5, 0))
      local bba = ((bay and Color3.fromRGB(255, 255, 255)) or aoo.Gray)
      local bbb = ((bay and Color3.fromRGB(255, 255, 255)) or aoo.Element)
      local bbc = ((bay and 0) or 0.1)
      local bbd = ((bay and 0.3) or 0.82)
      if (((7 * 7) == 49) and bax) then
        bau.Position, bau.BackgroundColor3 = baz, bba
        bas.BackgroundColor3, bas.BackgroundTransparency = bbb, bbc
        bat.Transparency = bbd
        return
      end
      aoj:Create(bau, TweenInfo.new(0.26, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = baz, BackgroundColor3 = bba}):Play()
      aoj:Create(bas, TweenInfo.new(0.18), {BackgroundColor3 = bbb, BackgroundTransparency = bbc}):Play()
      aoj:Create(bat, TweenInfo.new(0.18), {Transparency = bbd}):Play()
    end
    baw(true)
    bav.Set = function(bbe, bbf, bbg, bbh)
      bav.Value = (bbf == true)
      baw((bbh == true))
      if (((1 + 1) == 2) and ((bbg ~= false) and baq.Callback)) then
        task.spawn(baq.Callback, bav.Value)
      end
    end
    azr(bav, bar)
    aop(bar.Activated, function()
      bav:Set(not bav.Value, true)
    end)
    aro(bar, true)
    table.insert(aon.Registry, {type = g({46, 53, 61, 61, 54, 63}, 90), set = function(bbi)
      bav:Set(bbi, true)
    end, default = (baq.Value == true)})
    return bav
  end
  local bbj = nil
  local function bbk()
    local bbl = bbj
    if (((15 * 15) == 225) and not bbl) then
      return
    end
    bbj = nil
    pcall(function()
      bbl.catcher:Destroy()
    end)
    if (((100 % 7) == 2) and bbl.onClose) then
      pcall(bbl.onClose)
    end
    local bbm = bbl.wrap
    aoj:Create(bbl.scale, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Scale = 0.9}):Play()
    task.delay(0.13, function()
      pcall(function()
        bbm:Destroy()
      end)
    end)
  end
  table.insert(axy, bbk)
  local bbn = 192
  function ayd:Dropdown(bbo)
    bbo = (bbo or {})
    local bbp = (bbo.Multi == true)
    local function bbq()
      return (bbo.Values or {})
    end
    local bbr
    if (((12 * 12) == 144) and bbp) then
      bbr = {}
      for bbs, bbt in ipairs((((type(bbo.Value) == g({46, 59, 56, 54, 63}, 90)) and bbo.Value) or {})) do
        bbr[bbt] = true
      end
    else
      bbr = bbo.Value
      if (((3 ^ 2) == 9) and (((bbr == nil) and (bbo.AllowNone ~= true)) and (#bbq() > 0))) then
        bbr = bbq()[1]
      end
    end
    local bbu = azb(self, ((bbo.Desc and ayw) or ayv))
    azh(bbu, bbo, 176)
    local bbv = aoq(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0), Size = UDim2.fromOffset(162, 30), BackgroundColor3 = aoo.Element, BackgroundTransparency = 0.15, BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 8, Parent = bbu})
    aor(9, bbv)
    local bbw = aos(aoo.Stroke, 0.4, 1, bbv)
    local bbx = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 10, 0, 0), Size = UDim2.new(1, -30, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 11.5, TextColor3 = aoo.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = "", ZIndex = 9, Parent = bbv})
    local bby = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -8, 0.5, 0), Size = UDim2.fromOffset(12, 12), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = aoo.SubText, Text = g({9700}, 90), ZIndex = 9, Parent = bbv})
    aop(bbv.MouseEnter, function()
      aoj:Create(bbv, TweenInfo.new(0.14), {BackgroundTransparency = 0}):Play()
      aoj:Create(bbw, TweenInfo.new(0.14), {Transparency = 0.15}):Play()
    end)
    aop(bbv.MouseLeave, function()
      aoj:Create(bbv, TweenInfo.new(0.14), {BackgroundTransparency = 0.15}):Play()
      aoj:Create(bbw, TweenInfo.new(0.14), {Transparency = 0.4}):Play()
    end)
    aro(bbv)
    local bbz = {}
    local function bca()
      if (((7 * 7) == 49) and bbp) then
        local bcb = {}
        for bcc, bcd in ipairs(bbq()) do
          if (((1 + 1) == 2) and bbr[bcd]) then
            table.insert(bcb, bcd)
          end
        end
        bbz.Value = bcb
        bbx.Text = (((#bcb > 0) and table.concat(bcb, g({118, 122}, 90))) or (((bbo.AllowNone and g({20, 53, 46, 50, 51, 52, 61}, 90)) or g({9, 63, 54, 63, 57, 46, 8316}, 90))))
        bbx.TextColor3 = (((#bcb > 0) and aoo.Text) or aoo.SubText)
      else
        bbz.Value = bbr
        bbx.Text = tostring((bbr or (((bbo.AllowNone and g({20, 53, 46, 50, 51, 52, 61}, 90)) or g({9, 63, 54, 63, 57, 46, 8316}, 90)))))
        bbx.TextColor3 = (((bbr ~= nil) and aoo.Text) or aoo.SubText)
      end
    end
    bca()
    aop(bbv.Activated, function()
      if (((15 * 15) == 225) and (bbj and (bbj.owner == bbz))) then
        bbk()
        return
      end
      bbk()
      local bce = bbq()
      local bcf, bcg = axv(bbv)
      local bch = math.min(((#bce * 32) + 12), 226)
      local bci = ((((bcg + 34) + bch)) > ((asi - 10)))
      local bcj = math.clamp(((bcf + 162) - bbn), 8, ((ash - bbn) - 8))
      local bck = aoq(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, ZIndex = 51, Parent = axs})
      bck.Activated:Connect(bbk)
      local bcl = aoq(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = ((bci and Vector2.new(0, 1)) or Vector2.new(0, 0)), Position = ((bci and UDim2.new(0, bcj, 0, (bcg - 4))) or UDim2.new(0, bcj, 0, (bcg + 34))), Size = UDim2.fromOffset(bbn, bch), BackgroundTransparency = 1, ZIndex = 52, Parent = axs})
      local bcm = aoq(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 0.92, Parent = bcl})
      local bcn = aoq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromScale(1, 1), BackgroundColor3 = aoo.SurfaceAlt, BorderSizePixel = 0, ZIndex = 52, Parent = bcl})
      aor(11, bcn)
      aon.markAccent(aos(aoo.Accent, 0.55, 1, bcn), g({25, 53, 54, 53, 40}, 90))
      local bco = aoq(g({9, 57, 40, 53, 54, 54, 51, 52, 61, 28, 40, 59, 55, 63}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollingDirection = Enum.ScrollingDirection.Y, ScrollBarThickness = 3, ScrollBarImageTransparency = 0.2, ZIndex = 53, Parent = bcn})
      aon.markAccent(bco, g({9, 57, 40, 53, 54, 54, 24, 59, 40, 19, 55, 59, 61, 63, 25, 53, 54, 53, 40, 105}, 90))
      aoq(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90), {Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder, Parent = bco})
      aqb(bco, 6, 6, 6, 6)
      for bcp, bcq in ipairs(bce) do
        local bcr = aoq(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Size = UDim2.new(1, -4, 0, 28), BackgroundColor3 = aoo.Element, BackgroundTransparency = 0.1, BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 54, LayoutOrder = bcp, Parent = bco})
        aor(7, bcr)
        local bcs = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 9, 0, 0), Size = UDim2.new(1, -32, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 11.5, TextColor3 = aoo.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring(bcq), ZIndex = 55, Parent = bcr})
        local bct = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -8, 0.5, 0), Size = UDim2.fromOffset(14, 14), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = aoo.Text, Text = g({10057}, 90), Visible = false, ZIndex = 55, Parent = bcr})
        local function bcu()
          local bcv = ((bbp and ((bbr[bcq] == true))) or ((not bbp and (bbr == bcq))))
          bcr.BackgroundColor3 = ((bcv and aoo.Accent) or aoo.Element)
          bcr.BackgroundTransparency = ((bcv and 0.25) or 0.1)
          bcs.TextColor3 = ((bcv and aoo.Text) or aoo.SubText)
          bct.Visible = bcv
        end
        bcu()
        bcr.MouseEnter:Connect(function()
          local bcw = ((bbp and ((bbr[bcq] == true))) or ((not bbp and (bbr == bcq))))
          if (((100 % 7) == 2) and not bcw) then
            aoj:Create(bcr, TweenInfo.new(0.12), {BackgroundColor3 = aoo.ElementHover, BackgroundTransparency = 0}):Play()
          end
        end)
        bcr.MouseLeave:Connect(bcu)
        bcr.Activated:Connect(function()
          if (((12 * 12) == 144) and bbp) then
            bbr[bcq] = ((not bbr[bcq]) or nil)
            bcu()
            bca()
            if (((3 ^ 2) == 9) and bbo.Callback) then
              task.spawn(bbo.Callback, bbz.Value)
            end
          else
            bbr = bcq
            bca()
            bbk()
            if (((7 * 7) == 49) and bbo.Callback) then
              task.spawn(bbo.Callback, bbr)
            end
          end
        end)
      end
      bbj = {owner = bbz, wrap = bcl, scale = bcm, catcher = bck, onClose = function()
        aoj:Create(bby, TweenInfo.new(0.16), {Rotation = 0}):Play()
      end}
      aoj:Create(bby, TweenInfo.new(0.16), {Rotation = 180}):Play()
      aoj:Create(bcm, TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end)
    bbz.Set = function(bcx, bcy, bcz)
      if (((1 + 1) == 2) and bbp) then
        bbr = {}
        for bda, bdb in ipairs((((type(bcy) == g({46, 59, 56, 54, 63}, 90)) and bcy) or {})) do
          bbr[bdb] = true
        end
      else
        bbr = bcy
      end
      bca()
      if (((15 * 15) == 225) and ((bcz ~= false) and bbo.Callback)) then
        task.spawn(bbo.Callback, ((bbp and bbz.Value) or bbr))
      end
    end
    azr(bbz, bbu)
    local bdc = bbz.Destroy
    bbz.Destroy = function()
      if (((100 % 7) == 2) and (bbj and (bbj.owner == bbz))) then
        bbk()
      end
      if (((12 * 12) == 144) and bdc) then
        bdc()
      end
    end
    table.insert(aon.Registry, {type = g({62, 40, 53, 42, 62, 53, 45, 52}, 90), multi = bbp, default = bbo.Value, set = function(bdd)
      bbz:Set(bdd, true)
    end})
    return bbz
  end
  local bde = {}
  arf(function(bdf)
    for bdg = 1, #bde do
      local bdh = bde[bdg]
      if (((3 ^ 2) == 9) and (bdh.tab == aye)) then
        bdh.grad.Offset = Vector2.new(((((((bdf * 0.42) + bdh.phase)) % 1.7)) - 0.35), 0)
      end
    end
  end)
  local bdi = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.42, 1), NumberSequenceKeypoint.new(0.5, 0.84), NumberSequenceKeypoint.new(0.58, 1), NumberSequenceKeypoint.new(1, 1)})
  function ayd:Button(bdj)
    bdj = (bdj or {})
    local bdk = azb(self, ((bdj.Desc and 54) or 44))
    bdk.BackgroundColor3 = aoo.Accent
    aon.markAccent(bdk, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
    aon.markAccent(aqh(bdk, aoo.Accent, aoo.Accent2, 25), g({61, 40, 59, 62}, 90))
    local bdl, bdm = azh(bdk, bdj, 46)
    bdl.TextColor3 = Color3.fromRGB(255, 255, 255)
    if (((7 * 7) == 49) and bdm) then
      bdm.TextColor3 = Color3.fromRGB(226, 226, 244)
    end
    local bdn = aoq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0, ZIndex = 7, Parent = bdk})
    aor(11, bdn)
    local bdo = aoq(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Transparency = bdi, Rotation = 18, Parent = bdn})
    table.insert(bde, {grad = bdo, tab = self._tab, phase = (math.random() * 1.7)})
    local bdp = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -16, 0.5, 0), Size = UDim2.fromOffset(18, 18), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 15, TextColor3 = Color3.fromRGB(255, 255, 255), Text = g({8288}, 90), ZIndex = 8, Parent = bdk})
    local bdq = aoq(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 1, Parent = bdk})
    aop(bdk.MouseEnter, function()
      aoj:Create(bdp, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(1, -11, 0.5, 0)}):Play()
    end)
    aop(bdk.MouseLeave, function()
      aoj:Create(bdp, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(1, -16, 0.5, 0)}):Play()
    end)
    aop(bdk.MouseButton1Down, function()
      aoj:Create(bdq, TweenInfo.new(0.1), {Scale = 0.975}):Play()
    end)
    aop(bdk.MouseButton1Up, function()
      aoj:Create(bdq, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end)
    aro(bdk, true)
    local bdr = {}
    azr(bdr, bdk)
    aop(bdk.Activated, function()
      if (((1 + 1) == 2) and bdj.Callback) then
        task.spawn(bdj.Callback)
      end
    end)
    return bdr
  end
  local bds, bdt = nil, nil
  aop(aox.InputChanged, function(bdu)
    if (((15 * 15) == 225) and (bds and (((bdu.UserInputType == Enum.UserInputType.MouseMovement) or (bdu.UserInputType == Enum.UserInputType.Touch))))) then
      bds(bdu.Position.X)
    end
  end)
  aop(aox.InputEnded, function(bdv)
    if (((100 % 7) == 2) and (bds and (((bdv.UserInputType == Enum.UserInputType.MouseButton1) or (bdv.UserInputType == Enum.UserInputType.Touch))))) then
      bds = nil
      if (((12 * 12) == 144) and bdt) then
        pcall(bdt)
        bdt = nil
      end
    end
  end)
  function ayd:Slider(bdw)
    bdw = (bdw or {})
    local bdx = (bdw.Value or {})
    local bdy = (tonumber(bdx.Min) or 0)
    local bdz = (tonumber(bdx.Max) or 100)
    local bea = (tonumber(bdw.Step) or 1)
    if (((3 ^ 2) == 9) and (bea <= 0)) then
      bea = 1
    end
    local beb = ((bdw.Desc ~= nil) and (tostring(bdw.Desc) ~= ""))
    local bec = azb(self, ((beb and 78) or 60))
    local bed = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Name = g({14, 51, 46, 54, 63, 22, 59, 56, 63, 54}, 90), Position = UDim2.new(0, 14, 0, 10), Size = UDim2.new(1, -100, 0, 16), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12.5, TextColor3 = aoo.Text, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring((bdw.Title or "")), ZIndex = 6, Parent = bec})
    if (((7 * 7) == 49) and beb) then
      aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Name = g({30, 63, 41, 57, 22, 59, 56, 63, 54}, 90), Position = UDim2.new(0, 14, 0, 27), Size = UDim2.new(1, -100, 0, 22), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 11, TextColor3 = aoo.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true, Text = tostring(bdw.Desc), ZIndex = 6, Parent = bec})
    end
    local bee = aoq(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -14, 0, 8), Size = UDim2.fromOffset(62, 20), BackgroundColor3 = aoo.Accent, BackgroundTransparency = 0.78, BorderSizePixel = 0, ZIndex = 6, Parent = bec})
    aor(7, bee)
    aon.markAccent(bee, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
    aon.markAccent(aos(aoo.Accent, 0.6, 1, bee), g({25, 53, 54, 53, 40}, 90))
    local bef = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = aoo.Text, Text = g({106}, 90), ZIndex = 7, Parent = bee})
    local beg = aoq(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 14, 1, -18), Size = UDim2.new(1, -28, 0, 6), BackgroundColor3 = aoo.Element, BorderSizePixel = 0, ZIndex = 6, Parent = bec})
    aor(999, beg)
    local beh = aoq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.fromScale(0, 1), BackgroundColor3 = aoo.Accent, BorderSizePixel = 0, ZIndex = 7, Parent = beg})
    aor(999, beh)
    aon.markAccent(beh, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
    aon.markAccent(aqh(beh, aoo.Accent, aoo.Accent2, 0), g({61, 40, 59, 62}, 90))
    local bei = aoq(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.fromOffset(14, 14), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0, ZIndex = 8, Parent = beg})
    aor(999, bei)
    aon.markAccent(aos(aoo.Accent, 0.25, 2, bei), g({25, 53, 54, 53, 40}, 90))
    local bej = {Value = (tonumber(bdx.Default) or bdy)}
    local function bek(bel)
      if (((1 + 1) == 2) and (bea < 1)) then
        return string.format(g({127, 116, 104, 60}, 90), bel)
      end
      return tostring(math.floor((bel + 0.5)))
    end
    local function bem(ben, beo, bep)
      local beq = math.clamp((tonumber(ben) or bdy), bdy, bdz)
      beq = (bdy + (math.floor(((((beq - bdy)) / bea) + 0.5)) * bea))
      beq = math.clamp(beq, bdy, bdz)
      bej.Value = beq
      local ber = ((((bdz > bdy)) and (((beq - bdy)) / ((bdz - bdy)))) or 0)
      bef.Text = bek(beq)
      if (((15 * 15) == 225) and bep) then
        beh.Size = UDim2.fromScale(ber, 1)
        bei.Position = UDim2.new(ber, 0, 0.5, 0)
      else
        local bes = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        aoj:Create(beh, bes, {Size = UDim2.fromScale(ber, 1)}):Play()
        aoj:Create(bei, bes, {Position = UDim2.new(ber, 0, 0.5, 0)}):Play()
      end
      if (((100 % 7) == 2) and (beo and bdw.Callback)) then
        task.spawn(bdw.Callback, beq)
      end
    end
    bem(bej.Value, false, true)
    local function bet(beu)
      local bev = beg.AbsoluteSize.X
      if (((12 * 12) == 144) and (bev <= 0)) then
        return
      end
      local bew = math.clamp((((beu - beg.AbsolutePosition.X)) / bev), 0, 1)
      bem((bdy + (bew * ((bdz - bdy)))), true, true)
    end
    local function bex(bey)
      if (((3 ^ 2) == 9) and ((bey.UserInputType ~= Enum.UserInputType.MouseButton1) and (bey.UserInputType ~= Enum.UserInputType.Touch))) then
        return
      end
      bds = bet
      aoj:Create(bei, TweenInfo.new(0.12), {Size = UDim2.fromOffset(18, 18)}):Play()
      aoj:Create(beg, TweenInfo.new(0.12), {Size = UDim2.new(1, -28, 0, 8)}):Play()
      bdt = function()
        aoj:Create(bei, TweenInfo.new(0.16), {Size = UDim2.fromOffset(14, 14)}):Play()
        aoj:Create(beg, TweenInfo.new(0.16), {Size = UDim2.new(1, -28, 0, 6)}):Play()
      end
      bet(bey.Position.X)
    end
    aop(beg.InputBegan, bex)
    aop(bei.InputBegan, bex)
    aop(bec.InputBegan, function(bez)
      if (((7 * 7) == 49) and (bez.UserInputType ~= Enum.UserInputType.MouseButton1)) then
        return
      end
      local bfa = (bez.Position.Y - bec.AbsolutePosition.Y)
      if (((1 + 1) == 2) and (bfa >= (bec.AbsoluteSize.Y - 26))) then
        bex(bez)
      end
    end)
    bej.Set = function(bfb, bfc, bfd)
      bem(bfc, (bfd ~= false), false)
    end
    azr(bej, bec)
    bej.SetTitle = function(bfe, bff)
      bed.Text = tostring(bff)
    end
    table.insert(aon.Registry, {type = g({41, 54, 51, 62, 63, 40}, 90), default = (tonumber(bdx.Default) or bdy), set = function(bfg)
      bem((tonumber(bfg) or bdy), true, false)
    end})
    return bej
  end
  function ayd:Input(bfh)
    bfh = (bfh or {})
    local bfi = azb(self, ((bfh.Desc and ayw) or ayv))
    azh(bfi, bfh, 184)
    local bfj = aoq(g({14, 63, 34, 46, 24, 53, 34}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0), Size = UDim2.fromOffset(170, 30), BackgroundColor3 = aoo.Element, BackgroundTransparency = 0.15, BorderSizePixel = 0, Font = Enum.Font.Gotham, TextSize = 11.5, TextColor3 = aoo.Text, PlaceholderColor3 = Color3.fromRGB(112, 112, 142), PlaceholderText = tostring((bfh.Placeholder or "")), Text = "", ClearTextOnFocus = false, TextTruncate = Enum.TextTruncate.AtEnd, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8, Parent = bfi})
    aor(9, bfj)
    aqb(bfj, 0, 10, 0, 10)
    local bfk = aos(aoo.Stroke, 0.4, 1, bfj)
    local bfl = {Text = "", Value = ""}
    aop(bfj.Focused, function()
      aoj:Create(bfj, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
      aoj:Create(bfk, TweenInfo.new(0.15), {Color = aoo.Accent, Transparency = 0.1}):Play()
    end)
    aop(bfj.FocusLost, function(bfm)
      aoj:Create(bfj, TweenInfo.new(0.15), {BackgroundTransparency = 0.15}):Play()
      aoj:Create(bfk, TweenInfo.new(0.15), {Color = aoo.Stroke, Transparency = 0.4}):Play()
      bfl.Text, bfl.Value = bfj.Text, bfj.Text
      if (((15 * 15) == 225) and (bfm and bfh.Callback)) then
        task.spawn(bfh.Callback, bfj.Text)
      end
    end)
    aop(bfj:GetPropertyChangedSignal(g({14, 63, 34, 46}, 90)), function()
      bfl.Text, bfl.Value = bfj.Text, bfj.Text
    end)
    azr(bfl, bfi)
    bfl.SetText = function(bfn, bfo)
      bfj.Text = tostring((bfo or ""))
      bfl.Text, bfl.Value = bfj.Text, bfj.Text
    end
    return bfl
  end
  aop(aox.InputBegan, function(bfp, bfq)
    if (((100 % 7) == 2) and bfq) then
      return
    end
    if (((12 * 12) == 144) and (bfp.UserInputType ~= Enum.UserInputType.Keyboard)) then
      return
    end
    local bfr = bfp.KeyCode
    if (((3 ^ 2) == 9) and n.RebindWaiting) then
      n.RebindWaiting = false
      if (((7 * 7) == 49) and (bfr ~= Enum.KeyCode.Escape)) then
        l.HotkeyName = bfr.Name
        aon.Notify({Title = g({25, 53, 42, 63, 122, 18, 47, 56}, 90), Content = (g({18, 53, 46, 49, 63, 35, 122, 41, 63, 46, 122, 46, 53, 122}, 90) .. (bfr.Name .. g({122, 114, 17, 122, 59, 54, 41, 53, 122, 45, 53, 40, 49, 41, 115}, 90))), Icon = g({57, 50, 63, 57, 49}, 90), Duration = 2.5})
        k.SaveSettings(true)
      else
        aon.Notify({Title = g({25, 53, 42, 63, 122, 18, 47, 56}, 90), Content = g({8, 63, 56, 51, 52, 62, 122, 57, 59, 52, 57, 63, 54, 54, 63, 62}, 90), Icon = g({51, 52, 60, 53}, 90), Duration = 2})
      end
      if (((1 + 1) == 2) and k._refreshHotkeyLabel) then
        k._refreshHotkeyLabel()
      end
      return
    end
    if (((15 * 15) == 225) and (bfr == Enum.KeyCode.F8)) then
      if (((100 % 7) == 2) and k._bgPanic) then
        pcall(k._bgPanic)
      end
      return
    end
    if (((12 * 12) == 144) and ((bfr == Enum.KeyCode.K) or (bfr.Name == tostring(l.HotkeyName)))) then
      aot(not n.UIVisible)
    end
  end)
  function aov:Destroy()
    for bfs, bft in ipairs(aon.Conns) do
      pcall(function()
        bft:Disconnect()
      end)
    end
    table.clear(aon.Conns)
    table.clear(are.jobs)
    pcall(function()
      if (((3 ^ 2) == 9) and awk) then
        awk:Destroy()
      end
    end)
    awk = nil
    pcall(function()
      arv:Destroy()
    end)
    k.ScreenGui = nil
  end
end
local bfu = aov:Tab({Title = g({28, 59, 40, 55}, 90), Icon = g({55398, 57188}, 90)})
local bfv = aov:Tab({Title = g({31, 61, 61, 41}, 90), Icon = g({55396, 56576}, 90)})
local bfw = aov:Tab({Title = g({19, 52, 62, 63, 34}, 90), Icon = g({55399, 56460}, 90)})
local bfx = aov:Tab({Title = g({12, 59, 40, 51, 59, 52, 46, 41}, 90), Icon = g({55399, 56692}, 90)})
local bfy = aov:Tab({Title = g({29, 51, 60, 46, 41}, 90), Icon = g({55398, 57307}, 90)})
local bfz = aov:Tab({Title = g({25, 53, 54, 54, 63, 57, 46}, 90), Icon = g({55396, 56744}, 90)})
local bga = aov:Tab({Title = g({30, 63, 54, 63, 46, 63}, 90), Icon = g({55399, 56715, 65109}, 90)})
local bgb = aov:Tab({Title = g({24, 53, 53, 41, 46, 41}, 90), Icon = g({9979}, 90)})
local bgc = aov:Tab({Title = g({31, 52, 57, 50, 59, 52, 46}, 90), Icon = g({10098}, 90)})
local bgd = aov:Tab({Title = g({27, 54, 63, 40, 46, 41}, 90), Icon = g({55399, 56654}, 90)})
local bge = aov:Tab({Title = g({9, 46, 59, 46, 41}, 90), Icon = g({55399, 56464}, 90)})
local bgf = aov:Tab({Title = g({10, 63, 40, 60, 53, 40, 55, 59, 52, 57, 63}, 90), Icon = g({55399, 57050}, 90)})
local bgg = aov:Tab({Title = g({9, 63, 46, 46, 51, 52, 61, 41}, 90), Icon = g({9923, 65109}, 90)})
k._destroyUI = function()
  if (((7 * 7) == 49) and k._destroyWidget) then
    pcall(k._destroyWidget)
  end
  pcall(function()
    aov:Destroy()
  end)
end
aou(aow[1])
task.delay(0.4, function()
  pcall(function()
    k.SaveSettings(true)
  end)
end)
bfu:Section(g({24, 40, 63, 59, 49, 59, 56, 54, 63, 41}, 90))
bfu:Toggle({Title = g({27, 47, 46, 53, 122, 28, 59, 40, 55, 122, 24, 40, 63, 59, 49, 59, 56, 54, 63, 41}, 90), Desc = g({9, 42, 54, 51, 46, 41, 122, 42, 63, 46, 41, 122, 59, 57, 40, 53, 41, 41, 122, 41, 63, 44, 63, 40, 59, 54, 122, 56, 40, 63, 59, 49, 59, 56, 54, 63, 41, 122, 59, 52, 62, 122, 59, 46, 46, 59, 57, 49, 41, 122, 46, 50, 63, 55, 122, 59, 54, 54, 122, 59, 46, 122, 53, 52, 57, 63}, 90), Value = false, Callback = function(bgh)
  l.AutoFarm = bgh
end})
bfu:Slider({Title = g({10, 59, 40, 59, 54, 54, 63, 54, 122, 14, 59, 40, 61, 63, 46, 41}, 90), Desc = g({18, 53, 45, 122, 55, 59, 52, 35, 122, 56, 40, 63, 59, 49, 59, 56, 54, 63, 41, 122, 46, 53, 122, 60, 59, 40, 55, 122, 59, 46, 122, 46, 50, 63, 122, 41, 59, 55, 63, 122, 46, 51, 55, 63}, 90), Value = {Min = 1, Max = 10, Default = (tonumber(l.MultiTargets) or 3)}, Step = 1, Callback = function(bgi)
  l.MultiTargets = bgi
end})
bfu:Toggle({Title = g({28, 59, 40, 55, 122, 13, 50, 53, 54, 63, 122, 27, 40, 63, 59, 122, 27, 46, 122, 21, 52, 57, 63}, 90), Desc = g({19, 61, 52, 53, 40, 63, 41, 122, 10, 59, 40, 59, 54, 54, 63, 54, 122, 14, 59, 40, 61, 63, 46, 41, 122, 113, 122, 62, 51, 41, 46, 59, 52, 57, 63, 122, 8270, 122, 42, 47, 46, 41, 122, 59, 122, 42, 63, 46, 122, 53, 52, 122, 31, 12, 31, 8, 3, 122, 56, 40, 63, 59, 49, 59, 56, 54, 63, 122, 51, 52, 122, 46, 50, 63, 122, 59, 40, 63, 59, 122, 41, 51, 55, 47, 54, 46, 59, 52, 63, 53, 47, 41, 54, 35}, 90), Value = (l.FarmAllArea == true), Callback = function(bgj)
  l.FarmAllArea = bgj
end})
bfu:Slider({Title = g({28, 51, 40, 63, 122, 30, 63, 54, 59, 35}, 90), Desc = g({9, 63, 57, 53, 52, 62, 41, 122, 56, 63, 46, 45, 63, 63, 52, 122, 28, 59, 40, 55, 122, 25, 53, 51, 52, 122, 59, 46, 46, 59, 57, 49, 41}, 90), Value = {Min = 0.01, Max = 0.5, Default = 0.05}, Step = 0.01, Callback = function(bgk)
  l.FireDelay = bgk
end})
bfu:Slider({Title = g({23, 59, 34, 122, 28, 51, 40, 63, 41, 117, 9, 63, 57, 122, 114, 17, 51, 57, 49, 122, 9, 59, 60, 63, 46, 35, 115}, 90), Desc = g({18, 59, 40, 62, 122, 57, 59, 42, 122, 53, 52, 122, 46, 53, 46, 59, 54, 122, 28, 59, 40, 55, 122, 25, 53, 51, 52, 122, 40, 59, 46, 63, 116, 122, 27, 56, 53, 44, 63, 122, 36, 107, 106, 106, 117, 41, 122, 46, 50, 51, 41, 122, 59, 57, 57, 53, 47, 52, 46, 122, 61, 63, 46, 41, 122, 62, 51, 41, 57, 53, 52, 52, 63, 57, 46, 63, 62, 122, 8270, 122, 40, 59, 51, 41, 63, 122, 59, 46, 122, 35, 53, 47, 40, 122, 53, 45, 52, 122, 40, 51, 41, 49, 116}, 90), Value = {Min = 30, Max = 150, Default = (tonumber(l.SafeFireRate) or 100)}, Step = 10, Callback = function(bgl)
  l.SafeFireRate = bgl
end})
bfu:Slider({Title = g({23, 59, 34, 122, 30, 51, 41, 46, 59, 52, 57, 63}, 90), Desc = g({25, 59, 42, 41, 122, 57, 53, 51, 52, 122, 46, 59, 40, 61, 63, 46, 51, 52, 61, 122, 113, 122, 62, 40, 53, 42, 122, 57, 53, 54, 54, 63, 57, 46, 51, 53, 52, 118, 122, 106, 122, 103, 122, 47, 52, 54, 51, 55, 51, 46, 63, 62}, 90), Value = {Min = 0, Max = 5000, Default = 0}, Step = 50, Callback = function(bgm)
  l.MaxDistance = bgm
end})
bfu:Toggle({Title = g({22, 63, 59, 44, 63, 122, 25, 53, 51, 52, 122, 21, 52, 122, 24, 40, 63, 59, 49}, 90), Value = true, Callback = function(bgn)
  l.LeaveOnBreak = bgn
end})
bfu:Toggle({Title = g({21, 52, 54, 35, 122, 24, 40, 63, 59, 49, 122, 9, 46, 40, 53, 52, 61, 63, 41, 46, 122, 24, 40, 63, 59, 49, 59, 56, 54, 63, 41}, 90), Desc = g({19, 61, 52, 53, 40, 63, 41, 122, 46, 50, 63, 122, 45, 63, 59, 49, 122, 57, 53, 51, 52, 122, 46, 51, 63, 40, 41, 122, 51, 52, 122, 59, 52, 122, 59, 40, 63, 59, 122, 59, 52, 62, 122, 53, 52, 54, 35, 122, 59, 46, 46, 59, 57, 49, 41, 122, 57, 53, 51, 52, 41, 122, 59, 46, 122, 46, 50, 63, 122, 46, 53, 42, 122, 50, 63, 59, 54, 46, 50, 122, 46, 51, 63, 40}, 90), Value = (l.StrongestOnly ~= false), Callback = function(bgo)
  l.StrongestOnly = bgo
end})
bfu:Section(g({27, 40, 63, 59, 122, 124, 122, 13, 53, 40, 54, 62}, 90))
local bgp = bfu:Slot()
local bgq = bfu:Slot()
bfu:Section(g({10, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52}, 90))
local bgr, bgs, bgt
bgr = bfu:Toggle({Title = g({27, 47, 46, 53, 122, 24, 63, 41, 46, 122, 27, 40, 63, 59}, 90), Desc = g({17, 63, 63, 42, 41, 122, 60, 59, 40, 55, 51, 52, 61, 122, 46, 50, 63, 122, 50, 51, 61, 50, 63, 41, 46, 122, 59, 40, 63, 59, 122, 35, 53, 47, 122, 53, 45, 52, 122, 51, 52, 122, 46, 50, 63, 122, 57, 47, 40, 40, 63, 52, 46, 122, 45, 53, 40, 54, 62}, 90), Value = (l.AutoBestArea == true), Callback = function(bgu)
  l.AutoBestArea = bgu
  if (((1 + 1) == 2) and bgu) then
    l.AutoWorldProgress, l.AutoCompleteGame = false, false
    bgs:Set(false, false, true)
    bgt:Set(false, false, true)
  end
end})
bgs = bfu:Toggle({Title = g({13, 53, 40, 54, 62, 122, 10, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52}, 90), Desc = g({28, 59, 40, 55, 41, 122, 47, 52, 46, 51, 54, 122, 63, 44, 63, 40, 35, 122, 59, 40, 63, 59, 122, 53, 60, 122, 46, 50, 63, 122, 45, 53, 40, 54, 62, 122, 51, 41, 122, 53, 45, 52, 63, 62, 122, 114, 56, 47, 35, 41, 122, 61, 59, 46, 63, 41, 115, 118, 122, 46, 50, 63, 52, 122, 55, 53, 44, 63, 41, 122, 46, 53, 122, 46, 50, 63, 122, 52, 63, 34, 46, 122, 45, 53, 40, 54, 62}, 90), Value = (l.AutoWorldProgress == true), Callback = function(bgv)
  l.AutoWorldProgress = bgv
  if (((15 * 15) == 225) and bgv) then
    l.AutoBestArea, l.AutoCompleteGame = false, false
    bgr:Set(false, false, true)
    bgt:Set(false, false, true)
    if (((100 % 7) == 2) and not l.AutoFarm) then
      l.AutoFarm = true
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52, 122, 63, 52, 59, 56, 54, 63, 62, 122, 27, 47, 46, 53, 122, 28, 59, 40, 55, 122, 60, 53, 40, 122, 35, 53, 47}, 90), g({51, 52, 60, 53}, 90))
    end
  end
end})
bgt = bfu:Toggle({Title = g({27, 47, 46, 53, 122, 25, 53, 55, 42, 54, 63, 46, 63, 122, 29, 59, 55, 63}, 90), Desc = g({28, 51, 34, 63, 62, 122, 40, 53, 47, 46, 63, 96, 122, 9, 42, 59, 45, 52, 122, 119, 100, 122, 28, 59, 52, 46, 59, 41, 35, 122, 119, 100, 122, 109, 116, 111, 24, 122, 28, 59, 52, 46, 59, 41, 35, 122, 25, 53, 51, 52, 41, 122, 119, 100, 122, 56, 59, 57, 49, 122, 46, 53, 122, 9, 42, 59, 45, 52, 122, 60, 53, 40, 122, 19, 57, 63, 122, 14, 63, 57, 50, 122, 119, 100, 122, 14, 63, 57, 50, 122, 119, 100, 122, 18, 59, 57, 49, 63, 40, 122, 10, 53, 40, 46, 59, 54, 122, 43, 47, 63, 41, 46, 41, 122, 119, 100, 122, 12, 53, 51, 62, 122, 119, 100, 122, 27, 34, 53, 54, 53, 46, 54, 122, 21, 57, 63, 59, 52, 122, 119, 100, 122, 10, 51, 34, 63, 54, 116, 122, 19, 61, 52, 53, 40, 63, 41, 122, 61, 59, 55, 63, 42, 59, 41, 41, 119, 53, 52, 54, 35, 122, 59, 40, 63, 59, 41, 122, 114, 12, 19, 10, 115, 116, 122, 28, 53, 40, 57, 63, 41, 122, 27, 47, 46, 53, 122, 28, 59, 40, 55, 122, 53, 52, 116, 122, 30, 51, 41, 59, 56, 54, 63, 41, 122, 51, 46, 41, 63, 54, 60, 122, 45, 50, 63, 52, 122, 62, 53, 52, 63, 116}, 90), Value = (l.AutoCompleteGame == true), Callback = function(bgw)
  l.AutoCompleteGame = bgw
  if (((12 * 12) == 144) and bgw) then
    l.AutoBestArea, l.AutoWorldProgress = false, false
    bgr:Set(false, false, true)
    bgs:Set(false, false, true)
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
bfu:Button({Title = g({13, 50, 59, 46, 122, 19, 41, 122, 19, 46, 122, 30, 53, 51, 52, 61, 101}, 90), Desc = g({9, 50, 53, 45, 41, 122, 46, 50, 63, 122, 42, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52, 122, 45, 53, 40, 49, 63, 40, 125, 41, 122, 57, 47, 40, 40, 63, 52, 46, 122, 41, 46, 59, 46, 47, 41}, 90), Callback = function()
  local bgx = ((k._progState and k._progState.note) or "")
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({10, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52, 96, 122}, 90) .. ((((bgx ~= "") and bgx) or g({51, 62, 54, 63}, 90)))), g({61, 59, 47, 61, 63}, 90))
end})
bfv:Section(g({18, 59, 46, 57, 50, 51, 52, 61}, 90))
local bgy = bfv:Slot()
bfv:Toggle({Title = g({27, 47, 46, 53, 122, 21, 42, 63, 52, 122, 31, 61, 61, 41}, 90), Desc = g({18, 59, 46, 57, 50, 63, 41, 122, 60, 40, 53, 55, 122, 59, 52, 35, 45, 50, 63, 40, 63, 122, 44, 51, 59, 122, 46, 63, 54, 63, 42, 53, 40, 46, 119, 60, 54, 51, 57, 49, 63, 40}, 90), Value = false, Callback = function(bgz)
  l.AutoEggs = bgz
  if (((100 % 7) == 2) and not bgz) then
    n.EggTpDone = nil
  end
end})
bfv:Dropdown({Title = g({18, 59, 46, 57, 50, 122, 27, 55, 53, 47, 52, 46}, 90), Desc = g({34, 98, 122, 52, 63, 63, 62, 41, 122, 46, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 24, 47, 35, 119, 98, 122, 47, 52, 54, 53, 57, 49, 97, 122, 45, 51, 46, 50, 53, 47, 46, 122, 51, 46, 122, 46, 50, 63, 122, 60, 59, 40, 55, 122, 60, 59, 54, 54, 41, 122, 56, 59, 57, 49, 122, 46, 53, 122, 34, 105, 116}, 90), Values = {g({34, 107}, 90), g({34, 105}, 90), g({34, 98}, 90)}, Value = g({34, 105}, 90), Callback = function(bha)
  l.EggAmount = ((((bha == g({34, 98}, 90))) and 8) or (((((bha == g({34, 105}, 90))) and 3) or 1)))
  n.OctupleWarned = false
end})
bfv:Toggle({Title = g({9, 49, 51, 42, 122, 18, 59, 46, 57, 50, 122, 27, 52, 51, 55, 59, 46, 51, 53, 52}, 90), Desc = g({30, 51, 41, 59, 56, 54, 63, 41, 122, 46, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 57, 47, 46, 41, 57, 63, 52, 63, 122, 54, 51, 41, 46, 63, 52, 63, 40}, 90), Value = true, Callback = function(bhb)
  l.SkipAnim = bhb
end})
bfv:Slider({Title = g({18, 59, 46, 57, 50, 122, 30, 63, 54, 59, 35}, 90), Desc = g({9, 63, 40, 44, 63, 40, 122, 63, 52, 60, 53, 40, 57, 63, 41, 122, 36, 106, 116, 98, 41, 122, 55, 51, 52, 51, 55, 47, 55, 122, 56, 63, 46, 45, 63, 63, 52, 122, 56, 47, 35, 41}, 90), Value = {Min = 0.8, Max = 3, Default = 0.8}, Step = 0.05, Callback = function(bhc)
  l.HatchDelay = bhc
end})
k._deleteToggle = nil
bga:Section(g({8, 47, 54, 63, 41}, 90))
local bhe = bga:Toggle({Title = g({27, 47, 46, 53, 119, 30, 63, 54, 63, 46, 63, 122, 28, 51, 54, 46, 63, 40}, 90), Desc = g({30, 63, 54, 63, 46, 63, 41, 122, 50, 59, 46, 57, 50, 63, 62, 122, 42, 63, 46, 41, 122, 53, 60, 122, 46, 50, 63, 122, 42, 51, 57, 49, 63, 62, 122, 40, 59, 40, 51, 46, 51, 63, 41, 122, 44, 51, 59, 122, 46, 50, 63, 122, 50, 47, 56, 122, 8270, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 59, 54, 45, 59, 35, 41, 122, 41, 59, 60, 63}, 90), Value = false, Callback = function(bhd)
  l.AutoDeleteFilter = bhd
end})
k._filterToggle = bhe
local bhg = bga:Toggle({Title = g({27, 47, 46, 53, 119, 30, 63, 54, 63, 46, 63, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 41}, 90), Desc = g({30, 63, 54, 63, 46, 63, 41, 122, 50, 59, 46, 57, 50, 63, 62, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 119, 40, 59, 40, 51, 46, 35, 122, 42, 63, 46, 41, 122, 59, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 114, 63, 34, 57, 63, 42, 46, 122, 18, 47, 61, 63, 41, 117, 14, 51, 46, 59, 52, 51, 57, 41, 118, 122, 54, 53, 57, 49, 63, 62, 118, 122, 59, 52, 62, 122, 35, 53, 47, 40, 122, 49, 63, 42, 46, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 44, 59, 40, 51, 59, 52, 46, 41, 115, 122, 8270, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 59, 54, 45, 59, 35, 41, 122, 41, 59, 60, 63}, 90), Value = (l.AutoDeleteExclusives == true), Callback = function(bhf)
  l.AutoDeleteExclusives = bhf
end})
k._exclDeleteToggle = bhg
local function bhh()
  task.spawn(function()
    local bhi = k.Library
    if (((12 * 12) == 144) and not bhi) then
      return
    end
    pcall(function()
      local bhj = bhi.Save.Get()
      if (((3 ^ 2) == 9) and (not bhj or not bhj.AutoDelete)) then
        return
      end
      for bhk, bhl in ipairs(am) do
        bhj.AutoDelete[bhl] = false
      end
      if (((7 * 7) == 49) and bhi.Variables) then
        bhi.Variables.AutoDeleteEnabled = false
      end
    end)
  end)
end
task.spawn(function()
  while (((1 + 1) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  if (((15 * 15) == 225) and (k.Gen == o)) then
    bhh()
  end
end)
bga:Section(g({8, 59, 40, 51, 46, 51, 63, 41, 122, 14, 53, 122, 30, 63, 54, 63, 46, 63}, 90))
local bhm = {}
for bhn, bho in ipairs(am) do
  bhm[bho] = bga:Toggle({Title = bho, Desc = g({27, 47, 46, 53, 119, 62, 63, 54, 63, 46, 63, 122, 50, 59, 46, 57, 50, 63, 62, 122, 42, 63, 46, 41, 122, 53, 60, 122, 46, 50, 51, 41, 122, 40, 59, 40, 51, 46, 35, 122, 114, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 41, 42, 59, 40, 63, 62, 115}, 90), Value = (l.DeleteRarities[bho] == true), Callback = function(bhp)
    l.DeleteRarities[bho] = (bhp or nil)
    bhh()
  end})
end
bga:Section(g({17, 63, 63, 42, 122, 12, 59, 40, 51, 59, 52, 46, 41, 122, 114, 42, 63, 40, 122, 40, 59, 40, 51, 46, 35, 115}, 90))
for bhq, bhr in ipairs(am) do
  bga:Dropdown({Title = bhr, Desc = (g({27, 55, 53, 52, 61, 122, 59, 40, 55, 63, 62, 122}, 90) .. (bhr .. g({122, 42, 63, 46, 41, 118, 122, 41, 42, 59, 40, 63, 122, 46, 50, 63, 41, 63, 122, 44, 59, 40, 51, 59, 52, 46, 41}, 90))), Values = {g({20, 53, 40, 55, 59, 54}, 90), g({29, 53, 54, 62, 63, 52}, 90), g({8, 59, 51, 52, 56, 53, 45}, 90), g({30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90), g({9, 50, 51, 52, 35}, 90)}, Multi = true, AllowNone = true, Value = {}, Callback = function(bhs)
    local bht = (((type(bhs) == g({46, 59, 56, 54, 63}, 90)) and bhs) or {bhs})
    l.KeepVariants[bhr] = ((((#bht > 0)) and bht) or nil)
  end})
end
k._rarityToggles = bhm
k._runOnHubThread = function(bhu)
  task.spawn(bhu)
end
bga:Section(g({10, 40, 53, 46, 63, 57, 46, 51, 53, 52, 41}, 90))
bga:Toggle({Title = g({20, 63, 44, 63, 40, 122, 30, 63, 54, 63, 46, 63, 122, 18, 47, 61, 63, 41, 122, 124, 122, 14, 51, 46, 59, 52, 51, 57, 41}, 90), Desc = g({22, 53, 57, 49, 63, 62, 122, 42, 63, 46, 41, 122, 59, 52, 62, 122, 63, 61, 61, 122, 51, 46, 63, 55, 41, 122, 59, 40, 63, 122, 59, 54, 45, 59, 35, 41, 122, 41, 59, 60, 63, 122, 40, 63, 61, 59, 40, 62, 54, 63, 41, 41, 122, 53, 60, 122, 41, 63, 46, 46, 51, 52, 61, 41}, 90), Value = true, Callback = function(bhv)
  l.ProtectHugeTitanic = bhv
end})
bga:Section(g({23, 59, 52, 47, 59, 54}, 90))
bga:Button({Title = g({8, 47, 52, 122, 30, 63, 54, 63, 46, 63, 122, 9, 45, 63, 63, 42, 122, 20, 53, 45}, 90), Desc = g({21, 52, 63, 119, 46, 51, 55, 63, 122, 41, 45, 63, 63, 42, 122, 53, 60, 122, 35, 53, 47, 40, 122, 57, 47, 40, 40, 63, 52, 46, 122, 51, 52, 44, 63, 52, 46, 53, 40, 35}, 90), Icon = g({46, 40, 59, 41, 50, 119, 104}, 90), Callback = function()
  if (((100 % 7) == 2) and n.DeleteScanning) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 122, 62, 63, 54, 63, 46, 63, 122, 41, 45, 63, 63, 42, 122, 51, 41, 122, 59, 54, 40, 63, 59, 62, 35, 122, 40, 47, 52, 52, 51, 52, 61}, 90), g({57, 54, 53, 57, 49}, 90))
    return
  end
  task.spawn(function()
    n.DeleteScanning = true
    local bhw, bhx = k._sweepAutoDelete()
    n.DeleteScanning = false
    if (((12 * 12) == 144) and bhx) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({30, 63, 54, 63, 46, 63, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. bhx), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    elseif (((3 ^ 2) == 9) and (bhw > 0)) then
      m.Deleted += bhw
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({30, 63, 54, 63, 46, 63, 62, 122}, 90) .. (bhw .. (g({122, 42, 63, 46}, 90) .. ((((bhw == 1) and "") or g({41}, 90)))))), g({57, 50, 63, 57, 49}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({20, 53, 122, 62, 63, 54, 63, 46, 59, 56, 54, 63, 122, 42, 63, 46, 41, 122, 60, 53, 47, 52, 62}, 90), g({51, 52, 60, 53}, 90))
    end
  end)
end})
bfz:Section(g({10, 51, 57, 49, 47, 42, 41}, 90))
bfz:Toggle({Title = g({27, 47, 46, 53, 122, 25, 53, 54, 54, 63, 57, 46, 122, 21, 40, 56, 41}, 90), Desc = g({8, 63, 55, 53, 46, 63, 122, 57, 54, 59, 51, 55, 122, 51, 52, 122, 56, 59, 46, 57, 50, 63, 41, 122, 53, 60, 122, 111, 122, 114, 41, 63, 40, 44, 63, 40, 122, 54, 51, 55, 51, 46, 115}, 90), Value = false, Callback = function(bhy)
  l.AutoOrbs = bhy
end})
bfz:Toggle({Title = g({27, 47, 46, 53, 122, 25, 53, 54, 54, 63, 57, 46, 122, 22, 53, 53, 46, 56, 59, 61, 41}, 90), Desc = g({8, 63, 55, 53, 46, 63, 122, 57, 53, 54, 54, 63, 57, 46, 51, 53, 52}, 90), Value = false, Callback = function(bhz)
  l.AutoBags = bhz
end})
bfz:Section(g({23, 59, 61, 52, 63, 46}, 90))
bfz:Toggle({Title = g({23, 59, 61, 52, 63, 46, 96, 122, 21, 40, 56, 41}, 90), Desc = g({10, 47, 54, 54, 41, 122, 31, 12, 31, 8, 3, 122, 53, 40, 56, 122, 53, 52, 122, 46, 50, 63, 122, 55, 59, 42, 122, 46, 53, 122, 35, 53, 47, 118, 122, 107, 106, 34, 122, 42, 63, 40, 122, 41, 63, 57, 53, 52, 62}, 90), Value = false, Callback = function(bia)
  l.MagnetOrbs = bia
end})
bfz:Toggle({Title = g({23, 59, 61, 52, 63, 46, 96, 122, 22, 53, 53, 46, 56, 59, 61, 41}, 90), Desc = g({14, 63, 54, 63, 42, 53, 40, 46, 41, 122, 54, 53, 53, 46, 56, 59, 61, 41, 122, 46, 53, 122, 35, 53, 47, 40, 122, 60, 63, 63, 46}, 90), Value = false, Callback = function(bib)
  l.MagnetBags = bib
end})
bfy:Section(g({10, 54, 59, 35, 46, 51, 55, 63, 122, 8, 63, 45, 59, 40, 62, 41}, 90))
bfy:Toggle({Title = g({27, 47, 46, 53, 122, 25, 54, 59, 51, 55, 122, 10, 54, 59, 35, 46, 51, 55, 63, 122, 29, 51, 60, 46, 41}, 90), Desc = g({25, 54, 59, 51, 55, 41, 122, 63, 44, 63, 40, 35, 122, 60, 40, 63, 63, 122, 42, 54, 59, 35, 46, 51, 55, 63, 122, 61, 51, 60, 46, 122, 46, 50, 63, 122, 55, 53, 55, 63, 52, 46, 122, 51, 46, 41, 122, 46, 51, 55, 63, 40, 122, 51, 41, 122, 40, 63, 59, 62, 35, 116, 122, 14, 50, 63, 122, 45, 50, 53, 54, 63, 122, 107, 104, 119, 61, 51, 60, 46, 122, 41, 63, 46, 122, 40, 63, 119, 59, 40, 55, 41, 122, 53, 52, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 125, 41, 122, 40, 63, 41, 63, 46, 122, 57, 54, 53, 57, 49, 122, 114, 36, 111, 122, 50, 115, 118, 122, 45, 50, 51, 57, 50, 122, 46, 50, 63, 122, 46, 51, 54, 63, 41, 122, 56, 63, 54, 53, 45, 122, 57, 53, 47, 52, 46, 122, 62, 53, 45, 52, 122, 46, 53, 116}, 90), Value = (l.AutoGifts == true), Callback = function(bic)
  l.AutoGifts = bic
end})
local bid = bfy:StatGrid({{Key = g({25, 54, 59, 51, 55, 63, 62}, 90), Title = g({25, 54, 59, 51, 55, 63, 62, 122, 117, 122, 14, 53, 46, 59, 54}, 90)}, {Key = g({8, 63, 41, 63, 46}, 90), Title = g({9, 63, 46, 122, 8, 63, 41, 63, 46, 41, 122, 19, 52}, 90)}})
k._refreshPlayTiles = function()
  local bie = k.Library
  if (((7 * 7) == 49) and not bie) then
    return
  end
  local bif, big, bih = 0, 0, nil
  pcall(function()
    for bii in pairs((bie.Directory.FreeGifts or {})) do
      bif += 1
    end
    local bij = bie.Save.Get()
    if (((1 + 1) == 2) and not bij) then
      return
    end
    local bik = bij.FreeGiftsRedeemed
    if (((15 * 15) == 225) and (type(bik) == g({46, 59, 56, 54, 63}, 90))) then
      big = #bik
    end
    local bil = tonumber(bij.FreeGiftsResetTime)
    if (((100 % 7) == 2) and bil) then
      bih = (bil - os.time())
    end
  end)
  bid.Claimed(string.format(g({127, 62, 122, 117, 122, 127, 62}, 90), big, bif))
  if (((12 * 12) == 144) and not bih) then
    bid.Reset(g({8270}, 90))
  elseif (((3 ^ 2) == 9) and (bih <= 0)) then
    bid.Reset(g({40, 63, 59, 62, 35}, 90))
  else
    bid.Reset(string.format(g({127, 62, 50, 122, 127, 106, 104, 62, 55}, 90), math.floor((bih / 3600)), math.floor(((bih % 3600) / 60))))
  end
end
local bim = {}
for bin, bio in ipairs(k.BOOSTS) do
  bim[bio.key] = bio
end
local bip, biq = {}, {}
for bir, bis in ipairs(k.BOOSTS) do
  local bit = string.format(g({127, 41, 122, 8270, 122, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 114, 127, 41, 115}, 90), bis.key, as(bis.price), bis.duration)
  table.insert(bip, bit)
  biq[bit] = bis.key
end
local biu
bgb:Section(g({24, 47, 35, 122, 124, 122, 15, 41, 63}, 90))
local biw = bgb:Dropdown({Title = g({24, 53, 53, 41, 46}, 90), Values = bip, Value = bip[1], Callback = function(biv)
  l.BoostKey = (biq[biv] or k.BOOSTS[1].key)
  biu()
end})
local biy = bgb:Slider({Title = g({27, 55, 53, 47, 52, 46}, 90), Desc = g({18, 53, 45, 122, 55, 59, 52, 35, 122, 46, 53, 122, 56, 47, 35}, 90), Value = {Min = 1, Max = 100, Default = 1}, Step = 1, Callback = function(bix)
  l.BoostAmount = bix
  biu()
end})
local bjf = bgb:Button({Title = g({24, 47, 35}, 90), Desc = g({10, 47, 40, 57, 50, 59, 41, 63, 122, 45, 51, 46, 50, 122, 62, 51, 59, 55, 53, 52, 62, 41}, 90), Icon = g({41, 50, 53, 42, 42, 51, 52, 61, 119, 57, 59, 40, 46}, 90), Callback = function()
  if (((7 * 7) == 49) and n.BoostBusy) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 122, 56, 53, 53, 41, 46, 122, 42, 47, 40, 57, 50, 59, 41, 63, 122, 51, 41, 122, 59, 54, 40, 63, 59, 62, 35, 122, 40, 47, 52, 52, 51, 52, 61}, 90), g({57, 54, 53, 57, 49}, 90))
    return
  end
  local biz = (bim[l.BoostKey] or k.BOOSTS[1])
  local bja = (l.BoostAmount or 1)
  n.BoostBusy = true
  task.spawn(function()
    pcall(function()
      BuyButton:SetTitle(string.format(g({24, 47, 35, 51, 52, 61, 122, 106, 117, 127, 62, 116, 116, 116}, 90), bja))
    end)
    local bjd, bje = k._buyBoosts(biz.key, bja, function(bjb, bjc)
      pcall(function()
        BuyButton:SetTitle(string.format(g({24, 47, 35, 51, 52, 61, 122, 127, 62, 117, 127, 62, 116, 116, 116}, 90), bjb, bjc))
      end)
    end)
    n.BoostBusy = false
    if (((1 + 1) == 2) and bje) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({24, 53, 47, 61, 50, 46, 122, 127, 62, 117, 127, 62, 122, 34, 122, 127, 41, 122, 8270, 122, 127, 41}, 90), bjd, bja, biz.key, bje), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({24, 53, 47, 61, 50, 46, 122, 127, 62, 122, 34, 122, 127, 41, 122, 60, 53, 40, 122, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41}, 90), bjd, biz.key, as((bjd * biz.price))), g({57, 50, 63, 57, 49}, 90))
    end
    biu()
  end)
end})
local bjh = bgb:Slider({Title = g({15, 41, 63, 122, 27, 55, 53, 47, 52, 46}, 90), Desc = g({18, 53, 45, 122, 55, 59, 52, 35, 122, 53, 45, 52, 63, 62, 122, 56, 53, 53, 41, 46, 41, 122, 46, 53, 122, 59, 57, 46, 51, 44, 59, 46, 63}, 90), Value = {Min = 1, Max = 100, Default = 1}, Step = 1, Callback = function(bjg)
  l.BoostUseAmount = bjg
  biu()
end})
local bjr = bgb:Button({Title = g({15, 41, 63, 122, 60, 40, 53, 55, 122, 19, 52, 44, 63, 52, 46, 53, 40, 35}, 90), Desc = g({27, 57, 46, 51, 44, 59, 46, 63, 122, 56, 53, 53, 41, 46, 41, 122, 35, 53, 47, 122, 59, 54, 40, 63, 59, 62, 35, 122, 53, 45, 52}, 90), Icon = g({42, 54, 59, 35}, 90), Callback = function()
  local bji = (bim[l.BoostKey] or k.BOOSTS[1])
  local bjj = n.PendingData
  local bjk = (((bjj and bjj.BoostInv) and ((bjj.BoostInv[bji.key] or 0))) or 0)
  local bjl = math.min((l.BoostUseAmount or 1), bjk)
  if (((15 * 15) == 225) and (bjl <= 0)) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({3, 53, 47, 122, 53, 45, 52, 122, 106, 122, 34, 122}, 90) .. bji.key), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    return
  end
  task.spawn(function()
    pcall(function()
      UseButton:SetTitle(string.format(g({15, 41, 51, 52, 61, 122, 106, 117, 127, 62, 116, 116, 116}, 90), bjl))
    end)
    k._activateBoosts(bji.key, bjl)
    pcall(function()
      UseButton:SetTitle(string.format(g({15, 41, 51, 52, 61, 122, 127, 62, 117, 127, 62, 116, 116, 116}, 90), bjl, bjl))
    end)
    local bjm = false
    local bjn = k.Library
    if (((100 % 7) == 2) and bjn) then
      for bjo = 1, 16 do
        task.wait(0.25)
        pcall(function()
          local bjp = bjn.Save.Get()
          local bjq = (tonumber(bjp.BoostsInventory[bji.key]) or 0)
          if (((12 * 12) == 144) and (bjq <= (bjk - bjl))) then
            bjm = true
          end
        end)
        if (((3 ^ 2) == 9) and bjm) then
          break
        end
      end
    end
    if (((7 * 7) == 49) and bjm) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({27, 57, 46, 51, 44, 59, 46, 63, 62, 122, 127, 62, 122, 34, 122, 127, 41, 122, 114, 127, 41, 122, 63, 59, 57, 50, 115}, 90), bjl, bji.key, bji.duration), g({57, 50, 63, 57, 49}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 57, 46, 51, 44, 59, 46, 51, 53, 52, 122, 50, 59, 62, 122, 52, 53, 122, 63, 60, 60, 63, 57, 46, 122, 8270, 122, 56, 53, 53, 41, 46, 41, 122, 57, 59, 52, 125, 46, 122, 56, 63, 122, 47, 41, 63, 62, 122, 51, 52, 122, 46, 50, 63, 122, 14, 40, 59, 62, 51, 52, 61, 122, 10, 54, 59, 32, 59}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    task.wait(0.5)
    biu()
  end)
end})
biu = function()
  local bjs = (bim[l.BoostKey] or k.BOOSTS[1])
  local bjt = (l.BoostAmount or 1)
  local bju = (bjs.price * bjt)
  local bjv = n.PendingData
  pcall(function()
    biy:SetTitle(string.format(g({27, 55, 53, 47, 52, 46, 122, 8270, 122, 9, 47, 56, 46, 53, 46, 59, 54, 96, 122, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41}, 90), as(bju)))
    local bjw = (bjv and bjv.Diamonds)
    local bjx = ""
    if (((1 + 1) == 2) and bjw) then
      if (((15 * 15) == 225) and (bjw < bju)) then
        bjx = string.format(g({122, 38, 122, 24, 59, 54, 59, 52, 57, 63, 96, 122, 127, 41, 122, 114, 41, 50, 53, 40, 46, 122, 127, 41, 123, 115}, 90), as(bjw), as((bju - bjw)))
      else
        bjx = string.format(g({122, 38, 122, 24, 59, 54, 59, 52, 57, 63, 96, 122, 127, 41, 122, 119, 100, 122, 127, 41}, 90), as(bjw), as((bjw - bju)))
      end
    end
    bjf:SetTitle(string.format(g({24, 47, 35, 122, 127, 62, 122, 34, 122, 127, 41, 122, 103, 122, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41, 127, 41}, 90), bjt, bjs.key, as(bju), bjx))
    local bjy = (((bjv and bjv.BoostInv) and ((bjv.BoostInv[bjs.key] or 0))) or 0)
    local bjz = ((bjv and bjv.BoostsActive) and bjv.BoostsActive[bjs.key])
    bjr:SetTitle(string.format(g({15, 41, 63, 122, 127, 62, 122, 34, 122, 127, 41, 122, 114, 53, 45, 52, 63, 62, 96, 122, 127, 62, 115}, 90), (l.BoostUseAmount or 1), bjs.key, bjy))
    local bka = ((bjz and ((g({27, 57, 46, 51, 44, 63, 96, 122}, 90) .. aw(bjz)))) or g({20, 53, 46, 122, 59, 57, 46, 51, 44, 63}, 90))
    if (((100 % 7) == 2) and (bjv and (bjv.World == g({14, 40, 59, 62, 51, 52, 61, 122, 10, 54, 59, 32, 59}, 90)))) then
      bka = (bka .. g({122, 38, 122, 14, 40, 59, 62, 51, 52, 61, 122, 10, 54, 59, 32, 59, 122, 56, 54, 53, 57, 49, 41, 122, 56, 53, 53, 41, 46, 122, 47, 41, 63}, 90))
    end
    biw:SetDesc(string.format(g({127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41, 118, 122, 54, 59, 41, 46, 41, 122, 127, 41, 122, 8270, 122, 127, 41}, 90), as(bjs.price), bjs.duration, bka))
  end)
end
biu()
function k._diamondPacks()
  local bkb = {}
  pcall(function()
    local bkc = game:GetService(g({8, 63, 42, 54, 51, 57, 59, 46, 63, 62, 9, 46, 53, 40, 59, 61, 63}, 90)):FindFirstChild(g({5, 5, 30, 19, 8, 31, 25, 14, 21, 8, 3}, 90))
    local bkd = (bkc and bkc:FindFirstChild(g({9, 50, 53, 42, 25, 53, 52, 60, 51, 61}, 90)))
    if (((12 * 12) == 144) and not bkd) then
      return
    end
    local bke = require(bkd)
    local bkf = (bke and bke.DiamondPacks)
    if (((3 ^ 2) == 9) and (type(bkf) ~= g({46, 59, 56, 54, 63}, 90))) then
      return
    end
    for bkg = 1, #bkf do
      local bkh = bkf[bkg]
      if (((7 * 7) == 49) and ((((type(bkh) == g({46, 59, 56, 54, 63}, 90)) and bkh.Currency) and tonumber(bkh.Cost)) and tonumber(bkh.Diamonds))) then
        bkb[(#bkb + 1)] = {index = bkg, currency = tostring(bkh.Currency), cost = tonumber(bkh.Cost), diamonds = tonumber(bkh.Diamonds)}
      end
    end
  end)
  return bkb
end
function k._dpLabel(bki)
  return string.format(g({121, 127, 62, 122, 122, 127, 41, 122, 127, 41, 122, 122, 119, 100, 122, 122, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41}, 90), bki.index, ao(bki.cost), bki.currency, ao(bki.diamonds))
end
function k._dpFind(bkj)
  for bkk, bkl in ipairs(k._diamondPacks()) do
    if (((1 + 1) == 2) and (bkl.index == tonumber(bkj))) then
      return bkl
    end
  end
  return nil
end
function k._buyDiamondPack(bkm, bkn)
  local bko, bkp, bkq = pcall(function()
    return bkm.Network.Invoke(g({24, 47, 35, 122, 30, 51, 59, 55, 53, 52, 62, 10, 59, 57, 49}, 90), tonumber(bkn))
  end)
  if (((15 * 15) == 225) and not bko) then
    return false, tostring(bkp)
  end
  if (((100 % 7) == 2) and (bkp == true)) then
    return true, nil
  end
  return false, tostring((bkq or g({40, 63, 60, 47, 41, 63, 62}, 90)))
end
bgb:Section(g({30, 51, 59, 55, 53, 52, 62, 122, 10, 59, 57, 49, 41, 122, 114, 60, 40, 63, 63, 118, 122, 52, 53, 122, 8, 53, 56, 47, 34, 115}, 90))
local bkr, bks, bkt = {}, {}, nil
for bku, bkv in ipairs(k._diamondPacks()) do
  local bkw = k._dpLabel(bkv)
  bkr[(#bkr + 1)] = bkw
  bks[bkw] = bkv
  if (((12 * 12) == 144) and (bkv.index == tonumber(l.DiamondPackIndex))) then
    bkt = bkw
  end
end
if (((3 ^ 2) == 9) and (#bkr == 0)) then
  bkr = {g({114, 41, 50, 53, 42, 122, 57, 53, 52, 60, 51, 61, 122, 52, 53, 46, 122, 54, 53, 59, 62, 63, 62, 115}, 90)}
elseif (((7 * 7) == 49) and not bkt) then
  bkt = bkr[#bkr]
  l.DiamondPackIndex = ((bks[bkt] and bks[bkt].index) or nil)
end
local bkx, bky
bkx = bgb:Dropdown({Title = g({10, 59, 57, 49, 122, 14, 53, 122, 24, 47, 35}, 90), Desc = g({10, 59, 51, 62, 122, 51, 52, 122, 60, 59, 40, 55, 59, 56, 54, 63, 122, 57, 47, 40, 40, 63, 52, 57, 35, 118, 122, 52, 53, 46, 122, 8, 53, 56, 47, 34, 116, 122, 10, 51, 57, 49, 122, 45, 50, 51, 57, 50, 122, 53, 52, 63, 122, 63, 44, 63, 40, 35, 122, 56, 47, 35, 122, 56, 63, 54, 53, 45, 122, 47, 41, 63, 41, 116}, 90), Values = bkr, Value = (bkt or bkr[1]), Callback = function(bkz)
  local bla = bks[bkz]
  l.DiamondPackIndex = ((bla and bla.index) or nil)
  n.DPBase = nil
end})
bgb:Button({Title = g({24, 47, 35, 122, 21, 52, 63, 122, 10, 59, 57, 49, 122, 20, 53, 45}, 90), Desc = g({9, 51, 52, 61, 54, 63, 122, 42, 47, 40, 57, 50, 59, 41, 63, 122, 53, 60, 122, 46, 50, 63, 122, 42, 59, 57, 49, 122, 59, 56, 53, 44, 63, 118, 122, 51, 61, 52, 53, 40, 51, 52, 61, 122, 46, 50, 63, 122, 51, 52, 46, 63, 40, 44, 59, 54, 122, 59, 52, 62, 122, 46, 50, 63, 122, 57, 59, 42, 116, 122, 9, 46, 51, 54, 54, 122, 40, 63, 41, 42, 63, 57, 46, 41, 122, 52, 53, 46, 50, 51, 52, 61, 122, 56, 47, 46, 122, 35, 53, 47, 40, 122, 56, 59, 54, 59, 52, 57, 63, 122, 8270, 122, 47, 41, 63, 122, 46, 50, 51, 41, 122, 46, 53, 122, 41, 59, 52, 51, 46, 35, 119, 57, 50, 63, 57, 49, 122, 46, 50, 63, 122, 42, 40, 51, 57, 63, 122, 56, 63, 60, 53, 40, 63, 122, 59, 40, 55, 51, 52, 61, 122, 59, 47, 46, 53, 119, 56, 47, 35, 116}, 90), Callback = function()
  task.spawn(function()
    local blb = k.Library
    if (((1 + 1) == 2) and not blb) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    local blc = k._dpFind(l.DiamondPackIndex)
    if (((15 * 15) == 225) and not blc) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 51, 57, 49, 122, 59, 122, 62, 51, 59, 55, 53, 52, 62, 122, 42, 59, 57, 49, 122, 60, 51, 40, 41, 46}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    local bld, ble = k._buyDiamondPack(blb, blc.index)
    if (((100 % 7) == 2) and bld) then
      n.DPBought = (((n.DPBought or 0)) + 1)
      n.DPGained = (((n.DPGained or 0)) + blc.diamonds)
      n.DPNote = g({55, 59, 52, 47, 59, 54, 122, 56, 47, 35}, 90)
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({24, 53, 47, 61, 50, 46, 122, 42, 59, 57, 49, 122, 121, 127, 62, 96, 122, 113, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41}, 90), blc.index, ao(blc.diamonds)), g({61, 63, 55}, 90))
    else
      n.DPNote = tostring(ble)
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({10, 59, 57, 49, 122, 40, 63, 60, 47, 41, 63, 62, 96, 122}, 90) .. tostring(ble)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
  end)
end})
bky = bgb:Toggle({Title = g({27, 47, 46, 53, 122, 24, 47, 35, 122, 30, 51, 59, 55, 53, 52, 62, 122, 10, 59, 57, 49, 41}, 90), Desc = g({17, 63, 63, 42, 41, 122, 56, 47, 35, 51, 52, 61, 122, 46, 50, 63, 122, 42, 59, 57, 49, 122, 59, 56, 53, 44, 63, 122, 53, 52, 122, 46, 50, 63, 122, 51, 52, 46, 63, 40, 44, 59, 54, 122, 56, 63, 54, 53, 45, 116, 122, 9, 45, 51, 46, 57, 50, 63, 41, 122, 51, 46, 41, 63, 54, 60, 122, 53, 60, 60, 122, 53, 52, 57, 63, 122, 46, 50, 63, 122, 42, 47, 40, 57, 50, 59, 41, 63, 122, 57, 59, 42, 122, 53, 40, 122, 46, 50, 63, 122, 62, 51, 59, 55, 53, 52, 62, 122, 46, 59, 40, 61, 63, 46, 122, 51, 41, 122, 55, 63, 46, 97, 122, 51, 60, 122, 35, 53, 47, 122, 41, 51, 55, 42, 54, 35, 122, 57, 59, 52, 52, 53, 46, 122, 59, 60, 60, 53, 40, 62, 122, 53, 52, 63, 122, 51, 46, 122, 51, 62, 54, 63, 41, 122, 59, 52, 62, 122, 45, 59, 51, 46, 41, 122, 60, 53, 40, 122, 35, 53, 47, 40, 122, 56, 59, 54, 59, 52, 57, 63, 122, 46, 53, 122, 60, 59, 40, 55, 122, 56, 59, 57, 49, 122, 47, 42, 116}, 90), Value = (l.AutoDiamondPacks == true), Callback = function(blf)
  l.AutoDiamondPacks = blf
  if (((12 * 12) == 144) and blf) then
    n.DPBase, n.DPBought, n.DPGained = nil, 0, 0
    n.DPNextAt, n.DPNote = 0, g({41, 46, 59, 40, 46, 51, 52, 61}, 90)
  end
end})
k._dpToggle = bky
bgb:Slider({Title = g({9, 63, 57, 53, 52, 62, 41, 122, 24, 63, 46, 45, 63, 63, 52, 122, 24, 47, 35, 41}, 90), Desc = g({9, 42, 59, 57, 51, 52, 61, 122, 56, 63, 46, 45, 63, 63, 52, 122, 42, 47, 40, 57, 50, 59, 41, 63, 41, 116, 122, 22, 53, 45, 122, 44, 59, 54, 47, 63, 41, 122, 59, 40, 63, 122, 60, 51, 52, 63, 122, 8270, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 122, 57, 50, 59, 40, 61, 63, 41, 122, 42, 63, 40, 122, 57, 59, 54, 54, 118, 122, 46, 50, 63, 40, 63, 122, 51, 41, 122, 52, 53, 122, 62, 51, 41, 57, 53, 47, 52, 46, 122, 60, 53, 40, 122, 50, 59, 55, 55, 63, 40, 51, 52, 61, 122, 51, 46, 116}, 90), Value = {Min = 1, Max = 60, Default = math.clamp((tonumber(l.DiamondPackInterval) or 5), 1, 60)}, Step = 1, Callback = function(blg)
  l.DiamondPackInterval = math.clamp(math.floor((tonumber(blg) or 5)), 1, 60)
end})
bgb:Slider({Title = g({23, 59, 34, 122, 24, 47, 35, 41, 122, 10, 63, 40, 122, 8, 47, 52}, 90), Desc = g({18, 59, 40, 62, 122, 41, 46, 53, 42, 122, 59, 60, 46, 63, 40, 122, 46, 50, 51, 41, 122, 55, 59, 52, 35, 122, 42, 47, 40, 57, 50, 59, 41, 63, 41, 118, 122, 57, 53, 47, 52, 46, 63, 62, 122, 60, 40, 53, 55, 122, 45, 50, 63, 52, 122, 35, 53, 47, 122, 41, 45, 51, 46, 57, 50, 63, 62, 122, 59, 47, 46, 53, 119, 56, 47, 35, 122, 53, 52, 116, 122, 9, 54, 51, 62, 63, 122, 46, 53, 122, 106, 122, 60, 53, 40, 122, 47, 52, 54, 51, 55, 51, 46, 63, 62, 122, 8270, 122, 51, 46, 122, 46, 50, 63, 52, 122, 56, 47, 35, 41, 122, 60, 53, 40, 63, 44, 63, 40, 122, 59, 52, 62, 122, 53, 52, 54, 35, 122, 46, 50, 63, 122, 57, 47, 40, 40, 63, 52, 57, 35, 122, 60, 54, 53, 53, 40, 118, 122, 46, 50, 63, 122, 62, 51, 59, 55, 53, 52, 62, 122, 46, 59, 40, 61, 63, 46, 122, 53, 40, 122, 35, 53, 47, 40, 122, 53, 45, 52, 122, 56, 59, 54, 59, 52, 57, 63, 122, 57, 59, 52, 122, 41, 46, 53, 42, 122, 51, 46, 116}, 90), Value = {Min = 0, Max = 1000, Default = math.clamp((tonumber(l.DiamondPackCap) or 0), 0, 1000)}, Step = 1, Callback = function(blh)
  l.DiamondPackCap = math.clamp(math.floor((tonumber(blh) or 0)), 0, 1000)
end})
bgb:Slider({Title = g({17, 63, 63, 42, 122, 127, 122, 21, 60, 122, 25, 47, 40, 40, 63, 52, 57, 35}, 90), Desc = g({28, 54, 53, 53, 40, 122, 60, 53, 40, 122, 46, 50, 63, 122, 42, 59, 57, 49, 125, 41, 122, 53, 45, 52, 122, 57, 47, 40, 40, 63, 52, 57, 35, 118, 122, 59, 41, 122, 59, 122, 42, 63, 40, 57, 63, 52, 46, 59, 61, 63, 122, 53, 60, 122, 45, 50, 59, 46, 122, 35, 53, 47, 122, 50, 63, 54, 62, 122, 45, 50, 63, 52, 122, 59, 47, 46, 53, 119, 56, 47, 35, 122, 41, 46, 59, 40, 46, 63, 62, 116, 122, 27, 46, 122, 106, 122, 51, 46, 122, 41, 42, 63, 52, 62, 41, 122, 62, 53, 45, 52, 122, 46, 53, 122, 46, 50, 63, 122, 54, 59, 41, 46, 122, 57, 53, 51, 52, 97, 122, 59, 46, 122, 111, 106, 122, 51, 46, 122, 41, 46, 53, 42, 41, 122, 53, 52, 57, 63, 122, 50, 59, 54, 60, 122, 35, 53, 47, 40, 122, 41, 46, 59, 40, 46, 51, 52, 61, 122, 56, 59, 54, 59, 52, 57, 63, 122, 51, 41, 122, 61, 53, 52, 63, 116}, 90), Value = {Min = 0, Max = 90, Default = math.clamp((tonumber(l.DiamondPackReservePct) or 0), 0, 90)}, Step = 5, Callback = function(bli)
  l.DiamondPackReservePct = math.clamp(math.floor((tonumber(bli) or 0)), 0, 90)
end})
bgb:Slider({Title = g({9, 46, 53, 42, 122, 27, 46, 122, 30, 51, 59, 55, 53, 52, 62, 41}, 90), Desc = g({9, 46, 53, 42, 41, 122, 53, 52, 57, 63, 122, 35, 53, 47, 40, 122, 62, 51, 59, 55, 53, 52, 62, 122, 57, 53, 47, 52, 46, 122, 40, 63, 59, 57, 50, 63, 41, 122, 46, 50, 51, 41, 116, 122, 22, 63, 59, 44, 63, 122, 59, 46, 122, 106, 122, 60, 53, 40, 122, 52, 53, 122, 46, 59, 40, 61, 63, 46, 116}, 90), Value = {Min = 0, Max = 500000000, Default = math.max(0, math.floor((tonumber(l.DiamondPackTarget) or 0)))}, Step = 5000000, Callback = function(blj)
  l.DiamondPackTarget = math.max(0, math.floor((tonumber(blj) or 0)))
end})
local blk = bgb:StatGrid({{Key = g({20, 63, 34, 46}, 90), Title = g({20, 63, 34, 46, 122, 24, 47, 35, 122, 19, 52}, 90)}, {Key = g({24, 59, 54}, 90), Title = g({25, 59, 52, 122, 27, 60, 60, 53, 40, 62}, 90)}, {Key = g({24, 53, 47, 61, 50, 46}, 90), Title = g({24, 53, 47, 61, 50, 46, 122, 117, 122, 25, 59, 42}, 90)}, {Key = g({29, 59, 51, 52, 63, 62}, 90), Title = g({30, 51, 59, 55, 53, 52, 62, 41, 122, 29, 59, 51, 52, 63, 62}, 90)}})
k._refreshDPTiles = function()
  local bll = k._dpFind(l.DiamondPackIndex)
  local blm = math.clamp(math.floor((tonumber(l.DiamondPackCap) or 0)), 0, 1000)
  blk.Bought(string.format(g({127, 41, 122, 117, 122, 127, 41}, 90), as((n.DPBought or 0)), ((((blm > 0) and as(blm)) or g({8772}, 90)))))
  blk.Gained(ao((n.DPGained or 0)))
  if (((3 ^ 2) == 9) and not bll) then
    blk.Bal(g({52, 53, 122, 42, 59, 57, 49}, 90))
  else
    local bln = 0
    pcall(function()
      local blo = (k.Library and k.Library.Save.Get())
      bln = ((blo and ((tonumber(blo[bll.currency]) or 0))) or 0)
    end)
    blk.Bal(string.format(g({127, 62, 34, 122, 114, 127, 41, 122, 127, 41, 115}, 90), math.floor((bln / math.max(1, bll.cost))), ao(bln), bll.currency))
  end
  if (((7 * 7) == 49) and not l.AutoDiamondPacks) then
    blk.Next(tostring((n.DPNote or g({53, 60, 60}, 90))))
  elseif (((1 + 1) == 2) and not bll) then
    blk.Next(g({52, 53, 122, 42, 59, 57, 49}, 90))
  else
    local blp = (((n.DPNextAt or 0)) - os.clock())
    if (((15 * 15) == 225) and ((((n.DPNextAt or 0)) <= 0) or (blp <= 0))) then
      blk.Next(g({52, 53, 45}, 90))
    else
      blk.Next(string.format(g({127, 62, 41}, 90), math.ceil(blp)))
    end
  end
end
bgb:Section(g({10, 53, 46, 51, 53, 52, 122, 17, 63, 63, 42, 63, 40}, 90))
bgb:Dropdown({Title = g({17, 63, 63, 42, 122, 9, 46, 53, 57, 49, 63, 62}, 90), Desc = g({20, 63, 44, 63, 40, 122, 40, 47, 52, 122, 53, 47, 46, 122, 53, 60, 122, 46, 50, 63, 41, 63, 122, 42, 53, 46, 51, 53, 52, 41, 122, 8270, 122, 59, 47, 46, 53, 119, 56, 47, 35, 41, 122, 113, 122, 59, 47, 46, 53, 119, 47, 41, 63, 41}, 90), Values = bip, Value = (function()
  local blq = {}
  for blr, bls in ipairs((l.PotionKeepBoosts or {})) do
    for blt, blu in ipairs(bip) do
      if (((100 % 7) == 2) and (biq[blu] == bls)) then
        table.insert(blq, blu)
        break
      end
    end
  end
  return ((((#blq > 0) and blq) or {bip[1]}))
end)(), Multi = true, Callback = function(blv)
  local blw = {}
  for blx, bly in ipairs((((type(blv) == g({46, 59, 56, 54, 63}, 90)) and blv) or {})) do
    local blz = biq[bly]
    if (((12 * 12) == 144) and blz) then
      table.insert(blw, blz)
    end
  end
  l.PotionKeepBoosts = blw
end})
bgb:Slider({Title = g({8, 63, 41, 46, 53, 57, 49, 122, 14, 53}, 90), Desc = g({24, 47, 35, 41, 122, 47, 52, 46, 51, 54, 122, 35, 53, 47, 122, 53, 45, 52, 122, 46, 50, 51, 41, 122, 55, 59, 52, 35, 122, 53, 60, 122, 63, 59, 57, 50, 122, 41, 63, 54, 63, 57, 46, 63, 62, 122, 42, 53, 46, 51, 53, 52}, 90), Value = {Min = 1, Max = 50, Default = (tonumber(l.PotionKeepStock) or 10)}, Step = 1, Callback = function(bma)
  l.PotionKeepStock = bma
end})
bgb:Toggle({Title = g({27, 47, 46, 53, 119, 15, 41, 63, 122, 13, 50, 63, 52, 122, 31, 34, 42, 51, 40, 63, 62}, 90), Desc = g({8, 63, 119, 59, 57, 46, 51, 44, 59, 46, 63, 41, 122, 59, 122, 42, 53, 46, 51, 53, 52, 122, 60, 40, 53, 55, 122, 35, 53, 47, 40, 122, 41, 46, 53, 57, 49, 122, 46, 50, 63, 122, 55, 53, 55, 63, 52, 46, 122, 46, 50, 63, 122, 53, 54, 62, 122, 53, 52, 63, 122, 40, 47, 52, 41, 122, 53, 47, 46}, 90), Value = (l.PotionAutoUse ~= false), Callback = function(bmb)
  l.PotionAutoUse = bmb
end})
bgb:Slider({Title = g({30, 51, 59, 55, 53, 52, 62, 122, 28, 54, 53, 53, 40}, 90), Desc = g({10, 53, 46, 51, 53, 52, 122, 17, 63, 63, 42, 63, 40, 122, 41, 46, 53, 42, 41, 122, 56, 47, 35, 51, 52, 61, 122, 51, 60, 122, 51, 46, 122, 45, 53, 47, 54, 62, 122, 62, 40, 53, 42, 122, 35, 53, 47, 122, 56, 63, 54, 53, 45, 122, 46, 50, 51, 41}, 90), Value = {Min = 0, Max = 10000000, Default = (tonumber(l.PotionDiamondFloor) or 100000)}, Step = 10000, Callback = function(bmc)
  l.PotionDiamondFloor = bmc
end})
bgc:Section(g({27, 47, 46, 53, 122, 31, 52, 57, 50, 59, 52, 46}, 90))
local bmd, bme
local bmh = bgc:Dropdown({Title = g({30, 63, 41, 51, 40, 63, 62, 122, 31, 52, 57, 50, 59, 52, 46, 114, 41, 115}, 90), Desc = g({27, 122, 42, 63, 46, 122, 51, 41, 122, 125, 62, 53, 52, 63, 125, 122, 53, 52, 57, 63, 122, 51, 46, 122, 40, 53, 54, 54, 41, 122, 27, 20, 3, 122, 53, 60, 122, 46, 50, 63, 41, 63, 116, 122, 10, 51, 57, 49, 122, 53, 52, 63, 122, 53, 40, 122, 41, 63, 44, 63, 40, 59, 54, 116}, 90), Values = an, Multi = true, AllowNone = true, Value = (l.EnchantDesired or {}), Callback = function(bmf)
  local bmg = (((type(bmf) == g({46, 59, 56, 54, 63}, 90)) and bmf) or ((((bmf ~= nil) and {bmf}) or {})))
  l.EnchantDesired = bmg
end})
bmd = bgc:Toggle({Title = g({27, 47, 46, 53, 122, 31, 52, 57, 50, 59, 52, 46}, 90), Desc = g({31, 52, 57, 50, 59, 52, 46, 41, 122, 59, 122, 56, 59, 46, 57, 50, 122, 53, 60, 122, 63, 54, 51, 61, 51, 56, 54, 63, 122, 42, 63, 46, 41, 122, 53, 44, 63, 40, 122, 59, 52, 62, 122, 53, 44, 63, 40, 122, 47, 52, 46, 51, 54, 122, 63, 59, 57, 50, 122, 53, 52, 63, 122, 50, 59, 41, 122, 59, 122, 62, 63, 41, 51, 40, 63, 62, 122, 63, 52, 57, 50, 59, 52, 46, 116, 122, 13, 27, 8, 20, 19, 20, 29, 96, 122, 40, 63, 42, 54, 59, 57, 63, 41, 122, 59, 52, 35, 122, 63, 34, 51, 41, 46, 51, 52, 61, 122, 63, 52, 57, 50, 59, 52, 46, 41, 122, 59, 52, 62, 122, 57, 53, 41, 46, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 42, 63, 40, 122, 40, 53, 54, 54, 116}, 90), Value = (l.AutoEnchant == true), Callback = function(bmi)
  l.AutoEnchant = bmi
  if (((3 ^ 2) == 9) and (bmi and (#((l.EnchantDesired or {})) == 0))) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 51, 57, 49, 122, 59, 122, 30, 63, 41, 51, 40, 63, 62, 122, 31, 52, 57, 50, 59, 52, 46, 122, 60, 51, 40, 41, 46, 122, 8270, 122, 63, 52, 57, 50, 59, 52, 46, 122, 51, 62, 54, 63, 41, 122, 47, 52, 46, 51, 54, 122, 35, 53, 47, 122, 62, 53}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
  end
end})
bgc:Slider({Title = g({24, 59, 46, 57, 50, 122, 9, 51, 32, 63}, 90), Desc = g({10, 63, 46, 41, 122, 63, 52, 57, 50, 59, 52, 46, 63, 62, 122, 42, 63, 40, 122, 45, 59, 44, 63, 122, 114, 60, 51, 40, 63, 62, 122, 57, 53, 52, 57, 47, 40, 40, 63, 52, 46, 54, 35, 122, 51, 52, 122, 61, 40, 53, 47, 42, 41, 122, 53, 60, 122, 105, 115}, 90), Value = {Min = 1, Max = 30, Default = math.clamp((tonumber(l.EnchantBatch) or 10), 1, 30)}, Step = 1, Callback = function(bmj)
  l.EnchantBatch = bmj
end})
bgc:Toggle({Title = g({9, 49, 51, 42, 122, 22, 53, 57, 49, 63, 62, 122, 10, 63, 46, 41}, 90), Desc = g({22, 63, 59, 44, 63, 41, 122, 35, 53, 47, 40, 122, 54, 53, 57, 49, 63, 62, 122, 42, 63, 46, 41, 122, 47, 52, 46, 53, 47, 57, 50, 63, 62, 122, 114, 40, 63, 57, 53, 55, 55, 63, 52, 62, 63, 62, 122, 8270, 122, 63, 52, 57, 50, 59, 52, 46, 51, 52, 61, 122, 53, 44, 63, 40, 45, 40, 51, 46, 63, 41, 122, 46, 50, 63, 51, 40, 122, 42, 53, 45, 63, 40, 41, 115}, 90), Value = (l.EnchantSkipLocked ~= false), Callback = function(bmk)
  l.EnchantSkipLocked = bmk
end})
bgc:Slider({Title = g({30, 51, 59, 55, 53, 52, 62, 122, 28, 54, 53, 53, 40}, 90), Desc = g({9, 46, 53, 42, 41, 122, 63, 52, 57, 50, 59, 52, 46, 51, 52, 61, 122, 56, 63, 60, 53, 40, 63, 122, 35, 53, 47, 40, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 45, 53, 47, 54, 62, 122, 62, 40, 53, 42, 122, 56, 63, 54, 53, 45, 122, 46, 50, 51, 41, 122, 114, 106, 122, 103, 122, 52, 53, 122, 54, 51, 55, 51, 46, 115}, 90), Value = {Min = 0, Max = 50000000, Default = (tonumber(l.EnchantDiamondFloor) or 0)}, Step = 10000, Callback = function(bml)
  l.EnchantDiamondFloor = bml
end})
bgc:Button({Title = g({31, 52, 57, 50, 59, 52, 46, 122, 20, 53, 45, 122, 114, 53, 52, 63, 122, 45, 59, 44, 63, 115}, 90), Desc = g({8, 47, 52, 41, 122, 59, 122, 41, 51, 52, 61, 54, 63, 122, 56, 59, 46, 57, 50, 122, 51, 55, 55, 63, 62, 51, 59, 46, 63, 54, 35, 118, 122, 45, 51, 46, 50, 53, 47, 46, 122, 46, 47, 40, 52, 51, 52, 61, 122, 27, 47, 46, 53, 122, 31, 52, 57, 50, 59, 52, 46, 122, 53, 52}, 90), Icon = g({41, 42, 59, 40, 49, 54, 63, 41}, 90), Callback = function()
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
    local bmm, bmn, bmo = g({51, 62, 54, 63}, 90)
    pcall(function()
      bmm, bmn, bmo = k._enchantOnce(k.Library)
    end)
    n.EnchantBusy = false
    if (((15 * 15) == 225) and (bmm == g({40, 59, 52}, 90))) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({31, 52, 57, 50, 59, 52, 46, 63, 62, 122, 127, 62, 122, 42, 63, 46, 114, 41, 115, 118, 122, 127, 62, 122, 61, 53, 46, 122, 59, 122, 62, 63, 41, 51, 40, 63, 62, 122, 63, 52, 57, 50, 59, 52, 46}, 90), (bmn or 0), (bmo or 0)), g({41, 42, 59, 40, 49, 54, 63, 41}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({31, 52, 57, 50, 59, 52, 46, 96, 122}, 90) .. ((n.EnchantNote or tostring(bmm)))), g({51, 52, 60, 53}, 90))
    end
  end)
end})
bme = bgc:Button({Title = g({13, 50, 59, 46, 122, 19, 41, 122, 19, 46, 122, 30, 53, 51, 52, 61, 101}, 90), Desc = g({9, 50, 53, 45, 41, 122, 46, 50, 63, 122, 59, 47, 46, 53, 119, 63, 52, 57, 50, 59, 52, 46, 122, 45, 53, 40, 49, 63, 40, 125, 41, 122, 57, 47, 40, 40, 63, 52, 46, 122, 41, 46, 59, 46, 47, 41}, 90), Icon = g({61, 59, 47, 61, 63}, 90), Callback = function()
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({31, 52, 57, 50, 59, 52, 46, 96, 122}, 90) .. ((n.EnchantNote or g({51, 62, 54, 63}, 90)))), g({61, 59, 47, 61, 63}, 90))
end})
bgd:Section(g({30, 51, 41, 57, 53, 40, 62, 122, 13, 63, 56, 50, 53, 53, 49}, 90))
bgd:Input({Title = g({13, 63, 56, 50, 53, 53, 49, 122, 15, 8, 22}, 90), Desc = g({30, 51, 41, 57, 53, 40, 62, 122, 45, 63, 56, 50, 53, 53, 49, 122, 54, 51, 52, 49, 122, 114, 50, 46, 46, 42, 41, 96, 117, 117, 62, 51, 41, 57, 53, 40, 62, 116, 57, 53, 55, 117, 59, 42, 51, 117, 45, 63, 56, 50, 53, 53, 49, 41, 117, 116, 116, 116, 115}, 90), Placeholder = g({50, 46, 46, 42, 41, 96, 117, 117, 62, 51, 41, 57, 53, 40, 62, 116, 57, 53, 55, 117, 59, 42, 51, 117, 45, 63, 56, 50, 53, 53, 49, 41, 117, 116, 116, 116}, 90), Callback = function(bmp)
  l.WebhookURL = bmp
end})
bgd:Toggle({Title = g({20, 53, 46, 51, 60, 35, 122, 21, 52, 122, 18, 47, 61, 63, 122, 18, 59, 46, 57, 50}, 90), Desc = g({10, 53, 41, 46, 41, 122, 59, 52, 122, 63, 55, 56, 63, 62, 122, 45, 51, 46, 50, 122, 42, 63, 46, 118, 122, 57, 50, 59, 52, 57, 63, 118, 122, 51, 55, 59, 61, 63, 122, 59, 52, 62, 122, 47, 41, 63, 40, 52, 59, 55, 63}, 90), Value = false, Callback = function(bmq)
  l.WebhookEnabled = bmq
end})
bgd:Section(g({27, 54, 63, 40, 46, 41, 122, 124, 122, 16, 53, 47, 40, 52, 59, 54}, 90))
bgd:Toggle({Title = g({17, 51, 57, 49, 122, 27, 54, 63, 40, 46}, 90), Desc = g({30, 23, 41, 122, 35, 53, 47, 122, 46, 50, 63, 122, 55, 53, 55, 63, 52, 46, 122, 46, 50, 51, 41, 122, 59, 57, 57, 53, 47, 52, 46, 122, 61, 63, 46, 41, 122, 49, 51, 57, 49, 63, 62, 122, 53, 40, 122, 62, 51, 41, 57, 53, 52, 52, 63, 57, 46, 63, 62, 122, 114, 45, 51, 46, 50, 122, 41, 63, 41, 41, 51, 53, 52, 122, 46, 53, 46, 59, 54, 41, 115}, 90), Value = (l.KickAlert ~= false), Callback = function(bmr)
  l.KickAlert = bmr
end})
bgd:Toggle({Title = g({14, 40, 59, 62, 63, 122, 16, 53, 47, 40, 52, 59, 54}, 90), Desc = g({22, 53, 61, 41, 122, 63, 44, 63, 40, 35, 122, 57, 53, 55, 42, 54, 63, 46, 63, 62, 122, 46, 40, 59, 62, 63, 122, 46, 53, 122, 30, 51, 41, 57, 53, 40, 62, 122, 60, 40, 53, 55, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 125, 41, 122, 53, 45, 52, 122, 46, 40, 59, 62, 63, 122, 50, 51, 41, 46, 53, 40, 35}, 90), Value = (l.TradeJournal == true), Callback = function(bms)
  l.TradeJournal = bms
  if (((100 % 7) == 2) and not bms) then
    n.TradeSeen = nil
  end
end})
bgd:Button({Title = g({9, 63, 52, 62, 122, 14, 63, 41, 46, 122, 13, 63, 56, 50, 53, 53, 49}, 90), Desc = g({10, 53, 41, 46, 41, 122, 59, 122, 41, 59, 55, 42, 54, 63, 122, 18, 47, 61, 63, 122, 63, 55, 56, 63, 62, 122, 46, 53, 122, 57, 50, 63, 57, 49, 122, 46, 50, 63, 122, 15, 8, 22}, 90), Icon = g({41, 63, 52, 62}, 90), Callback = function()
  task.spawn(function()
    local bmt, bmu = k._testWebhook()
    if (((12 * 12) == 144) and bmt) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({14, 63, 41, 46, 122, 45, 63, 56, 50, 53, 53, 49, 122, 41, 63, 52, 46}, 90), g({57, 50, 63, 57, 49}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({13, 63, 56, 50, 53, 53, 49, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring(bmu)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
  end)
end})
bfv:Section(g({14, 63, 54, 63, 42, 53, 40, 46}, 90))
bfv:Toggle({Title = g({14, 63, 54, 63, 42, 53, 40, 46, 122, 14, 53, 122, 31, 61, 61, 122, 13, 50, 63, 52, 122, 18, 59, 46, 57, 50, 51, 52, 61}, 90), Desc = g({14, 63, 54, 63, 42, 53, 40, 46, 41, 122, 35, 53, 47, 122, 52, 63, 34, 46, 122, 46, 53, 122, 46, 50, 63, 122, 41, 63, 54, 63, 57, 46, 63, 62, 122, 63, 61, 61, 122, 21, 20, 25, 31, 122, 45, 50, 63, 52, 122, 50, 59, 46, 57, 50, 51, 52, 61, 122, 41, 46, 59, 40, 46, 41, 122, 114, 59, 52, 62, 122, 59, 60, 46, 63, 40, 122, 63, 59, 57, 50, 122, 45, 53, 40, 54, 62, 122, 41, 45, 51, 46, 57, 50, 115, 116, 122, 3, 53, 47, 122, 57, 59, 52, 122, 45, 59, 54, 49, 122, 59, 45, 59, 35, 122, 60, 40, 63, 63, 54, 35, 122, 59, 60, 46, 63, 40, 45, 59, 40, 62, 41, 116}, 90), Value = (l.EggStay == true), Callback = function(bmv)
  l.EggStay = bmv
  if (((3 ^ 2) == 9) and not bmv) then
    n.EggTpDone = nil
  end
end})
bfv:Button({Title = g({14, 63, 54, 63, 42, 53, 40, 46, 122, 14, 53, 122, 9, 63, 54, 63, 57, 46, 63, 62, 122, 31, 61, 61, 122, 20, 53, 45}, 90), Desc = g({21, 52, 63, 119, 41, 50, 53, 46, 96, 122, 41, 46, 59, 52, 62, 122, 53, 52, 122, 35, 53, 47, 40, 122, 57, 47, 40, 40, 63, 52, 46, 122, 41, 51, 62, 63, 122, 53, 60, 122, 46, 50, 63, 122, 63, 61, 61, 122, 57, 50, 53, 41, 63, 52, 122, 59, 56, 53, 44, 63, 118, 122, 60, 59, 57, 51, 52, 61, 122, 51, 46}, 90), Callback = function()
  task.spawn(function()
    local bmw, bmx = (k._teleportToEgg and k._teleportToEgg())
    if (((7 * 7) == 49) and bmw) then
      local bmy = k.Config.EggKey
      k.State.EggTpDone = ((bmy and ((bmy .. g({26, 55, 59, 52, 47, 59, 54}, 90)))) or nil)
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({14, 63, 54, 63, 42, 53, 40, 46, 63, 62, 122, 46, 53, 122, 63, 61, 61}, 90), g({57, 50, 63, 57, 49}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({14, 63, 54, 63, 42, 53, 40, 46, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring(bmx)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
  end)
end})
bfv:Section(g({31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 31, 61, 61}, 90))
local bna = bfv:Toggle({Title = g({27, 47, 46, 53, 122, 21, 42, 63, 52, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 31, 61, 61}, 90), Desc = g({24, 47, 35, 41, 122, 46, 50, 63, 122, 63, 34, 57, 54, 47, 41, 51, 44, 63, 122, 63, 61, 61, 122, 114, 35, 53, 47, 40, 122, 41, 63, 54, 63, 57, 46, 63, 62, 122, 63, 61, 61, 118, 122, 30, 51, 59, 55, 53, 52, 62, 41, 115, 122, 53, 52, 122, 59, 122, 54, 53, 53, 42, 116, 122, 10, 59, 47, 41, 63, 41, 122, 45, 50, 51, 54, 63, 122, 59, 122, 18, 47, 61, 63, 122, 51, 41, 122, 43, 47, 63, 47, 63, 62, 122, 60, 53, 40, 122, 46, 40, 59, 62, 63, 118, 122, 40, 63, 41, 47, 55, 63, 41, 122, 53, 52, 57, 63, 122, 51, 46, 125, 41, 122, 46, 40, 59, 62, 63, 62, 116}, 90), Value = (l.AutoOpenExclusive == true), Callback = function(bmz)
  l.AutoOpenExclusive = bmz
  if (((1 + 1) == 2) and bmz) then
    n.ExclusivePaused = false
  end
end})
k._exEggToggle = bna
bfv:Slider({Title = g({31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 31, 61, 61, 122, 30, 63, 54, 59, 35}, 90), Desc = g({9, 63, 57, 53, 52, 62, 41, 122, 56, 63, 46, 45, 63, 63, 52, 122, 63, 34, 57, 54, 47, 41, 51, 44, 63, 122, 63, 61, 61, 122, 56, 47, 35, 41, 122, 114, 41, 63, 40, 44, 63, 40, 122, 63, 52, 60, 53, 40, 57, 63, 41, 122, 36, 106, 116, 98, 41, 122, 55, 51, 52, 51, 55, 47, 55, 115}, 90), Value = {Min = 0.8, Max = 5, Default = 1}, Step = 0.1, Callback = function(bnb)
  l.ExclusiveOpenDelay = bnb
end})
bfv:Section(g({18, 47, 61, 63, 122, 14, 40, 59, 62, 51, 52, 61}, 90))
bfv:Input({Title = g({14, 40, 59, 62, 63, 122, 18, 47, 61, 63, 41, 122, 14, 53, 122, 114, 47, 41, 63, 40, 52, 59, 55, 63, 115}, 90), Desc = g({23, 47, 41, 46, 122, 56, 63, 122, 51, 52, 122, 46, 50, 51, 41, 122, 41, 63, 40, 44, 63, 40, 116, 122, 14, 50, 63, 35, 122, 59, 57, 57, 63, 42, 46, 122, 46, 50, 63, 122, 51, 52, 44, 51, 46, 63, 122, 113, 122, 46, 40, 59, 62, 63, 122, 53, 52, 122, 46, 50, 63, 51, 40, 122, 41, 51, 62, 63, 116}, 90), Placeholder = g({15, 41, 63, 40, 52, 59, 55, 63}, 90), Callback = function(bnc)
  l.TradeTarget = bnc
end})
local bne = bfv:Toggle({Title = g({27, 47, 46, 53, 122, 14, 40, 59, 62, 63, 122, 18, 47, 61, 63, 41, 122, 27, 60, 46, 63, 40, 122, 18, 59, 46, 57, 50}, 90), Desc = g({14, 40, 59, 62, 63, 41, 122, 59, 52, 35, 122, 50, 59, 46, 57, 50, 63, 62, 122, 18, 47, 61, 63, 122, 46, 53, 122, 46, 50, 63, 122, 47, 41, 63, 40, 122, 59, 56, 53, 44, 63, 122, 59, 52, 62, 122, 59, 57, 57, 63, 42, 46, 41, 116, 122, 31, 61, 61, 122, 53, 42, 63, 52, 51, 52, 61, 122, 40, 63, 41, 47, 55, 63, 41, 122, 53, 52, 57, 63, 122, 51, 46, 125, 41, 122, 61, 53, 52, 63, 116}, 90), Value = false, Callback = function(bnd)
  l.AutoTradeHuges = bnd
end})
k._tradeToggle = bne
bfx:Section(g({29, 53, 54, 62, 63, 52, 122, 124, 122, 8, 59, 51, 52, 56, 53, 45, 122, 23, 59, 57, 50, 51, 52, 63, 41}, 90))
local bng = bfx:Toggle({Title = g({27, 47, 46, 53, 122, 23, 59, 49, 63, 122, 29, 53, 54, 62, 63, 52, 122, 114, 107, 106, 106, 127, 115}, 90), Desc = g({28, 63, 63, 62, 41, 122, 63, 34, 59, 57, 46, 54, 35, 122, 108, 122, 51, 62, 63, 52, 46, 51, 57, 59, 54, 122, 42, 54, 59, 51, 52, 122, 42, 63, 46, 41, 122, 51, 52, 46, 53, 122, 46, 50, 63, 122, 29, 53, 54, 62, 63, 52, 122, 23, 59, 57, 50, 51, 52, 63, 122, 8270, 122, 46, 50, 63, 122, 61, 47, 59, 40, 59, 52, 46, 63, 63, 62, 122, 40, 53, 45, 118, 122, 41, 53, 122, 52, 53, 46, 50, 51, 52, 61, 122, 51, 41, 122, 63, 44, 63, 40, 122, 61, 59, 55, 56, 54, 63, 62, 116, 122, 107, 118, 104, 111, 106, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 42, 63, 40, 122, 29, 53, 54, 62, 63, 52, 116}, 90), Value = (l.AutoGolden == true), Callback = function(bnf)
  l.AutoGolden = bnf
  if (((15 * 15) == 225) and bnf) then
    n.GoldenErrShown = false
    n.GoldenIdleNotified = false
  end
end})
k._goldenToggle = bng
local bni = bfx:Toggle({Title = g({27, 47, 46, 53, 122, 23, 59, 49, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 114, 107, 106, 106, 127, 115}, 90), Desc = g({28, 63, 63, 62, 41, 122, 63, 34, 59, 57, 46, 54, 35, 122, 108, 122, 51, 62, 63, 52, 46, 51, 57, 59, 54, 122, 29, 53, 54, 62, 63, 52, 122, 42, 63, 46, 41, 122, 51, 52, 46, 53, 122, 46, 50, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 23, 59, 57, 50, 51, 52, 63, 122, 8270, 122, 59, 54, 41, 53, 122, 46, 50, 63, 122, 61, 47, 59, 40, 59, 52, 46, 63, 63, 62, 122, 40, 53, 45, 116, 122, 104, 118, 104, 111, 106, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 42, 63, 40, 122, 8, 59, 51, 52, 56, 53, 45, 116, 122, 8, 47, 52, 122, 46, 50, 51, 41, 122, 45, 51, 46, 50, 122, 27, 47, 46, 53, 122, 29, 53, 54, 62, 63, 52, 122, 46, 53, 122, 57, 50, 59, 51, 52, 122, 42, 54, 59, 51, 52, 122, 42, 63, 46, 41, 122, 59, 54, 54, 122, 46, 50, 63, 122, 45, 59, 35, 122, 46, 53, 122, 8, 59, 51, 52, 56, 53, 45, 116}, 90), Value = (l.AutoRainbow == true), Callback = function(bnh)
  l.AutoRainbow = bnh
  if (((100 % 7) == 2) and bnh) then
    n.RainbowErrShown = false
    n.RainbowIdleNotified = false
  end
end})
k._rainbowToggle = bni
bfx:Input({Title = g({30, 51, 59, 55, 53, 52, 62, 122, 28, 54, 53, 53, 40}, 90), Desc = g({24, 53, 46, 50, 122, 55, 59, 57, 50, 51, 52, 63, 41, 122, 42, 59, 47, 41, 63, 122, 40, 59, 46, 50, 63, 40, 122, 46, 50, 59, 52, 122, 41, 42, 63, 52, 62, 122, 56, 63, 54, 53, 45, 122, 46, 50, 51, 41, 122, 55, 59, 52, 35, 122, 30, 51, 59, 55, 53, 52, 62, 41, 116, 122, 24, 54, 59, 52, 49, 117, 106, 122, 103, 122, 41, 42, 63, 52, 62, 122, 60, 40, 63, 63, 54, 35, 116, 122, 10, 40, 63, 41, 41, 122, 31, 52, 46, 63, 40, 122, 46, 53, 122, 41, 63, 46, 116}, 90), Placeholder = g({63, 116, 61, 116, 122, 107, 106, 106, 106, 106, 106, 106}, 90), Callback = function(bnj)
  local bnk = tonumber((tostring(bnj):gsub(g({1, 4, 127, 62, 127, 116, 7}, 90), "")))
  l.MachineDiamondFloor = math.max(0, (bnk or 0))
  n.MachineBrokeNotified = false
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({23, 59, 57, 50, 51, 52, 63, 122, 62, 51, 59, 55, 53, 52, 62, 122, 60, 54, 53, 53, 40, 122, 41, 63, 46, 122, 46, 53, 122}, 90) .. tostring(math.floor(l.MachineDiamondFloor))), g({57, 50, 63, 57, 49}, 90))
end})
bfx:Button({Title = g({23, 59, 49, 63, 122, 21, 52, 63, 122, 29, 53, 54, 62, 63, 52, 122, 20, 53, 45}, 90), Desc = g({21, 52, 63, 122, 61, 47, 59, 40, 59, 52, 46, 63, 63, 62, 122, 108, 119, 42, 63, 46, 122, 57, 53, 52, 44, 63, 40, 41, 51, 53, 52, 116, 122, 8, 47, 52, 41, 122, 63, 44, 63, 52, 122, 45, 51, 46, 50, 122, 46, 50, 63, 122, 46, 53, 61, 61, 54, 63, 122, 53, 60, 60, 116}, 90), Callback = function()
  task.spawn(function()
    local bnl = k.Library
    if (((12 * 12) == 144) and not bnl) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    pcall(qb, bnl, g({61, 53, 54, 62, 63, 52}, 90))
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (n.GoldenNote or g({62, 53, 52, 63}, 90)), g({41, 42, 59, 40, 49, 54, 63, 41}, 90))
  end)
end})
bfx:Button({Title = g({23, 59, 49, 63, 122, 21, 52, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 20, 53, 45}, 90), Desc = g({21, 52, 63, 122, 61, 47, 59, 40, 59, 52, 46, 63, 63, 62, 122, 108, 119, 29, 53, 54, 62, 63, 52, 122, 57, 53, 52, 44, 63, 40, 41, 51, 53, 52, 116, 122, 8, 47, 52, 41, 122, 63, 44, 63, 52, 122, 45, 51, 46, 50, 122, 46, 50, 63, 122, 46, 53, 61, 61, 54, 63, 122, 53, 60, 60, 116}, 90), Callback = function()
  task.spawn(function()
    local bnm = k.Library
    if (((3 ^ 2) == 9) and not bnm) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    pcall(qb, bnm, g({40, 59, 51, 52, 56, 53, 45}, 90))
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (n.RainbowNote or g({62, 53, 52, 63}, 90)), g({41, 42, 59, 40, 49, 54, 63, 41}, 90))
  end)
end})
bfx:Section(g({30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90))
local bnn = bfx:Slot()
local bno = {}
local bnp = nil
bfx:Toggle({Title = g({27, 47, 46, 53, 122, 23, 59, 49, 63, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90), Desc = g({25, 53, 52, 44, 63, 40, 46, 41, 122, 35, 53, 47, 40, 122, 8, 59, 51, 52, 56, 53, 45, 122, 53, 60, 122, 46, 50, 63, 122, 42, 63, 46, 122, 59, 56, 53, 44, 63, 122, 53, 52, 63, 122, 59, 46, 122, 59, 122, 46, 51, 55, 63, 122, 114, 107, 96, 107, 122, 8648, 122, 63, 59, 57, 50, 122, 56, 63, 57, 53, 55, 63, 41, 122, 51, 46, 41, 122, 53, 45, 52, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 42, 63, 46, 115, 96, 122, 109, 118, 111, 106, 106, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 57, 53, 52, 44, 63, 40, 46, 122, 113, 122, 107, 118, 106, 106, 106, 118, 106, 106, 106, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 41, 49, 51, 42, 122, 42, 63, 40, 122, 42, 63, 46, 118, 122, 51, 52, 41, 46, 59, 52, 46, 122, 57, 54, 59, 51, 55, 116}, 90), Value = (l.AutoDarkMatter == true), Callback = function(bnq)
  l.AutoDarkMatter = bnq
  if (((7 * 7) == 49) and bnq) then
    n.DMIdleNotified = false
  end
end})
bfx:Toggle({Title = g({27, 47, 46, 53, 122, 9, 49, 51, 42, 122, 14, 51, 55, 63, 40, 122, 114, 29, 63, 55, 41, 115}, 90), Desc = g({10, 59, 35, 41, 122, 107, 118, 106, 106, 106, 118, 106, 106, 106, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 42, 63, 40, 122, 41, 54, 53, 46, 122, 46, 53, 122, 41, 49, 51, 42, 122, 46, 50, 63, 122, 46, 51, 55, 63, 40, 122, 59, 52, 62, 122, 57, 54, 59, 51, 55, 122, 51, 52, 41, 46, 59, 52, 46, 54, 35, 116, 122, 21, 60, 60, 122, 103, 122, 54, 63, 46, 122, 46, 50, 63, 122, 46, 51, 55, 63, 40, 41, 122, 40, 47, 52, 122, 60, 53, 40, 122, 60, 40, 63, 63, 116}, 90), Value = (l.DMAutoSkip ~= false), Callback = function(bnr)
  l.DMAutoSkip = bnr
  n.DMBrokeNotified = false
end})
local bnu = bfx:Input({Title = g({17, 63, 63, 42, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 27, 56, 53, 44, 63}, 90), Desc = g({9, 46, 53, 42, 122, 41, 42, 63, 52, 62, 51, 52, 61, 122, 53, 52, 122, 57, 53, 52, 44, 63, 40, 46, 117, 41, 49, 51, 42, 122, 53, 52, 57, 63, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 45, 53, 47, 54, 62, 122, 62, 40, 53, 42, 122, 56, 63, 54, 53, 45, 122, 46, 50, 51, 41, 116, 122, 10, 40, 63, 41, 41, 122, 31, 52, 46, 63, 40, 122, 46, 53, 122, 41, 63, 46, 116}, 90), Placeholder = g({63, 116, 61, 116, 122, 111, 106, 106, 106, 106, 106, 106}, 90), Callback = function(bns)
  local bnt = tonumber((tostring(bns):gsub(g({1, 4, 127, 62, 127, 116, 7}, 90), "")))
  l.DMDiamondFloor = (bnt or 0)
  n.DMBrokeNotified = false
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({30, 51, 59, 55, 53, 52, 62, 122, 60, 54, 53, 53, 40, 122, 41, 63, 46, 122, 46, 53, 122}, 90) .. tostring(math.floor(l.DMDiamondFloor))), g({57, 50, 63, 57, 49}, 90))
end})
pcall(function()
  bnu:SetText(tostring(math.floor((tonumber(l.DMDiamondFloor) or 0))))
end)
bfx:Button({Title = g({25, 53, 52, 44, 63, 40, 46, 122, 21, 52, 63, 122, 10, 63, 46, 122, 20, 53, 45}, 90), Desc = g({21, 52, 63, 122, 42, 63, 46, 96, 122, 57, 53, 52, 44, 63, 40, 46, 118, 122, 41, 49, 51, 42, 122, 46, 51, 55, 63, 40, 122, 45, 51, 46, 50, 122, 30, 51, 59, 55, 53, 52, 62, 41, 118, 122, 57, 54, 59, 51, 55, 116, 122, 8, 47, 52, 41, 122, 63, 44, 63, 52, 122, 45, 51, 46, 50, 122, 46, 50, 63, 122, 46, 53, 61, 61, 54, 63, 122, 53, 60, 60, 116}, 90), Callback = function()
  if (((1 + 1) == 2) and n.DMBusy) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 122, 30, 23, 122, 56, 59, 46, 57, 50, 122, 51, 41, 122, 59, 54, 40, 63, 59, 62, 35, 122, 40, 47, 52, 52, 51, 52, 61}, 90), g({57, 54, 53, 57, 49}, 90))
    return
  end
  task.spawn(function()
    local bnv = k.Library
    if (((15 * 15) == 225) and not bnv) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    n.DMBusy = true
    local bnw = l.AutoDarkMatter
    l.AutoDarkMatter = true
    pcall(k._dmStep, bnv)
    l.AutoDarkMatter = bnw
    n.DMBusy = false
  end)
end})
bfy:Section(g({29, 51, 60, 46, 122, 21, 42, 63, 52, 63, 40}, 90))
local bnx = bfy:Slot()
local bny = {}
local bnz = nil
local bob = bfy:Toggle({Title = g({27, 47, 46, 53, 122, 21, 42, 63, 52, 122, 29, 51, 60, 46, 41, 122, 114, 57, 53, 52, 46, 51, 52, 47, 53, 47, 41, 115}, 90), Desc = g({24, 47, 54, 49, 119, 53, 42, 63, 52, 41, 122, 63, 44, 63, 40, 35, 122, 50, 63, 54, 62, 122, 57, 53, 42, 35, 122, 53, 60, 122, 46, 50, 63, 122, 61, 51, 60, 46, 122, 42, 51, 57, 49, 63, 62, 122, 59, 56, 53, 44, 63, 118, 122, 59, 41, 122, 60, 59, 41, 46, 122, 59, 41, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 122, 59, 54, 54, 53, 45, 41, 118, 122, 59, 52, 62, 122, 49, 63, 63, 42, 41, 122, 53, 42, 63, 52, 51, 52, 61, 122, 59, 41, 122, 55, 53, 40, 63, 122, 59, 40, 40, 51, 44, 63, 116, 122, 9, 46, 59, 52, 62, 41, 122, 62, 53, 45, 52, 122, 59, 47, 46, 53, 55, 59, 46, 51, 57, 59, 54, 54, 35, 122, 45, 50, 51, 54, 63, 122, 46, 50, 63, 122, 46, 51, 55, 63, 62, 122, 56, 59, 46, 57, 50, 122, 53, 42, 63, 52, 63, 40, 122, 56, 63, 54, 53, 45, 122, 51, 41, 122, 53, 52, 116}, 90), Value = (l.AutoOpenGifts == true), Callback = function(boa)
  l.AutoOpenGifts = boa
  if (((100 % 7) == 2) and boa) then
    n.GiftErrShown = false
  end
end})
k._giftToggle = bob
bfy:Button({Title = g({21, 42, 63, 52, 122, 9, 63, 54, 63, 57, 46, 63, 62, 122, 29, 51, 60, 46, 41, 122, 20, 53, 45}, 90), Desc = g({21, 52, 63, 119, 41, 50, 53, 46, 122, 56, 47, 54, 49, 122, 53, 42, 63, 52, 122, 53, 60, 122, 63, 44, 63, 40, 35, 122, 50, 63, 54, 62, 122, 57, 53, 42, 35, 122, 53, 60, 122, 46, 50, 63, 122, 61, 51, 60, 46, 122, 57, 50, 53, 41, 63, 52, 122, 59, 56, 53, 44, 63, 116, 122, 8, 47, 52, 41, 122, 63, 44, 63, 52, 122, 45, 51, 46, 50, 122, 56, 53, 46, 50, 122, 46, 53, 61, 61, 54, 63, 41, 122, 53, 60, 60, 116}, 90), Callback = function()
  if (((12 * 12) == 144) and n.GiftBusy) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 122, 61, 51, 60, 46, 122, 53, 42, 63, 52, 122, 51, 41, 122, 59, 54, 40, 63, 59, 62, 35, 122, 40, 47, 52, 52, 51, 52, 61}, 90), g({57, 54, 53, 57, 49}, 90))
    return
  end
  task.spawn(function()
    local boc = k.Library
    if (((3 ^ 2) == 9) and not boc) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    if (((7 * 7) == 49) and not l.GiftKey) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 51, 57, 49, 122, 59, 122, 61, 51, 60, 46, 122, 46, 35, 42, 63, 122, 60, 51, 40, 41, 46}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    n.GiftBusy = true
    n.GiftDeleteArmed = true
    n.GiftTrashIds = aiw(boc, l.GiftKey)
    pcall(k._giftOpenStep, boc)
    task.wait(0.3)
    n.GiftDeleteArmed = false
    n.GiftBusy = false
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (n.GiftNote or g({62, 53, 52, 63}, 90)), g({61, 51, 60, 46}, 90))
  end)
end})
bfy:Section(g({14, 51, 55, 63, 62, 122, 24, 59, 46, 57, 50, 122, 21, 42, 63, 52, 63, 40}, 90))
bfy:Toggle({Title = g({21, 42, 63, 52, 122, 27, 122, 24, 59, 46, 57, 50, 122, 21, 52, 122, 27, 122, 14, 51, 55, 63, 40}, 90), Desc = g({8, 63, 54, 63, 59, 41, 63, 41, 122, 59, 122, 60, 51, 34, 63, 62, 122, 52, 47, 55, 56, 63, 40, 122, 53, 60, 122, 46, 50, 63, 122, 61, 51, 60, 46, 122, 42, 51, 57, 49, 63, 62, 122, 59, 56, 53, 44, 63, 122, 63, 44, 63, 40, 35, 122, 51, 52, 46, 63, 40, 44, 59, 54, 118, 122, 51, 52, 41, 46, 63, 59, 62, 122, 53, 60, 122, 62, 40, 59, 51, 52, 51, 52, 61, 122, 46, 50, 63, 122, 45, 50, 53, 54, 63, 122, 42, 51, 54, 63, 122, 59, 46, 122, 53, 52, 57, 63, 116, 122, 14, 59, 49, 63, 41, 122, 53, 44, 63, 40, 122, 60, 40, 53, 55, 122, 46, 50, 63, 122, 57, 53, 52, 46, 51, 52, 47, 53, 47, 41, 122, 53, 42, 63, 52, 63, 40, 122, 45, 50, 51, 54, 63, 122, 51, 46, 122, 51, 41, 122, 53, 52, 116}, 90), Value = (l.GiftBatchEnabled == true), Callback = function(bod)
  l.GiftBatchEnabled = bod
  if (((1 + 1) == 2) and bod) then
    n.GiftErrShown = false
    n.GiftBatchNextAt, n.GiftBatchLastAt, n.GiftBatchMinsUsed = 0, 0, 0
  end
end})
bfy:Slider({Title = g({24, 59, 46, 57, 50, 122, 19, 52, 46, 63, 40, 44, 59, 54, 122, 114, 55, 51, 52, 47, 46, 63, 41, 115}, 90), Desc = g({18, 53, 45, 122, 54, 53, 52, 61, 122, 46, 53, 122, 45, 59, 51, 46, 122, 56, 63, 46, 45, 63, 63, 52, 122, 56, 59, 46, 57, 50, 63, 41, 116, 122, 25, 50, 59, 52, 61, 51, 52, 61, 122, 46, 50, 51, 41, 122, 40, 63, 119, 46, 51, 55, 63, 41, 122, 46, 50, 63, 122, 57, 53, 47, 52, 46, 62, 53, 45, 52, 122, 59, 61, 59, 51, 52, 41, 46, 122, 46, 50, 63, 122, 54, 59, 41, 46, 122, 56, 59, 46, 57, 50, 122, 41, 46, 40, 59, 51, 61, 50, 46, 122, 59, 45, 59, 35, 116}, 90), Value = {Min = 5, Max = 60, Default = math.clamp((tonumber(l.GiftBatchMinutes) or 15), 5, 60)}, Step = 1, Callback = function(boe)
  l.GiftBatchMinutes = math.clamp(math.floor((tonumber(boe) or 15)), 5, 60)
end})
bfy:Slider({Title = g({29, 51, 60, 46, 41, 122, 10, 63, 40, 122, 24, 59, 46, 57, 50}, 90), Desc = g({18, 53, 45, 122, 55, 59, 52, 35, 122, 61, 51, 60, 46, 41, 122, 46, 53, 122, 53, 42, 63, 52, 122, 63, 59, 57, 50, 122, 46, 51, 55, 63, 122, 46, 50, 63, 122, 46, 51, 55, 63, 40, 122, 60, 51, 40, 63, 41, 116, 122, 19, 60, 122, 35, 53, 47, 122, 50, 53, 54, 62, 122, 60, 63, 45, 63, 40, 122, 46, 50, 59, 52, 122, 46, 50, 51, 41, 118, 122, 51, 46, 122, 53, 42, 63, 52, 41, 122, 45, 50, 59, 46, 122, 35, 53, 47, 122, 50, 59, 44, 63, 116}, 90), Value = {Min = 1, Max = 250, Default = math.max(1, math.floor((tonumber(l.GiftBatchCount) or 25)))}, Step = 1, Callback = function(bof)
  l.GiftBatchCount = math.max(1, math.floor((tonumber(bof) or 25)))
end})
local bog = bfy:StatGrid({{Key = g({20, 63, 34, 46}, 90), Title = g({20, 63, 34, 46, 122, 24, 59, 46, 57, 50, 122, 19, 52}, 90)}, {Key = g({18, 63, 54, 62}, 90), Title = g({29, 51, 60, 46, 41, 122, 18, 63, 54, 62}, 90)}, {Key = g({8, 47, 52, 41}, 90), Title = g({24, 59, 46, 57, 50, 63, 41, 122, 8, 47, 52}, 90)}, {Key = g({22, 59, 41, 46}, 90), Title = g({22, 59, 41, 46, 122, 24, 59, 46, 57, 50}, 90)}})
k._refreshBatchTiles = function()
  local boh = 0
  if (((15 * 15) == 225) and (k.Library and l.GiftKey)) then
    pcall(function()
      boh = #ajf(k.Library, l.GiftKey)
    end)
  end
  bog.Held(as(boh))
  bog.Runs(as((n.GiftBatchRuns or 0)))
  bog.Last(tostring((n.GiftBatchNote or g({53, 60, 60}, 90))))
  if (((100 % 7) == 2) and not l.GiftBatchEnabled) then
    bog.Next(g({53, 60, 60}, 90))
  elseif (((12 * 12) == 144) and not l.GiftKey) then
    bog.Next(g({52, 53, 122, 61, 51, 60, 46}, 90))
  else
    local boi = (((n.GiftBatchNextAt or 0)) - os.clock())
    if (((3 ^ 2) == 9) and ((((n.GiftBatchNextAt or 0)) <= 0) or (boi <= 0))) then
      bog.Next(g({52, 53, 45}, 90))
    else
      bog.Next(string.format(g({127, 62, 96, 127, 106, 104, 62}, 90), math.floor((boi / 60)), math.floor((boi % 60))))
    end
  end
end
bfy:Button({Title = g({21, 42, 63, 52, 122, 21, 52, 63, 122, 24, 59, 46, 57, 50, 122, 20, 53, 45}, 90), Desc = g({28, 51, 40, 63, 41, 122, 59, 122, 41, 51, 52, 61, 54, 63, 122, 56, 59, 46, 57, 50, 122, 53, 60, 122, 46, 50, 63, 122, 41, 51, 32, 63, 122, 59, 56, 53, 44, 63, 122, 51, 55, 55, 63, 62, 51, 59, 46, 63, 54, 35, 118, 122, 45, 51, 46, 50, 53, 47, 46, 122, 45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122, 46, 50, 63, 122, 46, 51, 55, 63, 40, 118, 122, 59, 52, 62, 122, 40, 63, 41, 63, 46, 41, 122, 46, 50, 63, 122, 57, 53, 47, 52, 46, 62, 53, 45, 52, 116}, 90), Callback = function()
  if (((7 * 7) == 49) and n.GiftBusy) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 122, 61, 51, 60, 46, 122, 53, 42, 63, 52, 122, 51, 41, 122, 59, 54, 40, 63, 59, 62, 35, 122, 40, 47, 52, 52, 51, 52, 61}, 90), g({57, 54, 53, 57, 49}, 90))
    return
  end
  task.spawn(function()
    local boj = k.Library
    if (((1 + 1) == 2) and not boj) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    if (((15 * 15) == 225) and not l.GiftKey) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 51, 57, 49, 122, 59, 122, 61, 51, 60, 46, 122, 46, 35, 42, 63, 122, 60, 51, 40, 41, 46}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    n.GiftTrashIds = aiw(boj, l.GiftKey)
    pcall(function()
      k._giftBatchRun(boj, l.GiftBatchCount)
    end)
    if (((100 % 7) == 2) and l.GiftBatchEnabled) then
      n.GiftBatchNextAt = (os.clock() + (math.clamp((tonumber(l.GiftBatchMinutes) or 15), 5, 60) * 60))
    end
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({29, 51, 60, 46, 122, 56, 59, 46, 57, 50, 96, 122}, 90) .. ((n.GiftBatchNote or g({40, 59, 52}, 90)))), g({61, 51, 60, 46}, 90))
  end)
end})
bfy:Section(g({30, 40, 53, 42, 122, 25, 54, 63, 59, 52, 47, 42}, 90))
bfy:Toggle({Title = g({30, 63, 54, 63, 46, 63, 122, 20, 53, 40, 55, 59, 54, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 41}, 90), Desc = g({14, 40, 59, 41, 50, 63, 41, 122, 42, 54, 59, 51, 52, 122, 114, 52, 53, 119, 55, 53, 62, 51, 60, 51, 63, 40, 115, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 42, 63, 46, 41, 122, 46, 50, 59, 46, 122, 57, 53, 55, 63, 122, 53, 47, 46, 122, 53, 60, 122, 46, 50, 63, 122, 61, 51, 60, 46, 122, 42, 51, 57, 49, 63, 62, 122, 59, 56, 53, 44, 63, 116, 122, 20, 53, 46, 50, 51, 52, 61, 122, 53, 47, 46, 41, 51, 62, 63, 122, 46, 50, 59, 46, 122, 61, 51, 60, 46, 125, 41, 122, 53, 45, 52, 122, 62, 40, 53, 42, 41, 122, 51, 41, 122, 63, 44, 63, 40, 122, 46, 53, 47, 57, 50, 63, 62, 116}, 90), Value = (l.GiftDeleteNormal ~= false), Callback = function(bok)
  l.GiftDeleteNormal = bok
end})
bfy:Toggle({Title = g({30, 63, 54, 63, 46, 63, 122, 29, 53, 54, 62, 63, 52, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 41}, 90), Desc = g({27, 54, 41, 53, 122, 46, 40, 59, 41, 50, 63, 41, 122, 29, 53, 54, 62, 63, 52, 119, 44, 59, 40, 51, 59, 52, 46, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 41, 122, 60, 40, 53, 55, 122, 46, 50, 59, 46, 122, 61, 51, 60, 46, 116, 122, 21, 60, 60, 122, 56, 35, 122, 62, 63, 60, 59, 47, 54, 46, 122, 8270, 122, 29, 53, 54, 62, 63, 52, 41, 122, 59, 40, 63, 122, 45, 53, 40, 46, 50, 122, 49, 63, 63, 42, 51, 52, 61, 116}, 90), Value = (l.GiftDeleteGolden == true), Callback = function(bol)
  l.GiftDeleteGolden = bol
end})
bfy:Toggle({Title = g({30, 63, 54, 63, 46, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 41}, 90), Desc = g({27, 54, 41, 53, 122, 46, 40, 59, 41, 50, 63, 41, 122, 8, 59, 51, 52, 56, 53, 45, 119, 44, 59, 40, 51, 59, 52, 46, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 41, 122, 60, 40, 53, 55, 122, 46, 50, 59, 46, 122, 61, 51, 60, 46, 116, 122, 21, 60, 60, 122, 56, 35, 122, 62, 63, 60, 59, 47, 54, 46, 122, 8270, 122, 46, 50, 51, 41, 122, 51, 41, 122, 46, 50, 63, 122, 40, 59, 40, 63, 41, 46, 122, 46, 51, 63, 40, 122, 46, 50, 63, 122, 57, 54, 63, 59, 52, 47, 42, 122, 57, 59, 52, 122, 40, 63, 59, 57, 50, 116}, 90), Value = (l.GiftDeleteRainbow == true), Callback = function(bom)
  l.GiftDeleteRainbow = bom
end})
bfy:Button({Title = g({20, 63, 44, 63, 40, 122, 30, 63, 54, 63, 46, 63, 62, 118, 122, 13, 50, 59, 46, 63, 44, 63, 40, 122, 14, 50, 63, 122, 14, 53, 61, 61, 54, 63, 41, 122, 9, 59, 35}, 90), Desc = g({30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 118, 122, 9, 50, 51, 52, 35, 118, 122, 22, 53, 57, 49, 63, 62, 118, 122, 18, 47, 61, 63, 122, 59, 52, 62, 122, 14, 51, 46, 59, 52, 51, 57, 122, 59, 40, 63, 122, 63, 34, 57, 54, 47, 62, 63, 62, 122, 60, 40, 53, 55, 122, 61, 51, 60, 46, 122, 57, 54, 63, 59, 52, 47, 42, 122, 47, 52, 57, 53, 52, 62, 51, 46, 51, 53, 52, 59, 54, 54, 35, 116, 122, 25, 54, 63, 59, 52, 47, 42, 122, 51, 41, 122, 59, 54, 41, 53, 122, 41, 57, 53, 42, 63, 62, 122, 46, 53, 122, 46, 50, 63, 122, 41, 63, 54, 63, 57, 46, 63, 62, 122, 61, 51, 60, 46, 125, 41, 122, 53, 45, 52, 122, 31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 62, 40, 53, 42, 41, 118, 122, 41, 53, 122, 42, 63, 46, 41, 122, 60, 40, 53, 55, 122, 59, 52, 35, 45, 50, 63, 40, 63, 122, 63, 54, 41, 63, 122, 59, 40, 63, 122, 41, 59, 60, 63, 116}, 90), Callback = function()
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({30, 23, 122, 117, 122, 9, 50, 51, 52, 35, 122, 117, 122, 22, 53, 57, 49, 63, 62, 122, 117, 122, 18, 47, 61, 63, 122, 117, 122, 14, 51, 46, 59, 52, 51, 57, 122, 59, 40, 63, 122, 59, 54, 45, 59, 35, 41, 122, 49, 63, 42, 46}, 90), g({41, 50, 51, 63, 54, 62}, 90))
end})
bfw:Section(g({25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 19, 52, 62, 63, 34}, 90))
local bon = bfw:Slot()
local bop = bfw:Toggle({Title = g({27, 47, 46, 53, 122, 19, 52, 62, 63, 34, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52}, 90), Desc = g({13, 59, 54, 49, 41, 122, 63, 44, 63, 40, 35, 122, 50, 59, 46, 57, 50, 59, 56, 54, 63, 122, 63, 61, 61, 122, 53, 60, 122, 46, 50, 63, 122, 45, 53, 40, 54, 62, 41, 122, 35, 53, 47, 122, 42, 51, 57, 49, 118, 122, 57, 50, 63, 59, 42, 63, 41, 46, 122, 60, 51, 40, 41, 46, 118, 122, 46, 63, 54, 63, 42, 53, 40, 46, 41, 122, 51, 52, 122, 60, 40, 53, 52, 46, 122, 53, 60, 122, 51, 46, 122, 59, 52, 62, 122, 50, 59, 46, 57, 50, 63, 41, 122, 47, 52, 46, 51, 54, 122, 46, 50, 59, 46, 122, 63, 61, 61, 122, 53, 45, 63, 41, 122, 46, 50, 63, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 52, 53, 46, 50, 51, 52, 61, 122, 8270, 122, 63, 44, 63, 40, 35, 122, 42, 63, 46, 118, 122, 59, 52, 62, 122, 20, 53, 40, 55, 59, 54, 117, 29, 53, 54, 62, 63, 52, 117, 8, 59, 51, 52, 56, 53, 45, 117, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 60, 53, 40, 122, 63, 59, 57, 50, 116, 122, 14, 59, 49, 63, 41, 122, 53, 44, 63, 40, 122, 50, 59, 46, 57, 50, 51, 52, 61, 122, 60, 40, 53, 55, 122, 27, 47, 46, 53, 122, 31, 61, 61, 41, 122, 59, 52, 62, 122, 42, 40, 53, 46, 63, 57, 46, 41, 122, 46, 50, 63, 122, 42, 63, 46, 41, 122, 51, 46, 122, 41, 46, 51, 54, 54, 122, 52, 63, 63, 62, 41, 122, 60, 40, 53, 55, 122, 59, 47, 46, 53, 119, 62, 63, 54, 63, 46, 63, 116}, 90), Value = (l.AutoIndex == true), Callback = function(boo)
  l.AutoIndex = boo
  n.IndexNote = ((boo and g({41, 46, 59, 40, 46, 51, 52, 61}, 90)) or g({53, 60, 60}, 90))
  n.IndexFullNotified = false
  n.IndexTargets, n.IndexTotal = nil, 0
  n.IndexKeepUids, n.IndexKeepAt = nil, 0
  n.IndexGoldenActive = false
  n.OctupleWarned = false
  if (((12 * 12) == 144) and boo) then
    if (((3 ^ 2) == 9) and (l.AutoCompleteGame or l.AutoWorldProgress)) then
      l.AutoCompleteGame, l.AutoWorldProgress = false, false
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({14, 47, 40, 52, 63, 62, 122, 53, 60, 60, 122, 27, 47, 46, 53, 122, 25, 53, 55, 42, 54, 63, 46, 63, 122, 29, 59, 55, 63, 122, 117, 122, 13, 53, 40, 54, 62, 122, 10, 40, 53, 61, 40, 63, 41, 41, 122, 8270, 122, 46, 50, 63, 35, 122, 60, 51, 61, 50, 46, 122, 46, 50, 63, 122, 51, 52, 62, 63, 34, 122, 53, 44, 63, 40, 122, 45, 53, 40, 54, 62, 122, 46, 40, 59, 44, 63, 54}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
    if (((7 * 7) == 49) and (#((l.IndexWorlds or {})) == 0)) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 51, 57, 49, 122, 59, 46, 122, 54, 63, 59, 41, 46, 122, 53, 52, 63, 122, 45, 53, 40, 54, 62, 122, 51, 52, 122, 19, 52, 62, 63, 34, 122, 13, 53, 40, 54, 62, 41}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    end
  else
    n.IndexNeedIds = nil
    n.IndexGoldenActive = false
  end
end})
k._indexToggle = bop
bfw:Section(g({19, 52, 62, 63, 34, 122, 14, 47, 52, 51, 52, 61}, 90))
bfw:Dropdown({Title = g({18, 59, 46, 57, 50, 122, 27, 55, 53, 47, 52, 46}, 90), Desc = g({18, 53, 45, 122, 55, 59, 52, 35, 122, 63, 61, 61, 41, 122, 42, 63, 40, 122, 56, 47, 35, 122, 45, 50, 51, 54, 63, 122, 51, 52, 62, 63, 34, 51, 52, 61, 116, 122, 23, 53, 40, 63, 122, 42, 63, 46, 41, 122, 42, 63, 40, 122, 41, 63, 57, 53, 52, 62, 118, 122, 55, 53, 40, 63, 122, 57, 53, 51, 52, 122, 56, 47, 40, 52, 116, 122, 34, 98, 122, 52, 63, 63, 62, 41, 122, 46, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 24, 47, 35, 119, 98, 122, 47, 52, 54, 53, 57, 49, 97, 122, 45, 51, 46, 50, 53, 47, 46, 122, 51, 46, 122, 46, 50, 63, 122, 51, 52, 62, 63, 34, 122, 60, 59, 54, 54, 41, 122, 56, 59, 57, 49, 122, 46, 53, 122, 34, 105, 116}, 90), Values = {g({34, 107}, 90), g({34, 105}, 90), g({34, 98}, 90)}, Value = ((((l.IndexHatchAmount == 8)) and g({34, 98}, 90)) or (((((l.IndexHatchAmount == 1)) and g({34, 107}, 90)) or g({34, 105}, 90)))), Callback = function(boq)
  l.IndexHatchAmount = ((((boq == g({34, 98}, 90))) and 8) or (((((boq == g({34, 107}, 90))) and 1) or 3)))
  n.OctupleWarned = false
end})
bfw:Toggle({Title = g({15, 41, 63, 122, 23, 59, 57, 50, 51, 52, 63, 41}, 90), Desc = g({8, 59, 51, 52, 56, 53, 45, 122, 52, 63, 44, 63, 40, 122, 62, 40, 53, 42, 41, 122, 60, 40, 53, 55, 122, 59, 52, 122, 63, 61, 61, 122, 59, 52, 62, 122, 29, 53, 54, 62, 63, 52, 122, 53, 52, 54, 35, 122, 62, 40, 53, 42, 41, 122, 60, 40, 53, 55, 122, 59, 122, 61, 53, 54, 62, 63, 52, 122, 53, 52, 63, 118, 122, 41, 53, 122, 46, 50, 63, 122, 51, 52, 62, 63, 34, 122, 55, 59, 49, 63, 41, 122, 46, 50, 63, 55, 96, 122, 108, 122, 51, 62, 63, 52, 46, 51, 57, 59, 54, 122, 42, 54, 59, 51, 52, 122, 42, 63, 46, 41, 122, 119, 100, 122, 29, 53, 54, 62, 63, 52, 118, 122, 108, 122, 29, 53, 54, 62, 63, 52, 41, 122, 119, 100, 122, 8, 59, 51, 52, 56, 53, 45, 118, 122, 59, 54, 45, 59, 35, 41, 122, 53, 52, 122, 46, 50, 63, 122, 61, 47, 59, 40, 59, 52, 46, 63, 63, 62, 122, 40, 53, 45, 116, 122, 21, 60, 60, 122, 55, 63, 59, 52, 41, 122, 53, 52, 54, 35, 122, 20, 53, 40, 55, 59, 54, 122, 63, 52, 46, 40, 51, 63, 41, 122, 45, 51, 54, 54, 122, 63, 44, 63, 40, 122, 57, 53, 55, 42, 54, 63, 46, 63, 116}, 90), Value = (l.IndexUseMachines ~= false), Callback = function(bor)
  l.IndexUseMachines = bor
end})
bfw:Toggle({Title = g({18, 59, 46, 57, 50, 122, 29, 53, 54, 62, 63, 52, 122, 31, 61, 61, 41}, 90), Desc = g({21, 52, 57, 63, 122, 59, 52, 122, 63, 61, 61, 122, 53, 45, 63, 41, 122, 52, 53, 122, 55, 53, 40, 63, 122, 20, 53, 40, 55, 59, 54, 122, 63, 52, 46, 40, 51, 63, 41, 118, 122, 41, 45, 51, 46, 57, 50, 122, 46, 53, 122, 46, 50, 63, 122, 61, 53, 54, 62, 63, 52, 122, 63, 61, 61, 122, 56, 63, 41, 51, 62, 63, 122, 51, 46, 122, 8270, 122, 63, 44, 63, 40, 35, 122, 50, 59, 46, 57, 50, 122, 57, 53, 55, 63, 41, 122, 53, 47, 46, 122, 29, 53, 54, 62, 63, 52, 118, 122, 41, 53, 122, 46, 50, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 55, 59, 57, 50, 51, 52, 63, 122, 61, 63, 46, 41, 122, 60, 63, 62, 122, 51, 52, 122, 53, 52, 63, 122, 41, 46, 63, 42, 122, 51, 52, 41, 46, 63, 59, 62, 122, 53, 60, 122, 41, 51, 34, 122, 42, 54, 59, 51, 52, 122, 42, 63, 46, 41, 122, 42, 63, 40, 122, 29, 53, 54, 62, 63, 52, 116, 122, 25, 53, 41, 46, 41, 122, 59, 56, 53, 47, 46, 122, 99, 34, 122, 46, 50, 63, 122, 57, 53, 51, 52, 41, 122, 42, 63, 40, 122, 50, 59, 46, 57, 50, 122, 59, 52, 62, 122, 52, 63, 63, 62, 41, 122, 46, 50, 63, 122, 61, 53, 54, 62, 63, 52, 122, 63, 61, 61, 122, 46, 53, 122, 56, 63, 122, 41, 46, 59, 52, 62, 51, 52, 61, 122, 51, 52, 122, 46, 50, 63, 122, 45, 53, 40, 54, 62, 116}, 90), Value = (l.IndexGoldenEggs ~= false), Callback = function(bos)
  l.IndexGoldenEggs = bos
  if (((1 + 1) == 2) and not bos) then
    n.IndexGoldenActive = false
  end
end})
bfw:Toggle({Title = g({9, 49, 51, 42, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 14, 51, 55, 63, 40}, 90), Desc = g({10, 59, 35, 41, 122, 107, 118, 106, 106, 106, 118, 106, 106, 106, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 46, 53, 122, 60, 51, 52, 51, 41, 50, 122, 59, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 57, 53, 52, 44, 63, 40, 41, 51, 53, 52, 122, 51, 52, 41, 46, 59, 52, 46, 54, 35, 122, 51, 52, 41, 46, 63, 59, 62, 122, 53, 60, 122, 45, 59, 51, 46, 51, 52, 61, 122, 53, 47, 46, 122, 46, 50, 63, 122, 55, 59, 57, 50, 51, 52, 63, 116, 122, 21, 60, 60, 122, 41, 46, 51, 54, 54, 122, 45, 53, 40, 49, 41, 122, 8270, 122, 46, 50, 63, 122, 41, 54, 53, 46, 122, 48, 47, 41, 46, 122, 40, 63, 62, 63, 63, 55, 41, 122, 51, 46, 41, 63, 54, 60, 122, 54, 59, 46, 63, 40, 122, 53, 52, 57, 63, 122, 46, 50, 63, 122, 46, 51, 55, 63, 40, 122, 63, 34, 42, 51, 40, 63, 41, 116}, 90), Value = (l.IndexForceSkipDM ~= false), Callback = function(bot)
  l.IndexForceSkipDM = bot
end})
bfw:Input({Title = g({30, 51, 59, 55, 53, 52, 62, 122, 28, 54, 53, 53, 40}, 90), Desc = g({14, 50, 63, 122, 51, 52, 62, 63, 34, 122, 45, 53, 52, 125, 46, 122, 41, 42, 63, 52, 62, 122, 30, 51, 59, 55, 53, 52, 62, 41, 122, 56, 63, 54, 53, 45, 122, 46, 50, 51, 41, 122, 56, 59, 54, 59, 52, 57, 63, 122, 114, 55, 59, 57, 50, 51, 52, 63, 41, 122, 59, 52, 62, 122, 46, 51, 55, 63, 40, 122, 41, 49, 51, 42, 41, 122, 56, 53, 46, 50, 115, 116, 122, 24, 54, 59, 52, 49, 117, 106, 122, 103, 122, 41, 42, 63, 52, 62, 122, 60, 40, 63, 63, 54, 35, 116, 122, 10, 40, 63, 41, 41, 122, 31, 52, 46, 63, 40, 122, 46, 53, 122, 41, 63, 46, 116}, 90), Placeholder = g({63, 116, 61, 116, 122, 104, 106, 106, 106, 106, 106, 106}, 90), Callback = function(bou)
  local bov = tonumber((tostring(bou):gsub(g({1, 4, 127, 62, 127, 116, 7}, 90), "")))
  l.IndexDiamondFloor = math.max(0, (bov or 0))
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({19, 52, 62, 63, 34, 122, 62, 51, 59, 55, 53, 52, 62, 122, 60, 54, 53, 53, 40, 122, 41, 63, 46, 122, 46, 53, 122}, 90) .. tostring(math.floor(l.IndexDiamondFloor))), g({57, 50, 63, 57, 49}, 90))
end})
bfw:Input({Title = g({18, 59, 46, 57, 50, 122, 25, 59, 42, 122, 10, 63, 40, 122, 31, 61, 61}, 90), Desc = g({29, 51, 44, 63, 122, 47, 42, 122, 53, 52, 122, 59, 52, 122, 63, 61, 61, 122, 59, 60, 46, 63, 40, 122, 46, 50, 51, 41, 122, 55, 59, 52, 35, 122, 50, 59, 46, 57, 50, 63, 41, 122, 59, 52, 62, 122, 55, 53, 44, 63, 122, 46, 53, 122, 46, 50, 63, 122, 52, 63, 34, 46, 122, 53, 52, 63, 118, 122, 40, 63, 46, 40, 35, 51, 52, 61, 122, 51, 46, 122, 52, 63, 34, 46, 122, 54, 59, 42, 116, 122, 24, 54, 59, 52, 49, 117, 106, 122, 103, 122, 52, 53, 122, 57, 59, 42, 116, 122, 10, 40, 63, 41, 41, 122, 31, 52, 46, 63, 40, 122, 46, 53, 122, 41, 63, 46, 116}, 90), Placeholder = g({106, 122, 103, 122, 47, 52, 54, 51, 55, 51, 46, 63, 62}, 90), Callback = function(bow)
  local box = tonumber((tostring(bow):gsub(g({1, 4, 127, 62, 7}, 90), "")))
  l.IndexEggCap = math.max(0, (box or 0))
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({19, 52, 62, 63, 34, 122, 50, 59, 46, 57, 50, 122, 57, 59, 42, 96, 122}, 90) .. ((((l.IndexEggCap == 0) and g({47, 52, 54, 51, 55, 51, 46, 63, 62}, 90)) or tostring(l.IndexEggCap)))), g({57, 50, 63, 57, 49}, 90))
end})
bfw:Input({Title = g({10, 59, 46, 51, 63, 52, 57, 63, 122, 10, 63, 40, 122, 31, 61, 61}, 90), Desc = g({23, 53, 44, 63, 122, 53, 52, 122, 59, 60, 46, 63, 40, 122, 46, 50, 51, 41, 122, 55, 59, 52, 35, 122, 50, 59, 46, 57, 50, 63, 41, 122, 45, 51, 46, 50, 122, 52, 53, 122, 52, 63, 45, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 63, 52, 46, 40, 35, 116, 122, 29, 47, 59, 40, 62, 41, 122, 59, 61, 59, 51, 52, 41, 46, 122, 59, 52, 122, 63, 61, 61, 122, 45, 50, 53, 41, 63, 122, 54, 59, 41, 46, 122, 42, 63, 46, 122, 51, 41, 122, 59, 122, 107, 119, 51, 52, 119, 59, 119, 55, 51, 54, 54, 51, 53, 52, 122, 62, 40, 53, 42, 116, 122, 30, 63, 60, 59, 47, 54, 46, 122, 108, 106, 106, 116, 122, 10, 40, 63, 41, 41, 122, 31, 52, 46, 63, 40, 122, 46, 53, 122, 41, 63, 46, 116}, 90), Placeholder = g({108, 106, 106}, 90), Callback = function(boy)
  local boz = tonumber((tostring(boy):gsub(g({1, 4, 127, 62, 7}, 90), "")))
  l.IndexEggPatience = math.max(0, (boz or 0))
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({19, 52, 62, 63, 34, 122, 42, 59, 46, 51, 63, 52, 57, 63, 96, 122}, 90) .. ((((l.IndexEggPatience == 0) and g({47, 52, 54, 51, 55, 51, 46, 63, 62}, 90)) or (tostring(l.IndexEggPatience) .. g({122, 50, 59, 46, 57, 50, 63, 41}, 90))))), g({57, 50, 63, 57, 49}, 90))
end})
bfw:Slider({Title = g({18, 59, 46, 57, 50, 122, 30, 63, 54, 59, 35}, 90), Desc = g({9, 63, 57, 53, 52, 62, 41, 122, 56, 63, 46, 45, 63, 63, 52, 122, 50, 59, 46, 57, 50, 63, 41, 116, 122, 24, 63, 54, 53, 45, 122, 107, 116, 104, 41, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 122, 41, 46, 59, 40, 46, 41, 122, 59, 52, 41, 45, 63, 40, 51, 52, 61, 122, 120, 35, 53, 47, 122, 59, 40, 63, 122, 62, 53, 51, 52, 61, 122, 46, 50, 51, 41, 122, 46, 53, 53, 122, 43, 47, 51, 57, 49, 54, 35, 120, 116}, 90), Value = {Min = 1.2, Max = 4, Default = (tonumber(l.IndexHatchDelay) or 1.2)}, Step = 0.1, Callback = function(bpa)
  l.IndexHatchDelay = math.max(1.2, (tonumber(bpa) or 1.2))
end})
bfw:Button({Title = g({9, 50, 53, 45, 122, 19, 52, 62, 63, 34, 122, 10, 40, 53, 61, 40, 63, 41, 41}, 90), Desc = g({10, 40, 53, 61, 40, 63, 41, 41, 122, 60, 53, 40, 122, 46, 50, 63, 122, 45, 53, 40, 54, 62, 41, 122, 35, 53, 47, 122, 41, 63, 54, 63, 57, 46, 63, 62, 122, 8270, 122, 63, 44, 63, 40, 35, 122, 44, 59, 40, 51, 59, 52, 46, 122, 53, 60, 122, 63, 44, 63, 40, 35, 122, 42, 63, 46, 122, 46, 50, 63, 51, 40, 122, 63, 61, 61, 41, 122, 57, 59, 52, 122, 57, 53, 55, 42, 54, 63, 46, 63, 122, 8270, 122, 42, 54, 47, 41, 122, 35, 53, 47, 40, 122, 53, 44, 63, 40, 59, 54, 54, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 46, 53, 46, 59, 54, 116}, 90), Callback = function()
  task.spawn(function()
    local bpb = k.Library
    if (((15 * 15) == 225) and not bpb) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 51, 56, 40, 59, 40, 35, 122, 52, 53, 46, 122, 40, 63, 59, 62, 35}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    local bpc = rh(bpb)
    local bpd = rp(bpb)
    if (((100 % 7) == 2) and (not bpc or not bpd)) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({25, 53, 47, 54, 62, 122, 52, 53, 46, 122, 40, 63, 59, 62, 122, 46, 50, 63, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
      return
    end
    local bpe, bpf = 0, 0
    for bpg in pairs(bpc) do
      bpf += 1
      if (((12 * 12) == 144) and bpd[bpg]) then
        bpe += 1
      end
    end
    local bph = rd(bpb)
    local bpi, bpj = {}, {}
    for bpk, bpl in ipairs((l.IndexWorlds or {})) do
      if (((3 ^ 2) == 9) and (type(bpl) == g({41, 46, 40, 51, 52, 61}, 90))) then
        bpi[bpl] = true
        table.insert(bpj, bpl)
      end
    end
    local bpm = bpb.Directory.Areas
    local bpn = {g({20, 53, 40, 55, 59, 54}, 90), g({29, 53, 54, 62, 63, 52}, 90), g({8, 59, 51, 52, 56, 53, 45}, 90), g({30, 59, 40, 49, 23, 59, 46, 46, 63, 40}, 90)}
    local bpo, bpp, bpq = {0, 0, 0, 0}, {0, 0, 0, 0}, {}
    pcall(function()
      for bpr, bps in pairs(bpb.Directory.Eggs) do
        if (((7 * 7) == 49) and ((((bps and bps.hatchable) and not bps.disabled) and not bps.isGolden) and bps.area)) then
          local bpt = bpm[tostring(bps.area)]
          local bpu = ((bpt and tostring((bpt.world or ""))) or nil)
          if (((1 + 1) == 2) and (bpu and bpi[bpu])) then
            for bpv, bpw in ipairs(sc(bpb, tostring(bpr), bph)) do
              for bpx = 1, 4 do
                local bpy = (bpw .. (g({119}, 90) .. bpx))
                if (((15 * 15) == 225) and (bpc[bpy] and not bpq[bpy])) then
                  bpq[bpy] = true
                  bpp[bpx] += 1
                  if (((100 % 7) == 2) and bpd[bpy]) then
                    bpo[bpx] += 1
                  end
                end
              end
            end
          end
        end
      end
    end)
    local bpz, bqa = 0, 0
    for bqb = 1, 4 do
      bpz += bpp[bqb]
      bqa += bpo[bqb]
    end
    if (((12 * 12) == 144) and (#bpj == 0)) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({20, 53, 122, 45, 53, 40, 54, 62, 41, 122, 41, 63, 54, 63, 57, 46, 63, 62, 116, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 53, 44, 63, 40, 59, 54, 54, 96, 122, 127, 62, 122, 117, 122, 127, 62, 122, 114, 127, 62, 122, 54, 63, 60, 46, 115}, 90), bpe, bpf, (bpf - bpe)), g({54, 51, 41, 46, 119, 57, 50, 63, 57, 49, 41}, 90))
      return
    end
    local bqc = {}
    for bqd = 1, 4 do
      if (((3 ^ 2) == 9) and (bpp[bqd] > 0)) then
        table.insert(bqc, string.format(g({127, 41, 122, 127, 62, 117, 127, 62}, 90), bpn[bqd], bpo[bqd], bpp[bqd]))
      end
    end
    local bqe = ((((#bpj <= 3)) and table.concat(bpj, g({118, 122}, 90))) or ((#bpj .. g({122, 45, 53, 40, 54, 62, 41}, 90))))
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({127, 41, 122, 8270, 122, 127, 62, 117, 127, 62, 122, 114, 127, 62, 122, 54, 63, 60, 46, 115, 80, 127, 41, 80, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 53, 44, 63, 40, 59, 54, 54, 96, 122, 127, 62, 117, 127, 62}, 90), bqe, bqa, bpz, (bpz - bqa), table.concat(bqc, g({122, 122}, 90)), bpe, bpf), g({54, 51, 41, 46, 119, 57, 50, 63, 57, 49, 41}, 90))
  end)
end})
bge:Section(g({9, 63, 41, 41, 51, 53, 52, 122, 14, 53, 46, 59, 54, 41}, 90))
local bqf = bge:StatGrid({{Key = g({25, 53, 51, 52, 41}, 90), Title = g({25, 53, 51, 52, 41, 122, 25, 53, 54, 54, 63, 57, 46, 63, 62}, 90)}, {Key = g({30, 59, 55, 59, 61, 63}, 90), Title = g({30, 59, 55, 59, 61, 63, 122, 30, 63, 59, 54, 46}, 90)}, {Key = g({31, 61, 61, 41}, 90), Title = g({31, 61, 61, 41, 122, 18, 59, 46, 57, 50, 63, 62}, 90)}, {Key = g({18, 47, 61, 63, 41}, 90), Title = g({18, 47, 61, 63, 41, 122, 18, 59, 46, 57, 50, 63, 62}, 90)}, {Key = g({21, 40, 56, 41}, 90), Title = g({21, 40, 56, 41, 122, 25, 53, 54, 54, 63, 57, 46, 63, 62}, 90)}, {Key = g({24, 59, 61, 41}, 90), Title = g({24, 59, 61, 41, 122, 25, 53, 54, 54, 63, 57, 46, 63, 62}, 90)}, {Key = g({30, 63, 54, 63, 46, 63, 62}, 90), Title = g({10, 63, 46, 41, 122, 30, 63, 54, 63, 46, 63, 62}, 90)}, {Key = g({29, 51, 60, 46, 41, 21, 42, 63, 52, 63, 62}, 90), Title = g({29, 51, 60, 46, 41, 122, 21, 42, 63, 52, 63, 62}, 90)}, {Key = g({31, 34, 31, 61, 61, 41, 21, 42, 63, 52, 63, 62}, 90), Title = g({31, 34, 57, 54, 47, 41, 51, 44, 63, 122, 31, 61, 61, 41}, 90)}, {Key = g({19, 52, 62, 63, 34, 20, 63, 45}, 90), Title = g({20, 63, 45, 122, 19, 52, 62, 63, 34, 122, 31, 52, 46, 40, 51, 63, 41}, 90)}, {Key = g({29, 53, 54, 62, 63, 52, 23, 59, 62, 63}, 90), Title = g({29, 53, 54, 62, 63, 52, 41, 122, 23, 59, 62, 63}, 90)}, {Key = g({8, 59, 51, 52, 56, 53, 45, 23, 59, 62, 63}, 90), Title = g({8, 59, 51, 52, 56, 53, 45, 41, 122, 23, 59, 62, 63}, 90)}, {Key = g({30, 23, 23, 59, 62, 63}, 90), Title = g({30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 23, 59, 62, 63}, 90)}, {Key = g({31, 52, 57, 50, 59, 52, 46, 30, 53, 52, 63}, 90), Title = g({31, 52, 57, 50, 59, 52, 46, 41, 122, 27, 42, 42, 54, 51, 63, 62}, 90)}})
k._refreshStatTiles = function()
  for bqg, bqh in pairs(bqf) do
    local bqi = m[bqg]
    if (((7 * 7) == 49) and (bqg == g({30, 59, 55, 59, 61, 63}, 90))) then
      bqh(ao((bqi or 0)))
    else
      bqh(as(math.floor((tonumber(bqi) or 0))))
    end
  end
end
bge:Section(g({23, 59, 51, 52, 46, 63, 52, 59, 52, 57, 63}, 90))
bge:Button({Title = g({8, 63, 41, 63, 46, 122, 9, 46, 59, 46, 41}, 90), Icon = g({40, 53, 46, 59, 46, 63, 119, 57, 57, 45}, 90), Callback = function()
  for bqj in pairs(m) do
    m[bqj] = 0
  end
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({9, 46, 59, 46, 41, 122, 40, 63, 41, 63, 46}, 90), g({57, 50, 63, 57, 49}, 90))
end})
bge:Button({Title = g({15, 52, 54, 53, 59, 62, 122, 18, 47, 56}, 90), Icon = g({54, 53, 61, 119, 53, 47, 46}, 90), Callback = function()
  task.spawn(function()
    k._stop()
  end)
end})
local bqk = {shadows = nil, mats = {}, decals = {}, fx = {}, postfx = {}, hideConn = nil}
local function bql(bqm)
  local bqn = Players.LocalPlayer
  local bqo = bqn.Character
  if (((1 + 1) == 2) and (bqo and bqm:IsDescendantOf(bqo))) then
    return true
  end
  for bqp, bqq in ipairs(Players:GetPlayers()) do
    local bqr = bqq.Character
    if (((15 * 15) == 225) and (bqr and bqm:IsDescendantOf(bqr))) then
      return true
    end
  end
  return false
end
local function bqs(bqt)
  task.spawn(function()
    local bqu = workspace:GetDescendants()
    for bqv = 1, #bqu do
      pcall(bqt, bqu[bqv])
      if (((100 % 7) == 2) and ((bqv % 400) == 0)) then
        task.wait()
      end
    end
  end)
end
k._perfRestoreAll = function()
  pcall(function()
    if (((12 * 12) == 144) and (bqk.shadows ~= nil)) then
      aol.GlobalShadows = bqk.shadows
    end
    for bqw, bqx in pairs(bqk.mats) do
      if (((3 ^ 2) == 9) and bqw.Parent) then
        bqw.Material = bqx
      end
    end
    for bqy, bqz in pairs(bqk.decals) do
      if (((7 * 7) == 49) and bqy.Parent) then
        bqy.Transparency = bqz
      end
    end
    for bra, brb in pairs(bqk.fx) do
      if (((1 + 1) == 2) and bra.Parent) then
        bra.Enabled = brb
      end
    end
    for brc, brd in pairs(bqk.postfx) do
      if (((15 * 15) == 225) and brc.Parent) then
        brc.Enabled = brd
      end
    end
    table.clear(bqk.mats)
    table.clear(bqk.decals)
    table.clear(bqk.fx)
    table.clear(bqk.postfx)
    bqk.shadows = nil
    if (((100 % 7) == 2) and bqk.hideConn) then
      bqk.hideConn:Disconnect()
      bqk.hideConn = nil
    end
    for bre, brf in ipairs(Players:GetPlayers()) do
      local brg = brf.Character
      if (((12 * 12) == 144) and (brg and (brf ~= Players.LocalPlayer))) then
        for brh, bri in ipairs(brg:GetDescendants()) do
          pcall(function()
            if (((3 ^ 2) == 9) and bri:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))) then
              bri.LocalTransparencyModifier = 0
            end
          end)
        end
      end
    end
  end)
end
local function brj(brk)
  task.spawn(function()
    if (((7 * 7) == 49) and brk) then
      if (((1 + 1) == 2) and (bqk.shadows == nil)) then
        bqk.shadows = aol.GlobalShadows
      end
      aol.GlobalShadows = false
    elseif (((15 * 15) == 225) and (bqk.shadows ~= nil)) then
      aol.GlobalShadows = bqk.shadows
      bqk.shadows = nil
    end
  end)
end
local function brl(brm)
  task.spawn(function()
    if (((100 % 7) == 2) and not brm) then
      for brn, bro in pairs(bqk.mats) do
        pcall(function()
          if (((12 * 12) == 144) and brn.Parent) then
            brn.Material = bro
          end
        end)
      end
      for brp, brq in pairs(bqk.decals) do
        pcall(function()
          if (((3 ^ 2) == 9) and brp.Parent) then
            brp.Transparency = brq
          end
        end)
      end
      table.clear(bqk.mats)
      table.clear(bqk.decals)
      return
    end
    bqs(function(brr)
      if (((7 * 7) == 49) and bql(brr)) then
        return
      end
      if (((1 + 1) == 2) and ((brr:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) and (brr.Material ~= Enum.Material.SmoothPlastic)) and (bqk.mats[brr] == nil))) then
        bqk.mats[brr] = brr.Material
        brr.Material = Enum.Material.SmoothPlastic
      elseif (((15 * 15) == 225) and (((brr:IsA(g({30, 63, 57, 59, 54}, 90)) or brr:IsA(g({14, 63, 34, 46, 47, 40, 63}, 90)))) and (bqk.decals[brr] == nil))) then
        bqk.decals[brr] = brr.Transparency
        brr.Transparency = 1
      end
    end)
  end)
end
local function brs(brt)
  task.spawn(function()
    if (((100 % 7) == 2) and not brt) then
      for bru, brv in pairs(bqk.fx) do
        pcall(function()
          if (((12 * 12) == 144) and bru.Parent) then
            bru.Enabled = brv
          end
        end)
      end
      table.clear(bqk.fx)
      return
    end
    bqs(function(brw)
      if (((3 ^ 2) == 9) and (((((((brw:IsA(g({10, 59, 40, 46, 51, 57, 54, 63, 31, 55, 51, 46, 46, 63, 40}, 90)) or brw:IsA(g({24, 63, 59, 55}, 90))) or brw:IsA(g({14, 40, 59, 51, 54}, 90))) or brw:IsA(g({28, 51, 40, 63}, 90))) or brw:IsA(g({9, 55, 53, 49, 63}, 90))) or brw:IsA(g({9, 42, 59, 40, 49, 54, 63, 41}, 90)))) and (bqk.fx[brw] == nil))) then
        bqk.fx[brw] = brw.Enabled
        brw.Enabled = false
      end
    end)
  end)
end
local function brx(bry)
  task.spawn(function()
    if (((7 * 7) == 49) and bry) then
      for brz, bsa in ipairs(aol:GetDescendants()) do
        if (((1 + 1) == 2) and (((((((bsa:IsA(g({24, 54, 53, 53, 55, 31, 60, 60, 63, 57, 46}, 90)) or bsa:IsA(g({9, 47, 52, 8, 59, 35, 41, 31, 60, 60, 63, 57, 46}, 90))) or bsa:IsA(g({25, 53, 54, 53, 40, 25, 53, 40, 40, 63, 57, 46, 51, 53, 52, 31, 60, 60, 63, 57, 46}, 90))) or bsa:IsA(g({30, 63, 42, 46, 50, 21, 60, 28, 51, 63, 54, 62, 31, 60, 60, 63, 57, 46}, 90))) or bsa:IsA(g({24, 54, 47, 40, 31, 60, 60, 63, 57, 46}, 90)))) and (bsa.Name ~= g({25, 53, 42, 63, 18, 47, 56, 24, 54, 47, 40}, 90))) and (bqk.postfx[bsa] == nil))) then
          bqk.postfx[bsa] = bsa.Enabled
          pcall(function()
            bsa.Enabled = false
          end)
        end
      end
    else
      for bsb, bsc in pairs(bqk.postfx) do
        pcall(function()
          if (((15 * 15) == 225) and bsb.Parent) then
            bsb.Enabled = bsc
          end
        end)
      end
      table.clear(bqk.postfx)
    end
  end)
end
local function bsd(bse)
  task.spawn(function()
    if (((100 % 7) == 2) and not bse) then
      if (((12 * 12) == 144) and bqk.hideConn) then
        bqk.hideConn:Disconnect()
        bqk.hideConn = nil
      end
      for bsf, bsg in ipairs(Players:GetPlayers()) do
        local bsh = bsg.Character
        if (((3 ^ 2) == 9) and (bsh and (bsg ~= Players.LocalPlayer))) then
          for bsi, bsj in ipairs(bsh:GetDescendants()) do
            pcall(function()
              if (((7 * 7) == 49) and bsj:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))) then
                bsj.LocalTransparencyModifier = 0
              end
            end)
          end
        end
      end
      return
    end
    if (((1 + 1) == 2) and bqk.hideConn) then
      return
    end
    bqk.hideConn = aok.RenderStepped:Connect(function()
      for bsk, bsl in ipairs(Players:GetPlayers()) do
        local bsm = bsl.Character
        if (((15 * 15) == 225) and (bsm and (bsl ~= Players.LocalPlayer))) then
          for bsn, bso in ipairs(bsm:GetDescendants()) do
            if (((100 % 7) == 2) and bso:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))) then
              bso.LocalTransparencyModifier = 1
            end
          end
        end
      end
    end)
  end)
end
local bsp = setmetatable({}, {__mode = g({49}, 90)})
k._visRecords = bsp
local function bsq(bsr, bss, bst)
  for bsu, bsv in ipairs(bsr:GetDescendants()) do
    local bsw = ((bsv:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90)) or bsv:IsA(g({30, 63, 57, 59, 54}, 90))) or bsv:IsA(g({14, 63, 34, 46, 47, 40, 63}, 90)))
    local bsx = (((((bsv:IsA(g({10, 59, 40, 46, 51, 57, 54, 63, 31, 55, 51, 46, 46, 63, 40}, 90)) or bsv:IsA(g({24, 63, 59, 55}, 90))) or bsv:IsA(g({14, 40, 59, 51, 54}, 90))) or bsv:IsA(g({28, 51, 40, 63}, 90))) or bsv:IsA(g({9, 55, 53, 49, 63}, 90))) or bsv:IsA(g({9, 42, 59, 40, 49, 54, 63, 41}, 90)))
    local bsy = (bsv:IsA(g({24, 51, 54, 54, 56, 53, 59, 40, 62, 29, 47, 51}, 90)) or bsv:IsA(g({9, 47, 40, 60, 59, 57, 63, 29, 47, 51}, 90)))
    if (((12 * 12) == 144) and (bsy and bst)) then
      continue
    end
    if (((3 ^ 2) == 9) and ((bsw or bsx) or bsy)) then
      if (((7 * 7) == 49) and bss) then
        if (((1 + 1) == 2) and (bsp[bsv] == nil)) then
          bsp[bsv] = ((bsw and bsv.Transparency) or bsv.Enabled)
        end
        if (((15 * 15) == 225) and bsw) then
          bsv.Transparency = 1
        else
          bsv.Enabled = false
        end
      else
        local bsz = bsp[bsv]
        if (((100 % 7) == 2) and (bsz ~= nil)) then
          if (((12 * 12) == 144) and bsw) then
            bsv.Transparency = bsz
          else
            bsv.Enabled = bsz
          end
          bsp[bsv] = nil
        end
      end
    end
  end
  bsr:SetAttribute(g({25, 53, 42, 63, 12, 51, 41, 18, 51, 62, 62, 63, 52}, 90), ((bss and true) or nil))
end
k._visDebug = {passes = 0, orbProc = 0, orbErr = g({52, 53, 52, 63}, 90)}
task.spawn(function()
  local bta = workspace:WaitForChild(g({5, 5, 14, 18, 19, 20, 29, 9}, 90), 180)
  if (((3 ^ 2) == 9) and not bta) then
    return
  end
  local btb = {{name = g({21, 40, 56, 41}, 90), key = g({18, 51, 62, 63, 21, 40, 56, 41}, 90), keepBB = false}, {name = g({22, 53, 53, 46, 56, 59, 61, 41}, 90), key = g({18, 51, 62, 63, 22, 53, 53, 46, 56, 59, 61, 41}, 90), keepBB = false}, {name = g({25, 53, 51, 52, 41}, 90), key = g({18, 51, 62, 63, 24, 40, 63, 59, 49, 59, 56, 54, 63, 41}, 90), keepBB = true}}
  local btc = {}
  while (((7 * 7) == 49) and (k.Gen == o)) do
    for btd, bte in ipairs(btb) do
      local btf = bta:FindFirstChild(bte.name)
      if (((1 + 1) == 2) and btf) then
        if (((15 * 15) == 225) and (btc[bte.name] ~= btf)) then
          btc[bte.name] = btf
          if (((100 % 7) == 2) and btc[(bte.name .. g({96, 57, 53, 52, 52}, 90))]) then
            pcall(function()
              btc[(bte.name .. g({96, 57, 53, 52, 52}, 90))]:Disconnect()
            end)
          end
          btc[(bte.name .. g({96, 57, 53, 52, 52}, 90))] = btf.ChildAdded:Connect(function(btg)
            task.defer(function()
              if (((12 * 12) == 144) and (k.Gen ~= o)) then
                return
              end
              if (((3 ^ 2) == 9) and (l[bte.key] == true)) then
                pcall(bsq, btg, true, bte.keepBB)
              end
            end)
          end)
        end
        local bth = (l[bte.key] == true)
        for bti, btj in ipairs(btf:GetChildren()) do
          local btk = (btj:GetAttribute(g({25, 53, 42, 63, 12, 51, 41, 18, 51, 62, 62, 63, 52}, 90)) == true)
          if (((7 * 7) == 49) and (bth ~= btk)) then
            local btl, btm = pcall(bsq, btj, bth, bte.keepBB)
            if (((1 + 1) == 2) and ((bte.name == g({21, 40, 56, 41}, 90)) and not btl)) then
              k._visDebug.orbErr = tostring(btm)
            end
          end
        end
        if (((15 * 15) == 225) and (bte.name == g({21, 40, 56, 41}, 90))) then
          k._visDebug.passes += 1
        end
      end
    end
    task.wait(1)
  end
  for btn, bto in pairs(btc) do
    if (((100 % 7) == 2) and ((btn:sub(-5) == g({96, 57, 53, 52, 52}, 90)) and bto)) then
      pcall(function()
        bto:Disconnect()
      end)
    end
  end
end)
local btp = g({25, 53, 42, 63, 19, 52, 63, 40, 46, 9, 46, 59, 52, 62, 19, 52}, 90)
local btq = getgenv().__cope_bfx_backup
if (((12 * 12) == 144) and ((type(btq) ~= g({46, 59, 56, 54, 63}, 90)) or (btq.dm ~= game))) then
  btq = {dm = game, items = {}}
  getgenv().__cope_bfx_backup = btq
end
local btr = btq.items
local function bts(btt, btu)
  return (((btu == g({25, 53, 51, 52, 122, 10, 59, 40, 46, 51, 57, 54, 63}, 90)) and btt.Models) or btt.Particles)
end
local function btv(btw, btx)
  local bty, btz = pcall(function()
    if (((3 ^ 2) == 9) and (btw == g({25, 53, 51, 52, 122, 10, 59, 40, 46, 51, 57, 54, 63}, 90))) then
      return btx:IsA(g({24, 59, 41, 63, 10, 59, 40, 46}, 90))
    end
    if (((7 * 7) == 49) and btx:IsA(g({10, 59, 40, 46, 51, 57, 54, 63, 31, 55, 51, 46, 46, 63, 40}, 90))) then
      return true
    end
    return (#btx:GetChildren() > 0)
  end)
  return (bty and (btz == true))
end
local function bua(bub)
  local buc, bud = pcall(getnilinstances)
  if (((1 + 1) == 2) and (not buc or (type(bud) ~= g({46, 59, 56, 54, 63}, 90)))) then
    return nil
  end
  for bue, buf in ipairs(bud) do
    local bug = false
    pcall(function()
      bug = ((((typeof(buf) == g({19, 52, 41, 46, 59, 52, 57, 63}, 90)) and (buf.Name == bub)) and (buf:GetAttribute(btp) == nil)) and btv(bub, buf))
    end)
    if (((15 * 15) == 225) and bug) then
      return buf
    end
  end
  return nil
end
k._bfxRestore = function()
  if (((100 % 7) == 2) and not next(btr)) then
    return
  end
  local buh = (k.Library and k.Library.Assets)
  if (((12 * 12) == 144) and buh) then
    for bui, buj in pairs(btr) do
      if (((3 ^ 2) == 9) and ((buj and (buj.Parent == nil)) and btv(bui, buj))) then
        local buk = bts(buh, bui)
        local bul = buk:FindFirstChild(bui)
        if (((7 * 7) == 49) and (bul and bul:GetAttribute(btp))) then
          bul:Destroy()
        end
        buj.Parent = buk
      end
    end
  end
  table.clear(btr)
end
k._applyBreakFx = function(bum)
  task.spawn(function()
    while (((1 + 1) == 2) and ((k.Gen == o) and not k.Library)) do
      task.wait(0.5)
    end
    if (((15 * 15) == 225) and (k.Gen ~= o)) then
      return
    end
    local bun = (k.Library and k.Library.Assets)
    if (((100 % 7) == 2) and not bun) then
      return
    end
    if (((12 * 12) == 144) and not bum) then
      k._bfxRestore()
      return
    end
    local function buo(bup, buq)
      if (((3 ^ 2) == 9) and btr[buq]) then
        return
      end
      local bur = bup:FindFirstChild(buq)
      if (((7 * 7) == 49) and (not bur or bur:GetAttribute(btp))) then
        return
      end
      if (((1 + 1) == 2) and btv(buq, bur)) then
        btr[buq] = bur
        bur.Parent = nil
      else
        local bus = bua(buq)
        if (((15 * 15) == 225) and bus) then
          btr[buq] = bus
        end
        bur:Destroy()
      end
      local but
      if (((100 % 7) == 2) and (buq == g({25, 53, 51, 52, 122, 10, 59, 40, 46, 51, 57, 54, 63}, 90))) then
        but = Instance.new(g({10, 59, 40, 46}, 90))
        but.Anchored = true
        but.CanCollide = false
        but.CanQuery = false
        but.CanTouch = false
        but.CastShadow = false
        but.Transparency = 1
        but.Size = Vector3.new(0.001, 0.001, 0.001)
      elseif (((12 * 12) == 144) and (buq == g({10, 63, 46, 122, 30, 59, 55, 59, 61, 63}, 90))) then
        but = Instance.new(g({10, 59, 40, 46, 51, 57, 54, 63, 31, 55, 51, 46, 46, 63, 40}, 90))
        but.Transparency = NumberSequence.new(1)
        but.Size = NumberSequence.new(0)
        but.Lifetime = NumberRange.new(0, 0)
      else
        but = Instance.new(g({28, 53, 54, 62, 63, 40}, 90))
      end
      but.Name = buq
      but:SetAttribute(btp, true)
      but.Parent = bup
    end
    for buu, buv in ipairs({g({25, 53, 51, 52, 122, 31, 34, 42, 54, 53, 62, 63}, 90), g({25, 53, 51, 52, 122, 30, 59, 55, 59, 61, 63}, 90), g({10, 63, 46, 122, 30, 59, 55, 59, 61, 63}, 90)}) do
      buo(bun.Particles, buv)
    end
    buo(bun.Models, g({25, 53, 51, 52, 122, 10, 59, 40, 46, 51, 57, 54, 63}, 90))
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
  local buw = k._leakStore.orig
  if (((15 * 15) == 225) and (type(buw) ~= g({60, 47, 52, 57, 46, 51, 53, 52}, 90))) then
    return nil, nil
  end
  local bux, buy = pcall(debug.getupvalue, buw, 1)
  local buz, bva = pcall(debug.getupvalue, buw, 2)
  if (((100 % 7) == 2) and (((not bux or not buz) or (type(bva) ~= g({46, 59, 56, 54, 63}, 90))) or (type(buy) ~= g({52, 47, 55, 56, 63, 40}, 90)))) then
    return nil, nil
  end
  return bva, buy
end
k._leakInstall = function()
  local bvb = k._leakStore
  local bvc = k.Library
  if (((12 * 12) == 144) and (not bvc or (type(bvc.Functions) ~= g({46, 59, 56, 54, 63}, 90)))) then
    return false
  end
  if (((3 ^ 2) == 9) and not bvb.orig) then
    local bvd = bvc.Functions.AddDebris
    if (((7 * 7) == 49) and ((type(bvd) ~= g({60, 47, 52, 57, 46, 51, 53, 52}, 90)) or (bvd == bvb.patched))) then
      return false
    end
    bvb.orig = bvd
    if (((1 + 1) == 2) and not k._leakBuckets()) then
      bvb.orig = nil
      return false
    end
  end
  if (((15 * 15) == 225) and not bvb.patched) then
    bvb.patched = function(bve, bvf)
      if (((100 % 7) == 2) and (typeof(bve) ~= g({19, 52, 41, 46, 59, 52, 57, 63}, 90))) then
        return
      end
      local bvg = tonumber(bvf)
      if (((12 * 12) == 144) and ((bvg == nil) or (bvg ~= bvg))) then
        bvg = 0
      end
      if (((3 ^ 2) == 9) and (bvg == math.huge)) then
        return
      end
      if (((7 * 7) == 49) and (bvg <= 0)) then
        task.defer(function()
          pcall(function()
            bve:Destroy()
          end)
        end)
      else
        task.delay(bvg, function()
          pcall(function()
            bve:Destroy()
          end)
        end)
      end
    end
  end
  if (((1 + 1) == 2) and (bvc.Functions.AddDebris ~= bvb.patched)) then
    bvc.Functions.AddDebris = bvb.patched
  end
  return true
end
k._leakRestore = function()
  local bvh = k._leakStore
  local bvi = k.Library
  if (((15 * 15) == 225) and (((bvi and (type(bvi.Functions) == g({46, 59, 56, 54, 63}, 90))) and bvh.orig) and (bvi.Functions.AddDebris == bvh.patched))) then
    bvi.Functions.AddDebris = bvh.orig
  end
end
k._leakArmed = function()
  local bvj = false
  pcall(function()
    local bvk = k._leakStore
    bvj = ((bvk.orig ~= nil) and (k.Library.Functions.AddDebris == bvk.patched))
  end)
  return bvj
end
k._leakPurge = function()
  local bvl, bvm = k._leakBuckets()
  if (((100 % 7) == 2) and not bvl) then
    return 0, 0, false
  end
  local bvn = (bvm - k.LeakMargin)
  local bvo, bvp, bvq = {}, 0, 0
  for bvr, bvs in pairs(bvl) do
    if (((12 * 12) == 144) and ((type(bvr) == g({52, 47, 55, 56, 63, 40}, 90)) and (bvr < bvn))) then
      bvo[(#bvo + 1)] = bvr
    else
      bvq += 1
    end
  end
  local bvt = math.min(#bvo, 2000)
  for bvu = 1, bvt do
    local bvv = bvl[bvo[bvu]]
    if (((3 ^ 2) == 9) and (type(bvv) == g({46, 59, 56, 54, 63}, 90))) then
      bvp += #bvv
    end
    bvl[bvo[bvu]] = nil
    if (((7 * 7) == 49) and ((bvu % 200) == 0)) then
      task.wait()
    end
  end
  k._leakStore.released += bvp
  n.LeakReleased = k._leakStore.released
  n.LeakBacklog = (#bvo - bvt)
  n.LeakBuckets = (bvq + n.LeakBacklog)
  n.LeakLastPass = bvp
  return bvt, bvp, (bvt < #bvo)
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
    local bvw = false
    if (((12 * 12) == 144) and (l.LeakGuard ~= false)) then
      pcall(k._leakInstall)
      local bvx, bvy, bvz, bwa = pcall(k._leakPurge)
      bvw = (bvx and (bwa == true))
    else
      pcall(k._leakRestore)
      n.LeakBacklog = nil
    end
    n.LeakArmed = k._leakArmed()
    local bwb = ((bvw and 1) or k._leakPurgeSecs())
    for bwc = 1, bwb do
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
  local bwd = game:GetService(g({30, 63, 56, 40, 51, 41}, 90))
  local bwe, bwf = workspace:FindFirstChild(g({5, 5, 30, 31, 24, 8, 19, 9}, 90)), 0
  while (((7 * 7) == 49) and ((not bwe and (k.Gen == o)) and (bwf < 180))) do
    task.wait(0.5)
    bwf += 0.5
    bwe = workspace:FindFirstChild(g({5, 5, 30, 31, 24, 8, 19, 9}, 90))
  end
  if (((1 + 1) == 2) and (not bwe or (k.Gen ~= o))) then
    return
  end
  n.DebrisFolder = bwe
  local function bwg(bwh)
    if (((15 * 15) == 225) and ((bwh.Name ~= g({50, 53, 41, 46}, 90)) or (l.DebrisSweep == false))) then
      return
    end
    n.DebrisSwept = (((n.DebrisSwept or 0)) + 1)
    pcall(function()
      bwd:AddItem(bwh, k._sweepSecs())
    end)
  end
  for bwi, bwj in ipairs(bwe:GetChildren()) do
    bwg(bwj)
  end
  n.DebrisConn = bwe.ChildAdded:Connect(function(bwk)
    if (((100 % 7) == 2) and (k.Gen ~= o)) then
      if (((12 * 12) == 144) and n.DebrisConn) then
        n.DebrisConn:Disconnect()
      end
      return
    end
    bwg(bwk)
  end)
end)
k._killIdleTracker = function()
  local bwl = 0
  pcall(function()
    for bwm, bwn in ipairs(getconnections(game:GetService(g({8, 47, 52, 9, 63, 40, 44, 51, 57, 63}, 90)).Heartbeat)) do
      local bwo = bwn.Function
      if (((3 ^ 2) == 9) and bwo) then
        local bwp = select(1, debug.info(bwo, g({41}, 90)))
        if (((7 * 7) == 49) and (((type(bwp) == g({41, 46, 40, 51, 52, 61}, 90)) and string.find(bwp, g({19, 62, 54, 63, 122, 14, 40, 59, 57, 49, 51, 52, 61}, 90), 1, true)) and bwn.Enabled)) then
          pcall(function()
            bwn:Disable()
          end)
          if (((1 + 1) == 2) and (bwn.Enabled == false)) then
            bwl += 1
          end
        end
      end
    end
  end)
  n.IdleKilled = (((n.IdleKilled or 0)) + bwl)
  return bwl
end
task.spawn(function()
  while (((15 * 15) == 225) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  for bwq = 1, 40 do
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
  local bwr = game:GetService(g({9, 46, 59, 46, 41}, 90))
  local bws = 0
  for bwt, bwu in ipairs(Enum.DeveloperMemoryTag:GetEnumItems()) do
    local bwv, bww = pcall(function()
      return bwr:GetMemoryUsageMbForTag(bwu)
    end)
    if (((3 ^ 2) == 9) and (((bwv and (type(bww) == g({52, 47, 55, 56, 63, 40}, 90))) and (bww == bww)) and (bww ~= math.huge))) then
      bws += bww
    end
  end
  return math.floor(bws)
end
k._memLimit = function()
  return math.clamp(math.floor((tonumber(l.MemGuardMb) or 2600)), 800, 12000)
end
k._rejoinBlocked = function()
  return (l.NoRejoin ~= false)
end
k._refreshClient = function(bwx)
  if (((7 * 7) == 49) and k._rejoinBlocked()) then
    n.RejoinRefused = (((n.RejoinRefused or 0)) + 1)
    n.RejoinRefusedWhy = tostring(bwx)
    return false
  end
  if (((1 + 1) == 2) and n.MemRejoining) then
    return false
  end
  n.MemRejoining = true
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({8, 63, 60, 40, 63, 41, 50, 51, 52, 61, 122, 57, 54, 51, 63, 52, 46, 122, 8270, 122}, 90) .. tostring(bwx)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
  pcall(function()
    k.SaveSettings(true)
  end)
  pcall(function()
    k._notifyWebhook(g({25, 54, 51, 63, 52, 46, 122, 40, 63, 60, 40, 63, 41, 50}, 90), string.format(g({112, 112, 127, 41, 112, 112, 122, 51, 41, 122, 40, 63, 48, 53, 51, 52, 51, 52, 61, 122, 46, 53, 122, 60, 40, 63, 63, 122, 55, 63, 55, 53, 40, 35, 116, 80, 127, 41, 80, 9, 63, 41, 41, 51, 53, 52, 96, 122, 112, 112, 127, 62, 55, 112, 112}, 90), Players.LocalPlayer.Name, tostring(bwx), math.floor((((os.clock() - aon.T0)) / 60))), 0xFBBF24)
  end)
  task.wait(2)
  pcall(function()
    game:GetService(g({14, 63, 54, 63, 42, 53, 40, 46, 9, 63, 40, 44, 51, 57, 63}, 90)):Teleport(game.PlaceId, Players.LocalPlayer)
  end)
  return true
end
k._memReclaim = function(bwy)
  if (((15 * 15) == 225) and n.MemReclaiming) then
    return 0
  end
  n.MemReclaiming = true
  local bwz = (n.MemMb or 0)
  local bxa = 0
  for bxb = 1, 60 do
    local bxc, bxd, bxe, bxf = pcall(k._leakPurge)
    if (((100 % 7) == 2) and not bxc) then
      break
    end
    bxa += ((tonumber(bxe) or 0))
    if (((12 * 12) == 144) and (bxf ~= true)) then
      break
    end
    task.wait()
  end
  pcall(function()
    if (((3 ^ 2) == 9) and n.DebrisFolder) then
      for bxg, bxh in ipairs(n.DebrisFolder:GetChildren()) do
        pcall(function()
          bxh:Destroy()
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
  local bxi = k._memoryMb()
  n.MemMb = bxi
  n.MemReclaimed = (((n.MemReclaimed or 0)) + bxa)
  n.MemLastReclaim = os.time()
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({23, 63, 55, 53, 40, 35, 122, 40, 63, 57, 54, 59, 51, 55, 122, 8270, 122, 40, 63, 54, 63, 59, 41, 63, 62, 122, 127, 41, 122, 53, 56, 48, 63, 57, 46, 41, 118, 122, 127, 41, 122, 23, 24, 122, 119, 100, 122, 127, 41, 122, 23, 24, 122, 114, 127, 41, 115}, 90), as(bxa), as(bwz), as(bxi), tostring(bwy)), g({41, 50, 51, 63, 54, 62}, 90))
  pcall(function()
    k._notifyWebhook(g({23, 63, 55, 53, 40, 35, 122, 40, 63, 57, 54, 59, 51, 55}, 90), string.format(g({112, 112, 127, 41, 112, 112, 122, 50, 51, 46, 122, 46, 50, 63, 122, 57, 63, 51, 54, 51, 52, 61, 122, 59, 52, 62, 122, 40, 63, 57, 54, 59, 51, 55, 63, 62, 122, 51, 52, 122, 42, 54, 59, 57, 63, 122, 51, 52, 41, 46, 63, 59, 62, 122, 53, 60, 122, 40, 63, 48, 53, 51, 52, 51, 52, 61, 116, 80, 127, 41, 80, 8, 63, 54, 63, 59, 41, 63, 62, 122, 112, 112, 127, 41, 112, 112, 122, 53, 56, 48, 63, 57, 46, 41, 118, 122, 112, 112, 127, 41, 122, 23, 24, 122, 119, 100, 122, 127, 41, 122, 23, 24, 112, 112}, 90), Players.LocalPlayer.Name, tostring(bwy), as(bxa), as(bwz), as(bxi)), 0x22D3EE)
  end)
  n.MemReclaiming = false
  return bxa
end
task.spawn(function()
  while (((7 * 7) == 49) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local bxj, bxk, bxl = os.clock(), nil, 0
  while (((1 + 1) == 2) and (k.Gen == o)) do
    task.wait(10)
    local bxm = k._memoryMb()
    n.MemMb = bxm
    n.MemPeak = math.max((n.MemPeak or 0), bxm)
    local bxn
    if (((15 * 15) == 225) and (l.MemGuard ~= false)) then
      local bxo = k._memLimit()
      if (((100 % 7) == 2) and (bxm >= bxo)) then
        bxk = (bxk or os.clock())
        if (((12 * 12) == 144) and ((os.clock() - bxk) >= 30)) then
          bxn = string.format(g({127, 62, 122, 23, 24, 122, 47, 41, 63, 62, 118, 122, 57, 63, 51, 54, 51, 52, 61, 122, 51, 41, 122, 127, 62, 122, 23, 24}, 90), bxm, bxo)
        end
      else
        bxk = nil
      end
    end
    local bxp = math.clamp((tonumber(l.MemRejoinHours) or 0), 0, 24)
    if (((3 ^ 2) == 9) and (((not bxn and (bxp > 0)) and (((os.clock() - bxj)) >= (bxp * 3600))) and not k._rejoinBlocked())) then
      bxn = string.format(g({41, 57, 50, 63, 62, 47, 54, 63, 62, 122, 127, 61, 50, 122, 40, 63, 60, 40, 63, 41, 50}, 90), bxp)
    end
    if (((7 * 7) == 49) and (bxn and (((os.clock() - bxl)) > 120))) then
      bxl = os.clock()
      bxk = nil
      if (((1 + 1) == 2) and k._rejoinBlocked()) then
        k._memReclaim(bxn)
      else
        k._refreshClient(bxn)
      end
    end
  end
end)
k._bgState = {render3dOff = false, qualityHeld = nil, capHeld = nil, render3dOk = nil, qualityOk = nil, capOk = nil, auto = false}
k._bgFpsCap = function()
  return math.clamp(math.floor((tonumber(l.BgFpsCap) or 30)), 5, 240)
end
k._bgSetCap = function(bxq)
  local bxr = k._bgState
  local bxs = ((rawget(getgenv(), g({41, 63, 46, 60, 42, 41, 57, 59, 42}, 90)) or setfpscap) or set_fps_cap)
  if (((15 * 15) == 225) and (type(bxs) ~= g({60, 47, 52, 57, 46, 51, 53, 52}, 90))) then
    bxr.capOk = false
    return false
  end
  local bxt = pcall(bxs, (bxq or 0))
  bxr.capOk = bxt
  if (((100 % 7) == 2) and bxt) then
    bxr.capHeld = bxq
  end
  return bxt
end
k._bgSetRender = function(bxu)
  local bxv = k._bgState
  local bxw = pcall(function()
    game:GetService(g({8, 47, 52, 9, 63, 40, 44, 51, 57, 63}, 90)):Set3dRenderingEnabled(not bxu)
  end)
  bxv.render3dOk = bxw
  if (((12 * 12) == 144) and bxw) then
    bxv.render3dOff = bxu
  end
  return bxw
end
k._bgSetQuality = function(bxx)
  local bxy = k._bgState
  local bya = pcall(function()
    local bxz = settings().Rendering
    if (((3 ^ 2) == 9) and bxx) then
      if (((7 * 7) == 49) and (bxy.qualityHeld == nil)) then
        bxy.qualityHeld = bxz.QualityLevel
      end
      bxz.QualityLevel = Enum.QualityLevel.Level01
    elseif (((1 + 1) == 2) and (bxy.qualityHeld ~= nil)) then
      bxz.QualityLevel = bxy.qualityHeld
      bxy.qualityHeld = nil
    end
  end)
  bxy.qualityOk = bya
  return bya
end
k._bgApply = function(byb)
  local byc = k._bgState
  if (((15 * 15) == 225) and byb) then
    k._bgSetCap(k._bgFpsCap())
    k._bgSetQuality(true)
    if (((100 % 7) == 2) and (l.BgRender3D ~= false)) then
      k._bgSetRender(true)
    elseif (((12 * 12) == 144) and byc.render3dOff) then
      k._bgSetRender(false)
    end
  else
    if (((3 ^ 2) == 9) and byc.render3dOff) then
      k._bgSetRender(false)
    end
    k._bgSetQuality(false)
    k._bgSetCap(0)
  end
  n.BgOn = ((byb and true) or false)
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
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 53, 60, 60, 122, 8270, 122, 40, 63, 52, 62, 63, 40, 51, 52, 61, 122, 40, 63, 41, 46, 53, 40, 63, 62, 122, 114, 28, 98, 115}, 90), g({57, 50, 63, 57, 49}, 90))
end
k._bgReport = function()
  local byd = k._bgState
  if (((1 + 1) == 2) and not n.BgOn) then
    return g({53, 60, 60}, 90)
  end
  if (((15 * 15) == 225) and byd.render3dOff) then
    return g({105, 30, 122, 53, 60, 60}, 90)
  end
  if (((100 % 7) == 2) and (byd.render3dOk == false)) then
    return g({57, 59, 42, 42, 63, 62, 122, 114, 105, 30, 122, 56, 54, 53, 57, 49, 63, 62, 115}, 90)
  end
  return g({57, 59, 42, 42, 63, 62}, 90)
end
task.spawn(function()
  while (((12 * 12) == 144) and (k.Gen == o)) do
    task.wait(2)
    local bye
    if (((3 ^ 2) == 9) and (l.BgAuto == true)) then
      bye = not n.UIVisible
    else
      bye = (l.BgMode == true)
    end
    if (((7 * 7) == 49) and (bye ~= ((n.BgOn == true)))) then
      pcall(k._bgApply, bye)
    end
  end
end)
bgf:Section(g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63}, 90))
k._bgTiles = bgf:StatGrid({{Key = g({9, 46, 59, 46, 63}, 90), Title = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63}, 90)}, {Key = g({28, 42, 41}, 90), Title = g({28, 10, 9, 122, 117, 122, 25, 59, 42}, 90)}})
k._bgW = {}
k._refreshBgTiles = function()
  local byf = k._bgTiles
  byf.State(k._bgReport())
  byf.Fps(string.format(g({127, 62, 122, 117, 122, 127, 41}, 90), (aon.FPS or 0), ((n.BgOn and tostring(k._bgFpsCap())) or g({52, 53, 52, 63}, 90))))
end
k._refreshBgToggles = function()
  local byg = k._bgW
  pcall(function()
    byg.main:Set((l.BgMode == true), true)
  end)
  pcall(function()
    byg.auto:Set((l.BgAuto == true), true)
  end)
  pcall(function()
    byg.render:Set((l.BgRender3D ~= false), true)
  end)
end
k._bgW.main = bgf:Toggle({Title = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63}, 90), Desc = g({9, 46, 53, 42, 41, 122, 46, 50, 51, 41, 122, 46, 59, 56, 122, 62, 40, 59, 45, 51, 52, 61, 122, 46, 50, 63, 122, 45, 53, 40, 54, 62, 122, 59, 46, 122, 59, 54, 54, 116, 122, 14, 50, 63, 122, 60, 59, 40, 55, 122, 49, 63, 63, 42, 41, 122, 40, 47, 52, 52, 51, 52, 61, 122, 59, 46, 122, 60, 47, 54, 54, 122, 41, 42, 63, 63, 62, 122, 8270, 122, 53, 52, 54, 35, 122, 46, 50, 63, 122, 40, 63, 52, 62, 63, 40, 63, 40, 122, 41, 54, 63, 63, 42, 41, 116, 122, 14, 50, 63, 122, 56, 51, 61, 61, 63, 41, 46, 122, 41, 51, 52, 61, 54, 63, 122, 28, 10, 9, 122, 45, 51, 52, 122, 50, 63, 40, 63, 118, 122, 59, 52, 62, 122, 51, 46, 122, 60, 40, 63, 63, 41, 122, 46, 50, 63, 122, 29, 10, 15, 122, 60, 53, 40, 122, 46, 50, 63, 122, 46, 59, 56, 122, 35, 53, 47, 122, 59, 40, 63, 122, 59, 57, 46, 47, 59, 54, 54, 35, 122, 45, 59, 46, 57, 50, 51, 52, 61, 116, 122, 28, 98, 122, 47, 52, 62, 53, 63, 41, 122, 51, 46, 122, 59, 52, 35, 122, 46, 51, 55, 63}, 90), Value = (l.BgMode == true), Callback = function(byh)
  l.BgMode = byh
  if (((1 + 1) == 2) and byh) then
    l.BgAuto = false
  end
  pcall(k._bgApply, byh)
  if (((15 * 15) == 225) and byh) then
    if (((100 % 7) == 2) and ((k._bgState.render3dOk == false) and (l.BgRender3D ~= false))) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 53, 52, 122, 8270, 122, 60, 40, 59, 55, 63, 122, 57, 59, 42, 122, 53, 52, 54, 35, 118, 122, 46, 50, 51, 41, 122, 57, 54, 51, 63, 52, 46, 122, 45, 51, 54, 54, 122, 52, 53, 46, 122, 54, 63, 46, 122, 46, 50, 63, 122, 40, 63, 52, 62, 63, 40, 63, 40, 122, 56, 63, 122, 41, 45, 51, 46, 57, 50, 63, 62, 122, 53, 60, 60}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
    else
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 53, 52, 122, 8270, 122}, 90) .. (k._bgReport() .. g({116, 122, 10, 40, 63, 41, 41, 122, 28, 98, 122, 46, 53, 122, 61, 63, 46, 122, 46, 50, 63, 122, 42, 51, 57, 46, 47, 40, 63, 122, 56, 59, 57, 49}, 90))), g({41, 50, 51, 63, 54, 62}, 90))
    end
  else
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 53, 60, 60, 122, 8270, 122, 40, 63, 52, 62, 63, 40, 51, 52, 61, 122, 40, 63, 41, 46, 53, 40, 63, 62}, 90), g({57, 50, 63, 57, 49}, 90))
  end
end})
k._bgW.auto = bgf:Toggle({Title = g({21, 52, 54, 35, 122, 13, 50, 51, 54, 63, 122, 14, 50, 63, 122, 18, 47, 56, 122, 19, 41, 122, 18, 51, 62, 62, 63, 52}, 90), Desc = g({31, 52, 61, 59, 61, 63, 41, 122, 24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 45, 50, 63, 52, 63, 44, 63, 40, 122, 35, 53, 47, 122, 50, 51, 62, 63, 122, 46, 50, 63, 122, 50, 47, 56, 122, 59, 52, 62, 122, 54, 51, 60, 46, 41, 122, 51, 46, 122, 45, 50, 63, 52, 122, 35, 53, 47, 122, 56, 40, 51, 52, 61, 122, 51, 46, 122, 56, 59, 57, 49, 116, 122, 24, 63, 41, 46, 122, 41, 63, 46, 46, 51, 52, 61, 122, 60, 53, 40, 122, 53, 44, 63, 40, 52, 51, 61, 50, 46, 122, 40, 47, 52, 41, 122, 8270, 122, 35, 53, 47, 122, 41, 63, 63, 122, 59, 122, 52, 53, 40, 55, 59, 54, 122, 61, 59, 55, 63, 122, 45, 50, 63, 52, 63, 44, 63, 40, 122, 35, 53, 47, 122, 54, 53, 53, 49, 122, 59, 46, 122, 51, 46}, 90), Value = (l.BgAuto == true), Callback = function(byi)
  l.BgAuto = byi
  if (((12 * 12) == 144) and byi) then
    l.BgMode = false
    pcall(function()
      k._bgW.main:Set(false, true)
    end)
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 45, 51, 54, 54, 122, 60, 53, 54, 54, 53, 45, 122, 46, 50, 63, 122, 50, 47, 56, 122, 8270, 122, 50, 51, 62, 62, 63, 52, 122, 55, 63, 59, 52, 41, 122, 59, 41, 54, 63, 63, 42}, 90), g({57, 50, 63, 57, 49}, 90))
  else
    pcall(k._bgApply, false)
  end
end})
k._bgW.render = bgf:Toggle({Title = g({9, 46, 53, 42, 122, 105, 30, 122, 8, 63, 52, 62, 63, 40, 51, 52, 61}, 90), Desc = g({14, 50, 63, 122, 42, 59, 40, 46, 122, 53, 60, 122, 24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 46, 50, 59, 46, 122, 62, 53, 63, 41, 122, 46, 50, 63, 122, 45, 53, 40, 49, 116, 122, 21, 60, 60, 122, 54, 63, 59, 44, 63, 41, 122, 53, 52, 54, 35, 122, 46, 50, 63, 122, 60, 40, 59, 55, 63, 122, 57, 59, 42, 122, 59, 52, 62, 122, 46, 50, 63, 122, 43, 47, 59, 54, 51, 46, 35, 122, 62, 40, 53, 42, 118, 122, 45, 50, 51, 57, 50, 122, 51, 41, 122, 61, 63, 52, 46, 54, 63, 40, 122, 56, 47, 46, 122, 52, 53, 45, 50, 63, 40, 63, 122, 52, 63, 59, 40, 122, 59, 41, 122, 57, 50, 63, 59, 42}, 90), Value = (l.BgRender3D ~= false), Callback = function(byj)
  l.BgRender3D = byj
  if (((3 ^ 2) == 9) and n.BgOn) then
    pcall(k._bgApply, true)
  end
  if (((7 * 7) == 49) and not byj) then
    pcall(k._bgSetRender, false)
  end
end})
bgf:Slider({Title = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 28, 10, 9, 122, 25, 59, 42}, 90), Desc = g({28, 40, 59, 55, 63, 41, 122, 42, 63, 40, 122, 41, 63, 57, 53, 52, 62, 122, 45, 50, 51, 54, 63, 122, 24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 51, 41, 122, 53, 52, 116, 122, 105, 106, 122, 51, 41, 122, 42, 54, 63, 52, 46, 35, 122, 60, 53, 40, 122, 59, 122, 60, 59, 40, 55, 97, 122, 107, 106, 122, 51, 41, 122, 60, 51, 52, 63, 122, 51, 60, 122, 52, 53, 46, 50, 51, 52, 61, 122, 53, 52, 122, 41, 57, 40, 63, 63, 52, 122, 52, 63, 63, 62, 41, 122, 46, 53, 122, 54, 53, 53, 49, 122, 41, 55, 53, 53, 46, 50, 116, 122, 22, 51, 60, 46, 63, 62, 122, 46, 50, 63, 122, 55, 53, 55, 63, 52, 46, 122, 24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 61, 53, 63, 41, 122, 53, 60, 60}, 90), Value = {Min = 5, Max = 240, Default = (tonumber(l.BgFpsCap) or 30)}, Step = 5, Callback = function(byk)
  l.BgFpsCap = byk
  if (((1 + 1) == 2) and n.BgOn) then
    pcall(k._bgSetCap, k._bgFpsCap())
  end
end})
bgf:Button({Title = g({8, 63, 41, 46, 53, 40, 63, 122, 8, 63, 52, 62, 63, 40, 51, 52, 61, 122, 20, 53, 45, 122, 114, 28, 98, 115}, 90), Desc = g({10, 59, 52, 51, 57, 122, 56, 47, 46, 46, 53, 52, 116, 122, 14, 47, 40, 52, 41, 122, 24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 59, 52, 62, 122, 46, 50, 63, 122, 59, 47, 46, 53, 122, 40, 47, 54, 63, 122, 53, 60, 60, 122, 59, 52, 62, 122, 42, 47, 46, 41, 122, 46, 50, 63, 122, 40, 63, 52, 62, 63, 40, 63, 40, 118, 122, 43, 47, 59, 54, 51, 46, 35, 122, 59, 52, 62, 122, 60, 40, 59, 55, 63, 122, 57, 59, 42, 122, 56, 59, 57, 49}, 90), Callback = function()
  k._bgPanic()
end})
bgf:Section(g({28, 10, 9, 122, 24, 53, 53, 41, 46, 63, 40, 41}, 90))
local byl = {}
local bym = false
bgf:Toggle({Title = g({23, 59, 34, 122, 28, 10, 9, 122, 23, 53, 62, 63}, 90), Desc = g({21, 52, 63, 122, 41, 45, 51, 46, 57, 50, 122, 8270, 122, 41, 50, 59, 62, 53, 45, 41, 118, 122, 42, 59, 40, 46, 51, 57, 54, 63, 41, 118, 122, 42, 53, 41, 46, 119, 42, 40, 53, 57, 63, 41, 41, 51, 52, 61, 118, 122, 46, 63, 34, 46, 47, 40, 63, 41, 122, 59, 52, 62, 122, 56, 40, 63, 59, 49, 122, 63, 60, 60, 63, 57, 46, 41, 122, 59, 54, 54, 122, 53, 60, 60, 116, 122, 28, 47, 54, 54, 35, 122, 40, 63, 44, 63, 40, 41, 51, 56, 54, 63}, 90), Value = (l.PerfMaxMode == true), Callback = function(byn)
  l.PerfMaxMode = byn
  if (((15 * 15) == 225) and bym) then
    return
  end
  bym = true
  for byo, byp in ipairs(byl) do
    pcall(function()
      byp:Set(byn, true)
    end)
  end
  if (((100 % 7) == 2) and byn) then
    pcall(aon.SetBlur, false)
  end
  bym = false
end})
table.insert(byl, bgf:Toggle({Title = g({30, 51, 41, 59, 56, 54, 63, 122, 9, 50, 59, 62, 53, 45, 41}, 90), Desc = g({14, 47, 40, 52, 41, 122, 53, 60, 60, 122, 61, 54, 53, 56, 59, 54, 122, 54, 51, 61, 50, 46, 51, 52, 61, 122, 41, 50, 59, 62, 53, 45, 41}, 90), Value = (l.PerfNoShadows == true), Callback = function(byq)
  l.PerfNoShadows = byq
  brj(byq)
end}))
table.insert(byl, bgf:Toggle({Title = g({30, 51, 41, 59, 56, 54, 63, 122, 10, 53, 41, 46, 119, 10, 40, 53, 57, 63, 41, 41, 51, 52, 61}, 90), Desc = g({14, 47, 40, 52, 41, 122, 53, 60, 60, 122, 24, 54, 53, 53, 55, 118, 122, 57, 53, 54, 53, 47, 40, 122, 57, 53, 40, 40, 63, 57, 46, 51, 53, 52, 118, 122, 41, 47, 52, 122, 40, 59, 35, 41, 122, 59, 52, 62, 122, 62, 63, 42, 46, 50, 119, 53, 60, 119, 60, 51, 63, 54, 62, 122, 51, 52, 122, 22, 51, 61, 50, 46, 51, 52, 61, 122, 8270, 122, 59, 122, 57, 50, 63, 59, 42, 122, 29, 10, 15, 122, 45, 51, 52}, 90), Value = (l.PerfPostFX == true), Callback = function(byr)
  l.PerfPostFX = byr
  brx(byr)
end}))
table.insert(byl, bgf:Toggle({Title = g({8, 63, 55, 53, 44, 63, 122, 14, 63, 34, 46, 47, 40, 63, 41, 122, 117, 122, 23, 59, 46, 63, 40, 51, 59, 54, 41}, 90), Desc = g({28, 54, 59, 46, 46, 63, 52, 41, 122, 46, 50, 63, 122, 55, 59, 42, 122, 46, 53, 122, 9, 55, 53, 53, 46, 50, 10, 54, 59, 41, 46, 51, 57, 122, 59, 52, 62, 122, 50, 51, 62, 63, 41, 122, 62, 63, 57, 59, 54, 41, 116, 122, 8, 63, 44, 63, 40, 46, 41, 122, 45, 50, 63, 52, 122, 46, 53, 61, 61, 54, 63, 62, 122, 53, 60, 60, 122, 53, 40, 122, 53, 52, 122, 47, 52, 54, 53, 59, 62}, 90), Value = (l.PerfTextures == true), Callback = function(bys)
  l.PerfTextures = bys
  brl(bys)
end}))
table.insert(byl, bgf:Toggle({Title = g({30, 51, 41, 59, 56, 54, 63, 122, 10, 59, 40, 46, 51, 57, 54, 63, 41}, 90), Desc = g({17, 51, 54, 54, 41, 122, 42, 59, 40, 46, 51, 57, 54, 63, 122, 63, 55, 51, 46, 46, 63, 40, 41, 118, 122, 56, 63, 59, 55, 41, 118, 122, 46, 40, 59, 51, 54, 41, 118, 122, 60, 51, 40, 63, 122, 59, 52, 62, 122, 41, 55, 53, 49, 63}, 90), Value = (l.PerfParticles == true), Callback = function(byt)
  l.PerfParticles = byt
  brs(byt)
end}))
bgf:Toggle({Title = g({18, 51, 62, 63, 122, 21, 46, 50, 63, 40, 122, 10, 54, 59, 35, 63, 40, 41}, 90), Desc = g({23, 59, 49, 63, 41, 122, 53, 46, 50, 63, 40, 122, 42, 54, 59, 35, 63, 40, 41, 125, 122, 57, 50, 59, 40, 59, 57, 46, 63, 40, 41, 122, 51, 52, 44, 51, 41, 51, 56, 54, 63, 122, 54, 53, 57, 59, 54, 54, 35, 122, 114, 42, 63, 46, 41, 122, 47, 52, 59, 60, 60, 63, 57, 46, 63, 62, 115}, 90), Value = (l.PerfHidePlayers == true), Callback = function(byu)
  l.PerfHidePlayers = byu
  bsd(byu)
end})
bgf:Section(g({18, 51, 62, 63, 122, 13, 53, 40, 54, 62, 122, 21, 56, 48, 63, 57, 46, 41}, 90))
bgf:Toggle({Title = g({18, 51, 62, 63, 122, 21, 40, 56, 41}, 90), Desc = g({23, 59, 49, 63, 41, 122, 53, 40, 56, 41, 122, 51, 52, 44, 51, 41, 51, 56, 54, 63, 122, 54, 53, 57, 59, 54, 54, 35, 116, 122, 27, 47, 46, 53, 119, 57, 53, 54, 54, 63, 57, 46, 122, 41, 46, 51, 54, 54, 122, 45, 53, 40, 49, 41, 122, 8270, 122, 53, 52, 54, 35, 122, 46, 50, 63, 122, 44, 51, 41, 47, 59, 54, 41, 122, 59, 40, 63, 122, 50, 51, 62, 62, 63, 52}, 90), Value = (l.HideOrbs == true), Callback = function(byv)
  l.HideOrbs = byv
end})
bgf:Toggle({Title = g({18, 51, 62, 63, 122, 22, 53, 53, 46, 56, 59, 61, 41}, 90), Desc = g({23, 59, 49, 63, 41, 122, 54, 53, 53, 46, 56, 59, 61, 41, 122, 51, 52, 44, 51, 41, 51, 56, 54, 63, 122, 54, 53, 57, 59, 54, 54, 35, 116, 122, 27, 47, 46, 53, 119, 56, 59, 61, 122, 42, 51, 57, 49, 47, 42, 122, 41, 46, 51, 54, 54, 122, 45, 53, 40, 49, 41}, 90), Value = (l.HideLootbags == true), Callback = function(byw)
  l.HideLootbags = byw
end})
bgf:Toggle({Title = g({18, 51, 62, 63, 122, 24, 40, 63, 59, 49, 59, 56, 54, 63, 41, 122, 114, 17, 63, 63, 42, 122, 18, 63, 59, 54, 46, 50, 122, 24, 59, 40, 41, 115}, 90), Desc = g({18, 51, 62, 63, 41, 122, 46, 50, 63, 122, 57, 53, 51, 52, 122, 55, 63, 41, 50, 63, 41, 122, 56, 47, 46, 122, 49, 63, 63, 42, 41, 122, 46, 50, 63, 122, 60, 54, 53, 59, 46, 51, 52, 61, 122, 50, 63, 59, 54, 46, 50, 122, 56, 59, 40, 41, 118, 122, 41, 53, 122, 46, 50, 63, 122, 60, 59, 40, 55, 122, 41, 46, 51, 54, 54, 122, 41, 50, 53, 45, 41, 122, 45, 50, 59, 46, 122, 51, 46, 122, 51, 41, 122, 56, 40, 63, 59, 49, 51, 52, 61}, 90), Value = (l.HideBreakables == true), Callback = function(byx)
  l.HideBreakables = byx
end})
table.insert(byl, bgf:Toggle({Title = g({18, 51, 62, 63, 122, 24, 40, 63, 59, 49, 122, 31, 60, 60, 63, 57, 46, 41}, 90), Desc = g({8, 63, 55, 53, 44, 63, 41, 122, 46, 50, 63, 122, 63, 34, 42, 54, 53, 41, 51, 53, 52, 122, 42, 59, 40, 46, 51, 57, 54, 63, 41, 122, 59, 52, 62, 122, 60, 54, 35, 51, 52, 61, 122, 57, 53, 51, 52, 122, 57, 50, 47, 52, 49, 41, 122, 45, 50, 63, 52, 122, 59, 122, 56, 40, 63, 59, 49, 59, 56, 54, 63, 122, 62, 51, 63, 41, 122, 8270, 122, 46, 50, 63, 122, 55, 59, 51, 52, 122, 56, 40, 63, 59, 49, 119, 46, 51, 55, 63, 122, 54, 59, 61, 122, 41, 53, 47, 40, 57, 63}, 90), Value = (l.HideBreakFx ~= false), Callback = function(byy)
  l.HideBreakFx = byy
  k._applyBreakFx(byy)
end}))
bgf:Section(g({21, 44, 63, 40, 52, 51, 61, 50, 46, 122, 9, 46, 59, 56, 51, 54, 51, 46, 35}, 90))
local byz = bgf:StatGrid({{Key = g({23, 63, 55}, 90), Title = g({25, 54, 51, 63, 52, 46, 122, 23, 63, 55, 53, 40, 35}, 90)}, {Key = g({10, 63, 59, 49}, 90), Title = g({10, 63, 59, 49, 122, 117, 122, 25, 63, 51, 54, 51, 52, 61}, 90)}, {Key = g({22, 63, 59, 49}, 90), Title = g({22, 63, 59, 49, 122, 8, 63, 54, 63, 59, 41, 63, 62}, 90)}, {Key = g({18, 63, 54, 62}, 90), Title = g({24, 47, 57, 49, 63, 46, 41, 122, 18, 63, 54, 62}, 90)}, {Key = g({30, 63, 56, 40, 51, 41}, 90), Title = g({30, 63, 56, 40, 51, 41, 122, 10, 59, 40, 49, 63, 62}, 90)}, {Key = g({9, 45, 63, 42, 46}, 90), Title = g({18, 53, 41, 46, 41, 122, 9, 45, 63, 42, 46}, 90)}, {Key = g({8, 63, 48, 53, 51, 52}, 90), Title = g({27, 47, 46, 53, 122, 8, 63, 48, 53, 51, 52}, 90)}, {Key = g({8, 63, 57, 54, 59, 51, 55, 63, 62}, 90), Title = g({8, 63, 57, 54, 59, 51, 55, 63, 62}, 90)}})
k._refreshStabTiles = function()
  local bza = (n.MemMb or 0)
  byz.Mem((((bza > 0) and ((as(bza) .. g({122, 23, 24}, 90)))) or g({40, 63, 59, 62, 51, 52, 61, 116, 116, 116}, 90)))
  byz.Peak(string.format(g({127, 41, 122, 117, 122, 127, 41, 122, 23, 24}, 90), as((n.MemPeak or 0)), as(k._memLimit())))
  if (((12 * 12) == 144) and (l.LeakGuard == false)) then
    byz.Leak(g({53, 60, 60}, 90))
  elseif (((3 ^ 2) == 9) and n.LeakArmed) then
    byz.Leak(as((n.LeakReleased or 0)))
  else
    byz.Leak(g({59, 40, 55, 51, 52, 61, 116, 116, 116}, 90))
  end
  if (((7 * 7) == 49) and (((n.LeakBacklog or 0)) > 0)) then
    byz.Held((as((n.LeakBuckets or 0)) .. g({122, 114, 62, 40, 59, 51, 52, 51, 52, 61, 115}, 90)))
  else
    byz.Held(as((n.LeakBuckets or 0)))
  end
  local bzb = g({8270}, 90)
  if (((1 + 1) == 2) and n.DebrisFolder) then
    local bzc, bzd = pcall(function()
      return #n.DebrisFolder:GetChildren()
    end)
    if (((15 * 15) == 225) and bzc) then
      bzb = as(bzd)
    end
  end
  byz.Debris(bzb)
  byz.Swept(as((n.DebrisSwept or 0)))
  if (((100 % 7) == 2) and (l.NoRejoin == false)) then
    byz.Rejoin(g({59, 54, 54, 53, 45, 63, 62}, 90))
  elseif (((12 * 12) == 144) and (((n.RejoinRefused or 0)) > 0)) then
    byz.Rejoin((g({56, 54, 53, 57, 49, 63, 62, 122, 34}, 90) .. as(n.RejoinRefused)))
  else
    byz.Rejoin(g({56, 54, 53, 57, 49, 63, 62}, 90))
  end
  byz.Reclaimed(as((n.MemReclaimed or 0)))
end
bgf:Toggle({Title = g({22, 63, 59, 49, 122, 29, 47, 59, 40, 62}, 90), Desc = g({14, 18, 31, 122, 57, 40, 59, 41, 50, 122, 60, 51, 34, 116, 122, 14, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 53, 45, 52, 122, 27, 62, 62, 30, 63, 56, 40, 51, 41, 122, 52, 63, 44, 63, 40, 122, 54, 63, 46, 41, 122, 61, 53, 122, 53, 60, 122, 45, 50, 59, 46, 122, 51, 46, 122, 62, 63, 54, 63, 46, 63, 41, 122, 8270, 122, 53, 52, 63, 122, 46, 59, 56, 122, 45, 59, 41, 122, 50, 53, 54, 62, 51, 52, 61, 122, 110, 118, 105, 110, 105, 118, 107, 106, 105, 122, 62, 63, 59, 62, 122, 53, 56, 48, 63, 57, 46, 41, 122, 59, 52, 62, 122, 107, 104, 116, 105, 122, 29, 24, 122, 56, 63, 60, 53, 40, 63, 122, 46, 50, 51, 41, 122, 63, 34, 51, 41, 46, 63, 62, 116, 122, 8, 63, 54, 63, 59, 41, 63, 41, 122, 46, 50, 63, 55, 122, 59, 52, 62, 122, 41, 46, 53, 42, 41, 122, 55, 53, 40, 63, 122, 59, 57, 57, 40, 47, 51, 52, 61, 116, 122, 22, 63, 59, 44, 63, 122, 51, 46, 122, 53, 52}, 90), Value = (l.LeakGuard ~= false), Callback = function(bze)
  l.LeakGuard = bze
  if (((3 ^ 2) == 9) and bze) then
    task.spawn(function()
      pcall(k._leakInstall)
      local bzf, bzg, bzh = 0, 0, false
      local bzi = pcall(function()
        bzf, bzg, bzh = k._leakPurge()
      end)
      n.LeakArmed = k._leakArmed()
      if (((7 * 7) == 49) and (bzi and n.LeakArmed)) then
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({22, 63, 59, 49, 122, 29, 47, 59, 40, 62, 122, 53, 52, 122, 8270, 122, 40, 63, 54, 63, 59, 41, 63, 62, 122, 127, 41, 122, 53, 56, 48, 63, 57, 46, 41, 122, 60, 40, 53, 55, 122, 127, 41, 122, 56, 47, 57, 49, 63, 46, 41, 127, 41}, 90), as(bzg), as(bzf), ((bzh and ((g({118, 122}, 90) .. (as((n.LeakBacklog or 0)) .. g({122, 54, 63, 60, 46, 122, 46, 53, 122, 62, 40, 59, 51, 52}, 90))))) or "")), g({41, 50, 51, 63, 54, 62}, 90))
      else
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 63, 59, 49, 122, 29, 47, 59, 40, 62, 122, 53, 52, 122, 8270, 122, 45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122, 46, 50, 63, 122, 61, 59, 55, 63, 122, 46, 53, 122, 54, 53, 59, 62}, 90), g({57, 54, 53, 57, 49}, 90))
      end
    end)
  else
    pcall(k._leakRestore)
    n.LeakArmed = false
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({22, 63, 59, 49, 122, 29, 47, 59, 40, 62, 122, 53, 60, 60, 122, 8270, 122, 55, 63, 55, 53, 40, 35, 122, 45, 51, 54, 54, 122, 57, 54, 51, 55, 56, 122, 59, 61, 59, 51, 52}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
  end
end})
bgf:Slider({Title = g({22, 63, 59, 49, 122, 10, 47, 40, 61, 63, 122, 19, 52, 46, 63, 40, 44, 59, 54, 122, 114, 41, 115}, 90), Desc = g({18, 53, 45, 122, 53, 60, 46, 63, 52, 122, 46, 50, 63, 122, 50, 63, 54, 62, 119, 53, 56, 48, 63, 57, 46, 122, 56, 47, 57, 49, 63, 46, 41, 122, 59, 40, 63, 122, 57, 54, 63, 59, 40, 63, 62, 116, 122, 105, 106, 41, 122, 51, 41, 122, 57, 50, 63, 59, 42, 122, 59, 52, 62, 122, 49, 63, 63, 42, 41, 122, 46, 50, 63, 122, 56, 59, 57, 49, 54, 53, 61, 122, 52, 63, 59, 40, 122, 32, 63, 40, 53, 97, 122, 53, 52, 54, 35, 122, 40, 59, 51, 41, 63, 122, 51, 46, 122, 51, 60, 122, 35, 53, 47, 122, 41, 63, 63, 122, 59, 122, 50, 51, 46, 57, 50}, 90), Value = {Min = 10, Max = 300, Default = (tonumber(l.LeakPurgeSecs) or 30)}, Step = 5, Callback = function(bzj)
  l.LeakPurgeSecs = bzj
end})
bgf:Toggle({Title = g({9, 45, 63, 63, 42, 122, 22, 63, 60, 46, 53, 44, 63, 40, 122, 30, 63, 56, 40, 51, 41}, 90), Desc = g({30, 63, 54, 63, 46, 63, 41, 122, 46, 50, 63, 122, 51, 52, 44, 51, 41, 51, 56, 54, 63, 122, 42, 59, 40, 46, 51, 57, 54, 63, 122, 50, 53, 41, 46, 41, 122, 46, 50, 63, 122, 61, 59, 55, 63, 122, 60, 53, 40, 61, 63, 46, 41, 122, 46, 53, 122, 57, 54, 63, 59, 52, 122, 47, 42, 116, 122, 27, 122, 41, 63, 57, 53, 52, 62, 118, 122, 41, 55, 59, 54, 54, 63, 40, 122, 54, 63, 59, 49, 122, 46, 50, 59, 52, 122, 46, 50, 63, 122, 53, 52, 63, 122, 59, 56, 53, 44, 63, 122, 8270, 122, 54, 63, 59, 44, 63, 122, 51, 46, 122, 53, 52}, 90), Value = (l.DebrisSweep ~= false), Callback = function(bzk)
  l.DebrisSweep = bzk
end})
bgf:Slider({Title = g({30, 63, 56, 40, 51, 41, 122, 9, 45, 63, 63, 42, 122, 30, 63, 54, 59, 35}, 90), Desc = g({9, 63, 57, 53, 52, 62, 41, 122, 56, 63, 60, 53, 40, 63, 122, 59, 122, 42, 59, 40, 49, 63, 62, 122, 50, 53, 41, 46, 122, 51, 41, 122, 62, 63, 54, 63, 46, 63, 62, 116, 122, 14, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 53, 45, 52, 122, 63, 60, 60, 63, 57, 46, 41, 122, 52, 63, 44, 63, 40, 122, 54, 51, 44, 63, 122, 54, 53, 52, 61, 63, 40, 122, 46, 50, 59, 52, 122, 111, 41, 118, 122, 41, 53, 122, 59, 52, 35, 46, 50, 51, 52, 61, 122, 50, 63, 40, 63, 122, 51, 41, 122, 41, 59, 60, 63}, 90), Value = {Min = 6, Max = 120, Default = (tonumber(l.DebrisSweepSecs) or 20)}, Step = 2, Callback = function(bzl)
  l.DebrisSweepSecs = bzl
end})
bgf:Toggle({Title = g({9, 51, 54, 63, 52, 57, 63, 122, 19, 62, 54, 63, 122, 14, 40, 59, 57, 49, 63, 40}, 90), Desc = g({17, 51, 54, 54, 41, 122, 46, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 56, 40, 53, 49, 63, 52, 122, 51, 62, 54, 63, 122, 41, 57, 40, 51, 42, 46, 116, 122, 19, 46, 122, 46, 50, 40, 53, 45, 41, 122, 59, 52, 122, 63, 40, 40, 53, 40, 122, 63, 44, 63, 40, 35, 122, 60, 40, 59, 55, 63, 122, 59, 60, 46, 63, 40, 122, 36, 104, 106, 122, 55, 51, 52, 122, 27, 28, 17, 122, 8270, 122, 107, 116, 107, 122, 55, 51, 54, 54, 51, 53, 52, 122, 53, 60, 122, 46, 50, 63, 55, 122, 59, 52, 62, 122, 59, 122, 105, 108, 98, 122, 23, 24, 122, 54, 53, 61, 122, 51, 52, 122, 53, 52, 63, 122, 52, 51, 61, 50, 46}, 90), Value = (l.KillIdleTracker ~= false), Callback = function(bzm)
  l.KillIdleTracker = bzm
  if (((1 + 1) == 2) and bzm) then
    local bzn = k._killIdleTracker()
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (((bzn > 0) and ((g({19, 62, 54, 63, 122, 46, 40, 59, 57, 49, 63, 40, 122, 41, 51, 54, 63, 52, 57, 63, 62, 122, 114}, 90) .. (bzn .. g({115}, 90))))) or g({19, 62, 54, 63, 122, 46, 40, 59, 57, 49, 63, 40, 122, 52, 53, 46, 122, 40, 47, 52, 52, 51, 52, 61, 122, 35, 63, 46, 122, 8270, 122, 45, 51, 54, 54, 122, 40, 63, 46, 40, 35}, 90)), g({41, 50, 51, 63, 54, 62}, 90))
  else
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({19, 62, 54, 63, 122, 46, 40, 59, 57, 49, 63, 40, 122, 54, 63, 60, 46, 122, 59, 54, 53, 52, 63, 122, 8270, 122, 40, 63, 48, 53, 51, 52, 122, 46, 53, 122, 40, 63, 119, 63, 52, 59, 56, 54, 63, 122, 51, 46}, 90), g({51, 52, 60, 53}, 90))
  end
end})
bgf:Toggle({Title = g({20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52}, 90), Desc = g({24, 54, 53, 57, 49, 41, 122, 63, 44, 63, 40, 35, 122, 59, 47, 46, 53, 55, 59, 46, 51, 57, 122, 46, 63, 54, 63, 42, 53, 40, 46, 116, 122, 27, 122, 40, 63, 48, 53, 51, 52, 122, 54, 53, 59, 62, 41, 122, 46, 50, 63, 122, 42, 54, 59, 57, 63, 122, 59, 122, 41, 63, 57, 53, 52, 62, 122, 46, 51, 55, 63, 122, 56, 63, 60, 53, 40, 63, 122, 51, 46, 122, 62, 40, 53, 42, 41, 122, 46, 50, 63, 122, 60, 51, 40, 41, 46, 118, 122, 41, 53, 122, 51, 46, 122, 52, 63, 63, 62, 41, 122, 23, 21, 8, 31, 122, 55, 63, 55, 53, 40, 35, 122, 59, 46, 122, 63, 34, 59, 57, 46, 54, 35, 122, 46, 50, 63, 122, 55, 53, 55, 63, 52, 46, 122, 46, 50, 63, 40, 63, 122, 51, 41, 122, 52, 53, 52, 63, 122, 8270, 122, 51, 46, 122, 51, 41, 122, 45, 50, 59, 46, 122, 49, 51, 54, 54, 63, 62, 122, 46, 50, 63, 122, 46, 59, 56, 41, 118, 122, 52, 53, 46, 122, 45, 50, 59, 46, 122, 41, 59, 44, 63, 62, 122, 46, 50, 63, 55, 116, 122, 21, 52, 118, 122, 46, 50, 63, 122, 57, 63, 51, 54, 51, 52, 61, 122, 40, 63, 57, 54, 59, 51, 55, 41, 122, 51, 52, 122, 42, 54, 59, 57, 63, 122, 51, 52, 41, 46, 63, 59, 62, 116, 122, 22, 63, 59, 44, 63, 122, 46, 50, 51, 41, 122, 53, 52}, 90), Value = (l.NoRejoin ~= false), Callback = function(bzo)
  l.NoRejoin = bzo
  if (((15 * 15) == 225) and bzo) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52, 122, 53, 52, 122, 8270, 122, 46, 50, 63, 122, 57, 63, 51, 54, 51, 52, 61, 122, 45, 51, 54, 54, 122, 40, 63, 57, 54, 59, 51, 55, 122, 51, 52, 122, 42, 54, 59, 57, 63, 122, 51, 52, 41, 46, 63, 59, 62}, 90), g({41, 50, 51, 63, 54, 62}, 90))
  else
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52, 122, 21, 28, 28, 122, 8270, 122, 46, 50, 51, 41, 122, 57, 54, 51, 63, 52, 46, 122, 55, 59, 35, 122, 46, 63, 54, 63, 42, 53, 40, 46, 122, 51, 46, 41, 63, 54, 60, 122, 59, 61, 59, 51, 52}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
  end
end})
bgf:Toggle({Title = g({23, 63, 55, 53, 40, 35, 122, 29, 47, 59, 40, 62}, 90), Desc = g({13, 59, 46, 57, 50, 63, 41, 122, 46, 50, 51, 41, 122, 57, 54, 51, 63, 52, 46, 125, 41, 122, 55, 63, 55, 53, 40, 35, 122, 59, 52, 62, 122, 59, 57, 46, 41, 122, 45, 50, 63, 52, 122, 51, 46, 122, 42, 59, 41, 41, 63, 41, 122, 46, 50, 63, 122, 57, 63, 51, 54, 51, 52, 61, 122, 56, 63, 54, 53, 45, 116, 122, 13, 51, 46, 50, 122, 20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52, 122, 53, 52, 122, 51, 46, 122, 62, 40, 59, 51, 52, 41, 122, 46, 50, 63, 122, 45, 50, 53, 54, 63, 122, 50, 63, 54, 62, 119, 53, 56, 48, 63, 57, 46, 122, 56, 59, 57, 49, 54, 53, 61, 122, 59, 52, 62, 122, 63, 55, 42, 46, 51, 63, 41, 122, 46, 50, 63, 122, 62, 63, 56, 40, 51, 41, 122, 42, 59, 40, 49, 122, 51, 52, 122, 42, 54, 59, 57, 63, 97, 122, 45, 51, 46, 50, 122, 51, 46, 122, 53, 60, 60, 122, 51, 46, 122, 40, 63, 48, 53, 51, 52, 41}, 90), Value = (l.MemGuard ~= false), Callback = function(bzp)
  l.MemGuard = bzp
end})
bgf:Button({Title = g({8, 63, 57, 54, 59, 51, 55, 122, 23, 63, 55, 53, 40, 35, 122, 20, 53, 45}, 90), Desc = g({8, 47, 52, 41, 122, 46, 50, 63, 122, 57, 63, 51, 54, 51, 52, 61, 125, 41, 122, 45, 50, 53, 54, 63, 122, 51, 52, 119, 42, 54, 59, 57, 63, 122, 42, 59, 41, 41, 122, 51, 55, 55, 63, 62, 51, 59, 46, 63, 54, 35, 122, 8270, 122, 62, 40, 59, 51, 52, 41, 122, 63, 44, 63, 40, 35, 122, 41, 46, 59, 54, 63, 122, 56, 47, 57, 49, 63, 46, 118, 122, 63, 55, 42, 46, 51, 63, 41, 122, 46, 50, 63, 122, 62, 63, 56, 40, 51, 41, 122, 42, 59, 40, 49, 118, 122, 62, 40, 53, 42, 41, 122, 46, 50, 63, 122, 50, 47, 56, 125, 41, 122, 57, 59, 57, 50, 63, 41, 116, 122, 9, 59, 60, 63, 122, 46, 53, 122, 42, 40, 63, 41, 41, 122, 59, 52, 35, 122, 46, 51, 55, 63}, 90), Callback = function()
  task.spawn(function()
    k._memReclaim(g({59, 41, 49, 63, 62, 122, 60, 53, 40, 122, 51, 46}, 90))
  end)
end})
bgf:Slider({Title = g({23, 63, 55, 53, 40, 35, 122, 25, 63, 51, 54, 51, 52, 61, 122, 114, 23, 24, 115}, 90), Desc = g({13, 50, 63, 40, 63, 122, 46, 50, 63, 122, 23, 63, 55, 53, 40, 35, 122, 29, 47, 59, 40, 62, 122, 59, 57, 46, 41, 116, 122, 14, 50, 51, 41, 122, 40, 63, 59, 62, 41, 122, 54, 53, 45, 63, 40, 122, 46, 50, 59, 52, 122, 14, 59, 41, 49, 122, 23, 59, 52, 59, 61, 63, 40, 122, 8270, 122, 59, 122, 50, 63, 59, 54, 46, 50, 35, 122, 57, 54, 51, 63, 52, 46, 122, 41, 50, 53, 45, 41, 122, 36, 107, 110, 106, 106, 122, 50, 63, 40, 63, 122, 45, 50, 51, 54, 63, 122, 57, 53, 55, 55, 51, 46, 46, 51, 52, 61, 122, 36, 105, 116, 104, 122, 29, 24, 122, 8270, 122, 41, 53, 122, 49, 63, 63, 42, 122, 51, 46, 122, 63, 59, 40, 54, 35, 96, 122, 104, 108, 106, 106, 122, 60, 53, 40, 122, 110, 122, 46, 59, 56, 41, 122, 53, 52, 122, 107, 108, 122, 29, 24, 118, 122, 105, 106, 106, 106, 122, 60, 53, 40, 122, 105, 122, 46, 59, 56, 41}, 90), Value = {Min = 800, Max = 12000, Default = (tonumber(l.MemGuardMb) or 2600)}, Step = 100, Callback = function(bzq)
  l.MemGuardMb = bzq
end})
bgf:Slider({Title = g({9, 57, 50, 63, 62, 47, 54, 63, 62, 122, 8, 63, 48, 53, 51, 52, 122, 114, 50, 53, 47, 40, 41, 115}, 90), Desc = g({8, 63, 60, 40, 63, 41, 50, 122, 46, 50, 51, 41, 122, 57, 54, 51, 63, 52, 46, 122, 63, 44, 63, 40, 35, 122, 20, 122, 50, 53, 47, 40, 41, 122, 45, 50, 59, 46, 63, 44, 63, 40, 122, 46, 50, 63, 122, 55, 63, 55, 53, 40, 35, 122, 40, 63, 59, 62, 41, 116, 122, 19, 61, 52, 53, 40, 63, 62, 122, 45, 50, 51, 54, 63, 122, 20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52, 122, 51, 41, 122, 53, 52, 118, 122, 59, 52, 62, 122, 106, 122, 62, 51, 41, 59, 56, 54, 63, 41, 122, 51, 46, 122, 8270, 122, 45, 50, 51, 57, 50, 122, 51, 41, 122, 46, 50, 63, 122, 62, 63, 60, 59, 47, 54, 46, 122, 52, 53, 45}, 90), Value = {Min = 0, Max = 12, Default = (tonumber(l.MemRejoinHours) or 0)}, Step = 1, Callback = function(bzr)
  l.MemRejoinHours = bzr
end})
bgg:Section(g({19, 52, 46, 63, 40, 60, 59, 57, 63}, 90))
local bzs
bzs = bgg:Button({Title = (g({8, 63, 56, 51, 52, 62, 122, 18, 51, 62, 63, 117, 9, 50, 53, 45, 122, 17, 63, 35, 122, 8270, 122}, 90) .. tostring(l.HotkeyName)), Desc = g({10, 40, 63, 41, 41, 122, 59, 52, 35, 122, 49, 63, 35, 122, 46, 53, 122, 56, 51, 52, 62, 122, 51, 46, 116, 122, 31, 41, 57, 122, 57, 59, 52, 57, 63, 54, 41, 116, 122, 17, 122, 59, 54, 45, 59, 35, 41, 122, 45, 53, 40, 49, 41, 122, 46, 53, 53, 116}, 90), Callback = function()
  if (((100 % 7) == 2) and n.RebindWaiting) then
    return
  end
  n.RebindWaiting = true
  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({10, 40, 63, 41, 41, 122, 59, 52, 35, 122, 49, 63, 35, 122, 46, 53, 122, 41, 63, 46, 122, 46, 50, 63, 122, 52, 63, 45, 122, 50, 51, 62, 63, 117, 41, 50, 53, 45, 122, 49, 63, 35, 116, 116, 116}, 90), g({57, 54, 53, 57, 49}, 90))
  aot(false)
end})
k._refreshHotkeyLabel = function()
  pcall(function()
    bzs.SetTitle(bzs, (g({8, 63, 56, 51, 52, 62, 122, 18, 51, 62, 63, 117, 9, 50, 53, 45, 122, 17, 63, 35, 122, 8270, 122}, 90) .. tostring(l.HotkeyName)))
  end)
end
bgg:Toggle({Title = g({27, 47, 46, 53, 122, 8, 63, 48, 53, 51, 52, 122, 21, 52, 122, 30, 51, 41, 57, 53, 52, 52, 63, 57, 46}, 90), Desc = g({14, 63, 54, 63, 42, 53, 40, 46, 41, 122, 35, 53, 47, 122, 56, 59, 57, 49, 122, 51, 60, 122, 35, 53, 47, 122, 61, 63, 46, 122, 49, 51, 57, 49, 63, 62, 122, 53, 40, 122, 62, 51, 41, 57, 53, 52, 52, 63, 57, 46, 63, 62, 116, 122, 14, 50, 51, 41, 122, 53, 52, 63, 122, 51, 41, 122, 50, 59, 40, 55, 54, 63, 41, 41, 122, 8270, 122, 46, 50, 63, 122, 57, 54, 51, 63, 52, 46, 122, 51, 41, 122, 59, 54, 40, 63, 59, 62, 35, 122, 53, 60, 60, 122, 46, 50, 63, 122, 41, 63, 40, 44, 63, 40, 118, 122, 41, 53, 122, 46, 50, 63, 40, 63, 122, 51, 41, 122, 52, 53, 122, 41, 63, 57, 53, 52, 62, 122, 57, 53, 42, 35, 122, 53, 60, 122, 46, 50, 63, 122, 42, 54, 59, 57, 63, 122, 46, 53, 122, 42, 59, 35, 122, 60, 53, 40, 122, 8270, 122, 56, 47, 46, 122, 20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52, 122, 53, 52, 122, 46, 50, 63, 122, 10, 63, 40, 60, 53, 40, 55, 59, 52, 57, 63, 122, 46, 59, 56, 122, 41, 46, 51, 54, 54, 122, 53, 44, 63, 40, 40, 51, 62, 63, 41, 122, 51, 46}, 90), Value = (l.AutoRejoin ~= false), Callback = function(bzt)
  l.AutoRejoin = bzt
end})
bgg:Toggle({Title = g({27, 52, 46, 51, 119, 27, 28, 17}, 90), Desc = g({8, 63, 42, 53, 40, 46, 41, 122, 51, 46, 122, 45, 50, 63, 52, 122, 8, 53, 56, 54, 53, 34, 122, 60, 54, 59, 61, 41, 122, 46, 50, 51, 41, 122, 57, 54, 51, 63, 52, 46, 122, 51, 62, 54, 63, 122, 114, 36, 104, 106, 122, 55, 51, 52, 115, 122, 59, 52, 62, 122, 49, 63, 63, 42, 41, 122, 60, 59, 40, 55, 51, 52, 61, 116, 122, 19, 46, 122, 47, 41, 63, 62, 122, 46, 53, 122, 40, 63, 48, 53, 51, 52, 122, 51, 52, 41, 46, 63, 59, 62, 122, 8270, 122, 45, 50, 51, 57, 50, 122, 55, 63, 59, 52, 46, 122, 63, 44, 63, 40, 35, 122, 46, 59, 56, 122, 46, 63, 54, 63, 42, 53, 40, 46, 63, 62, 122, 59, 46, 122, 53, 52, 57, 63, 122, 63, 44, 63, 40, 35, 122, 104, 106, 122, 55, 51, 52, 47, 46, 63, 41, 118, 122, 59, 52, 62, 122, 46, 50, 59, 46, 122, 51, 41, 122, 45, 50, 59, 46, 122, 45, 59, 41, 122, 49, 51, 54, 54, 51, 52, 61, 122, 46, 50, 63, 55, 122, 53, 44, 63, 40, 52, 51, 61, 50, 46, 116, 122, 8, 63, 59, 54, 122, 57, 59, 52, 52, 53, 46, 122, 60, 59, 49, 63, 122, 51, 52, 42, 47, 46, 118, 122, 41, 53, 122, 52, 53, 46, 50, 51, 52, 61, 122, 63, 54, 41, 63, 122, 51, 41, 122, 42, 53, 41, 41, 51, 56, 54, 63, 122, 50, 63, 40, 63}, 90), Value = (l.AntiAFK ~= false), Callback = function(bzu)
  l.AntiAFK = bzu
end})
bgg:Toggle({Title = g({30, 51, 41, 59, 56, 54, 63, 122, 10, 53, 42, 119, 15, 42, 41}, 90), Desc = g({24, 54, 53, 57, 49, 41, 122, 51, 52, 119, 61, 59, 55, 63, 122, 52, 53, 46, 51, 60, 51, 57, 59, 46, 51, 53, 52, 122, 46, 53, 59, 41, 46, 41, 122, 59, 52, 62, 122, 55, 53, 62, 59, 54, 122, 55, 63, 41, 41, 59, 61, 63, 122, 56, 53, 34, 63, 41, 122, 114, 57, 53, 52, 60, 51, 40, 55, 122, 62, 51, 59, 54, 53, 61, 41, 122, 59, 47, 46, 53, 119, 59, 57, 57, 63, 42, 46, 115}, 90), Value = (l.DisablePopups == true), Callback = function(bzv)
  l.DisablePopups = bzv
  k._setDisablePopups(bzv)
end})
bgg:Section(g({25, 53, 52, 60, 51, 61, 47, 40, 59, 46, 51, 53, 52}, 90))
do
  local bzw = false
  bgg:Button({Title = g({8, 63, 41, 63, 46, 122, 27, 54, 54, 122, 9, 63, 46, 46, 51, 52, 61, 41}, 90), Desc = g({8, 63, 41, 46, 53, 40, 63, 41, 122, 63, 44, 63, 40, 35, 122, 57, 53, 52, 46, 40, 53, 54, 122, 46, 53, 122, 51, 46, 41, 122, 62, 63, 60, 59, 47, 54, 46, 122, 59, 52, 62, 122, 62, 63, 54, 63, 46, 63, 41, 122, 46, 50, 63, 122, 41, 59, 44, 63, 62, 122, 60, 51, 54, 63}, 90), Callback = function()
    task.spawn(function()
      if (((12 * 12) == 144) and not bzw) then
        bzw = true
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({25, 54, 51, 57, 49, 122, 8, 63, 41, 63, 46, 122, 59, 61, 59, 51, 52, 122, 45, 51, 46, 50, 51, 52, 122, 111, 122, 41, 63, 57, 53, 52, 62, 41, 122, 46, 53, 122, 57, 53, 52, 60, 51, 40, 55}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
        task.delay(5, function()
          bzw = false
        end)
        return
      end
      bzw = false
      for bzx, bzy in ipairs(aon.Registry) do
        pcall(bzy.set, bzy.default)
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
bgg:Section(g({27, 47, 46, 53, 119, 9, 59, 44, 63}, 90))
do
  local bzz
  local function caa()
    pcall(function()
      local cab = ((k._lastSavedAt and os.date(g({127, 18, 96, 127, 23, 96, 127, 9}, 90), k._lastSavedAt)) or g({52, 63, 44, 63, 40}, 90))
      bzz.SetTitle(bzz, ((((l.AutoSaveSettings == false) and g({9, 63, 46, 46, 51, 52, 61, 41, 122, 8270, 122, 59, 47, 46, 53, 119, 41, 59, 44, 63, 122, 21, 28, 28}, 90)) or g({9, 63, 46, 46, 51, 52, 61, 41, 122, 8270, 122, 54, 59, 41, 46, 122, 41, 59, 44, 63, 62, 122, 127, 41}, 90))):format(cab))
    end)
  end
  bgg:Toggle({Title = g({27, 47, 46, 53, 119, 9, 59, 44, 63, 122, 9, 63, 46, 46, 51, 52, 61, 41}, 90), Desc = g({13, 40, 51, 46, 63, 41, 122, 63, 44, 63, 40, 35, 122, 41, 63, 46, 46, 51, 52, 61, 122, 57, 50, 59, 52, 61, 63, 122, 46, 53, 122, 62, 51, 41, 49, 122, 45, 51, 46, 50, 51, 52, 122, 111, 122, 41, 63, 57, 53, 52, 62, 41, 118, 122, 41, 53, 122, 52, 53, 46, 50, 51, 52, 61, 122, 51, 41, 122, 54, 53, 41, 46, 122, 53, 52, 122, 59, 122, 57, 40, 59, 41, 50, 118, 122, 49, 51, 57, 49, 122, 53, 40, 122, 40, 63, 48, 53, 51, 52}, 90), Value = (l.AutoSaveSettings ~= false), Callback = function(cac)
    l.AutoSaveSettings = cac
    if (((1 + 1) == 2) and cac) then
      pcall(function()
        k.SaveSettings(true)
      end)
    end
    caa()
  end})
  bzz = bgg:Button({Title = g({9, 63, 46, 46, 51, 52, 61, 41, 122, 8270, 122, 54, 59, 41, 46, 122, 41, 59, 44, 63, 62, 122, 52, 63, 44, 63, 40}, 90), Desc = g({25, 54, 51, 57, 49, 122, 46, 53, 122, 60, 53, 40, 57, 63, 122, 59, 52, 122, 51, 55, 55, 63, 62, 51, 59, 46, 63, 122, 41, 59, 44, 63, 122, 53, 60, 122, 59, 54, 54, 122, 57, 47, 40, 40, 63, 52, 46, 122, 41, 63, 46, 46, 51, 52, 61, 41}, 90), Callback = function()
    task.spawn(function()
      local cad = pcall(function()
        k.SaveSettings(true)
      end)
      if (((15 * 15) == 225) and cad) then
        k._lastSavedAt = os.time()
      end
      caa()
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), ((cad and g({9, 63, 46, 46, 51, 52, 61, 41, 122, 41, 59, 44, 63, 62}, 90)) or g({9, 59, 44, 63, 122, 60, 59, 51, 54, 63, 62}, 90)), ((cad and g({57, 50, 63, 57, 49}, 90)) or g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90)))
    end)
  end})
  k._refreshSaveStatus = caa
end
bgg:Section(g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62}, 90))
bgg:Dropdown({Title = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 27, 52, 51, 55, 59, 46, 51, 53, 52}, 90), Desc = g({13, 50, 59, 46, 122, 55, 53, 44, 63, 41, 122, 56, 63, 50, 51, 52, 62, 122, 46, 50, 63, 122, 42, 59, 52, 63, 54, 41, 116, 122, 29, 40, 59, 62, 51, 63, 52, 46, 122, 59, 52, 62, 122, 9, 53, 54, 51, 62, 122, 62, 53, 122, 52, 53, 122, 42, 63, 40, 119, 60, 40, 59, 55, 63, 122, 45, 53, 40, 49, 122, 59, 46, 122, 59, 54, 54, 116}, 90), Values = aon.BgStyles, Value = tostring((l.UIBgStyle or g({27, 47, 40, 53, 40, 59}, 90))), Callback = function(cae)
  aon.SetBgStyle(cae)
end})
bgg:Section(g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 25, 53, 54, 53, 40, 41}, 90))
do
  local caf = aoq(g({28, 40, 59, 55, 63}, 90), {LayoutOrder = aon.NextOrder(bgg), Size = UDim2.new(1, 0, 0, 106), BackgroundTransparency = 1, ZIndex = 5, Parent = bgg._page})
  aoq(g({15, 19, 29, 40, 51, 62, 22, 59, 35, 53, 47, 46}, 90), {CellSize = UDim2.new(0.25, -7, 0, 49), CellPadding = UDim2.fromOffset(9, 8), SortOrder = Enum.SortOrder.LayoutOrder, Parent = caf})
  local cag = {}
  local function cah(cai)
    for caj, cak in pairs(cag) do
      local cal = ((caj == cai))
      aoj:Create(cak, TweenInfo.new(0.18), {Color = ((cal and aoo.Accent) or aoo.Stroke), Transparency = ((cal and 0.05) or 0.55), Thickness = ((cal and 2) or 1)}):Play()
    end
  end
  for cam, can in ipairs(aon.BgSwatches) do
    local cao = aoq(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {LayoutOrder = cam, BackgroundColor3 = aom(can.a), BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 6, Parent = caf})
    aor(11, cao)
    local cap = aon.Grad(cao, aom(can.a), aom(can.b), 35)
    if (((100 % 7) == 2) and (can.n == g({27, 57, 57, 63, 52, 46}, 90))) then
      aon.markAccent(cao, g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 25, 53, 54, 53, 40, 105}, 90))
      aon.markAccent(cap, g({61, 40, 59, 62}, 90))
    end
    cag[can.n] = aos(aoo.Stroke, 0.55, 1, cao)
    aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 9, 0, 0), Size = UDim2.new(1, -14, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11.5, TextColor3 = Color3.fromRGB(255, 255, 255), TextXAlignment = Enum.TextXAlignment.Left, Text = can.n, ZIndex = 7, Parent = cao})
    local caq = aoq(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 1, Parent = cao})
    aop(cao.MouseEnter, function()
      aoj:Create(caq, TweenInfo.new(0.14, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Scale = 1.05}):Play()
    end)
    aop(cao.MouseLeave, function()
      aoj:Create(caq, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end)
    aon.Ripple(cao, true)
    aop(cao.Activated, function()
      aon.SetBackground(can.n)
      cah(can.n)
    end)
    if (((12 * 12) == 144) and (tostring((l.UIBgPreset or g({23, 51, 62, 52, 51, 61, 50, 46}, 90))) == can.n)) then
      cah(can.n)
    end
  end
  table.insert(aon.Registry, {type = g({56, 61, 42, 40, 63, 41, 63, 46}, 90), default = g({23, 51, 62, 52, 51, 61, 50, 46}, 90), set = function(car)
    local cas = tostring((car or g({23, 51, 62, 52, 51, 61, 50, 46}, 90)))
    aon.SetBackground(cas)
    cah(cas)
  end})
  k._markBgPreset = cah
end
bgg:Section(g({27, 42, 42, 63, 59, 40, 59, 52, 57, 63}, 90))
bgg:Slider({Title = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 19, 52, 46, 63, 52, 41, 51, 46, 35}, 90), Desc = g({106, 122, 103, 122, 60, 54, 59, 46, 122, 59, 52, 62, 122, 62, 59, 40, 49, 118, 122, 104, 106, 106, 122, 103, 122, 60, 47, 54, 54, 122, 56, 40, 51, 61, 50, 46, 52, 63, 41, 41}, 90), Value = {Min = 0, Max = 200, Default = (tonumber(l.UIBgIntensity) or 100)}, Step = 5, Callback = function(cat)
  l.UIBgIntensity = cat
  aon.RefreshBackground()
end})
bgg:Slider({Title = g({27, 52, 51, 55, 59, 46, 51, 53, 52, 122, 9, 42, 63, 63, 62}, 90), Desc = g({9, 57, 59, 54, 63, 41, 122, 63, 44, 63, 40, 35, 122, 54, 53, 53, 42, 51, 52, 61, 122, 59, 52, 51, 55, 59, 46, 51, 53, 52, 116, 122, 22, 53, 45, 63, 40, 122, 51, 41, 122, 57, 59, 54, 55, 63, 40, 122, 59, 52, 62, 122, 57, 50, 63, 59, 42, 63, 40, 116}, 90), Value = {Min = 25, Max = 200, Default = (tonumber(l.UIAnimSpeed) or 100)}, Step = 5, Callback = function(cau)
  l.UIAnimSpeed = cau
end})
bgg:Toggle({Title = g({15, 19, 122, 27, 52, 51, 55, 59, 46, 51, 53, 52, 41}, 90), Desc = g({21, 60, 60, 122, 60, 40, 63, 63, 32, 63, 41, 122, 59, 54, 54, 122, 56, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 59, 52, 62, 122, 50, 51, 61, 50, 54, 51, 61, 50, 46, 122, 55, 53, 46, 51, 53, 52, 122, 8270, 122, 46, 50, 63, 122, 57, 50, 63, 59, 42, 63, 41, 46, 122, 46, 50, 63, 122, 50, 47, 56, 122, 61, 63, 46, 41}, 90), Value = (l.UIMotion ~= false), Callback = function(cav)
  l.UIMotion = cav
  aon.RefreshBackground()
end})
bgg:Slider({Title = g({15, 19, 122, 9, 57, 59, 54, 63}, 90), Desc = g({9, 51, 32, 63, 122, 53, 60, 122, 46, 50, 63, 122, 45, 50, 53, 54, 63, 122, 45, 51, 52, 62, 53, 45, 118, 122, 51, 52, 122, 42, 63, 40, 57, 63, 52, 46}, 90), Value = {Min = 80, Max = 130, Default = (tonumber(l.UIScale) or 100)}, Step = 5, Callback = function(caw)
  aon.SetUIScale(caw)
end})
bgg:Toggle({Title = g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 24, 54, 47, 40}, 90), Desc = g({28, 40, 53, 41, 46, 63, 62, 119, 61, 54, 59, 41, 41, 122, 56, 54, 47, 40, 122, 56, 63, 50, 51, 52, 62, 122, 46, 50, 63, 122, 50, 47, 56, 116, 122, 22, 53, 53, 49, 41, 122, 61, 40, 63, 59, 46, 122, 56, 47, 46, 122, 57, 53, 41, 46, 41, 122, 36, 108, 55, 41, 117, 60, 40, 59, 55, 63, 122, 114, 59, 56, 53, 47, 46, 122, 98, 122, 28, 10, 9, 115, 122, 8270, 122, 53, 60, 60, 122, 56, 35, 122, 62, 63, 60, 59, 47, 54, 46}, 90), Value = (l.UIBlur == true), Callback = function(cax)
  aon.SetBlur(cax)
end})
bgg:Section(g({27, 57, 57, 63, 52, 46, 122, 25, 53, 54, 53, 40}, 90))
do
  local cay = {{n = g({12, 51, 53, 54, 63, 46}, 90), a = g({98, 24, 111, 25, 28, 108}, 90), b = g({104, 104, 30, 105, 31, 31}, 90)}, {n = g({9, 47, 52, 41, 63, 46}, 90), a = g({28, 28, 108, 24, 99, 30}, 90), b = g({28, 28, 24, 98, 108, 24}, 90)}, {n = g({31, 55, 63, 40, 59, 54, 62}, 90), a = g({105, 110, 30, 105, 99, 99}, 90), b = g({27, 105, 31, 108, 105, 111}, 90)}, {n = g({21, 57, 63, 59, 52}, 90), a = g({105, 24, 98, 104, 28, 108}, 90), b = g({105, 98, 24, 30, 28, 98}, 90)}, {n = g({23, 59, 61, 55, 59}, 90), a = g({31, 28, 110, 110, 110, 110}, 90), b = g({28, 99, 109, 105, 107, 108}, 90)}, {n = g({23, 53, 52, 53}, 90), a = g({27, 107, 27, 107, 27, 27}, 90), b = g({31, 110, 31, 110, 31, 109}, 90)}}
  local caz = aoq(g({28, 40, 59, 55, 63}, 90), {LayoutOrder = aon.NextOrder(bgg), Size = UDim2.new(1, 0, 0, 124), BackgroundTransparency = 1, ZIndex = 5, Parent = bgg._page})
  aoq(g({15, 19, 29, 40, 51, 62, 22, 59, 35, 53, 47, 46}, 90), {CellSize = UDim2.new((1 / 3), -6, 0, 58), CellPadding = UDim2.fromOffset(9, 8), SortOrder = Enum.SortOrder.LayoutOrder, Parent = caz})
  local cba = {}
  local function cbb(cbc)
    for cbd, cbe in pairs(cba) do
      local cbf = ((cbd == cbc))
      aoj:Create(cbe, TweenInfo.new(0.18), {Transparency = ((cbf and 0) or 1), Thickness = ((cbf and 2) or 1)}):Play()
    end
  end
  for cbg, cbh in ipairs(cay) do
    local cbi = aoq(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {LayoutOrder = cbg, BackgroundColor3 = aom(cbh.a), BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 6, Parent = caz})
    aor(12, cbi)
    aon.Grad(cbi, aom(cbh.a), aom(cbh.b), 28)
    cba[cbh.n] = aos(Color3.fromRGB(255, 255, 255), 1, 1, cbi)
    aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 11, 0, 12), Size = UDim2.new(1, -18, 0, 15), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 13, TextColor3 = Color3.fromRGB(255, 255, 255), TextXAlignment = Enum.TextXAlignment.Left, Text = cbh.n, ZIndex = 7, Parent = cbi})
    aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 11, 0, 30), Size = UDim2.new(1, -18, 0, 13), BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 10, TextColor3 = Color3.fromRGB(255, 255, 255), TextTransparency = 0.25, TextXAlignment = Enum.TextXAlignment.Left, Text = (g({121}, 90) .. cbh.a), ZIndex = 7, Parent = cbi})
    local cbj = aoq(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 1, Parent = cbi})
    aop(cbi.MouseEnter, function()
      aoj:Create(cbj, TweenInfo.new(0.14, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Scale = 1.04}):Play()
    end)
    aop(cbi.MouseLeave, function()
      aoj:Create(cbj, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end)
    aon.Ripple(cbi, true)
    aop(cbi.Activated, function()
      aon.SetAccent(aom(cbh.a), aom(cbh.b))
      cbb(cbh.n)
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({14, 50, 63, 55, 63, 122, 41, 63, 46, 122, 46, 53, 122}, 90) .. cbh.n), g({42, 59, 51, 52, 46, 56, 40, 47, 41, 50}, 90))
    end)
    if (((3 ^ 2) == 9) and (string.upper(tostring((l.Accent1 or ""))) == cbh.a)) then
      cbb(cbh.n)
    end
  end
  table.insert(aon.Registry, {type = g({59, 57, 57, 63, 52, 46}, 90), default = g({12, 51, 53, 54, 63, 46}, 90), set = function(cbk)
    for cbl, cbm in ipairs(cay) do
      if (((7 * 7) == 49) and (cbm.n == tostring(cbk))) then
        aon.SetAccent(aom(cbm.a), aom(cbm.b))
        cbb(cbm.n)
        return
      end
    end
  end})
  k._markAccentPreset = cbb
end
function k._setAntiAFK(cbn)
  if (((1 + 1) == 2) and (cbn and not n.AntiAFKConn)) then
    n.AntiAFKConn = Players.LocalPlayer.Idled:Connect(function()
      n.LastIdleSpoof = os.time()
      n.IdleFlagged = (((n.IdleFlagged or 0)) + 1)
      if (((15 * 15) == 225) and (n.VirtualUserOk ~= false)) then
        local cbp = pcall(function()
          local cbo = game:GetService(g({12, 51, 40, 46, 47, 59, 54, 15, 41, 63, 40}, 90))
          cbo:CaptureController()
          cbo:ClickButton2(Vector2.new())
        end)
        n.VirtualUserOk = cbp
        if (((100 % 7) == 2) and cbp) then
          return
        end
      end
      if (((12 * 12) == 144) and not n.IdleReported) then
        n.IdleReported = true
        ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({8, 53, 56, 54, 53, 34, 122, 60, 54, 59, 61, 61, 63, 62, 122, 46, 50, 51, 41, 122, 57, 54, 51, 63, 52, 46, 122, 51, 62, 54, 63, 116, 122, 28, 59, 40, 55, 51, 52, 61, 122, 57, 53, 52, 46, 51, 52, 47, 63, 41, 122, 8270, 122, 52, 53, 122, 40, 63, 48, 53, 51, 52, 118, 122, 46, 50, 59, 46, 122, 45, 59, 41, 122, 45, 50, 59, 46, 122, 49, 51, 54, 54, 63, 62, 122, 46, 50, 63, 122, 46, 59, 56, 41}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
        pcall(function()
          k._notifyWebhook(g({28, 54, 59, 61, 61, 63, 62, 122, 51, 62, 54, 63}, 90), string.format(g({112, 112, 127, 41, 112, 112, 122, 45, 59, 41, 122, 60, 54, 59, 61, 61, 63, 62, 122, 51, 62, 54, 63, 122, 56, 35, 122, 8, 53, 56, 54, 53, 34, 116, 122, 8, 63, 59, 54, 122, 57, 59, 52, 52, 53, 46, 122, 60, 59, 49, 63, 122, 51, 52, 42, 47, 46, 118, 122, 41, 53, 122, 52, 53, 46, 50, 51, 52, 61, 122, 51, 41, 122, 62, 53, 52, 63, 122, 59, 56, 53, 47, 46, 122, 51, 46, 96, 122, 46, 50, 63, 122, 60, 59, 40, 55, 122, 49, 63, 63, 42, 41, 122, 40, 47, 52, 52, 51, 52, 61, 122, 59, 52, 62, 122, 46, 50, 63, 122, 46, 59, 56, 122, 51, 41, 122, 54, 63, 60, 46, 122, 59, 54, 53, 52, 63, 116}, 90), Players.LocalPlayer.Name), 0xFBBF24)
        end)
      end
    end)
  elseif (((3 ^ 2) == 9) and (not cbn and n.AntiAFKConn)) then
    n.AntiAFKConn:Disconnect()
    n.AntiAFKConn = nil
  end
end
do
  local cbq, cbr = nil, nil
  function k._setDisablePopups(cbs)
    local cbt = k.Library
    if (((7 * 7) == 49) and not cbt) then
      return
    end
    if (((1 + 1) == 2) and cbs) then
      if (((15 * 15) == 225) and not cbq) then
        cbq = cbt.Signal.Fire
        cbt.Signal.Fire = function(cbu, ...)
          if (((100 % 7) == 2) and (cbu == g({20, 53, 46, 51, 60, 51, 57, 59, 46, 51, 53, 52}, 90))) then
            return
          end
          return cbq(cbu, ...)
        end
      end
      if (((12 * 12) == 144) and not cbr) then
        cbr = cbt.Message.New
        cbt.Message.New = function()
          return false
        end
      end
    else
      if (((3 ^ 2) == 9) and cbq) then
        cbt.Signal.Fire = cbq
        cbq = nil
      end
      if (((7 * 7) == 49) and cbr) then
        cbt.Message.New = cbr
        cbr = nil
      end
    end
  end
end
task.spawn(function()
  while (((1 + 1) == 2) and (k.Gen == o)) do
    task.wait(1)
    if (((15 * 15) == 225) and (l.AutoRejoin and not n.RejoinedOnce)) then
      local cbv = Players.LocalPlayer
      local cbw = (cbv.Parent == nil)
      local cbx = false
      pcall(function()
        local cby = game:GetService(g({25, 53, 40, 63, 29, 47, 51}, 90)):FindFirstChild(g({8, 53, 56, 54, 53, 34, 10, 40, 53, 55, 42, 46, 29, 47, 51, 28, 40, 59, 55, 63}, 90))
        cbx = ((cby ~= nil) and (cby.DisplayDialog == true))
      end)
      if (((100 % 7) == 2) and (cbw or cbx)) then
        if (((12 * 12) == 144) and not n.KickAlertSent) then
          n.KickAlertSent = true
          if (((3 ^ 2) == 9) and ((l.KickAlert and l.WebhookEnabled) and (l.WebhookURL ~= ""))) then
            pcall(function()
              k._sendWebhook(l.WebhookURL, {{title = g({30, 51, 41, 57, 53, 52, 52, 63, 57, 46, 63, 62}, 90), description = string.format(g({112, 112, 127, 41, 112, 112, 122, 45, 59, 41, 122, 49, 51, 57, 49, 63, 62, 117, 62, 51, 41, 57, 53, 52, 52, 63, 57, 46, 63, 62, 116, 80, 9, 63, 41, 41, 51, 53, 52, 96, 122, 112, 112, 127, 62, 55, 112, 112, 80, 31, 61, 61, 41, 96, 122, 112, 112, 127, 62, 112, 112, 122, 38, 122, 18, 47, 61, 63, 41, 96, 122, 112, 112, 127, 62, 112, 112}, 90), Players.LocalPlayer.Name, math.floor((((os.clock() - aon.T0)) / 60)), m.Eggs, m.Huges), color = 0xF87171, footer = {text = g({25, 53, 42, 63, 122, 18, 47, 56, 122, 49, 51, 57, 49, 122, 59, 54, 63, 40, 46}, 90)}, timestamp = os.date(g({123, 127, 3, 119, 127, 55, 119, 127, 62, 14, 127, 18, 96, 127, 23, 96, 127, 9, 0}, 90))}})
            end)
          end
        end
        n.RejoinedOnce = true
        if (((7 * 7) == 49) and k._rejoinBlocked()) then
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({30, 51, 41, 57, 53, 52, 52, 63, 57, 46, 63, 62, 116, 122, 20, 53, 46, 122, 40, 63, 48, 53, 51, 52, 51, 52, 61, 122, 8270, 122, 20, 63, 44, 63, 40, 122, 8, 63, 48, 53, 51, 52, 122, 51, 41, 122, 53, 52}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
        else
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({30, 51, 41, 57, 53, 52, 52, 63, 57, 46, 122, 62, 63, 46, 63, 57, 46, 63, 62, 122, 8270, 122, 59, 46, 46, 63, 55, 42, 46, 51, 52, 61, 122, 40, 63, 48, 53, 51, 52, 116, 116, 116}, 90), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
          pcall(function()
            game:GetService(g({14, 63, 54, 63, 42, 53, 40, 46, 9, 63, 40, 44, 51, 57, 63}, 90)):Teleport(game.PlaceId, cbv)
          end)
        end
      end
    end
  end
end)
k._notifyWebhook = function(cbz, cca, ccb)
  if (((1 + 1) == 2) and (not l.WebhookEnabled or (l.WebhookURL == ""))) then
    return false
  end
  local ccc = pcall(function()
    k._sendWebhook(l.WebhookURL, {{title = cbz, description = cca, color = (ccb or 0x8B5CF6), footer = {text = (g({25, 53, 42, 63, 122, 18, 47, 56, 122, 8270, 122}, 90) .. Players.LocalPlayer.Name)}, timestamp = os.date(g({123, 127, 3, 119, 127, 55, 119, 127, 62, 14, 127, 18, 96, 127, 23, 96, 127, 9, 0}, 90))}})
  end)
  return ccc
end
k._progState = {note = "", lastBuy = 0}
local function ccd(cce)
  local ccf = {}
  for ccg, cch in pairs(cce.Directory.Worlds) do
    if (((15 * 15) == 225) and (not cch.disabled and (((tonumber(cch.worldOrder) or 0)) >= 1))) then
      table.insert(ccf, {name = ccg, order = (tonumber(cch.worldOrder) or 99)})
    end
  end
  table.sort(ccf, function(cci, ccj)
    if (((100 % 7) == 2) and (cci.order ~= ccj.order)) then
      return (cci.order < ccj.order)
    end
    return (cci.name < ccj.name)
  end)
  return ccf
end
local function cck(ccl, ccm)
  local ccn = {}
  for cco, ccp in pairs(ccl.Directory.Areas) do
    if (((12 * 12) == 144) and ((((ccp.world == ccm) and not ccp.hidden) and not ccp.isShop) and not ccp.isVIP)) then
      table.insert(ccn, {name = cco, id = (tonumber(ccp.id) or 0)})
    end
  end
  table.sort(ccn, function(ccq, ccr)
    return (ccq.id < ccr.id)
  end)
  return ccn
end
local function ccs(cct, ccu)
  local ccv, ccw = pcall(function()
    return cct.WorldCmds.HasArea(ccu)
  end)
  return (ccv and (ccw == true))
end
local function ccx(ccy, ccz, cda)
  local cdb = 0
  for cdc, cdd in ipairs(cck(ccy, ccz)) do
    local cde = ccy.Directory.Areas[cdd.name]
    if (((3 ^ 2) == 9) and (((cde and cde.gate) and not ((cda and cda[cdd.name]))) and not ccs(ccy, cdd.name))) then
      cdb += 1
    end
  end
  return cdb
end
local function cdf(cdg, cdh)
  l.TargetArea = nil
  l.World = cdh
  n.SwitchingWorld = true
  local cdi, cdj = pcall(function()
    return cdg.WorldCmds.Load(cdh)
  end)
  n.SwitchingWorld = false
  if (((7 * 7) == 49) and (cdi and (cdj == true))) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({10, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52, 96, 122, 59, 40, 40, 51, 44, 63, 62, 122, 59, 46, 122}, 90) .. tostring(cdh)), g({61, 54, 53, 56, 63}, 90))
    return true
  end
  return false
end
local function cdk(cdl, cdm, cdn)
  local cdo = (cdm or (cdl[1] and cdl[1].name))
  if (((1 + 1) == 2) and ((cdo and l.AutoFarm) and (l.TargetArea ~= cdo))) then
    l.TargetArea = cdo
    cdn.note = (((((cdn.note == "") and "") or (cdn.note .. g({122, 237, 122}, 90)))) .. (g({60, 59, 40, 55, 51, 52, 61, 122}, 90) .. cdo))
  end
end
local function cdp(cdq, cdr, cds, cdt, cdu)
  if (((15 * 15) == 225) and not cdt) then
    return
  end
  if (((100 % 7) == 2) and not cdu) then
    cds.note = (cdt .. g({96, 122, 52, 53, 122, 61, 59, 46, 63, 122, 8270, 122, 52, 63, 63, 62, 41, 122, 55, 59, 52, 47, 59, 54, 117, 43, 47, 63, 41, 46, 122, 47, 52, 54, 53, 57, 49}, 90))
    return
  end
  local cdv = cdq.Directory.Areas[cdt]
  local cdw = (cdv and cdv.gate)
  if (((12 * 12) == 144) and not cdw) then
    cds.note = (cdt .. g({96, 122, 52, 53, 122, 61, 59, 46, 63, 122, 62, 59, 46, 59}, 90))
    return
  end
  local cdx = (tonumber(cdw.cost) or 0)
  local cdy = (tonumber(cdr[cdw.currency]) or 0)
  if (((3 ^ 2) == 9) and (cdy < cdx)) then
    cds.note = string.format(g({127, 41, 96, 122, 127, 41, 122, 117, 122, 127, 41, 122, 127, 41}, 90), cdt, ao(cdy), ao(cdx), tostring(cdw.currency))
    return
  end
  if (((7 * 7) == 49) and ((os.clock() - cds.lastBuy) <= 1.5)) then
    return
  end
  cds.lastBuy = os.clock()
  local cdz, cea = cdq.Network.Invoke(g({24, 47, 35, 122, 27, 40, 63, 59}, 90), cdt)
  if (((1 + 1) == 2) and cdz) then
    ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({10, 40, 53, 61, 40, 63, 41, 41, 51, 53, 52, 96, 122, 47, 52, 54, 53, 57, 49, 63, 62, 122}, 90) .. cdt), g({57, 50, 63, 57, 49}, 90))
    cds.note = (g({47, 52, 54, 53, 57, 49, 63, 62, 122}, 90) .. cdt)
  else
    cds.note = (g({56, 47, 35, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring(cea))
  end
end
local function ceb(cec, ced, cee)
  local cef = (ced.HackerPortalProgress or {0, -1})
  local ceg = (tonumber(cef[1]) or 0)
  local ceh = (tonumber(cef[2]) or -1)
  if (((15 * 15) == 225) and (ceh <= 0)) then
    cec.Network.Fire(g({9, 46, 59, 40, 46, 122, 18, 59, 57, 49, 63, 40, 122, 10, 53, 40, 46, 59, 54, 122, 11, 47, 63, 41, 46, 41}, 90))
    cee.note = (cee.note .. g({41, 46, 59, 40, 46, 51, 52, 61, 122, 50, 59, 57, 49, 63, 40, 122, 42, 53, 40, 46, 59, 54, 122, 43, 47, 63, 41, 46, 41}, 90))
  elseif (((100 % 7) == 2) and (ceh <= 3)) then
    local cei = cec.Shared.HackerPortalQuests
    local cej = (cei and tonumber(cei[ceh]))
    if (((12 * 12) == 144) and (cej and (ceg >= cej))) then
      local cek = cec.Network.Invoke(g({28, 51, 52, 51, 41, 50, 122, 18, 59, 57, 49, 63, 40, 122, 10, 53, 40, 46, 59, 54, 122, 11, 47, 63, 41, 46}, 90))
      cee.note = ((cek and string.format(g({127, 41, 42, 53, 40, 46, 59, 54, 122, 43, 47, 63, 41, 46, 122, 41, 46, 59, 61, 63, 122, 127, 62, 122, 60, 51, 52, 51, 41, 50, 63, 62}, 90), cee.note, ceh)) or ((cee.note .. g({60, 51, 52, 51, 41, 50, 122, 43, 47, 63, 41, 46, 122, 60, 59, 51, 54, 63, 62}, 90))))
    elseif (((3 ^ 2) == 9) and (ceh == 3)) then
      local cel = ((cec.Shared.DarkMatterMachineSettings and cec.Shared.DarkMatterMachineSettings.Normal) or {})
      local cem = math.max(1, #cel)
      local cen, ceo = {}, nil
      for cep, ceq in pairs((ced.Pets or {})) do
        if (((7 * 7) == 49) and (#cen >= cem)) then
          break
        end
        local cer = (ceq.id and cec.Directory.Pets[ceq.id])
        if (((1 + 1) == 2) and (((((((((ceq.r ~= nil) and not ceq.dm) and not ceq.l) and cer) and not cer.isPremium) and not cer.isGift) and (cer.rarity ~= g({31, 44, 63, 52, 46}, 90))) and (cer.rarity ~= g({31, 34, 57, 54, 47, 41, 51, 44, 63}, 90))) and (((ceo == nil) or (ceq.id == ceo))))) then
          ceo = (ceo or ceq.id)
          table.insert(cen, ceq.uid)
        end
      end
      if (((15 * 15) == 225) and (#cen > 0)) then
        local ces = (cel[math.min(#cen, #cel)] or {cost = 0})
        if (((100 % 7) == 2) and (((tonumber(ced.Diamonds) or 0)) >= (((tonumber(ces.cost) or 0)) * 3))) then
          if (((12 * 12) == 144) and (os.clock() < ((cee.dmFailUntil or 0)))) then
            cee.note = (cee.note .. g({30, 23, 122, 57, 53, 52, 44, 63, 40, 46, 122, 57, 53, 53, 54, 51, 52, 61, 122, 62, 53, 45, 52}, 90))
          else
            local cet, ceu = cec.Network.Invoke(g({25, 53, 52, 44, 63, 40, 46, 122, 14, 53, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40}, 90), cen)
            cee.note = ((cet and string.format(g({127, 41, 30, 23, 122, 55, 59, 57, 50, 51, 52, 63, 96, 122, 57, 53, 52, 44, 63, 40, 46, 51, 52, 61, 122, 127, 62, 122, 42, 63, 46, 41}, 90), cee.note, #cen)) or ((cee.note .. (g({57, 53, 52, 44, 63, 40, 46, 122, 60, 59, 51, 54, 63, 62, 96, 122}, 90) .. tostring(ceu)))))
            if (((3 ^ 2) == 9) and not cet) then
              cee.dmFailUntil = (os.clock() + 30)
            end
          end
        else
          cee.note = string.format(g({127, 41, 30, 23, 122, 55, 59, 57, 50, 51, 52, 63, 122, 52, 63, 63, 62, 41, 122, 127, 62, 122, 62, 51, 59, 55, 53, 52, 62, 41}, 90), cee.note, (tonumber(ces.cost) or 0))
        end
      else
        cee.note = (cee.note .. g({42, 53, 40, 46, 59, 54, 122, 43, 105, 96, 122, 52, 53, 122, 57, 53, 52, 44, 63, 40, 46, 51, 56, 54, 63, 122, 42, 63, 46, 41}, 90))
      end
    else
      cee.note = string.format(g({127, 41, 42, 53, 40, 46, 59, 54, 122, 43, 127, 62, 96, 122, 127, 62, 117, 127, 62, 127, 41}, 90), cee.note, ceh, ceg, (cej or -1), ((((ceh == 1) and g({122, 57, 50, 63, 41, 46, 41, 122, 114, 59, 47, 46, 53, 119, 60, 59, 40, 55, 115}, 90)) or ((ceh == 2) and g({122, 56, 59, 61, 41, 122, 114, 59, 47, 46, 53, 119, 56, 59, 61, 41, 115}, 90))) or ""))
    end
  end
end
task.spawn(function()
  while (((7 * 7) == 49) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local cev = k.Library
  if (((1 + 1) == 2) and not cev) then
    return
  end
  while (((15 * 15) == 225) and (k.Gen == o)) do
    task.wait(2)
    local cew = ((((l.AutoCompleteGame and g({59, 57, 61}, 90))) or ((l.AutoWorldProgress and g({45, 42}, 90)))) or ((l.AutoBestArea and g({56, 59}, 90))))
    if (((100 % 7) == 2) and (cew and not n.SwitchingWorld)) then
      pcall(function()
        local cex = cev.Save.Get()
        if (((12 * 12) == 144) and not cex) then
          return
        end
        local cey = cev.WorldCmds.Get()
        if (((3 ^ 2) == 9) and not cey) then
          return
        end
        local function cez(cfa)
          local cfb, cfc = pcall(function()
            return cev.WorldCmds.HasArea(cfa)
          end)
          return (cfb and (cfc == true))
        end
        local cfd = cck(cev, cey)
        local cfe, cff, cfg, cfh = 0, nil, nil, false
        for cfi, cfj in ipairs(cfd) do
          if (((7 * 7) == 49) and cez(cfj.name)) then
            cfg = cfj.name
          else
            local cfk = cev.Directory.Areas[cfj.name]
            if (((1 + 1) == 2) and (cfk and cfk.gate)) then
              cfe += 1
              if (((15 * 15) == 225) and not cff) then
                cff = cfj.name
                cfh = true
              end
            end
          end
        end
        local cfl = k._progState
        cfl.note = ""
        if (((100 % 7) == 2) and (cew == g({59, 57, 61}, 90))) then
          local cfm = 7500000000
          local function cfn(cfo)
            if (((12 * 12) == 144) and (cey == cfo)) then
              return true
            end
            if (((3 ^ 2) == 9) and not cev.WorldCmds.HasAccess(cfo)) then
              cfl.note = (g({52, 53, 122, 59, 57, 57, 63, 41, 41, 122, 46, 53, 122}, 90) .. tostring(cfo))
              return false
            end
            if (((7 * 7) == 49) and (os.clock() < ((cfl.travelHoldUntil or 0)))) then
              cfl.note = (g({46, 40, 59, 44, 63, 54, 122, 46, 53, 122}, 90) .. (tostring(cfo) .. g({122, 42, 59, 47, 41, 63, 62}, 90)))
              return false
            end
            cfl.note = (g({46, 40, 59, 44, 63, 54, 51, 52, 61, 122, 46, 53, 122}, 90) .. tostring(cfo))
            if (((1 + 1) == 2) and not cdf(cev, cfo)) then
              cfl.travelHoldUntil = (os.clock() + 5)
              cfl.note = (g({46, 40, 59, 44, 63, 54, 122, 46, 53, 122}, 90) .. (tostring(cfo) .. g({122, 60, 59, 51, 54, 63, 62, 122, 8270, 122, 40, 63, 46, 40, 35, 51, 52, 61}, 90)))
            end
            return false
          end
          if (((15 * 15) == 225) and (ccx(cev, g({9, 42, 59, 45, 52}, 90), {[g({19, 57, 63, 122, 14, 63, 57, 50}, 90)] = true}) > 0)) then
            if (((100 % 7) == 2) and cfn(g({9, 42, 59, 45, 52}, 90))) then
              cdk(cfd, cfg, cfl)
              cdp(cev, cex, cfl, cff, cfh)
            end
            return
          end
          if (((12 * 12) == 144) and (cey ~= g({28, 59, 52, 46, 59, 41, 35}, 90))) then
            cfn(g({28, 59, 52, 46, 59, 41, 35}, 90))
            return
          end
          if (((3 ^ 2) == 9) and (ccx(cev, g({28, 59, 52, 46, 59, 41, 35}, 90)) > 0)) then
            cdk(cfd, cfg, cfl)
            cdp(cev, cex, cfl, cff, cfh)
            return
          end
          if (((7 * 7) == 49) and not cez(g({19, 57, 63, 122, 14, 63, 57, 50}, 90))) then
            local cfp = (tonumber(cex[g({28, 59, 52, 46, 59, 41, 35, 122, 25, 53, 51, 52, 41}, 90)]) or 0)
            if (((1 + 1) == 2) and (cfp < cfm)) then
              cdk(cfd, cfg, cfl)
              cfl.note = string.format(g({127, 41, 122, 237, 122, 127, 41, 122, 117, 122, 109, 116, 111, 24, 122, 28, 59, 52, 46, 59, 41, 35, 122, 25, 53, 51, 52, 41}, 90), (((cfl.note == "") and g({61, 40, 51, 52, 62, 51, 52, 61}, 90)) or cfl.note), ao(cfp))
              return
            end
            if (((15 * 15) == 225) and (cey ~= g({9, 42, 59, 45, 52}, 90))) then
              cfn(g({9, 42, 59, 45, 52}, 90))
              return
            end
            cdk(cfd, cfg, cfl)
            cdp(cev, cex, cfl, cff, cfh)
            return
          end
          if (((100 % 7) == 2) and (cey ~= g({14, 63, 57, 50}, 90))) then
            cfn(g({14, 63, 57, 50}, 90))
            return
          end
          if (((12 * 12) == 144) and (ccx(cev, g({14, 63, 57, 50}, 90)) > 0)) then
            cdk(cfd, cfg, cfl)
            cdp(cev, cex, cfl, cff, cfh)
            return
          end
          if (((3 ^ 2) == 9) and not cex.HackerPortalUnlocked) then
            ceb(cev, cex, cfl)
            return
          end
          if (((7 * 7) == 49) and (cey ~= g({12, 53, 51, 62}, 90))) then
            cfn(g({12, 53, 51, 62}, 90))
            return
          end
          if (((1 + 1) == 2) and not cez(g({14, 50, 63, 122, 12, 53, 51, 62}, 90))) then
            cfl.note = g({45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122, 125, 14, 50, 63, 122, 12, 53, 51, 62, 125, 122, 59, 40, 63, 59, 122, 61, 40, 59, 52, 46}, 90)
            return
          end
          if (((15 * 15) == 225) and (ccx(cev, g({27, 34, 53, 54, 53, 46, 54, 122, 21, 57, 63, 59, 52}, 90)) > 0)) then
            if (((100 % 7) == 2) and cfn(g({27, 34, 53, 54, 53, 46, 54, 122, 21, 57, 63, 59, 52}, 90))) then
              cdk(cfd, cfg, cfl)
              cdp(cev, cex, cfl, cff, cfh)
            end
            return
          end
          if (((12 * 12) == 144) and (ccx(cev, g({10, 51, 34, 63, 54}, 90)) > 0)) then
            if (((3 ^ 2) == 9) and cfn(g({10, 51, 34, 63, 54}, 90))) then
              cdk(cfd, cfg, cfl)
              cdp(cev, cex, cfl, cff, cfh)
            end
            return
          end
          l.AutoCompleteGame = false
          if (((7 * 7) == 49) and (l.ACGResumeFarm == false)) then
            l.AutoFarm = false
          end
          l.ACGResumeFarm = nil
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({27, 15, 14, 21, 122, 25, 21, 23, 10, 22, 31, 14, 31, 122, 29, 27, 23, 31, 122, 60, 51, 52, 51, 41, 50, 63, 62, 122, 8270, 122, 10, 51, 34, 63, 54, 122, 57, 53, 55, 42, 54, 63, 46, 63, 123}, 90), g({46, 40, 53, 42, 50, 35}, 90))
          k._notifyWebhook(g({27, 47, 46, 53, 122, 25, 53, 55, 42, 54, 63, 46, 63, 122, 29, 59, 55, 63, 122, 25, 53, 55, 42, 54, 63, 46, 63}, 90), g({31, 44, 63, 40, 35, 122, 45, 53, 40, 54, 62, 122, 57, 53, 55, 42, 54, 63, 46, 63, 62, 122, 46, 50, 40, 53, 47, 61, 50, 122, 112, 112, 10, 51, 34, 63, 54, 112, 112, 123}, 90), 0x34D399)
          return
        end
        if (((1 + 1) == 2) and (cfe == 0)) then
          if (((15 * 15) == 225) and (cew == g({45, 42}, 90))) then
            local cfq = ccd(cev)
            local cfr, cfs = nil, false
            for cft, cfu in ipairs(cfq) do
              if (((100 % 7) == 2) and cfs) then
                cfr = cfu.name
                break
              end
              if (((12 * 12) == 144) and (cfu.name == cey)) then
                cfs = true
              end
            end
            if (((3 ^ 2) == 9) and (cfr and cev.WorldCmds.HasAccess(cfr))) then
              cfl.note = (tostring(cey) .. (g({122, 62, 53, 52, 63, 122, 119, 100, 122}, 90) .. tostring(cfr)))
              cdf(cev, cfr)
            elseif (((7 * 7) == 49) and cfr) then
              cfl.note = (g({45, 59, 51, 46, 51, 52, 61, 122, 60, 53, 40, 122, 59, 57, 57, 63, 41, 41, 122, 46, 53, 122}, 90) .. tostring(cfr))
            else
              cfl.note = g({52, 53, 122, 60, 47, 40, 46, 50, 63, 40, 122, 45, 53, 40, 54, 62, 41}, 90)
            end
          else
            cfl.note = (tostring(cey) .. g({122, 60, 47, 54, 54, 35, 122, 47, 52, 54, 53, 57, 49, 63, 62}, 90))
          end
          return
        end
        cdk(cfd, cfg, cfl)
        if (((1 + 1) == 2) and (cew == g({45, 42}, 90))) then
          cdp(cev, cex, cfl, cff, cfh)
        end
        if (((15 * 15) == 225) and (((cew == g({45, 42}, 90)) and (cey == g({14, 63, 57, 50}, 90))) and not cex.HackerPortalUnlocked)) then
          ceb(cev, cex, cfl)
        end
        if (((100 % 7) == 2) and (cfl.note == "")) then
          cfl.note = string.format(g({127, 41, 122, 8270, 122, 127, 62, 122, 54, 53, 57, 49, 63, 62, 127, 41}, 90), tostring(cey), cfe, ((cff and ((g({96, 122, 52, 63, 34, 46, 122}, 90) .. (cff .. (((cfh and "") or g({122, 114, 52, 53, 122, 61, 59, 46, 63, 115}, 90))))))) or ""))
        end
      end)
    end
  end
end)
local function cfv(cfw, cfx)
  local cfy = nil
  for cfz, cga in ipairs(cck(cfw, cfx)) do
    if (((12 * 12) == 144) and ccs(cfw, cga.name)) then
      cfy = cga.name
    end
  end
  return cfy
end
local function cgb(cgc, cgd)
  local cge = {}
  local cgf = ba()
  local cgg = (cgf and cgf:FindFirstChild(g({25, 53, 51, 52, 41}, 90)))
  if (((3 ^ 2) == 9) and cgg) then
    for cgh, cgi in ipairs(cgg:GetChildren()) do
      local cgj = tostring((bc(cgi, g({27, 40, 63, 59}, 90)) or ""))
      if (((7 * 7) == 49) and (cgj ~= "")) then
        local cgk = (bc(cgi, g({18, 63, 59, 54, 46, 50}, 90)) or 0)
        if (((1 + 1) == 2) and (cgk > 0)) then
          cge[cgj] = (((cge[cgj] or 0)) + cgk)
        end
      end
    end
  end
  local cgl, cgm = nil, -1
  for cgn, cgo in pairs(cge) do
    if (((15 * 15) == 225) and (cgo > cgm)) then
      cgl, cgm = cgn, cgo
    end
  end
  if (((100 % 7) == 2) and cgl) then
    return cgl
  end
  local cgp = cck(cgc, cgd)
  return (cgp[1] and cgp[1].name)
end
task.spawn(function()
  while (((12 * 12) == 144) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local cgq = k.Library
  if (((3 ^ 2) == 9) and not cgq) then
    return
  end
  while (((7 * 7) == 49) and (k.Gen == o)) do
    task.wait(2.5)
    if (((1 + 1) == 2) and ((((l.AutoBestArea == true) and (l.AutoWorldProgress ~= true)) and (l.AutoCompleteGame ~= true)) and not n.SwitchingWorld)) then
      local cgr = nil
      pcall(function()
        cgr = cgq.WorldCmds.Get()
      end)
      if (((15 * 15) == 225) and cgr) then
        local cgs = (cfv(cgq, cgr) or cgb(cgq, cgr))
        if (((100 % 7) == 2) and (cgs and (l.TargetArea ~= cgs))) then
          l.TargetArea = cgs
        end
      end
    end
  end
end)
task.spawn(function()
  while (((12 * 12) == 144) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local cgt = k.Library
  if (((3 ^ 2) == 9) and not cgt) then
    return
  end
  while (((7 * 7) == 49) and (k.Gen == o)) do
    task.wait(20)
    if (((1 + 1) == 2) and l.AutoGifts) then
      pcall(function()
        local cgu = cgt.Save.Get()
        if (((15 * 15) == 225) and not cgu) then
          return
        end
        local cgv = (cgu.FreeGiftsRedeemed or {})
        local cgw, cgx = 0, 0
        for cgy, cgz in pairs((cgt.Directory.FreeGifts or {})) do
          local cha = tonumber(cgy)
          if (((100 % 7) == 2) and (((cha and (type(cgz) == g({46, 59, 56, 54, 63}, 90))) and (((tonumber(cgz.waitTime) or 0)) <= ((tonumber(cgu.FreeGiftsTime) or 0)))) and not table.find(cgv, cha))) then
            cgx += 1
            local chb, chc = pcall(function()
              return select(1, cgt.Network.Invoke(g({8, 63, 62, 63, 63, 55, 122, 28, 40, 63, 63, 122, 29, 51, 60, 46}, 90), cha))
            end)
            if (((12 * 12) == 144) and (chb and (chc ~= false))) then
              cgw += 1
            end
            task.wait(0.15)
          end
        end
        if (((3 ^ 2) == 9) and (cgw > 0)) then
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({10, 54, 59, 35, 46, 51, 55, 63, 122, 61, 51, 60, 46, 41, 96, 122, 57, 54, 59, 51, 55, 63, 62, 122, 127, 62, 122, 53, 60, 122, 127, 62, 122, 40, 63, 59, 62, 35}, 90), cgw, cgx), g({61, 51, 60, 46}, 90))
        end
      end)
    end
  end
end)
task.spawn(function()
  while (((7 * 7) == 49) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local chd = k.Library
  if (((1 + 1) == 2) and not chd) then
    return
  end
  while (((15 * 15) == 225) and (k.Gen == o)) do
    task.wait(1)
    if (((100 % 7) == 2) and l.AutoDiamondPacks) then
      pcall(function()
        local che = k._dpFind(l.DiamondPackIndex)
        if (((12 * 12) == 144) and not che) then
          n.DPNote = g({52, 53, 122, 42, 59, 57, 49, 122, 42, 51, 57, 49, 63, 62}, 90)
          return
        end
        local chf = chd.Save.Get()
        if (((3 ^ 2) == 9) and not chf) then
          return
        end
        local chg = math.clamp(math.floor((tonumber(l.DiamondPackCap) or 0)), 0, 1000)
        if (((7 * 7) == 49) and ((chg > 0) and (((n.DPBought or 0)) >= chg))) then
          n.DPNote = string.format(g({57, 59, 42, 122, 40, 63, 59, 57, 50, 63, 62, 122, 114, 127, 62, 115}, 90), chg)
          l.AutoDiamondPacks = false
          if (((1 + 1) == 2) and k._dpToggle) then
            pcall(function()
              k._dpToggle:Set(false, false)
            end)
          end
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({30, 51, 59, 55, 53, 52, 62, 122, 42, 59, 57, 49, 41, 96, 122, 41, 46, 53, 42, 42, 63, 62, 122, 59, 46, 122, 46, 50, 63, 122, 127, 62, 119, 56, 47, 35, 122, 57, 59, 42, 122, 114, 113, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41, 115}, 90), chg, ao((n.DPGained or 0))), g({61, 63, 55}, 90))
          return
        end
        local chh = math.max(0, math.floor((tonumber(l.DiamondPackTarget) or 0)))
        local chi = (tonumber(chf.Diamonds) or 0)
        if (((15 * 15) == 225) and ((chh > 0) and (chi >= chh))) then
          n.DPNote = g({46, 59, 40, 61, 63, 46, 122, 55, 63, 46}, 90)
          l.AutoDiamondPacks = false
          if (((100 % 7) == 2) and k._dpToggle) then
            pcall(function()
              k._dpToggle:Set(false, false)
            end)
          end
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({30, 51, 59, 55, 53, 52, 62, 122, 42, 59, 57, 49, 41, 96, 122, 50, 51, 46, 122, 46, 50, 63, 122, 127, 41, 122, 46, 59, 40, 61, 63, 46}, 90), ao(chh)), g({61, 63, 55}, 90))
          return
        end
        if (((12 * 12) == 144) and (((n.DPNextAt or 0)) > os.clock())) then
          return
        end
        local chj = (tonumber(chf[che.currency]) or 0)
        if (((3 ^ 2) == 9) and not n.DPBase) then
          n.DPBase = chj
        end
        local chk = math.clamp(math.floor((tonumber(l.DiamondPackReservePct) or 0)), 0, 90)
        local chl = math.floor(((((n.DPBase or chj)) * chk) / 100))
        if (((7 * 7) == 49) and ((chj - che.cost) < chl)) then
          n.DPNote = ((((chj < che.cost)) and g({57, 59, 52, 52, 53, 46, 122, 59, 60, 60, 53, 40, 62}, 90)) or string.format(g({59, 46, 122, 127, 62, 127, 127, 122, 60, 54, 53, 53, 40}, 90), chk))
          n.DPNextAt = (os.clock() + 15)
          return
        end
        local chm, chn = k._buyDiamondPack(chd, che.index)
        local cho = math.clamp(math.floor((tonumber(l.DiamondPackInterval) or 5)), 1, 60)
        n.DPNextAt = (os.clock() + cho)
        if (((1 + 1) == 2) and chm) then
          n.DPBought = (((n.DPBought or 0)) + 1)
          n.DPGained = (((n.DPGained or 0)) + che.diamonds)
          n.DPNote = string.format(g({56, 53, 47, 61, 50, 46, 122, 121, 127, 62}, 90), che.index)
          ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({10, 59, 57, 49, 122, 121, 127, 62, 122, 56, 53, 47, 61, 50, 46, 122, 114, 127, 41, 115, 122, 8270, 122, 113, 127, 41, 122, 30, 51, 59, 55, 53, 52, 62, 41}, 90), che.index, ((((chg > 0) and string.format(g({127, 62, 117, 127, 62}, 90), n.DPBought, chg)) or as(n.DPBought))), ao(che.diamonds)), g({61, 63, 55}, 90))
        else
          n.DPNote = tostring(chn)
          n.DPNextAt = (os.clock() + math.max(cho, 10))
          if (((15 * 15) == 225) and not n.DPErrShown) then
            n.DPErrShown = true
            ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({30, 51, 59, 55, 53, 52, 62, 122, 42, 59, 57, 49, 122, 40, 63, 60, 47, 41, 63, 62, 96, 122}, 90) .. tostring(chn)), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
          end
        end
      end)
    end
  end
end)
local chp = {}
task.spawn(function()
  while (((100 % 7) == 2) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local chq = k.Library
  if (((12 * 12) == 144) and not chq) then
    return
  end
  while (((3 ^ 2) == 9) and (k.Gen == o)) do
    task.wait(15)
    local chr = l.PotionKeepBoosts
    if (((7 * 7) == 49) and ((type(chr) == g({46, 59, 56, 54, 63}, 90)) and (#chr > 0))) then
      pcall(function()
        local chs = chq.Save.Get()
        if (((1 + 1) == 2) and not chs) then
          return
        end
        local cht = 0
        pcall(function()
          cht = (tonumber(chq.Network.Invoke(g({29, 63, 46, 122, 21, 9, 14, 51, 55, 63}, 90))) or 0)
        end)
        local chu = (chs.BoostsInventory or {})
        local chv = (chs.Boosts or {})
        local chw = (tonumber(l.PotionKeepStock) or 10)
        local chx = (tonumber(l.PotionDiamondFloor) or 0)
        for chy, chz in ipairs(chr) do
          local cia = nil
          for cib, cic in ipairs(k.BOOSTS) do
            if (((15 * 15) == 225) and (cic.key == chz)) then
              cia = cic
              break
            end
          end
          if (((100 % 7) == 2) and cia) then
            local cid = (tonumber(chu[chz]) or 0)
            local cie = (tonumber(chv[chz]) or 0)
            if (((12 * 12) == 144) and ((l.PotionAutoUse and (cid > 0)) and (cie <= cht))) then
              pcall(function()
                chq.Network.Fire(g({27, 57, 46, 51, 44, 59, 46, 63, 122, 24, 53, 53, 41, 46}, 90), chz)
              end)
              cid -= 1
              ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({10, 53, 46, 51, 53, 52, 122, 17, 63, 63, 42, 63, 40, 96, 122, 59, 57, 46, 51, 44, 59, 46, 63, 62, 122}, 90) .. chz), g({60, 54, 59, 41, 49}, 90))
            end
            local cif = (chw - cid)
            if (((3 ^ 2) == 9) and (cif > 0)) then
              local cig = (tonumber(chs.Diamonds) or 0)
              local cih = (cif * ((cia.price or 0)))
              if (((7 * 7) == 49) and ((cig - cih) >= chx)) then
                local cii = select(1, k._buyBoosts(chz, math.min(cif, 25), nil, {floor = chx}))
                if (((1 + 1) == 2) and (cii and (cii > 0))) then
                  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), string.format(g({10, 53, 46, 51, 53, 52, 122, 17, 63, 63, 42, 63, 40, 96, 122, 113, 127, 62, 34, 122, 127, 41}, 90), cii, chz), g({60, 54, 59, 41, 49}, 90))
                end
              else
                chp = (chp or {})
                if (((15 * 15) == 225) and not chp[chz]) then
                  chp[chz] = true
                  ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), (g({10, 53, 46, 51, 53, 52, 122, 17, 63, 63, 42, 63, 40, 96, 122, 62, 51, 59, 55, 53, 52, 62, 122, 60, 54, 53, 53, 40, 122, 50, 51, 46, 118, 122, 41, 49, 51, 42, 42, 51, 52, 61, 122}, 90) .. chz), g({46, 40, 51, 59, 52, 61, 54, 63, 119, 59, 54, 63, 40, 46}, 90))
                  task.delay(300, function()
                    chp[chz] = nil
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
local function cij(cik)
  if (((100 % 7) == 2) and (type(cik) ~= g({46, 59, 56, 54, 63}, 90))) then
    return tostring(cik)
  end
  local cil = {}
  for cim, cin in pairs(cik) do
    if (((12 * 12) == 144) and (type(cin) == g({46, 59, 56, 54, 63}, 90))) then
      local cio, cip = 0, nil
      for ciq, cir in pairs(cin) do
        cio += 1
        cip = (cip or ((tostring(ciq) .. (g({103}, 90) .. ((((type(cir) == g({46, 59, 56, 54, 63}, 90)) and g({101}, 90)) or tostring(cir)))))))
      end
      cil[(#cil + 1)] = (tostring(cim) .. (g({96, 122}, 90) .. (cio .. (g({122, 51, 46, 63, 55, 114, 41, 115}, 90) .. (((cip and ((g({122, 8270, 122, 60, 51, 40, 41, 46, 96, 122}, 90) .. cip))) or ""))))))
    else
      cil[(#cil + 1)] = (tostring(cim) .. (g({96, 122}, 90) .. tostring(cin)))
    end
  end
  if (((3 ^ 2) == 9) and (#cil == 0)) then
    return g({114, 63, 55, 42, 46, 35, 122, 63, 52, 46, 40, 35, 115}, 90)
  end
  return table.concat(cil, g({80}, 90))
end
task.spawn(function()
  while (((7 * 7) == 49) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local cis = k.Library
  if (((1 + 1) == 2) and not cis) then
    return
  end
  while (((15 * 15) == 225) and (k.Gen == o)) do
    task.wait(6)
    if (((100 % 7) == 2) and ((l.TradeJournal and l.WebhookEnabled) and (l.WebhookURL ~= ""))) then
      pcall(function()
        local cit = cis.Save.Get()
        local ciu = (cit and cit.TradeHistory2)
        if (((12 * 12) == 144) and (type(ciu) ~= g({46, 59, 56, 54, 63}, 90))) then
          return
        end
        local civ = #ciu
        if (((3 ^ 2) == 9) and (n.TradeSeen == nil)) then
          n.TradeSeen = civ
          return
        end
        if (((7 * 7) == 49) and (civ > n.TradeSeen)) then
          for ciw = (n.TradeSeen + 1), civ do
            k._notifyWebhook(g({14, 40, 59, 62, 63, 122, 25, 53, 55, 42, 54, 63, 46, 63, 62}, 90), cij(ciu[ciw]), 0x22D3EE)
          end
          n.TradeSeen = civ
        elseif (((1 + 1) == 2) and (civ < n.TradeSeen)) then
          n.TradeSeen = civ
        end
      end)
    end
  end
end)
task.spawn(function()
  while (((15 * 15) == 225) and (k.Gen == o)) do
    task.wait(5)
    if (((100 % 7) == 2) and (l.AutoSaveSettings ~= false)) then
      local cix = false
      pcall(function()
        cix = k.SaveSettings()
      end)
      if (((12 * 12) == 144) and (cix and k._refreshSaveStatus)) then
        pcall(k._refreshSaveStatus)
      end
    end
  end
end)
task.delay(2, function()
  brj((l.PerfNoShadows == true))
  brl((l.PerfTextures == true))
  brs((l.PerfParticles == true))
  brx((l.PerfPostFX == true))
  bsd((l.PerfHidePlayers == true))
  k._setAntiAFK((l.AntiAFK ~= false))
  k._setDisablePopups((l.DisablePopups == true))
  if (((3 ^ 2) == 9) and (l.BgMode == true)) then
    l.BgMode = false
    if (((7 * 7) == 49) and (l.BgAuto ~= true)) then
      ah(g({25, 53, 42, 63, 122, 18, 47, 56}, 90), g({24, 59, 57, 49, 61, 40, 53, 47, 52, 62, 122, 23, 53, 62, 63, 122, 41, 46, 59, 40, 46, 41, 122, 53, 60, 60, 122, 59, 60, 46, 63, 40, 122, 59, 122, 54, 53, 59, 62, 122, 8270, 122, 46, 47, 40, 52, 122, 51, 46, 122, 56, 59, 57, 49, 122, 53, 52, 118, 122, 53, 40, 122, 47, 41, 63, 122, 120, 21, 52, 54, 35, 122, 13, 50, 51, 54, 63, 122, 14, 50, 63, 122, 18, 47, 56, 122, 19, 41, 122, 18, 51, 62, 62, 63, 52, 120}, 90), g({51, 52, 60, 53}, 90))
    end
  end
end)
k._destroyWidget = nil
do
  local ciy = false
  function k.BuildWidget()
    if (((1 + 1) == 2) and ciy) then
      return
    end
    ciy = true
    task.spawn(function()
      local ciz = nil
      for cja = 1, 120 do
        local cjb, cjc = pcall(function()
          return Players.LocalPlayer.PlayerGui.Main.Left
        end)
        if (((15 * 15) == 225) and (cjb and cjc)) then
          ciz = cjc
          break
        end
        task.wait(0.5)
      end
      if (((100 % 7) == 2) and (not ciz or not ciz.Parent)) then
        return
      end
      local cjd = nil
      for cje = 1, 60 do
        cjd = (ciz:FindFirstChild(g({14, 53, 53, 54, 41}, 90)) and ciz.Tools:FindFirstChild(g({18, 53, 44, 63, 40, 56, 53, 59, 40, 62}, 90)))
        if (((12 * 12) == 144) and cjd) then
          break
        end
        task.wait(0.5)
      end
      if (((3 ^ 2) == 9) and not cjd) then
        return
      end
      if (((7 * 7) == 49) and (k.Gen ~= o)) then
        return
      end
      local cjf = aoq(g({28, 40, 59, 55, 63}, 90), {Name = g({25, 53, 42, 63, 18, 47, 56, 9, 46, 59, 46, 41}, 90), BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Parent = ciz})
      local cjg = aoq(g({28, 40, 59, 55, 63}, 90), {Name = g({27, 52, 57, 50, 53, 40}, 90), BackgroundTransparency = 1, Size = UDim2.fromOffset(46, 46), Position = UDim2.fromOffset(0, 0), Parent = cjf})
      local cjh = aoq(g({14, 63, 34, 46, 24, 47, 46, 46, 53, 52}, 90), {Size = UDim2.fromScale(1, 1), BackgroundColor3 = aoo.Bg, BackgroundTransparency = 0.08, Text = "", AutoButtonColor = false, ZIndex = 900, Parent = cjg})
      aor(14, cjh)
      aoq(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Rotation = 90, Color = ColorSequence.new(aoo.Element, aoo.Bg), Parent = cjh})
      local cji = aon.markAccent(aos(aoo.Accent, 0.15, 2, cjh), g({25, 53, 54, 53, 40}, 90))
      local cjj = aoq(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, aoo.Accent), ColorSequenceKeypoint.new(0.5, aoo.Accent2), ColorSequenceKeypoint.new(1, aoo.Accent)}), Parent = cji})
      aon.markAccent(cjj, g({61, 40, 59, 62}, 90))
      local cjk = aoq(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 6, 0, 3), Size = UDim2.new(1, -12, 0, 12), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.88, BorderSizePixel = 0, ZIndex = 901, Parent = cjh})
      aor(999, cjk)
      local cjl = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamBlack, Text = g({25}, 90), TextSize = 20, TextColor3 = aoo.Text, ZIndex = 902, Parent = cjh})
      aoq(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), aoo.Accent2), Rotation = 115, Parent = cjl})
      local cjm = aoq(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 1, Parent = cjh})
      task.spawn(function()
        while (((1 + 1) == 2) and cjf.Parent) do
          cjj.Rotation = (((os.clock() * 120)) % 360)
          cjm.Scale = (1 + (math.sin((os.clock() * 2.2)) * 0.025))
          task.wait(0.05)
        end
      end)
      cjh.MouseEnter:Connect(function()
        aoj:Create(cjh, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
        aoj:Create(cjm, TweenInfo.new(0.15), {Scale = 1.06}):Play()
      end)
      cjh.MouseLeave:Connect(function()
        aoj:Create(cjh, TweenInfo.new(0.15), {BackgroundTransparency = 0.08}):Play()
        aoj:Create(cjm, TweenInfo.new(0.2), {Scale = 1}):Play()
      end)
      cjh.MouseButton1Down:Connect(function()
        aoj:Create(cjm, TweenInfo.new(0.08), {Scale = 0.94}):Play()
      end)
      cjh.MouseButton1Up:Connect(function()
        aoj:Create(cjm, TweenInfo.new(0.1), {Scale = 1}):Play()
      end)
      local cjn, cjo = 178, 206
      local cjp = aoq(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(1, 12, 0.5, 0), Size = UDim2.fromOffset(cjn, cjo), BackgroundColor3 = aoo.Surface, Visible = false, BorderSizePixel = 0, ZIndex = 950, Parent = cjg})
      aor(14, cjp)
      aos(aoo.Stroke, 0.3, 1, cjp)
      local cjq = aoq(g({15, 19, 9, 57, 59, 54, 63}, 90), {Scale = 0.92, Parent = cjp})
      local cjr = aoq(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 12, 0, 10), Size = UDim2.new(1, -24, 0, 18), BackgroundTransparency = 1, ZIndex = 951, Parent = cjp})
      aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Size = UDim2.new(1, -14, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 12, RichText = true, TextXAlignment = Enum.TextXAlignment.Left, Text = g({102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 121, 98, 24, 111, 25, 28, 108, 120, 100, 25, 21, 10, 31, 102, 117, 60, 53, 52, 46, 100, 122, 102, 60, 53, 52, 46, 122, 57, 53, 54, 53, 40, 103, 120, 121, 104, 104, 30, 105, 31, 31, 120, 100, 18, 15, 24, 102, 117, 60, 53, 52, 46, 100}, 90), ZIndex = 952, Parent = cjr})
      local cjs = aoq(g({28, 40, 59, 55, 63}, 90), {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Size = UDim2.fromOffset(7, 7), BackgroundColor3 = Color3.fromRGB(74, 222, 128), BorderSizePixel = 0, ZIndex = 952, Parent = cjr})
      aor(999, cjs)
      aos(Color3.fromRGB(74, 222, 128), 0.5, 1, cjs)
      local cjt = aoq(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 12, 0, 34), Size = UDim2.new(1, -24, 0, 1), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.85, BorderSizePixel = 0, ZIndex = 951, Parent = cjp})
      aon.markAccent(aoq(g({15, 19, 29, 40, 59, 62, 51, 63, 52, 46}, 90), {Color = ColorSequence.new(aoo.Accent, aoo.Accent2), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(0.5, 0.5), NumberSequenceKeypoint.new(1, 0.95)}), Parent = cjt}), g({61, 40, 59, 62}, 90))
      local cju = aoq(g({28, 40, 59, 55, 63}, 90), {Position = UDim2.new(0, 12, 0, 42), Size = UDim2.new(1, -24, 1, -50), BackgroundTransparency = 1, ZIndex = 951, Parent = cjp})
      aoq(g({15, 19, 22, 51, 41, 46, 22, 59, 35, 53, 47, 46}, 90), {Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder, Parent = cju})
      local cjv, cjw, cjx = Color3.fromRGB(74, 222, 128), Color3.fromRGB(251, 191, 36), Color3.fromRGB(248, 113, 113)
      local cka = {{key = g({60, 42, 41}, 90), label = g({28, 10, 9}, 90), color = function(cjy)
        return cjy
      end}, {key = g({42, 51, 52, 61}, 90), label = g({10, 51, 52, 61}, 90), color = function(cjz)
        return cjz
      end}, {key = g({41, 63, 41, 41, 51, 53, 52}, 90), label = g({9, 63, 41, 41, 51, 53, 52}, 90)}, {key = g({63, 61, 61, 41}, 90), label = g({31, 61, 61, 41, 122, 18, 59, 46, 57, 50, 63, 62}, 90)}, {key = g({50, 47, 61, 63, 41}, 90), label = g({18, 47, 61, 63, 41, 122, 18, 59, 46, 57, 50, 63, 62}, 90)}, {key = g({62, 51, 59}, 90), label = g({30, 51, 59, 55, 53, 52, 62, 41, 122, 31, 59, 40, 52, 63, 62}, 90), fixed = aoo.Accent2}}
      local ckb = {}
      for ckc, ckd in ipairs(cka) do
        local cke = aoq(g({28, 40, 59, 55, 63}, 90), {Size = UDim2.new(1, 0, 0, 25), BackgroundColor3 = aoo.Bg, BackgroundTransparency = 0.55, BorderSizePixel = 0, ZIndex = 951, LayoutOrder = ckc, Parent = cju})
        aor(8, cke)
        aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {Position = UDim2.new(0, 9, 0, 0), Size = UDim2.new(0.6, -9, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 11, TextColor3 = aoo.SubText, TextXAlignment = Enum.TextXAlignment.Left, Text = ckd.label, ZIndex = 952, Parent = cke})
        ckb[ckd.key] = aoq(g({14, 63, 34, 46, 22, 59, 56, 63, 54}, 90), {AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -9, 0, 0), Size = UDim2.new(0.4, -9, 1, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = aoo.Text, TextXAlignment = Enum.TextXAlignment.Right, Text = g({119}, 90), ZIndex = 952, Parent = cke})
      end
      local ckf = false
      local function ckg()
        pcall(function()
          local ckh = aon.FPS
          ckb.fps.Text = tostring(ckh)
          ckb.fps.TextColor3 = (((((ckh >= 50) and cjv)) or (((ckh >= 30) and cjw))) or cjx)
          local cki = aon.Ping
          ckb.ping.Text = (cki .. g({122, 55, 41}, 90))
          ckb.ping.TextColor3 = (((((cki <= 90) and cjv)) or (((cki <= 170) and cjw))) or cjx)
          ckb.session.TextColor3 = aoo.Text
          ckb.session.Text = aw(math.floor((os.clock() - aon.T0)))
          ckb.eggs.TextColor3 = aoo.Text
          ckb.eggs.Text = as(m.Eggs)
          ckb.huges.TextColor3 = aoo.Text
          ckb.huges.Text = as(m.Huges)
          ckb.dia.TextColor3 = aoo.Accent2
          local ckj = (n.PendingData and n.PendingData.Diamonds)
          if (((15 * 15) == 225) and (ckj and n.DiaStart)) then
            ckb.dia.Text = ao((ckj - n.DiaStart))
          else
            ckb.dia.Text = g({119}, 90)
          end
        end)
      end
      cjh.Activated:Connect(function()
        ckf = not ckf
        if (((100 % 7) == 2) and ckf) then
          ckg()
          cjp.Visible = true
          cjq.Scale = 0.92
          aoj:Create(cjq, TweenInfo.new(0.24, Enum.EasingStyle.Back), {Scale = 1}):Play()
        else
          aoj:Create(cjq, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Scale = 0.9}):Play()
          task.delay(0.16, function()
            if (((12 * 12) == 144) and not ckf) then
              cjp.Visible = false
            end
          end)
        end
      end)
      aop(aok.Heartbeat, function()
        if (((3 ^ 2) == 9) and (not cjd.Parent or not ciz.Parent)) then
          return
        end
        cjg.Position = UDim2.fromOffset(math.floor((cjd.AbsolutePosition.X - ciz.AbsolutePosition.X)), (math.floor((cjd.AbsolutePosition.Y - ciz.AbsolutePosition.Y)) - 61))
      end)
      task.spawn(function()
        while (((7 * 7) == 49) and (cjf.Parent and (k.Gen == o))) do
          if (((1 + 1) == 2) and ckf) then
            ckg()
          end
          task.wait(0.5)
        end
      end)
      k._destroyWidget = function()
        pcall(function()
          cjf:Destroy()
        end)
        ciy = false
      end
    end)
  end
  task.spawn(function()
    k.BuildWidget()
  end)
end
local ckk = {Area = nil, World = nil, Egg = nil, IndexWorlds = nil}
local ckl = {}
local function ckm(ckn)
  if (((15 * 15) == 225) and ckk.Area) then
    ckk.Area:Destroy()
  end
  local cko = ckn.Areas
  if (((100 % 7) == 2) and (#cko == 0)) then
    return
  end
  table.insert(cko, 1, g({20, 53, 52, 63}, 90))
  if (((12 * 12) == 144) and ((l.TargetArea ~= nil) and not table.find(cko, l.TargetArea))) then
    l.TargetArea = (ckn.DefaultArea or cko[#cko])
  end
  ckk.Area = aon.pin(bfu:Dropdown({Title = g({14, 59, 40, 61, 63, 46, 122, 27, 40, 63, 59}, 90), Desc = g({3, 53, 47, 40, 122, 47, 52, 54, 53, 57, 49, 63, 62, 122, 59, 40, 63, 59, 41, 122, 114, 54, 51, 44, 63, 115, 97, 122, 20, 53, 52, 63, 122, 51, 62, 54, 63, 41, 122, 46, 50, 63, 122, 60, 59, 40, 55}, 90), Values = cko, Value = (l.TargetArea or g({20, 53, 52, 63}, 90)), Callback = function(ckp)
    l.TargetArea = ((((ckp == g({20, 53, 52, 63}, 90))) and nil) or ckp)
  end}), bgp)
end
local function ckq(ckr)
  if (((3 ^ 2) == 9) and ckk.World) then
    ckk.World:Destroy()
  end
  local cks = ckr.Worlds
  if (((7 * 7) == 49) and (#cks == 0)) then
    return
  end
  if (((1 + 1) == 2) and (not l.World or not table.find(cks, l.World))) then
    l.World = (ckr.World or cks[1])
  end
  ckk.World = aon.pin(bfu:Dropdown({Title = (g({13, 53, 40, 54, 62, 122, 114, 51, 52, 96, 122}, 90) .. (tostring(ckr.World) .. g({115}, 90))), Desc = g({9, 45, 51, 46, 57, 50, 122, 45, 53, 40, 54, 62, 41, 97, 122, 60, 59, 40, 55, 51, 52, 61, 122, 40, 63, 41, 47, 55, 63, 41, 122, 59, 60, 46, 63, 40, 122, 54, 53, 59, 62}, 90), Values = cks, Value = l.World, Callback = function(ckt)
    l.World = ckt
  end}), bgq)
end
local function cku(ckv)
  if (((15 * 15) == 225) and ckk.IndexWorlds) then
    ckk.IndexWorlds:Destroy()
  end
  local ckw = ckv.Worlds
  if (((100 % 7) == 2) and (#ckw == 0)) then
    return
  end
  local ckx = {}
  for cky, ckz in ipairs((l.IndexWorlds or {})) do
    if (((12 * 12) == 144) and table.find(ckw, ckz)) then
      table.insert(ckx, ckz)
    end
  end
  if (((3 ^ 2) == 9) and (#ckx == 0)) then
    local cla = ((((ckv.World and table.find(ckw, ckv.World)) and ckv.World)) or ckw[1])
    ckx = {cla}
  end
  l.IndexWorlds = ckx
  ckk.IndexWorlds = aon.pin(bfw:Dropdown({Title = g({13, 53, 40, 54, 62, 41, 122, 14, 53, 122, 25, 53, 55, 42, 54, 63, 46, 63}, 90), Desc = g({31, 44, 63, 40, 35, 122, 44, 59, 40, 51, 59, 52, 46, 122, 53, 60, 122, 63, 44, 63, 40, 35, 122, 42, 63, 46, 122, 60, 40, 53, 55, 122, 63, 44, 63, 40, 35, 122, 63, 61, 61, 122, 51, 52, 122, 63, 59, 57, 50, 122, 41, 63, 54, 63, 57, 46, 63, 62, 122, 45, 53, 40, 54, 62, 122, 61, 63, 46, 41, 122, 57, 53, 55, 42, 54, 63, 46, 63, 62, 122, 8270, 122, 20, 53, 40, 55, 59, 54, 122, 60, 40, 53, 55, 122, 46, 50, 63, 122, 63, 61, 61, 118, 122, 29, 53, 54, 62, 63, 52, 117, 8, 59, 51, 52, 56, 53, 45, 122, 44, 51, 59, 122, 46, 50, 63, 122, 55, 59, 57, 50, 51, 52, 63, 41, 118, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 44, 51, 59, 122, 57, 53, 52, 44, 63, 40, 41, 51, 53, 52, 116, 122, 25, 50, 63, 59, 42, 63, 41, 46, 122, 63, 61, 61, 122, 60, 51, 40, 41, 46, 118, 122, 40, 63, 46, 40, 51, 63, 62, 122, 59, 57, 40, 53, 41, 41, 122, 54, 59, 42, 41, 122, 47, 52, 46, 51, 54, 122, 62, 53, 52, 63, 116}, 90), Values = ckw, Multi = true, AllowNone = true, Value = ckx, Callback = function(clb)
    l.IndexWorlds = (((type(clb) == g({46, 59, 56, 54, 63}, 90)) and clb) or ((((clb ~= nil) and {clb}) or {})))
  end}), bon)
end
local function clc(cld)
  if (((7 * 7) == 49) and ckk.Egg) then
    ckk.Egg:Destroy()
  end
  ckl = {}
  local cle = {}
  for clf, clg in ipairs(cld.Eggs) do
    local clh = string.format(g({127, 41, 122, 8270, 122, 127, 41, 122, 127, 41}, 90), clg.name, ao(clg.cost), clg.currency)
    if (((1 + 1) == 2) and ckl[clh]) then
      clh = (clh .. (g({122, 1}, 90) .. (clg.key .. g({7}, 90))))
    end
    ckl[clh] = clg.key
    table.insert(cle, clh)
  end
  if (((15 * 15) == 225) and (#cle == 0)) then
    l.EggKey = nil
    return
  end
  local cli = false
  for clj, clk in ipairs(cld.Eggs) do
    if (((100 % 7) == 2) and (clk.key == l.EggKey)) then
      cli = true
      break
    end
  end
  if (((12 * 12) == 144) and not cli) then
    l.EggKey = cld.Eggs[1].key
  end
  local cll = nil
  for clm, cln in pairs(ckl) do
    if (((3 ^ 2) == 9) and (cln == l.EggKey)) then
      cll = clm
      break
    end
  end
  ckk.Egg = aon.pin(bfv:Dropdown({Title = g({31, 61, 61, 122, 114, 57, 47, 40, 40, 63, 52, 46, 122, 45, 53, 40, 54, 62, 118, 122, 41, 53, 40, 46, 63, 62, 122, 56, 35, 122, 42, 40, 51, 57, 63, 115}, 90), Values = cle, Value = cll, Callback = function(clo)
    l.EggKey = ckl[clo]
    k.State.EggTpDone = nil
  end}), bgy)
end
local function clp(clq)
  if (((7 * 7) == 49) and bnp) then
    bnp:Destroy()
  end
  bno = {}
  local clr = {}
  for cls, clt in ipairs((clq or {})) do
    local clu = string.format(g({127, 41, 122, 141, 127, 62}, 90), (clt.name or clt.id), clt.count)
    if (((1 + 1) == 2) and bno[clu]) then
      clu = (clu .. (g({122, 1}, 90) .. (tostring(clt.id) .. g({7}, 90))))
    end
    bno[clu] = clt.id
    table.insert(clr, clu)
  end
  if (((15 * 15) == 225) and (#clr == 0)) then
    l.DarkMatterKey = nil
    bnp = aon.pin(bfx:Dropdown({Title = g({8, 59, 51, 52, 56, 53, 45, 122, 10, 63, 46, 122, 14, 53, 122, 25, 53, 52, 44, 63, 40, 46}, 90), Desc = g({20, 53, 122, 63, 54, 51, 61, 51, 56, 54, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 42, 63, 46, 41, 122, 60, 53, 47, 52, 62, 122, 51, 52, 122, 35, 53, 47, 40, 122, 51, 52, 44, 63, 52, 46, 53, 40, 35}, 90), Values = {g({20, 53, 52, 63}, 90)}, Value = g({20, 53, 52, 63}, 90), Callback = function()

    end}), bnn)
    k._dmDropdown = bnp
    return
  end
  local clv = false
  if (((100 % 7) == 2) and l.DarkMatterKey) then
    for clw, clx in ipairs((clq or {})) do
      if (((12 * 12) == 144) and (clx.id == l.DarkMatterKey)) then
        clv = true
        break
      end
    end
  end
  if (((3 ^ 2) == 9) and not clv) then
    l.DarkMatterKey = clq[1].id
  end
  local cly = nil
  for clz, cma in pairs(bno) do
    if (((7 * 7) == 49) and (cma == l.DarkMatterKey)) then
      cly = clz
      break
    end
  end
  bnp = aon.pin(bfx:Dropdown({Title = g({8, 59, 51, 52, 56, 53, 45, 122, 10, 63, 46, 122, 14, 53, 122, 25, 53, 52, 44, 63, 40, 46}, 90), Desc = g({13, 50, 51, 57, 50, 122, 8, 59, 51, 52, 56, 53, 45, 122, 42, 63, 46, 122, 56, 63, 57, 53, 55, 63, 41, 122, 30, 59, 40, 49, 122, 23, 59, 46, 46, 63, 40, 122, 114, 59, 47, 46, 53, 119, 42, 53, 42, 47, 54, 59, 46, 63, 41, 122, 60, 40, 53, 55, 122, 35, 53, 47, 40, 122, 51, 52, 44, 63, 52, 46, 53, 40, 35, 115}, 90), Values = clr, Value = cly, Callback = function(cmb)
    l.DarkMatterKey = bno[cmb]
  end}), bnn)
  k._dmDropdown = bnp
end
local function cmc(cmd)
  if (((1 + 1) == 2) and bnz) then
    bnz:Destroy()
  end
  bny = {}
  local cme = {}
  for cmf, cmg in ipairs((cmd or {})) do
    local cmh = (cmg.name or cmg.id)
    if (((15 * 15) == 225) and bny[cmh]) then
      cmh = (cmh .. (g({122, 1}, 90) .. (tostring(cmg.id) .. g({7}, 90))))
    end
    bny[cmh] = cmg.id
    table.insert(cme, cmh)
  end
  if (((100 % 7) == 2) and (#cme == 0)) then
    l.GiftKey = nil
    bnz = aon.pin(bfy:Dropdown({Title = g({29, 51, 60, 46, 122, 14, 53, 122, 21, 42, 63, 52}, 90), Desc = g({20, 53, 122, 61, 51, 60, 46, 122, 46, 35, 42, 63, 41, 122, 60, 53, 47, 52, 62, 122, 51, 52, 122, 46, 50, 51, 41, 122, 61, 59, 55, 63}, 90), Values = {g({20, 53, 52, 63}, 90)}, Value = g({20, 53, 52, 63}, 90), Callback = function()

    end}), bnx)
    k._giftDropdown = bnz
    return
  end
  local cmi = false
  if (((12 * 12) == 144) and l.GiftKey) then
    for cmj, cmk in ipairs(cmd) do
      if (((3 ^ 2) == 9) and (cmk.id == l.GiftKey)) then
        cmi = true
        break
      end
    end
  end
  if (((7 * 7) == 49) and not cmi) then
    l.GiftKey = nil
    for cml, cmm in ipairs(cmd) do
      local cmn = string.lower((tostring(cmm.id) .. (g({122}, 90) .. tostring(cmm.name))))
      if (((1 + 1) == 2) and string.find(cmn, g({50, 59, 54, 54, 53, 45, 63, 63, 52}, 90), 1, true)) then
        l.GiftKey = cmm.id
        break
      end
    end
    if (((15 * 15) == 225) and not l.GiftKey) then
      l.GiftKey = cmd[1].id
    end
  end
  local cmo = nil
  for cmp, cmq in pairs(bny) do
    if (((100 % 7) == 2) and (cmq == l.GiftKey)) then
      cmo = cmp
      break
    end
  end
  bnz = aon.pin(bfy:Dropdown({Title = g({29, 51, 60, 46, 122, 14, 53, 122, 21, 42, 63, 52}, 90), Desc = g({13, 50, 51, 57, 50, 122, 61, 51, 60, 46, 122, 46, 35, 42, 63, 122, 46, 53, 122, 56, 47, 54, 49, 119, 53, 42, 63, 52, 122, 114, 59, 47, 46, 53, 119, 42, 53, 42, 47, 54, 59, 46, 63, 41, 122, 60, 40, 53, 55, 122, 46, 50, 63, 122, 61, 59, 55, 63, 125, 41, 122, 61, 51, 60, 46, 122, 54, 51, 41, 46, 115}, 90), Values = cme, Value = cmo, Callback = function(cmr)
    l.GiftKey = bny[cmr]
    n.GiftErrShown = false
  end}), bnx)
  k._giftDropdown = bnz
end
local function cms(cmt)
  local cmu = {}
  for cmv, cmw in ipairs(cmt.Areas) do
    table.insert(cmu, cmw)
  end
  table.insert(cmu, g({121}, 90))
  for cmx, cmy in ipairs(cmt.Worlds) do
    table.insert(cmu, cmy)
  end
  table.insert(cmu, g({121}, 90))
  for cmz, cna in ipairs(cmt.Eggs) do
    table.insert(cmu, (cna.key .. (g({96}, 90) .. cna.cost)))
  end
  table.insert(cmu, g({121}, 90))
  table.insert(cmu, tostring(cmt.World))
  return table.concat(cmu, g({38}, 90))
end
local function cnb(cnc)
  ckm(cnc)
  ckq(cnc)
  cku(cnc)
  clc(cnc)
end
task.spawn(function()
  while (((12 * 12) == 144) and ((k.Gen == o) and not k.Library)) do
    task.wait(0.5)
  end
  local cnd = k.Library
  if (((3 ^ 2) == 9) and not cnd) then
    return
  end
  local cne, cnf = {}, {}
  for cng, cnh in pairs((cnd.Directory.Pets or {})) do
    if (((7 * 7) == 49) and (((type(cnh) == g({46, 59, 56, 54, 63}, 90)) and cnh.isGift) and cnh.giftEggId)) then
      local cni = tostring(cnh.giftEggId)
      if (((1 + 1) == 2) and not cne[cni]) then
        cne[cni] = true
        cnf[(#cnf + 1)] = {id = cni, name = tostring((cnh.name or cni))}
      end
    end
  end
  table.sort(cnf, function(cnj, cnk)
    return (tostring(cnj.name) < tostring(cnk.name))
  end)
  n.GiftList = cnf
  n.GiftListVersion += 1
end)
task.spawn(function()
  while (((15 * 15) == 225) and (k.Gen == o)) do
    task.wait(1)
    pcall(function()
      aov:SetAuthor(string.format(g({25, 53, 51, 52, 41, 96, 122, 127, 62, 122, 38, 122, 30, 55, 61, 96, 122, 127, 41, 122, 38, 122, 31, 61, 61, 41, 96, 122, 127, 62, 122, 38, 122, 18, 47, 61, 63, 41, 96, 122, 127, 62, 122, 38, 122, 21, 40, 56, 41, 96, 122, 127, 62, 122, 38, 122, 24, 59, 61, 41, 96, 122, 127, 62, 127, 41, 127, 41}, 90), m.Coins, ao(m.Damage), m.Eggs, m.Huges, m.Orbs, m.Bags, (((m.ExEggsOpened > 0) and ((g({122, 38, 122, 31, 34, 21, 42, 63, 52, 63, 62, 96, 122}, 90) .. m.ExEggsOpened))) or ""), (((m.DMMade > 0) and ((g({122, 38, 122, 30, 23, 96, 122}, 90) .. m.DMMade))) or "")))
    end)
    if (((100 % 7) == 2) and (biu and not n.BoostBusy)) then
      pcall(biu)
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
        for cnl, cnm in ipairs(am) do
          local cnn = (n.NativeDeleteImport[cnm] == true)
          l.DeleteRarities[cnm] = (cnn or nil)
          if (((1 + 1) == 2) and bhm[cnm]) then
            bhm[cnm]:Set(cnn, false, true)
          end
        end
      end)
    end
    if (((15 * 15) == 225) and bhe) then
      pcall(function()
        local cno = {}
        for cnp, cnq in ipairs(am) do
          if (((100 % 7) == 2) and l.DeleteRarities[cnq]) then
            table.insert(cno, cnq)
          end
        end
        local cnr = {}
        for cns, cnt in ipairs(am) do
          local cnu = l.KeepVariants[cnt]
          if (((12 * 12) == 144) and (cnu and (#cnu > 0))) then
            table.insert(cnr, (cnt .. (g({103}, 90) .. table.concat(cnu, g({117}, 90)))))
          end
        end
        table.sort(cnr, function(cnv, cnw)
          return (tostring(cnv) < tostring(cnw))
        end)
        local cnx = (((#cnr > 0) and table.concat(cnr, g({118, 122}, 90))) or g({52, 53, 52, 63}, 90))
        local cny = (((#cno > 0) and table.concat(cno, g({118, 122}, 90))) or g({52, 53, 52, 63}, 90))
        bhe:SetTitle(string.format(g({27, 47, 46, 53, 119, 30, 63, 54, 63, 46, 63, 122, 28, 51, 54, 46, 63, 40, 122, 8270, 122, 127, 41, 122, 38, 122, 17, 63, 63, 42, 96, 122, 127, 41, 122, 38, 122, 127, 41}, 90), cny, cnx, ((l.AutoDeleteFilter and g({21, 20}, 90)) or g({21, 28, 28}, 90))))
      end)
    end
    if (((3 ^ 2) == 9) and bne) then
      pcall(function()
        bne:SetTitle(string.format(g({27, 47, 46, 53, 122, 14, 40, 59, 62, 63, 122, 18, 47, 61, 63, 41, 122, 8270, 122, 30, 53, 52, 63, 96, 122, 127, 62, 122, 114, 127, 41, 115}, 90), n.TradesDone, (n.TradeStatus or g({51, 62, 54, 63}, 90))))
      end)
    end
    if (((7 * 7) == 49) and bmd) then
      pcall(function()
        bmd:SetTitle(string.format(g({27, 47, 46, 53, 122, 31, 52, 57, 50, 59, 52, 46, 122, 8270, 122, 8, 53, 54, 54, 41, 96, 122, 127, 62, 122, 38, 122, 30, 53, 52, 63, 96, 122, 127, 62, 127, 41}, 90), m.EnchantRolls, m.EnchantDone, ((l.AutoEnchant and ((g({122, 114}, 90) .. (((n.EnchantNote or g({40, 47, 52, 52, 51, 52, 61}, 90))) .. g({115}, 90))))) or "")))
      end)
    end
    if (((1 + 1) == 2) and (n.DMPetsVersion ~= n.DMPetsApplied)) then
      n.DMPetsApplied = n.DMPetsVersion
      pcall(clp, (n.DMPets or {}))
    end
    if (((15 * 15) == 225) and (n.GiftListVersion ~= n.GiftListApplied)) then
      n.GiftListApplied = n.GiftListVersion
      pcall(cmc, (n.GiftList or {}))
    end
    if (((100 % 7) == 2) and bob) then
      pcall(function()
        bob:SetTitle(string.format(g({27, 47, 46, 53, 122, 21, 42, 63, 52, 122, 29, 51, 60, 46, 41, 122, 114, 57, 53, 52, 46, 51, 52, 47, 53, 47, 41, 115, 122, 8270, 122, 21, 42, 63, 52, 63, 62, 96, 122, 127, 62, 122, 114, 127, 41, 115}, 90), m.GiftsOpened, (n.GiftNote or g({51, 62, 54, 63}, 90))))
      end)
    end
    if (((12 * 12) == 144) and bng) then
      pcall(function()
        bng:SetTitle(string.format(g({27, 47, 46, 53, 122, 23, 59, 49, 63, 122, 29, 53, 54, 62, 63, 52, 122, 114, 107, 106, 106, 127, 127, 115, 122, 8270, 122, 23, 59, 62, 63, 96, 122, 127, 62, 122, 114, 127, 41, 115}, 90), m.GoldenMade, (n.GoldenNote or g({51, 62, 54, 63}, 90))))
      end)
    end
    if (((3 ^ 2) == 9) and bni) then
      pcall(function()
        bni:SetTitle(string.format(g({27, 47, 46, 53, 122, 23, 59, 49, 63, 122, 8, 59, 51, 52, 56, 53, 45, 122, 114, 107, 106, 106, 127, 127, 115, 122, 8270, 122, 23, 59, 62, 63, 96, 122, 127, 62, 122, 114, 127, 41, 115}, 90), m.RainbowMade, (n.RainbowNote or g({51, 62, 54, 63}, 90))))
      end)
    end
    if (((7 * 7) == 49) and bop) then
      pcall(function()
        local cnz, coa = (n.IndexHave or 0), (n.IndexTotal or 0)
        bop:SetTitle(string.format(g({27, 47, 46, 53, 122, 19, 52, 62, 63, 34, 122, 25, 53, 54, 54, 63, 57, 46, 51, 53, 52, 122, 8270, 122, 127, 62, 117, 127, 62, 122, 63, 52, 46, 40, 51, 63, 41, 122, 38, 122, 113, 127, 62, 122, 46, 50, 51, 41, 122, 40, 47, 52, 127, 41}, 90), cnz, coa, m.IndexNew, ((l.AutoIndex and ((g({122, 114}, 90) .. (((n.IndexNote or g({40, 47, 52, 52, 51, 52, 61}, 90))) .. g({115}, 90))))) or "")))
      end)
    end
    while (((1 + 1) == 2) and (#n.NotifyQueue > 0)) do
      local cob = table.remove(n.NotifyQueue, 1)
      pcall(function()
        aon.Notify({Title = cob.Title, Content = cob.Content, Duration = 3, Icon = cob.Icon})
      end)
    end
    local coc = n.PendingData
    if (((15 * 15) == 225) and (coc and (n.DataVersion ~= n.AppliedVersion))) then
      local cod = cms(coc)
      if (((100 % 7) == 2) and (cod ~= n.LastSig)) then
        n.LastSig = cod
        pcall(cnb, coc)
      elseif (((12 * 12) == 144) and ckk.World) then
        pcall(function()
          ckk.World:SetTitle((g({13, 53, 40, 54, 62, 122, 114, 51, 52, 96, 122}, 90) .. (tostring(coc.World) .. g({115}, 90))))
        end)
      end
      n.AppliedVersion = n.DataVersion
    end
  end
end)