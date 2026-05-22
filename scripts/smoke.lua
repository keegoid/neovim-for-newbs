local failures = {}

local function check(name, condition, detail)
  if not condition then
    table.insert(failures, name .. (detail and (": " .. detail) or ""))
  end
end

local function command_exists(name)
  return vim.fn.exists(":" .. name) == 2
end

local function map_for(mode, lhs)
  return vim.fn.maparg(lhs, mode, false, true)
end

local function check_map(mode, lhs, desc)
  local map = map_for(mode, lhs)
  check(mode .. " map " .. lhs, map and map.lhs ~= nil and map.lhs ~= "", "missing")
  check(mode .. " map " .. lhs .. " desc", map and map.desc == desc, "expected " .. desc)
end

check("confirm option", vim.o.confirm)
check("persistent undo", vim.o.undofile)
check("smartcase search", vim.o.ignorecase and vim.o.smartcase)
check("right/below splits", vim.o.splitright and vim.o.splitbelow)
check("substitute preview", vim.o.inccommand == "split")
check("node provider disabled", vim.g.loaded_node_provider == 0)
check("perl provider disabled", vim.g.loaded_perl_provider == 0)
check("python provider disabled", vim.g.loaded_python3_provider == 0)
check("ruby provider disabled", vim.g.loaded_ruby_provider == 0)
check(
  "runtimepath does not include real dotfiles root",
  not vim.o.runtimepath:find("/dotfiles/neovim%-for%-newbs", 1, false)
)

check_map("n", "<C-s>", "Save file")
check_map("i", "<C-s>", "Save file")
check_map("n", "<leader>ff", "Find files")
check_map("n", "<leader>fr", "Recent files")
check_map("n", "<leader>fg", "Search text")
check_map("n", "<leader>ef", "Toggle file explorer")
check_map("n", "<leader>eo", "Edit files with Oil")
check_map("n", "<leader>sk", "Show keymaps")
check_map("n", "<leader>sh", "Check health")
check_map("n", "<leader>sl", "Open Lazy")
check_map("n", "<leader>a", "Return to dashboard")

vim.cmd("edit /private/tmp/newbs-smoke.lua")
check_map("n", "<leader>lh", "Hover documentation")
check_map("n", "<leader>ld", "Go to definition")
check_map("n", "<leader>lr", "Find references")
check_map("n", "<leader>la", "Code action")
check_map("n", "<leader>le", "Show line diagnostic")
check_map("n", "<leader>ln", "Next diagnostic")
check_map("n", "<leader>lp", "Previous diagnostic")
check_map("n", "<leader>ll", "List diagnostics")

for _, command in ipairs({ "Alpha", "Neotree", "Oil", "Telescope", "NewbsHelp", "NewbsKeys", "NewbsOilLab" }) do
  check("command " .. command, command_exists(command))
end

for _, module in ipairs({ "alpha", "oil", "telescope", "which-key" }) do
  local ok = pcall(require, module)
  check("module " .. module, ok)
end

check("newbs help tag", pcall(vim.cmd.help, "neovim-for-newbs"))

vim.cmd("Alpha")
check("alpha filetype", vim.bo.filetype == "alpha", "got " .. vim.bo.filetype)
for _, lhs in ipairs({ "h", "j", "k", "l" }) do
  local map = vim.fn.maparg(lhs, "n", false, true)
  check(
    "alpha keeps " .. lhs .. " movement",
    not (map and map.buffer == 1 and map.lhs == lhs),
    "buffer-local mapping exists"
  )
end
local alpha_text = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
check("alpha dashboard omits MRU clutter", not alpha_text:find("MRU", 1, true))
check("alpha dashboard uses dashboard header", alpha_text:find("___", 1, true))
check("alpha dashboard avoids block logo", not alpha_text:find("████", 1, true))
check("alpha dashboard shows clear shortcuts", alpha_text:find("SPC f f", 1, true))

local float_buf = vim.api.nvim_create_buf(false, true)
vim.api.nvim_buf_set_lines(float_buf, 0, -1, false, { "floating plugin window" })
vim.api.nvim_open_win(float_buf, true, {
  relative = "editor",
  row = 1,
  col = 1,
  width = 30,
  height = 3,
  style = "minimal",
})
local dashboard_keys = vim.api.nvim_replace_termcodes("<Space>a", true, false, true)
vim.api.nvim_feedkeys(dashboard_keys, "xt", false)
check("alpha opens from floating window", vim.bo.filetype == "alpha", "got " .. vim.bo.filetype)

if #failures > 0 then
  error("Smoke checks failed:\n- " .. table.concat(failures, "\n- "))
end

print("newbs smoke ok")
