return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    -- REMOVE: tag = "0.1.5"
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search text" })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find open buffers" })
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Recent files" })

      require("telescope").load_extension("ui-select")
    end,
  },
}
