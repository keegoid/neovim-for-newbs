return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>f", group = "find" },
          { "<leader>e", group = "explorer" },
          { "<leader>g", group = "git" },
          { "<leader>l", group = "code" },
          { "<leader>t", group = "test" },
          { "<leader>w", group = "write" },
          { "<leader>q", group = "quit" },
          { "<leader>s", group = "system" },
        },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
    end,
  },
}
