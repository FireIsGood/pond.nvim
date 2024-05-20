# pond.nvim

Fishing mini game. Wildly unbalanced.

> [!WARNING]
> Why though?

## Installation

```lua
-- lazy.nvim
{
  "FireIsGood/pond.nvim",
  lazy = false,
  config = true,
},

-- packer
use "FireIsGood/pond.nvim"
```

## Usage

Use the commands or the builtin keymaps.

| Command             | Keymap       | Description        |
| ------------------- | ------------ | ------------------ |
| `:Fish`             | `<leader>af` | Fish               |
| `:FishBalance`      | `<leader>ab` | Check your balance |
| `:FishResetAccount` |              | Reset your account |

## Configuration

The `.setup()` call is optional if you are fine with the defaults below.

```lua
-- default config
require("pond-nvim").setup({
  name = "Unnamed Fisher",
  use_default_keymaps = true,
  data_path = vim.fn.stdpath("data") .. "/pond-data.json",
})
```

Example configuration:

```lua
-- lazy.nvim
{
  "FireIsGood/pond.nvim",
  lazy = false,
  opts = { use_default_keymaps = false }
},

-- packer
use {
  "FireIsGood/pond.nvim"
	config = function ()
		require("pont-nvim").setup({
      use_default_keymaps = true
    })
	end,
}
```

## Contributing

Huh????
