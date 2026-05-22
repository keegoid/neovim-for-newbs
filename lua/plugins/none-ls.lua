return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local sources = {
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.stylua,
    }
    if vim.fn.executable("markdownlint") == 1 then
      table.insert(
        sources,
        null_ls.builtins.diagnostics.markdownlint.with({
          extra_args = { "--config", vim.fn.expand("~/.markdownlint.json") },
        })
      )
    end
    null_ls.setup({ sources = sources })

    vim.keymap.set("n", "<leader>li", vim.lsp.buf.format, { desc = "Format file" })
    vim.keymap.set("n", "<leader>i", vim.lsp.buf.format, { desc = "Format file" })
  end,
}
