-- Define íconos personalizados para diagnósticos (gutter signs)
local signs = {
  Error = " ",
  Warn  = " ",
  Hint  = " ",
  Info  = " ",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Configuración visual general del sistema de diagnóstico
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true, -- mejora visual: errores más graves se priorizan
})
