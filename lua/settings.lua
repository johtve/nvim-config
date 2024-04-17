-- Set colorscheme
vim.cmd.colorscheme('ofirkai')
-- Enable line numbering
vim.cmd("set number")
-- Hightlight matching parentheses
vim.cmd("DoMatchParen")

-- Enable indent folding
vim.o.foldmethod = 'indent'
-- Make nothing folded by default
vim.o.foldlevelstart = 99

-- LSP zero configuration
local lsp_zero = require('lsp-zero')


--- if you want to know more about lsp-zero and mason.nvim
--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		lsp_zero.default_setup,
	},
})




-- Telescope configuration
require("telescope").load_extension("file_browser")


-- Automatically enter insert mode on terminal open
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
	pattern = { "*" },
	callback = function()
		if vim.opt.buftype:get() == "terminal" then
			vim.cmd(":startinsert")
		end
	end
})



-- nvim-highlight-colors setup
vim.o.termguicolors = true
vim.o.t_Co = 256
require("nvim-highlight-colors").turnOn()


--[[ -- Illuminate setup
require("illuminate").configure({
	min_count_to_highlight = 2,
}) ]]


-- Copilot setup
--This needs to be ran. Figure out if it can be replaced with something in the plugin file
require("copilot").setup({})


-- Markdown specific settings
vim.cmd([[
	" autocmd FileType markdown setlocal spell
	autocmd FileType markdown set linebreak
	autocmd FileType markdown set breakindent
	autocmd FileType markdown set breakindentopt=shift:2
	autocmd FileType markdown lua vim.cmd(':Copilot disable')
	]])
