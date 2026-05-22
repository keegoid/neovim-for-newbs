return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  config = function()
    vim.keymap.set("n", "<leader>tt", "<cmd>TestNearest<cr>", { desc = "Run nearest test", silent = true })
    vim.keymap.set("n", "<leader>tT", "<cmd>TestFile<cr>", { desc = "Run file tests", silent = true })
    vim.keymap.set("n", "<leader>ta", "<cmd>TestSuite<cr>", { desc = "Run test suite", silent = true })
    vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<cr>", { desc = "Run last test", silent = true })
    vim.keymap.set("n", "<leader>tg", "<cmd>TestVisit<cr>", { desc = "Open last test output", silent = true })
    vim.cmd("let test#strategy = 'vimux'")
  end,
}
