-- after/plugin/nvim-tree.lua

-- Disable netrw at the very start to prevent conflicts with nvim-tree.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Optionally enable 24-bit color.
vim.opt.termguicolors = true

-- Setup nvim-tree with your options.
require('nvim-tree').setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 20,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set('n', '<leader>ww', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>we', ':NvimTreeFocus<CR>', { noremap = true, silent = true })

