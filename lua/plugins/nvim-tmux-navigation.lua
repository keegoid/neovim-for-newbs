return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    require("nvim-tmux-navigation").setup({})
    vim.keymap.set("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { desc = "Move to left pane", silent = true })
    vim.keymap.set("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { desc = "Move to lower pane", silent = true })
    vim.keymap.set("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { desc = "Move to upper pane", silent = true })
    vim.keymap.set("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { desc = "Move to right pane", silent = true })
  end,
}
