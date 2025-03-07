return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	opts = {
		window = {
			layout = 'float',
			relative = 'cursor',
			width = 1,
			height = 0.4,
			row = 1
		},
		context = 'buffer'
	}
}
