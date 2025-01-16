-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit colour
vim.opt.termguicolors = false

-- Calls all plugin and lsp configs
require('plugins')
require('user.lsp')
require('user.configs')

--Enables Line Numbering
vim.wo.number = true

-- Indent options
vim.opt.shiftwidth = 2
