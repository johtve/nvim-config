-- Set colorscheme
vim.cmd.colorscheme('catppuccin-macchiato')
-- Enable line numbering
vim.cmd("set number")
-- Hightlight matching parentheses
vim.cmd("DoMatchParen")
-- Smart case sensitivity when searching (insensitive when all lowercase)
vim.cmd("set smartcase")
-- Automatic format on write
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]


-- Enable indent folding
vim.o.foldmethod = 'indent'
-- Make nothing folded by default
vim.o.foldlevelstart = 99

-- Terminal color setup stuff
vim.o.termguicolors = true

-- Automatically enter insert mode on terminal open
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
	pattern = { "*" },
	callback = function()
		if vim.opt.buftype:get() == "terminal" then
			vim.cmd(":startinsert")
		end
	end
})

-- Markdown specific settings
vim.cmd([[
	" autocmd FileType markdown setlocal spell
	autocmd FileType markdown set linebreak
	autocmd FileType markdown set breakindent
	autocmd FileType markdown set breakindentopt=shift:2
	" autocmd FileType markdown lua vim.cmd(':Copilot disable')
	]])


-- LSP setup
-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lspconfig_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	end,
})


local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'luasnip' },
		{ name = 'copilot' },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			-- My current nerd font doesn't support the actual Copilot symbol
			symbol_map = { Copilot = "" }
		}),
	},
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})
