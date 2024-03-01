-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable 24-bit colour
vim.opt.termguicolors = true

require('plugins')
require('user.lsp')

require('lspconfig').lua_ls.setup {
	-- ... other configs
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim', 'client' }
			}
		}
	}
}

-- Tree Sitter setup
require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (or "all")
	ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		--disable = { "c", "rust" },
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		--[[
	disable = function(lang, buf)
        	local max_filesize = 100 * 1024 -- 100 KB
        	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        	if ok and stats and stats.size > max_filesize then
            	return true
        	end
		
    	end,
	]] --

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}

--Telescope setup
require('telescope').setup {
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key"
			}
		}
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	}
}

--Nvim Tree setup
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

-- Error Lens setup
require("error-lens").setup(client, {

	-- this setting tries to auto adjust the colors
	-- based on the diagnostic-highlight groups and your
	-- theme background color with a color blender
	enabled = true,
	auto_adjust = {
		enable = false,
		fallback_bg_color = nil, -- mandatory if enable true (e.g. #281478)
		step = 7,  -- inc: colors should be brighter/darker
		total = 30 -- steps of blender
	},
	prefix = 4,        -- distance code <-> diagnostic message
	-- default colors
	colors = {
		error_fg = "#FF6363", -- diagnostic font color
		error_bg = "#4B252C", -- diagnostic line color
		warn_fg = "#FA973A",
		warn_bg = "#403733",
		info_fg = "#5B38E8",
		info_bg = "#281478",
		hint_fg = "#25E64B",
		hint_bg = "#147828"
	}
})

--Enables Line Numbering
vim.wo.number = true
