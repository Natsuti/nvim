require("telescope").setup ({
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = "➤ ",
    file_ignore_patterns = { "node_modules", ".gitexcept", ".git/", "%.a", "%.o", "%.out", "dist" },
    vimgrep_arguments = { "grep", "-n", "-R", "--no-heading", "--smart-case", "--hidden" },
    layout_strategy = "vertical",
    layout_config = { height = 0.9, width = 0.9, preview_cutoff = 0 },
  },
})
