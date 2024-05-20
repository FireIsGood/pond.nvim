local M = {}

local Util = require("pond-nvim.util")
local config = require("pond-nvim.config").config
local State = require("pond-nvim.state")
local data = State.data

---@type boolean
local can_fish = true
---@type number?
local timer_id = nil
---@type number
local timer_started_ms = 0

--------------------------------------------------------------------------------

---@alias rarity "trash"|"common"|"rare"
---@alias fish { icon: string, price: number }

local fish_list = {
  trash = {
    boot = { icon = "👞", price = 1 },
    can = { icon = "🥫", price = 1 },
    bamboo = { icon = "🎍", price = 2 },
    parts = { icon = "🔩", price = 4 },
  },
  common = {
    minnow = { icon = "🐟", price = 42 },
    tropical_fish = { icon = "🐠", price = 56 },
    pufferfish = { icon = "🐡", price = 86 },
  },
  rare = {
    snail = { icon = "🐌", price = 200 },
    money_fish = { icon = "💰🐟💰", price = 275 },
    whale = { icon = "🐳", price = 320 },
    dragon = { icon = "🐉", price = 400 },
  },
}

function M.fish()
  if not can_fish then
    local time_passed = vim.loop.now() - timer_started_ms
    local cooldown_left = config.cooldown - math.floor(time_passed / 1000)
    Util.notify(
      config.name .. ", you cannot fish yet!\n\nYou can fish again in " .. cooldown_left .. " seconds",
      "warn"
    )
    return
  end

  if data.money < 10 then
    Util.notify("You don't have enough money to fish!", "warn")
    return
  end

  -- Get a random fish
  local rarity = M.random_rarity()
  local name = M.random_fish(rarity)
  local fish = fish_list[rarity][name]

  -- Calculate net gain or loss
  local net_money = fish.price - 10
  M.change_money(net_money)

  -- Notify
	-- stylua: ignore
  local output_text = ""
    .. "🎣| " .. config.name .. " fishes...\n"
    .. "  | Caught: " .. fish.icon .. " (value: 💴 " .. fish.price .. ")\n"
    .. "\n"
    .. "You paid 💴 10 for fishing. (💴 " .. data.money .." left)"

  Util.notify(output_text)

  -- Set the cooldown
  M.start_cooldown()
end

function M.balance()
  Util.notify("Balance: 💴 " .. tostring(data.money))
end

--------------------------------------------------------------------------------
-- State API
--------------------------------------------------------------------------------

---@param change number
function M.change_money(change)
  data.money = data.money + change
  State.save_data()
end

function M.reset_account()
  data.money = require("pond-nvim.state").default_data.money
  State.save_data()
end

--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

---@return rarity
function M.random_rarity()
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
---@return string
function M.random_fish(rarity)
  -- Narrow to rarity
  local fish_in_rarity = fish_list[rarity]

  -- Random key value pair
  ---@type string[]
  local keyset = {}
  for key in pairs(fish_in_rarity) do
    table.insert(keyset, key)
  end
  return keyset[math.random(#keyset)]
end

function M.start_cooldown()
  -- Disable fishing
  can_fish = false

  -- Stop previous timers
  if timer_id then
    vim.fn.timer_stop(timer_id)
  end

  -- Set the timer
  timer_started_ms = vim.loop.now()
  local cooldown_ms = config.cooldown * 1000
  timer_id = vim.fn.timer_start(cooldown_ms, function()
    can_fish = true
  end)
end

--------------------------------------------------------------------------------

return M
