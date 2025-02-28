local fn = vim.fn

-- Automatically install packer

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Installed Plugins
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself	

	-- Mason and LSP
	use('williamboman/mason.nvim')
	use('williamboman/mason-lspconfig.nvim')
	use('neovim/nvim-lspconfig')

	-- Autocompletion
	use('hrsh7th/nvim-cmp')
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-path')

	-- Code snippet plugins
	use('L3MON4D3/LuaSnip')
	use('saadparwaiz1/cmp_luasnip')
	use('rafamadriz/friendly-snippets')

	-- Treesitter
	use('nvim-treesitter/nvim-treesitter')

	-- Plenary
	use('nvim-lua/plenary.nvim')

	-- Telescope
	use { 'nvim-telescope/telescope.nvim' }

	-- Paranthesis autoclose
	use('m4xshen/autoclose.nvim')

	-- Github Copilot
	use('github/copilot.vim')
	use('CopilotC-Nvim/CopilotChat.nvim')

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
