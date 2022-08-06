local use = require("packer").use

vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_methods = 1

use {
    'fatih/vim-go',
    {
        ft = { 'go', 'gomod' },
    }
}
