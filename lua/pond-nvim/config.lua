local M = {}

--------------------------------------------------------------------------------

---@type config
local default_config = {
  name = "Unnamed Fisher",
  use_default_keymaps = true,
}
M.config = default_config

---@class config
---@field name? string
---@field use_default_keymaps? boolean

---optional setup function
---@param user_config? config
function M.setup(user_config)
  M.config = vim.tbl_deep_extend("force", default_config, user_config or {})

  if M.config.use_default_keymaps then
    require("pond-nvim.keymaps").setup()
  end
  return M.config
end

--------------------------------------------------------------------------------

return M
