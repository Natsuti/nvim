-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyonight",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false,
  },
}

M.plugins = "plugins"
M.lsp = { setup_lspconf = "configs.lspconfig" }
M.null_ls = "configs.null-ls"
M.dap = { setup_dapconf = "configs.dap.init" }

require "configs.runner"

return M
