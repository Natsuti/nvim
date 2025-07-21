local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    -- Python
    null_ls.builtins.diagnostics.ruff,

    -- C/C++
    null_ls.builtins.diagnostics.cpplint,

    -- JavaScript/TypeScript
    null_ls.builtins.diagnostics.eslint_d, -- usa eslint_d si está instalado

    -- CSS
    null_ls.builtins.diagnostics.stylelint,
  },
}
