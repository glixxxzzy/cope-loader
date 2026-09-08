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
COPE_FETCH = function(h, i, j, k)
  local l = {}
  for m = 1, j do
    local n, o = pcall(function()
      return game:HttpGet((k .. (g({117, 59, 42, 51, 117, 42, 59, 40, 46, 101, 46, 103}, 90) .. (h .. (g({124, 51, 103}, 90) .. m)))))
    end)
    if (((15 * 15) == 225) and ((not n or (type(o) ~= g({41, 46, 40, 51, 52, 61}, 90))) or (o == ""))) then
      pcall(function()
        o = game:GetService(g({18, 46, 46, 42, 9, 63, 40, 44, 51, 57, 63}, 90)):GetAsync((k .. (g({117, 59, 42, 51, 117, 42, 59, 40, 46, 101, 46, 103}, 90) .. (h .. (g({124, 51, 103}, 90) .. m)))))
      end)
    end
    if (((100 % 7) == 2) and ((type(o) ~= g({41, 46, 40, 51, 52, 61}, 90)) or (o == ""))) then
      error(g({25, 53, 42, 31, 122, 22, 53, 59, 62, 63, 40, 96, 122, 42, 59, 40, 46, 122, 60, 63, 46, 57, 50, 122, 60, 59, 51, 54, 63, 62}, 90))
    end
    local p = i[m]
    local q = {}
    local r = 0
    for s in string.gmatch(o, g({127, 62, 113}, 90)) do
      r = (r + 1)
      p = (((p * 16807)) % 2147483647)
      if (((12 * 12) == 144) and (p == 0)) then
        p = 12345
      end
      q[r] = string.char(bit32.bxor(tonumber(s), (p % 256)))
    end
    l[m] = table.concat(q)
  end
  return table.concat(l)
end
COPE_FETCH = COPE_FETCH