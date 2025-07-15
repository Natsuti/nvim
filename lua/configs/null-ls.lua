local null_ls = require("null-ls")

local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then return end

null_ls.setup({
  sources = {
    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.ruff,
    
    -- C/C++
    null_ls.builtins.diagnostics.cpplint,
    null_ls.builtins.formatting.clang_format,

    -- JS/TS/HTML/CSS
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.stylelint,

    -- Lua
    null_ls.builtins.formatting.stylua,
  },
})






















