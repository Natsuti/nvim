require("bufferline").setup ({
  options = {
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = false,
    separator_style = "thin",
    always_show_bufferline = true,
    offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
  },
})
