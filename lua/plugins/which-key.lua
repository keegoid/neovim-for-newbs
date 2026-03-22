return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        {
          mode = { "n", "v" },
          -- Window / Write Group
          { "<leader>w", group = "windows/write" },
          { "<leader>ww", "<cmd>call SaveAs()<cr>", desc = "Save As" },
          { "<leader>wq", "<cmd>wq<cr>", desc = "Save & Quit" },

          -- Lazy / System Group
          { "<leader>l", group = "lazy/lsp" },
          { "<leader>lv", "<cmd>Lazy<cr>", desc = "Open Lazy UI" },
          { "<leader>lc", "<cmd>checkhealth<cr>", desc = "Checkhealth" },

          -- Quit / Session Group
          { "<leader>z", group = "quit/force" },
          { "<leader>zz", "<cmd>q!<cr>", desc = "Force Quit (!)" },

          -- Search / UI Group
          { "<leader>h", "<cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><cr>", desc = "Clear Highlight" },
        },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      -- No more register! setup(opts) with the 'spec' field
      -- handles everything automatically in v3.
    end,
  },
}
