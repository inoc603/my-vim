return require("config.module").export(function(use)
    vim.g.fzf_layout = { window = { height = 0.8, width = 0.8 } }

    vim.cmd [[ let $FZF_DEFAULT_OPTS = '--reverse' ]]

    -- Fuzzy finder
    use {
        'junegunn/fzf.vim',
        requires = {
            'junegunn/fzf',
        },
        config = function()
            local n = function(l, r)
                vim.keymap.set("n", l, r, { silent = true })
            end

            n("<C-p>", ":GFiles<CR>")
            n("<Leader>p", ":Files<CR>")
            n("<Leader>a", ":Ag<CR>")
            n("<Leader>rp", [[:execute "Ag" expand("<cword>")<CR>]])
        end
    }

    use 'mileszs/ack.vim' -- Search in project
    use 'tpope/vim-abolish' -- Search and replace
end)
