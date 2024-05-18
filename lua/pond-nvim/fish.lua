local M = {}

local util = require("pond-nvim.util")
local config = require("pond-nvim.config").config
local state = require("pond-nvim.state")
local data = state.data

--------------------------------------------------------------------------------

---@alias rarity "trash"|"common"|"rare"
---@alias fish { icon: string, price: number }

local fishList = {
  trash = {
    boot = { icon = "👞", price = 1 },
    can = { icon = "🥫", price = 1 },
    bamboo = { icon = "🎍", price = 2 },
    parts = { icon = "🔩", price = 4 },
  },
  common = {
    minnow = { icon = "🐟", price = 42 },
    tropicalFish = { icon = "🐠", price = 56 },
    blowFish = { icon = "🐡", price = 86 },
  },
  rare = {
    snail = { icon = "🐌", price = 200 },
    moneyFish = { icon = "💰🐟💰", price = 275 },
    whale = { icon = "🐳", price = 320 },
    dragon = { icon = "🐉", price = 400 },
  },
}

function M.fish()
  if data.money < 10 then
    util.notify("You don't have enough money to fish!", "warn")
    return
  end

  -- Get a random fish
  local rarity = M.randomRarity()
  local name = M.randomFish(rarity)
  local fish = fishList[rarity][name]

  -- Calculate net gain or loss
  local netMoney = fish.price - 10
  M.changeMoney(netMoney)

  -- Notify
	-- stylua: ignore
  local outputText = ""
    .. "🎣| " .. config.name .. " fishes...\n"
    .. "  | Caught: " .. fish.icon .. " (value: 💴 " .. fish.price .. ")\n"
    .. "\n"
    .. "You paid 💴 10 for fishing. (💴 " .. data.money .." left)"

  util.notify(outputText)
end

function M.balance()
  util.notify("Balance: 💴 " .. tostring(data.money))
end

--------------------------------------------------------------------------------
-- State API
--------------------------------------------------------------------------------

---@param change number
function M.changeMoney(change)
  data.money = data.money + change
  state.saveData()
end

function M.resetAccount()
  data.money = require("pond-nvim.state").defaultData.money
  state.saveData()
end

--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

---@return rarity
function M.randomRarity()
  local rand = math.random(100)

  if rand < 90 then
    return "trash"
  elseif rand < 98 then
    return "common"
  else
    return "rare"
  end
end

---@param rarity rarity
function M.randomFish(rarity)
  -- Narrow to rarity
  local fishInRarity = fishList[rarity]

  -- Random key value pair
  ---@type string[]
  local keyset = {}
  for key in pairs(fishInRarity) do
    table.insert(keyset, key)
  end
  return keyset[math.random(#fishInRarity)]
end

--------------------------------------------------------------------------------

return M
