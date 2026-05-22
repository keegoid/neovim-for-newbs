local M = {}

local oil_lab = "/private/tmp/newbs-oil-lab"

local function doc_dir()
  local docs = vim.api.nvim_get_runtime_file("doc/neovim-for-newbs.txt", false)
  if #docs > 0 then
    return vim.fn.fnamemodify(docs[1], ":h")
  end

  local uv = vim.uv or vim.loop
  local init_path = uv.fs_realpath(vim.env.MYVIMRC or (vim.fn.stdpath("config") .. "/init.lua"))
  if init_path then
    local real_doc_dir = vim.fn.fnamemodify(init_path, ":h") .. "/doc"
    if vim.fn.filereadable(real_doc_dir .. "/neovim-for-newbs.txt") == 1 then
      return real_doc_dir
    end
  end

  return vim.fn.stdpath("config") .. "/doc"
end

local function open_help()
  local ok = pcall(vim.cmd.help, "neovim-for-newbs")
  if ok then
    return
  end

  vim.cmd("silent! helptags " .. vim.fn.fnameescape(doc_dir()))
  vim.cmd.help("neovim-for-newbs")
end

local function show_keymaps()
  local ok, which_key = pcall(require, "which-key")
  if ok and which_key.show then
    which_key.show({ keys = "<leader>" })
    return
  end
  vim.cmd("WhichKey <leader>")
end

local function ensure_file(path, lines)
  if vim.fn.filereadable(path) == 0 then
    vim.fn.writefile(lines, path)
  end
end

local function open_oil_lab()
  vim.fn.mkdir(oil_lab .. "/src", "p")
  vim.fn.mkdir(oil_lab .. "/docs", "p")
  ensure_file(oil_lab .. "/src/app.lua", {
    "local M = {}",
    "",
    "function M.greet(name)",
    '  return "hello, " .. name',
    "end",
    "",
    "return M",
  })
  ensure_file(oil_lab .. "/docs/notes.md", {
    "# Oil Lab",
    "",
    "Try renaming, creating, moving, and deleting files from the Oil buffer.",
  })
  ensure_file(oil_lab .. "/README.md", {
    "# newbs-oil-lab",
    "",
    "This throwaway directory is safe to edit while learning Oil.",
  })

  vim.cmd("Oil " .. vim.fn.fnameescape(oil_lab))
end

function M.setup()
  vim.api.nvim_create_user_command("NewbsHelp", open_help, { desc = "Open neovim-for-newbs help" })
  vim.api.nvim_create_user_command("NewbsKeys", show_keymaps, { desc = "Show beginner keymaps" })
  vim.api.nvim_create_user_command("NewbsOilLab", open_oil_lab, { desc = "Open a throwaway Oil practice directory" })
end

return M
