return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = { light = "latte", dark = "mocha" },
        transparent_background = false,
        show_end_of_buffer = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          neotree = true,
          treesitter = true,
          telescope = { enabled = true },
          which_key = true,
          mason = true,
          indent_blankline = { enabled = true },
          lualine = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = { background = true },
          },
        },
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
