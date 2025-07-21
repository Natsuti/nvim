-- Íconos personalizados en el gutter
local signs = {
  [vim.diagnostic.severity.ERROR] = "",
  [vim.diagnostic.severity.WARN]  = "",
  [vim.diagnostic.severity.HINT]  = "",
  [vim.diagnostic.severity.INFO]  = "",
}

for severity, icon in pairs(signs) do
  local name = "DiagnosticSign" .. vim.diagnostic.severity[severity]:gsub("^%l", string.upper)
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

vim.diagnostic.config {
  virtual_text = {
    prefix = "●", -- Puedes cambiar este símbolo si quieres
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always", -- Muestra de qué LSP proviene el mensaje
    header = "",
    prefix = "",
  },
}

-- Mostrar automáticamente mensaje flotante cuando pasas el cursor sobre un error
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})
