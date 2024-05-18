local M = {}

--------------------------------------------------------------------------------

---@type config
local defaultConfig = {
  name = "Unnamed Fisher",
  useDefaultKeymaps = true,
}
M.config = defaultConfig

---@class config
---@field name? string
---@field useDefaultKeymaps? boolean

---optional setup function
---@param userConfig? config
function M.setup(userConfig)
  M.config = vim.tbl_deep_extend("force", defaultConfig, userConfig or {})

  if M.config.useDefaultKeymaps then
    require("pond-nvim.keymaps").setup()
  end
  return M.config
end

--------------------------------------------------------------------------------

return M
