return {
  -- Native LSP configuration via nvim-lspconfig (using system-installed LSP servers, no Mason)
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- List of LSP servers installed via DNF / Cargo / Go / NPM on Fedora
      local servers = {
        "lua_ls",         -- Lua
        "pyright",        -- Python
        "gopls",          -- Go
        "rust_analyzer",  -- Rust
        "bashls",         -- Bash
        "ts_ls",          -- TypeScript / JavaScript
        "nil_ls",         -- Nix (if needed)
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      -- Diagnostic Signs for error/warning icons
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

  -- Format on save
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

  -- Trouble.nvim for diagnostics list
  { "folke/trouble.nvim", opts = {} },
}
