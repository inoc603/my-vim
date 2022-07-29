require("coverage").setup({
	commands = true, -- create commands
	highlights = {
		covered = {
			ctermfg="Green",
		},
		uncovered = {
			ctermfg="Red",
		},
		summary_normal = {
			link = "NONE",
		},
	},
	signs = {
		-- use your own highlight groups or text markers
		covered = { hl = "CoverageCovered", text = "▎" },
		uncovered = { hl = "CoverageUncovered", text = "▎" },
	},
	summary = {
		-- customize the summary pop-up
		min_coverage = 80.0,      -- minimum coverage threshold (used for highlighting)
	},
})

vim.api.nvim_set_keymap('n', '<leader>c', ':Coverage<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><leader>c', ':CoverageHide<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><leader>s', ':CoverageSummary<CR>', {noremap = true})

