local use = require("packer").use

use 'tpope/vim-sensible'

-- More text objects
use 'wellle/targets.vim'

-- Indent guide
vim.g.indent_guides_start_level = 2
vim.g.indent_guides_guide_size = 1
use 'nathanaelkane/vim-indent-guides'

-- Auto pairs parenthesis
use 'jiangmiao/auto-pairs'

-- Makes moving aroung easier
use 'easymotion/vim-easymotion'

-- Edit surrounds with ease
use 'tpope/vim-surround'

-- Code comment
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup {
            ---LHS of toggle mappings in NORMAL + VISUAL mode
            toggler = {
                line = '<leader>n',
                block = 'gbc',
            },

            mappings = {
                extra = false,
            },
        }
    end
}

-- Multicursor editing
vim.g.multi_cursor_exit_from_insert_mode = 0
use 'terryma/vim-multiple-cursors'

-- Code alignment
use {
    'junegunn/vim-easy-align',
    config = function()
        vim.keymap.set({ "n", "v" }, "ga", "<Plug>(EasyAlign)")
    end
}

-- Editorconfig
use 'editorconfig/editorconfig-vim'

-- Visual color codes
use {
    'norcalli/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup()
    end,
}
