require("nvim-treesitter.configs").setup({
  ensure_installed = { "bash", "c", "cpp", "html", "css", "javascript", "typescript", "lua", "python", "json" },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = { init_selection = "<C-space>", node_incremental = "<C-space>", node_decremental = "<bs>" },
  },
})
