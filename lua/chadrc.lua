-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@class ChadrcConfig
---@field ui table?
---@field nvdash table?
---@field plugins any
---@field lsp table?
---@field null_ls any
local M = {}

  -- hl_override = {
  --   Comment = { italic = true },
  --   ["@comment"] = { italic = true },
  -- },


M.nvdash = { load_on_startup = true }

M.ui = {
  theme = "catppuccin_icy"
}

M.plugins = "plugins"
M.lsp = { setup_lspconf = "configs.lspconfig" }
M.null_ls = "configs.null-ls"

-- extras fuera del config
vim.g.transparency = true
vim.g.nvchad_theme = "catppuccin_icy"

require "configs.runner"

vim.g.clipboard = {
  name = "termux",
  copy = {
    ["+"] = "termux-clipboard-set",
    ["*"] = "termux-clipboard-set",
  },
  paste = {
    ["+"] = "termux-clipboard-get",
    ["*"] = "termux-clipboard-get",
  },
  cache_enabled = 0,
}
vim.opt.clipboard = "unnamedplus"

return M
