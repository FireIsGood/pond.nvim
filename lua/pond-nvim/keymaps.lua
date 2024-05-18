local M = {}

local cmd = vim.api.nvim_create_user_command

--------------------------------------------------------------------------------

local defaultCommands = {
  fish = "Fish",
  balance = "FishBalance",
  resetAccount = "FishResetAccount",
}

local defaultKeymaps = {
  fish = "<leader>af",
  balance = "<leader>ab",
}

function M.setup()
  local keymap = vim.keymap.set

  for command, map in pairs(defaultKeymaps) do
    keymap("n", map, function()
      require("pond-nvim")[command]()
    end, { desc = command .. " command" })
  end

  for command, map in pairs(defaultCommands) do
    cmd(map, function()
      require("pond-nvim")[command]()
    end, {})
  end
end

--------------------------------------------------------------------------------

return M
