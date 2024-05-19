# pond.nvim

Fishing mini game. Wildly unbalanced.

## Installation

> [!WARNING]
> Why though?

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

### Defaults

The `.setup()` call is optional if you are fine with the defaults below.

```lua
-- default config
require("pond-nvim").setup({
  name = "Unnamed Fisher",
  useDefaultKeymaps = true,
})
```

## Contributing

Huh????
