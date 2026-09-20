return {
  -- Native LSP configuration via nvim-lspconfig (không cần Mason, dùng LSP server có sẵn trên hệ thống)
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Danh sách LSP servers cài đặt trực tiếp qua DNF / Cargo / Go / NPM trên Fedora
      local servers = {
        "lua_ls",         -- Lua
        "pyright",        -- Python
        "gopls",          -- Go
        "rust_analyzer",  -- Rust
        "bashls",         -- Bash
        "ts_ls",          -- TypeScript / JavaScript
        "nil_ls",         -- Nix (nếu cần)
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      -- Diagnostic Signs hiển thị icon lỗi/cảnh báo
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

  -- Trouble.nvim để duyệt danh sách lỗi/diagnostics
  { "folke/trouble.nvim", opts = {} },
}
