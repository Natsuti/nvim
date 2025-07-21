vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = "," -- Coma como lider local
vim.opt.number = true -- Numeros de linea
vim.opt.cursorline = true  -- Resaltar linea actual
vim.opt.tabstop = 2  -- 2 espacios para tabulaciones
vim.opt.shiftwidth = 2 -- 2 espacios para indentacion
vim.opt.expandtab = true -- Espacios en lugar de tabs
vim.opt.smartindent = true -- Indentacion inteligente
vim.opt.wrap = false -- Sin ajuste de linea
vim.opt.swapfile = false -- Desactivar swap
vim.opt.undofile = false -- Desactivar undo persistente
vim.opt.updatetime = 100 -- Actualizacion rapida
vim.opt.timeoutlen = 200 -- Tiempo corto para mapeos
vim.opt.termguicolors = true -- Colores de 24 bits
vim.opt.signcolumn = "yes:2" -- Columna de signos ancha para diagnosticos
vim.opt.showmode = false -- Ocultar modo
vim.opt.mouse = "a" -- Habilitar mouse
vim.opt.clipboard = "unnamedplus" -- Sincronizar portapapeles
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Autocompletado
vim.opt.pumheight = 10 -- Limitar altura del menu de autocompletado 
vim.opt.conceallevel = 0 -- Mostrar todo el texto (util para HTML)
vim.opt.scrolloff = 8 -- Mantener 8 lineas visibles al desplazar
vim.opt.sidescrolloff = 8 -- Mantener 8 columnas visibles al desplazar 

-- OPtimizaciones para Termux
vim.opt.lazyredraw = true -- Reducir redibujado para mejor rendimiento
vim.opt.redrawtime = 1500 -- Tiempo maximo para redibujar
vim.opt.synmaxcol = 200 -- Limitar resaltado de sintaxis en lineas largas

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"
vim.schedule(function()
  require "mappings"
end)

