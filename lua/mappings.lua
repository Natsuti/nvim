require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
local M = {}

M.dap = {
  n = {
    ["<F5>"] = { function() require("dap").continue() end, "Start/Continue" },
    ["<F10>"] = { function() require("dap").step_over() end, "Step Over" },
    ["<F11>"] = { function() require("dap").step_into() end, "Step Into" },
    ["<F12>"] = { function() require("dap").step_out() end, "Step Out" },
    ["<Leader>b"] = { function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint" },
    ["<Leader>dr"] = { function() require("dap").repl.open() end, "Open REPL" },
  }
}

map("n", "<leader>fm", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format File" })

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })

map("n", "<leader>sd", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Símbolos del documento" })
map("n", "<leader>sw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Símbolos de la workspace" })
map("n", "<leader>st", "<cmd>Telescope tags<cr>", { desc = "Tags con ctags" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Ayuda de Neovim" })

vim.keymap.set("n", "<leader>fm", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Formatear archivo actual" })

vim.api.nvim_create_user_command("NewProjectPython", function()
  require("utils.projectgen").new_project("python")
end, {})

vim.api.nvim_create_user_command("NewProjectCpp", function()
  require("utils.projectgen").new_project("cpp")
end, {})

vim.api.nvim_create_user_command("NewProjectHTML", function()
  require("utils.projectgen").new_project("html")
end, {})

local langcmds = require("utils.langcommands")

vim.api.nvim_create_user_command("LangRun", function()
  langcmds.run_action("run")
end, {})

vim.api.nvim_create_user_command("LangBuild", function()
  langcmds.run_action("build")
end, {})

vim.api.nvim_create_user_command("LangTest", function()
  langcmds.run_action("test")
end, {})

vim.keymap.set("n", "<leader>lr", "<cmd>LangRun<CR>", { desc = "Run (según lenguaje)" })
vim.keymap.set("n", "<leader>lb", "<cmd>LangBuild<CR>", { desc = "Build (según lenguaje)" })
vim.keymap.set("n", "<leader>lt", "<cmd>LangTest<CR>", { desc = "Test (según lenguaje)" })





return M
