local M = {}

local json = require("pond-nvim.json")

--------------------------------------------------------------------------------

---@class data
---@field money number

---@type data
M.default_data = {
  money = 100,
}

function M.setup()
  -- Load existing data or use default
  M.data = json.read_json(M.data_path()) or M.default_data
  json.write_json(M.data, M.data_path())
end

function M.save_data()
  json.write_json(M.data, M.data_path())
end

--------------------------------------------------------------------------------

function M.data_path()
  return vim.fs.normalize(vim.fn.stdpath("data") .. "/pond-data.json")
end

--------------------------------------------------------------------------------

return M
