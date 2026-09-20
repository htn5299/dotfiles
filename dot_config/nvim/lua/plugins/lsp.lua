return {
  {
    "williamboman/mason.nvim",
    opts = { ui = { border = "single" } },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "pyright", "gopls", "rust_analyzer", "bashls", "ts_ls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      for _, server in ipairs({ "lua_ls", "pyright", "gopls", "rust_analyzer", "bashls", "ts_ls" }) do
        lspconfig[server].setup({ capabilities = capabilities })
      end

      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        virtual_text = { spacing = 4, source = "if_many" },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          },
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        go = { "gofmt" },
        rust = { "rustfmt" },
      },
      format_on_save = function()
        if vim.g.autoformat == false then return end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    },
  },
  { "folke/trouble.nvim", opts = {} },
}
