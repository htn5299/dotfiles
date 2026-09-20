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
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      autotag = { enable = true },
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "go", "rust", "bash" },
    },
  },
}
