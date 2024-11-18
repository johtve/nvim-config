return {
	-- Base copilot plugin
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup {
			suggestion = {},
			panel = { enabled = false },
			filetypes = {
				markdown = false,
			}
		}
		vim.cmd("Copilot disable")
	end
}
