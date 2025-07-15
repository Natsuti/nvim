return {

  {
    "stevearc/conform.nvim",
    --event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "configs.treesitter"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end,
  },

  { "mfussenegger/nvim-dap" },

  { "nvimtools/none-ls.nvim" },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "configs.cmp"
    end,
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "rafamadriz/friendly-snippets",
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.telescope"
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require "configs.autopairs"
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require "configs.luasnip"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "configs.nvimtree"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "configs.lualine"
    end,
  },
}
