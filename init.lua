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

-- Paranthesis auto close setup
require('autoclose').setup()

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
