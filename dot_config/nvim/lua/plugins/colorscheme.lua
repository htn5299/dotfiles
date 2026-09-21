return {
  {
    "RRethy/base16-nvim",
    priority = 1000,
    config = function()
      require("base16-colorscheme").setup({
        base00 = "#191b1d", base01 = "#282a2e", base02 = "#373b41", base03 = "#969896",
        base04 = "#b4b7b4", base05 = "#c5c8c6", base06 = "#e0e0e0", base07 = "#ffffff",
        base08 = "#cc6666", base09 = "#de935f", base0A = "#f0c674", base0B = "#b5bd68",
        base0C = "#8abeb7", base0D = "#81a2be", base0E = "#b294bb", base0F = "#a3685a",
      })

      -- Highlight group overrides matching nvf highlight.nix
      local hl_links = {
        -- Floats
        FloatBorder = "Comment",
        FloatTitle = "Comment",
        NormalFloat = "Normal",

        -- Neo-tree float
        NeoTreeNormal = "Normal",
        NeoTreeNormalNC = "Normal",
        NeoTreeFloatTitle = "Normal",
        NeoTreeTitleBar = "Normal",

        -- fzf-lua
        FzfLuaNormal = "Normal",
        FzfLuaBorder = "FloatBorder",
        FzfLuaTitle = "Normal",
        FzfLuaHelpNormal = "Normal",
        FzfLuaHelpBorder = "FloatBorder",
        FzfLuaPreviewNormal = "Normal",
        FzfLuaPreviewBorder = "FloatBorder",
        FzfLuaPreviewTitle = "Normal",
        FzfLuaCursorLine = "Visual",

        -- Completion menu
        Pmenu = "Normal",
        PmenuSel = "Visual",
        PmenuSbar = "CursorLine",
        PmenuThumb = "Visual",

        -- Editor chrome
        LineNr = "FloatBorder",
        SignColumn = "Normal",
        WinSeparator = "FloatBorder",
        StatusLine = "Directory",
        StatusLineNC = "FloatBorder",

        -- Plugin borders
        WhichKeySeparator = "FloatBorder",
        BlinkCmpMenuBorder = "FloatBorder",
        BlinkCmpDocBorder = "FloatBorder",
        BlinkCmpDocSeparator = "FloatBorder",
        BlinkCmpSignatureHelpBorder = "FloatBorder",
      }

      for target, source in pairs(hl_links) do
        vim.api.nvim_set_hl(0, target, { link = source })
      end
    end,
  },
}
