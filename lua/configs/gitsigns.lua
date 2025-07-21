require("gitsigns").setup ({
  signs = {
    add = { text = "+" },
    change = { "-" },
    delete = { "_" },
  },
  current_line_blame = true,
})
