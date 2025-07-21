require "nvchad.mappings"

local map = vim.keymap.set

-- General
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<CR>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document Symbols" })

-- LSP
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to Definition" })
map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Go to references" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", { desc = "Format" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

-- Depuracion
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Continue" })
map("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
map("n", "<leader>do", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
map("n", "<leader>dt", "<cmd>DapTerminate<CR>", { desc = "Terminate" })

-- Navegacion
map("n", "<C-h>", "<C-w>h", { desc = "Window Left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window Right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window Up" })

-- Buffers
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close Buffer" })

-- Git
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git Status" })

-- Ejecucion
map("n", "<leader>rp", "<cmd>TermuxExec cmd='python3 %'<CR>", { desc = "Run Python" })
map("n", "<leader>rc", "<cmd>TermuxExec cmd='g++ % -o output && ./output'<CR>", { desc = "Run C++" })
map("n", "<leader>rj", "<cmd>TermuxExec cmd='node %'<CR>", { desc = "Run JavaScript" })
map("n", "<leader>rh", "<cmd>TermuxExec cmd='xdg-open %'<CR>", { desc = "Open HTML" })


return M
