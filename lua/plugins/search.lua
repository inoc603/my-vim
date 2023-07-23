return {
    -- Fuzzy finder
    {
        'junegunn/fzf.vim',
        dependencies = { 'junegunn/fzf' },
        config = function()
            vim.g.fzf_layout = { window = { height = 0.8, width = 0.8 } }
            vim.cmd [[ let $FZF_DEFAULT_OPTS = '--reverse' ]]
            local n = function(l, r)
                vim.keymap.set("n", l, r, { silent = true })
            end

            vim.cmd [[ command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0) ]]

            n("<leader>a", ":Ag<CR>")
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        -- tag = '0.1.1',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'tom-anders/telescope-vim-bookmarks.nvim',
            'MattesGroeger/vim-bookmarks',
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim" -- add this value
        },
        config = function()
            local builtin = require('telescope.builtin')
            local n = function(l, r)
                vim.keymap.set("n", l, r, { silent = true })
            end

            local project_files = function()
                local opts = {} -- define here if you want to define something
                vim.fn.system('git rev-parse --is-inside-work-tree')
                if vim.v.shell_error == 0 then
                    builtin.git_files(opts)
                else
                    builtin.find_files(opts)
                end
            end

            n('<C-p>', project_files)
            n('<leader>p', builtin.find_files)
            n('<leader><leader>a', builtin.live_grep)
            -- n('<leader>a', function()
            --     builtin.grep_string {
            --         shorten_path = true,
            --         word_match = "-w",
            --         only_sort_text = true,
            --         search = '',
            --     }
            -- end)
            n('<leader>fb', builtin.buffers)
            n('<leader>rp', builtin.grep_string)

            n('<leader>ll', builtin.lsp_dynamic_workspace_symbols)

            local search_lsp_symbols = function(symbol)
                return function()
                    builtin.lsp_dynamic_workspace_symbols({ symbols = symbol })
                end
            end

            n('<leader>lf', search_lsp_symbols("function"))
            n('<leader>lm', search_lsp_symbols("method"))
            n('<leader>lv', search_lsp_symbols("variable"))

            require('telescope').load_extension('vim_bookmarks')

            local extensions = require('telescope').extensions

            n('<leader>m', function()
                extensions.vim_bookmarks.all {
                    attach_mappings = function(_, map)
                        map('n', 'dd', extensions.vim_bookmarks.actions.delete_selected_or_at_cursor)
                        return true
                    end
                }
            end)
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
            'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release &&' ..
            'cmake --build build --config Release &&' ..
            'cmake --install build --prefix build'
    },
    'tpope/vim-abolish', -- Search and replace
}
