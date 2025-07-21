return {

-- Plenary (base de muchos plugins)
  { "nvim-lua/plenary.nvim", lazy = false },

-- Telescope para busquedas
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = "make",
    config = function()
      require("configs.telescope")
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

-- NvimTree para explorador de archivos
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require("nvim-tree").setup {
        view = { width = 30, side = "left", adaptive_size = true },
        filters = { dotfiles = false, custom = { "^.git$" } },
        git = { enable = true, ignore = false },
        renderer = { indent_markers = { enable = true }, icons = { show = { git = true, folder = true, file = true } } },
      }
    end,
  },

-- Treesitter para analisis sintactico
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("configs.treesitter")
    end,
  },

-- LSP para soporte avanzado
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("configs.lspconfig")
    end,
  },

-- Autocompletado
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("configs.cmp")
    end,
  },

-- Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("configs.luasnip")
    end,
  },

-- Linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("configs.null-ls")
    end,
  },

-- Formatters
  {
    "stevearc/conform.nvim",
    config = function()
      require("configs.conform")
    end,
  },

--  Depuracion
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require("dap")
      require("dapui")
    end,
  },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
  { "mfussenegger/nvim-dap-python" },

-- Git
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("configs.gitsigns")
    end,
  },

-- Barra de estado
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("configs.lualine")
    end,
  },

-- Barra de pestanas
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = function()
      require("configs.bufferline")
    end,
  },

--
  {
    "windwp/nvim-autopairs",
    config = function()
      require("configs.autopairs")
    end,
  },
}
