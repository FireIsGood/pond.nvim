local M = {}

local util = require("pond-nvim.util")

--------------------------------------------------------------------------------

---@class data
---@field money number

---@type data
M.defaultData = {
  money = 100,
}

function M.setup()
  -- Load existing data or use default
  M.data = M.loadData() or M.defaultData
  M.saveData()
end

function M.saveData()
  -- Open the file
  local file = io.open(M.dataPath(), "w+")
  if not file then
    util.notify("Could not open file", "error")
    return
  end

  -- Write our data
  local encodedData = vim.fn.json_encode(M.data)
  file:write(encodedData)

  -- Close the file
  io.close(file)
end

---@return data?
function M.loadData()
  -- Open the file
  local file = io.open(M.dataPath(), "r")
  if not file then
    util.notify("No previous data, creating account!")
    return nil
  end

  -- Read our data
  ---@type string
  local encodedData = file:read("*a")

  local data = nil
  if encodedData ~= "" then
    data = vim.fn.json_decode(encodedData)
  end

  -- Close the file
  io.close(file)

  return data
end

--------------------------------------------------------------------------------

function M.dataPath()
  return vim.fn.stdpath("data") .. "/pond-data.json"
end

--------------------------------------------------------------------------------

return M
