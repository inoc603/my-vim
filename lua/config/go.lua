local use = require("packer").use

vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_generate_tags  = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_methods = 1
vim.g.go_def_mapping_enabled = 0
vim.g.go_fmt_autosave = 1
vim.g.go_echo_command_info = 0

use {
    'fatih/vim-go',
    ft = { 'go', 'gomod' },
}

-- visual code coverage
use {
    'andythigpen/nvim-coverage',
    requires = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require("coverage").setup({
            commands = true, -- create commands
            highlights = {
                covered = { fg = "#c3e88d", bg = "#3c3836" },
                uncovered = { fg = "#f07178", bg = "#3c3836" },
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
    end
}
