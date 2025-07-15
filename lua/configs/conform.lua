  local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    python = { "black", "isort" },
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    cpp = { "clang-format" },
    c = { "clang-format" },
    java = { "google-java-format" }, -- requiere config externa
  },

  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.lua", "*.py", "*.js", "*.ts", "*.cpp", "*.java" },
  callback = function(args)
    require("conform").format({ bufnr = args.buf, async = false })
  end,
  })
})
