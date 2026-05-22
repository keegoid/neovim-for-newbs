return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Neovim 0.11.x requires using the main module directly
      local configs = require("nvim-treesitter")
      local parser_install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "treesitter")

      if vim.fn.filewritable(vim.fn.stdpath("data")) ~= 2 then
        parser_install_dir = vim.fs.joinpath(vim.fn.stdpath("cache"), "treesitter")
      end

      vim.fn.mkdir(parser_install_dir, "p")

      configs.setup({
        install_dir = parser_install_dir,

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
