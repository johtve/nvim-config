return {
	--Status bar
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		theme = require('ofirkai.statuslines.lualine').theme,
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'diff', 'diagnostics' },
			lualine_c = { 'filename' },
			lualine_x = { 'filetype' },
			lualine_y = { 'location', 'progress' },
			lualine_z = {
				-- Ripped right from LazyVim lol
				function()
					return " " .. os.date("%R")
				end,
			}
		},
	}
}
