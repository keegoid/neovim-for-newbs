return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    require('nvim-tmux-navigation').setup({})
    vim.keymap.set("n", "<C-h>", ":NvimTmuxNavigateLeft<CR>", {})
    vim.keymap.set("n", "<C-j>", ":NvimTmuxNavigateDown<CR>", {})
    vim.keymap.set("n", "<C-k>", ":NvimTmuxNavigateUp<CR>", {})
    vim.keymap.set("n", "<C-l>", ":NvimTmuxNavigateRight<CR>", {})
  end,
}
