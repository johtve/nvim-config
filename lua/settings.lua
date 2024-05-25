-- Set colorscheme
vim.cmd.colorscheme('ofirkai')
-- Enable line numbering
vim.cmd("set number")
-- Hightlight matching parentheses
vim.cmd("DoMatchParen")
-- Smart case sensitivity when searching (insensitive when all lowercase)
vim.cmd("set smartcase")

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
