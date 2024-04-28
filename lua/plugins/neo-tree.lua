return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>ef", ":Neotree filesystem reveal toggle left<CR>", { desc = "explore file" })
    vim.keymap.set("n", "<leader>eb", ":Neotree buffers reveal toggle float<CR>", { desc = "explore buffer" })
    vim.keymap.set("n", "<leader>eg", ":Neotree git_status reveal toggle float<CR>", { desc = "explore git" })
  end,
}
