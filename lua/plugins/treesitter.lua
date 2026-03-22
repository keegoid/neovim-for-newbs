return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Neovim 0.11.x requires using the main module directly
      local configs = require("nvim-treesitter")

      configs.setup({
        -- This tells Neovim to automatically download the parser
        -- the first time you open a file of that type.
        auto_install = true,

        highlight = {
          enable = true,
          -- Setting this to false prevents "double-highlighting"
          -- which can cause lag in Neovim 0.11.
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
        },
      })
    end,
  },
}
