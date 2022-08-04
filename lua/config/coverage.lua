require("coverage").setup({
    commands = true, -- create commands
    highlights = {
        covered = { fg = "#C3E88D", bg = "#3c3836" },
        uncovered = { fg = "#F07178", bg = "#3c3836" },
    },
    signs = {
        -- use your own highlight groups or text markers
        covered = { hl = "CoverageCovered", text = "▎" },
        uncovered = { hl = "CoverageUncovered", text = "▎" },
    },
})

vim.api.nvim_set_keymap('n', '<leader>c', ':Coverage<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><leader>c', ':CoverageHide<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><leader>s', ':CoverageSummary<CR>', { noremap = true })
