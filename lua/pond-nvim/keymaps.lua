local M = {}

local config = require("pond-nvim.config").config

local cmd = vim.api.nvim_create_user_command

--------------------------------------------------------------------------------

local default_commands = {
  fish = "Fish",
  balance = "FishBalance",
  reset_account = "FishResetAccount",
}

local default_keymaps = {
  fish = "<leader>af",
  balance = "<leader>ab",
}

function M.setup()
  local keymap = vim.keymap.set

  -- Keymaps
  if config.use_default_keymaps then
    for command, map in pairs(default_keymaps) do
      keymap("n", map, function()
        require("pond-nvim")[command]()
      end, { desc = command .. " command" })
    end
  end

  -- Commands
  for command, map in pairs(default_commands) do
    cmd(map, function()
      require("pond-nvim")[command]()
    end, { desc = command .. " command" })
  end
end

--------------------------------------------------------------------------------

return M
