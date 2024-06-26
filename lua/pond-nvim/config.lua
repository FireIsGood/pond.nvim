local M = {}

--------------------------------------------------------------------------------

---@type config
local default_config = {
  name = "Unnamed Fisher",
  cooldown = 5,
  use_default_keymaps = true,
  data_path = vim.fn.stdpath("data") .. "/pond-data.json",
}
M.config = default_config

---@class config
---@field name? string
---@field use_default_keymaps? boolean
---@field cooldown? number
---@field data_path? string

---optional setup function
---@param user_config? config
function M.setup(user_config)
  M.config = vim.tbl_deep_extend("force", default_config, user_config or {})

  return M.config
end

--------------------------------------------------------------------------------

return M
