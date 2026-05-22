vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = false
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"

vim.wo.number = true
vim.wo.relativenumber = true

local function save_current_file()
  if vim.api.nvim_buf_get_name(0) == "" then
    local target = vim.fn.input("Save as: ", "", "file")
    if target == "" then
      return
    end
    vim.cmd("saveas " .. vim.fn.fnameescape(target))
  else
    vim.cmd.write()
  end
end

vim.api.nvim_create_user_command("W", save_current_file, { desc = "Write current file" })

vim.keymap.set("i", "<Right>", function()
  if vim.fn.col(".") == vim.fn.col("$") and vim.fn.line(".") < vim.fn.line("$") then
    return "<C-o>j<C-o>0"
  end
  return "<Right>"
end, { desc = "Move right", expr = true, replace_keycodes = true })

vim.keymap.set("i", "<Left>", function()
  if vim.fn.col(".") == 1 and vim.fn.line(".") > 1 then
    return "<C-o>k<C-o>A"
  end
  return "<Left>"
end, { desc = "Move left", expr = true, replace_keycodes = true })
