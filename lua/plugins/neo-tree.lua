return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set(
      "n",
      "<leader>ef",
      "<cmd>Neotree filesystem toggle left<cr>",
      { desc = "Toggle file explorer", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>eb",
      "<cmd>Neotree buffers toggle float<cr>",
      { desc = "Browse open buffers", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>eg",
      "<cmd>Neotree git_status toggle float<cr>",
      { desc = "Browse git changes", silent = true }
    )
  end,
}
