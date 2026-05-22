return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup({
      default_file_explorer = false,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = false,
      view_options = {
        show_hidden = false,
      },
    })

    vim.keymap.set("n", "-", oil.toggle_float, { desc = "Edit parent directory with Oil" })
    vim.keymap.set("n", "<leader>eo", oil.toggle_float, { desc = "Edit files with Oil" })
  end,
}
