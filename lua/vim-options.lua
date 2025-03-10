vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd [[
  function! SaveAs()
    if bufname('%') == ''
      execute 'saveas ' . input('Save as: ')
    else
      write
    endif
  endfunction

  command! W call SaveAs()
]]

vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd([[
  imap <expr> <Right> col('.') == col('$') && line('.') < line('$') ? "\<C-o>j\<C-o>0" : "\<Right>"
  imap <expr> <Left> col('.') == 1 && line('.') > 1 ? "\<C-o>k\<C-o>A" : "\<Left>"
]])
