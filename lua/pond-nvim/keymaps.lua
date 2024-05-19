local M = {}

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

  for command, map in pairs(default_keymaps) do
    keymap("n", map, function()
      require("pond-nvim")[command]()
    end, { desc = command .. " command" })
  end

  for command, map in pairs(default_commands) do
    cmd(map, function()
      require("pond-nvim")[command]()
    end, { desc = command .. " command" })
  end
end

--------------------------------------------------------------------------------

return M
