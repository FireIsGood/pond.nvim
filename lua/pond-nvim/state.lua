local M = {}

local Json = require("pond-nvim.json")
local config = require("pond-nvim.config").config
local data_path = vim.fs.normalize(config.data_path)

--------------------------------------------------------------------------------

---@class data
---@field money number

---@type data
M.default_data = {
  money = 100,
}

function M.setup()
  -- Load existing data or use default

  M.data = Json.read_json(data_path) or M.default_data
  Json.write_json(M.data, data_path)
end

function M.save_data()
  Json.write_json(M.data, data_path)
end

--------------------------------------------------------------------------------

return M
