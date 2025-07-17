-- ~/.config/nvim/lua/configs/luasnip.lua
local ls = require "luasnip"

-- ⛔ Evitar errores por rutas vacías
require("luasnip.loaders.from_vscode").lazy_load { paths = {} }
require("luasnip.loaders.from_snipmate").lazy_load { paths = {} }

-- ✅ Tu carpeta real de snippets
require("luasnip.loaders.from_lua").lazy_load {
  paths = vim.fn.stdpath "config" .. "/lua/snippets",
}

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
}
