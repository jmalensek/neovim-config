-- Sets up various lsp configurations

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					'vim', 'client'
				}
			}
		}
	}
}
lspconfig.clangd.setup {}
