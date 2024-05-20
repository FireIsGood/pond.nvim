local M = {}

local config = require("pond-nvim.config").config

local cmd = vim.api.nvim_create_user_command

--------------------------------------------------------------------------------

---@class fish_command
---@field fish_function string
---@field description string
---@field user_command string
---@field keymap string?

---@type fish_command[]
local fish_command_list = {
  { fish_function = "fish", description = "Fish once", user_command = "Fish", keymap = "<leader>af" },
  {
    fish_function = "balance",
    description = "Check your balance",
    user_command = "FishBalance",
    keymap = "<leader>ab",
  },
  { fish_function = "reset_account", description = "Reset your account", user_command = "FishResetAccount" },
}

function M.setup()
  local keymap = vim.keymap.set

  -- Keymaps and commands
  for _, command in pairs(fish_command_list) do
    -- Keymap
    if config.use_default_keymaps and command.keymap ~= nil then
      keymap("n", command.keymap, function()
        require("pond-nvim")[command.fish_function]()
      end, { desc = command.description })
    end

    -- Command
    cmd(command.user_command, function()
      require("pond-nvim")[command.fish_function]()
    end, { desc = command.description })
  end
end

--------------------------------------------------------------------------------

return M
