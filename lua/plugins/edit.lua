return {
    'tpope/vim-sensible',

    -- More text objects
    'wellle/targets.vim',

    {
        'nathanaelkane/vim-indent-guides',
        config = function()
            -- Indent guide
            vim.g.indent_guides_start_level = 2
            vim.g.indent_guides_guide_size = 1
        end
    },

    -- Auto pairs parenthesis
    'jiangmiao/auto-pairs',

    {
        'ggandor/leap.nvim',
        config = function()
            vim.keymap.set({ "n" }, "<leader>s", "<Plug>(leap-forward-to)")
            vim.keymap.set({ "n" }, "<leader><leader>s", "<Plug>(leap-backward-to)")
        end
    },

    -- Edit surrounds with ease
    'tpope/vim-surround',

    -- Code comment
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                mappings = false,
            })

            -- <leader>n to toggle comments for the current line in normal mode
            vim.keymap.set("n", "<leader>n", function()
                require("Comment.api").toggle.linewise.current()
            end)

            -- <leader>n to toggle comments for the selected lines in visual mode
            vim.keymap.set('x', '<leader>n', '<Plug>(comment_toggle_linewise_visual)')
        end
    },

    -- Multicursor editing
    {
        'terryma/vim-multiple-cursors',
        config = function()
            vim.g.multi_cursor_exit_from_insert_mode = 0
        end
    },

    -- Code alignment
    {
        'junegunn/vim-easy-align',
        config = function()
            vim.keymap.set({ "n", "v" }, "ga", "<Plug>(EasyAlign)")
        end
    },

    -- Editorconfig
    'editorconfig/editorconfig-vim',

    -- Visual color codes
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    }
}
