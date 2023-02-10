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

            n("<C-p>", ":GFiles<CR>")
            n("<Leader>p", ":Files<CR>")
            n("<Leader>a", ":Ag<CR>")
            n("<Leader>rp", [[:execute "Ag" expand("<cword>")<CR>]])
        end
    },

    'mileszs/ack.vim', -- Search in project
    'tpope/vim-abolish', -- Search and replace
}
