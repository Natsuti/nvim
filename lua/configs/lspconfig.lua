local lspconfig = require "lspconfig"

-- Función común para desactivar el formateo por LSP
local function disable_formatting(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

-- Lista de LSPs por lenguaje
local servers = {
  pyright = {},
  ts_ls = {},
  clangd = {},
  html = {},
  cssls = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = { checkThirdParty = false },
      },
    },
  },
}

-- Configuración de cada servidor
for name, config in pairs(servers) do
  config.on_attach = function(client, bufnr)
    disable_formatting(client)

    -- aquí podrías agregar keymaps, etc.
  end
  lspconfig[name].setup(config)
end

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded" }
)
