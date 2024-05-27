-- Only load once
if vim.g.loaded_pond_nvim == 1 then
  return
end
vim.g.loaded_pond_nvim = 1

-- Setup user commands
require("pond-nvim.keymaps").setup_user_commands()
