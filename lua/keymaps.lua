if vim.fn.executable('wl-copy') == 1 then
  vim.keymap.set('v', '<leader>y', 'y:call system("wl-copy", getreg(\'"\'))<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>p', ':r !wl-paste<CR>', { noremap = true, silent = true })
elseif vim.fn.has('macunix') == 1 then
  vim.keymap.set('v', '<leader>y', '"+y', { desc = "Copy to System Clipboard" })
  vim.keymap.set('n', '<leader>p', '"+p', { desc = "Paste from System Clipboard" })
end

-- vim.keymap.set('i', '<C-S-Up>', '<C-o>:m -2<CR>', { noremap = true, silent = true })
-- vim.keymap.set('i', '<C-S-Down>', '<C-o>:m +1<CR>', { noremap = true, silent = true })
