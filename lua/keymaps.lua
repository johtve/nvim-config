-- Telescope
local telescope_builtin = require('telescope.builtin')
local telescope_actions = require('telescope.actions')

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
-- Telescope file browser
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>")

-- Autocompletion
local cmp = require('cmp')
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Scroll up and down in the completion documentation
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),

		['<C-j>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
		['<C-k>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
	})
})


-- Code actions (LSP code fixes)
vim.keymap.set('n', '<leader>fx', vim.lsp.buf.code_action, {})



-- ToggleTerm
vim.api.nvim_set_keymap('n', '<C-t>', ':ToggleTerm<CR>', { noremap = true, silent = true })
-- Make it easy to exit terminal
vim.api.nvim_set_keymap('t', '<esc>', [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap('t', '<C-t>', [[<esc> <C-\><C-n> :ToggleTerm <CR>]], { noremap = true })




-- CopilotChat
vim.api.nvim_set_keymap('n', '<leader>cq',
	":lua local input = vim.fn.input('Quick Chat: '); if input ~= '' then require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer }) end<CR>",
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cc', ':CopilotChatToggle<CR>', { noremap = true, silent = true })
