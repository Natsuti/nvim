local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then return end

-- disables netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nvimtree.setup({
  view = {
    width = 30,
    side = "left",
    number = false,
    relativenumber = false,
  },
  renderer = {
    highlight_git = true,
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          open = "",
        },
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = { ".git", "node_modules", ".cache" },
  },
  git = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})
