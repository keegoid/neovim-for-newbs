-- intuitive escape from insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Ctrl+S to save (works in normal and insert mode)
vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>write<cr>", { desc = "Save file", silent = true })

vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy selection to system clipboard", silent = true })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard", silent = true })
vim.keymap.set("n", "<leader>ww", "<cmd>W<cr>", { desc = "Save or save as", silent = true })
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Save & Quit", silent = true })
vim.keymap.set("n", "<leader>qq", "<cmd>quit<cr>", { desc = "Quit", silent = true })
vim.keymap.set("n", "<leader>qf", "<cmd>quit!<cr>", { desc = "Force quit", silent = true })
vim.keymap.set(
  "n",
  "<leader>h",
  "<cmd>nohlsearch<bar>diffupdate<bar>normal! <C-L><cr>",
  { desc = "Clear Highlight", silent = true }
)
vim.keymap.set("n", "<leader>sh", "<cmd>checkhealth<cr>", { desc = "Check health", silent = true })
vim.keymap.set("n", "<leader>sl", "<cmd>Lazy<cr>", { desc = "Open Lazy", silent = true })
vim.keymap.set("n", "<leader>sH", "<cmd>NewbsHelp<cr>", { desc = "Open newbs help", silent = true })
vim.keymap.set("n", "<leader>sk", "<cmd>NewbsKeys<cr>", { desc = "Show keymaps", silent = true })
vim.keymap.set("n", "<leader>so", "<cmd>NewbsOilLab<cr>", { desc = "Open Oil lab", silent = true })

-- vim.keymap.set('i', '<C-S-Up>', '<C-o>:m -2<CR>', { noremap = true, silent = true })
-- vim.keymap.set('i', '<C-S-Down>', '<C-o>:m +1<CR>', { noremap = true, silent = true })
