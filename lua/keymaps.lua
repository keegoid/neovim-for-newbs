-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "clear hlsearch" })
vim.keymap.set("n", "<leader>lv", ":Lazy<CR>", { desc = "LazyVim" })
vim.keymap.set("n", "<leader>lc", ":checkhealth<CR>", { desc = "LazyVim healthcheck" })
vim.keymap.set("n", "<leader>ww", ":call SaveAs()<CR>", { noremap = true, silent = true, desc = "window write" })
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "window write and quit" })
vim.keymap.set("n", "<leader>zz", ":q!<CR>", { desc = "window quit!" })

if vim.fn.executable('wl-copy') == 1 then
  vim.keymap.set('v', '<leader>y', 'y:call system("wl-copy", getreg(\'"\'))<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>p', ':r !wl-paste<CR>', { noremap = true, silent = true })
end

-- vim.keymap.set('i', '<C-S-Up>', '<C-o>:m -2<CR>', { noremap = true, silent = true })
-- vim.keymap.set('i', '<C-S-Down>', '<C-o>:m +1<CR>', { noremap = true, silent = true })
