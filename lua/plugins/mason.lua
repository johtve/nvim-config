return {
	{ 'williamboman/mason.nvim',
		config = function ()
			--- if you want to know more about lsp-zero and mason.nvim
			--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
			local lsp_zero = require('lsp-zero')
			require('mason').setup({})
			require('mason-lspconfig').setup({
				handlers = {
					lsp_zero.default_setup,
				},
			})
		end
	},
	{ 'williamboman/mason-lspconfig.nvim' },
}
