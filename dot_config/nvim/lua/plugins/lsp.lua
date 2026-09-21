return {
  -- Native LSP configuration via nvim-lspconfig (using system-installed LSP servers, no Mason)
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- List of standard LSP servers installed via DNF / Cargo / Go / NPM on Fedora
      local servers = {
        "lua_ls",         -- Lua
        "pyright",        -- Python
        "gopls",          -- Go
        "rust_analyzer",  -- Rust
        "csharp_ls",      -- C# (or omnisharp)
        "bashls",         -- Bash
        "ts_ls",          -- TypeScript / JavaScript
        "html",           -- HTML
        "cssls",          -- CSS / SCSS
        "jsonls",         -- JSON
        "yamlls",         -- YAML
        "taplo",          -- TOML
        "marksman",       -- Markdown
        "sqlls",          -- SQL
        "terraformls",    -- Terraform
        "nil_ls",         -- Nix
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      -- Angular Language Server with custom filetypes
      lspconfig.angularls.setup({
        capabilities = capabilities,
        filetypes = { "typescript", "html", "typescriptreact", "htmlangular" },
        root_dir = lspconfig.util.root_pattern("angular.json", "nx.json"),
      })

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
        csharp = { "csharpier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        htmlangular = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        terraform = { "terraform_fmt" },
        sql = { "sqlfluff" },
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

