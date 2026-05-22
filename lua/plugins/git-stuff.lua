return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview git hunk", silent = true })
      vim.keymap.set(
        "n",
        "<leader>gb",
        "<cmd>Gitsigns toggle_current_line_blame<cr>",
        { desc = "Toggle git blame", silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>gt",
        "<cmd>Gitsigns toggle_current_line_blame<cr>",
        { desc = "Toggle git blame", silent = true }
      )
    end,
  },
}
