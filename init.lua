-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit colour
vim.opt.termguicolors = true

require('plugins')
require('user.lsp')

-- Different LSP configs
require('lspconfig').lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim', 'client' }
			}
		}
	}
}

-- Calls all config files
require('user.configs')

--Enables Line Numbering
vim.wo.number = true

-- Indent options
vim.opt.shiftwidth = 4

-- Something something clipboard
vim.api.nvim_set_option("clipboard", "unnamed")
