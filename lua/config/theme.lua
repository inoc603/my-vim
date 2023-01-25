return require("config.module").export(function(use)
    use {
        "morhetz/gruvbox",
        config = function()
            vim.cmd [[ 
                set termguicolors
                colorscheme gruvbox
            ]]
        end
    }
end)
