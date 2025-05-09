return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim',
			'sharkdp/fd' },
		config = function()
			require('telescope').setup {
				defaults = {
					path_display = { "smart" },
					mappings = {
						["i"] = {
							["<C-j>"] = require('telescope.actions').move_selection_next,
							["<C-k>"] = require('telescope.actions').move_selection_previous,
						}
					},
				}
			}

			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("ui-select")
		end
	},
	-- Replaces core nvim menus with telescope because we love telescope
	{ 'nvim-telescope/telescope-ui-select.nvim' }
}
