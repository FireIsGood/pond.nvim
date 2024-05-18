local M = {}

--------------------------------------------------------------------------------

function M.fish()
  require("pond-nvim.fish").fish()
end

function M.balance()
  require("pond-nvim.fish").balance()
end

function M.resetAccount()
  require("pond-nvim.fish").resetAccount()
end

--------------------------------------------------------------------------------
-- SETUP
--------------------------------------------------------------------------------

-- optional setup function
---@param userConfig? config
function M.setup(userConfig)
  -- Randomize the seed
  math.randomseed(os.clock())

  -- Load config
  local config = require("pond-nvim.config").setup(userConfig)

  -- Setup state
  require("pond-nvim.state").setup()

  -- Configure keymaps
  if config.useDefaultKeymaps then
    require("pond-nvim.keymaps").setup()
  end
end

--------------------------------------------------------------------------------

return M
