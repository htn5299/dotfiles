return {
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { "HiPhish/rainbow-delimiters.nvim" },
  { "j-hui/fidget.nvim", opts = {} },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({ delay = 200 })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "declancm/cinnamon.nvim",
    version = "*",
    opts = {
      keymaps = { basic = true },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      autotag = { enable = true },
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query",
        "python", "go", "rust", "c_sharp", "bash",
        "javascript", "typescript", "tsx", "html", "css", "scss",
        "json", "yaml", "toml", "markdown", "markdown_inline",
        "sql", "terraform", "nix"
      },
    },
  },
}
