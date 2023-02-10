return {
    {
        -- Seamless navigation in vim and tmux panel
        'christoomey/vim-tmux-navigator',
        init = function()
            vim.g.tmux_navigator_no_mappings = 1
            vim.g.tmux_navigator_save_on_switch = 0
        end,
        config = function()
            local n = function(l, r)
                vim.keymap.set("n", l, r, { silent = true })
            end

            n("<C-h>", ":TmuxNavigateLeft<cr>")
            n("<C-j>", ":TmuxNavigateDown<cr>")
            n("<C-k>", ":TmuxNavigateUp<cr>")
            n("<C-l>", ":TmuxNavigateRight<cr>")
        end
    }
}
