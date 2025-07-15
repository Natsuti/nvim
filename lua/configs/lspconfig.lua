require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "pyright", "ruff", "jdtls", "ts_ls", "clangd", "cssls", }
vim.lsp.enable(servers)

require("configs.diagnostics")
-- read :h vim.lsp.config for changing options of lsp servers 
