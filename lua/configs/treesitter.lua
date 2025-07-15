require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash", "c", "cpp", "html", "css", "javascript", "typescript", "lua", "python", "json"
  },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = { enable = true },
})
