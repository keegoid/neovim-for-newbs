return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()

      local function ensure_installed(package_name)
        if #vim.api.nvim_list_uis() == 0 then
          return
        end

        local ok, registry = pcall(require, "mason-registry")
        if not ok then
          return
        end

        local function install()
          local package_ok, package = pcall(registry.get_package, package_name)
          if package_ok and not package:is_installed() then
            package:install()
          end
        end

        if registry.refresh then
          registry.refresh(install)
        else
          install()
        end
      end

      ensure_installed("tree-sitter-cli")
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require("cmp")
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format({ details = true }),
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
      })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      vim.lsp.config("lua_ls", lsp_zero.nvim_lua_ls())

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
          "bashls",
          "jsonls",
        },
        automatic_enable = true,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
      vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Hover documentation" })
      vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "Find references" })
      vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Show line diagnostic" })
      vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
      vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
      vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, { desc = "List diagnostics" })
    end,
  },
}
