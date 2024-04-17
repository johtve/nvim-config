return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
	lazy = true,
	dependencies = {
		{ 'neovim/nvim-lspconfig' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{
			'hrsh7th/nvim-cmp',
			dependencies = {
				{ 'L3MON4D3/LuaSnip' }
			},
		}
	},
	config = { function()
		local lsp_zero = require('lsp-zero')
		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
			lsp_zero.buffer_autoformat(client, bufnr, { tabSize = 4 }) -- Auto format on save. Note that this formats with all enabled LSPs for a given language
		end)

		-- Need to disable LSP semantic tokens for treesitter to take control of highlighting
		lsp_zero.set_server_config({
			on_init = function(client)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})
	end

	}
}
