require("telescope").setup({
  defaults = {
    layout_config = {
      horizontal = { preview_width = 0.6 },
    },
    file_ignore_patterns = { "node_modules", ".git" },
  },
  pickers = {
    -- Configuraciones específicas si quieres (puedes dejarlas vacías o personalizar)
    lsp_references = { theme = "dropdown" },
    lsp_definitions = { theme = "dropdown" },
    lsp_implementations = { theme = "dropdown" },
  },
})

local map = vim.keymap.set

-- Buscar símbolos LSP en el documento actual
map("n", "<leader>sd", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Symbols in Document" })

-- Buscar símbolos LSP en toda la workspace
map("n", "<leader>sw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Symbols in Workspace" })

-- Buscar help tags
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })

-- Buscar tags (si tienes ctags o tags generados)
map("n", "<leader>st", "<cmd>Telescope tags<cr>", { desc = "Tags" })
