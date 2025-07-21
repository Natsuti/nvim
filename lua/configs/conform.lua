require("conform").setup {
  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = false, -- ❗️Evita que LSPs como pyright formateen
  },
  formatters_by_ft = {
    python = { "isort", "black" }, -- 🧠 Orden óptimo: isort → black
    javascript = { "prettier" },
    typescript = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    lua = { "stylua" },
  },
}
