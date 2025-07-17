-- Define íconos personalizados para diagnósticos (gutter signs)
vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  virtual_text = {
    prefix = "●",
    spacing = 2,
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}
