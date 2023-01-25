return require("config.module").export(function(use)
    -- Show git diff
    use 'airblade/vim-gitgutter'
    -- Git intergration
    use 'tpope/vim-fugitive'
    -- Using tig in vim
    use {
        'iberianpig/tig-explorer.vim',
        config = function()
            -- open tig with Project root path
            vim.keymap.set("n", "<Leader>T", ":TigOpenProjectRootDir<CR>")
        end
    }
end)
