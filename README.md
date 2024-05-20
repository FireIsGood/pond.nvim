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

The `data_path` variable is expanded, so you can use `~` as short for your home directory.

Example configuration:

```lua
-- lazy.nvim
{
  "FireIsGood/pond.nvim",
  lazy = false,
  opts = {
    name = "The Coolest Fisher"
    use_default_keymaps = false,
    data_path = "~/Desktop/my_cool_fishery_data.json",
  }
},

-- packer
use {
  "FireIsGood/pond.nvim"
  config = function ()
    require("pont-nvim").setup({
      name = "The Coolest Fisher",
      use_default_keymaps = true,
      data_path = "~/Desktop/my_cool_fishery_data.json",
    })
  end,
}
```

## Contributing

Huh????
