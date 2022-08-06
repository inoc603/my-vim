local packer = require("packer")
local use = packer.use

packer.init({
    display = {
        open_fn = require('packer.util').float,
    },
})

use 'wbthomason/packer.nvim'

local packer_group = vim.api.nvim_create_augroup("packer_user_config", { clear = true })

-- automatically run PackerCompile when configuration changes
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "{lua/config/*.lua,lua/init.lua}",
    callback = function()
        packer.compile()
    end,
    group = packer_group,
})

use 'morhetz/gruvbox'
vim.cmd [[ 
    set termguicolors
    colorscheme gruvbox
]]

require("config.edit")
require("config.git")
require("config.tmux")
require("config.search")
require("config.explorer")
require("config.cmp")
require("config.lualine")
require("config.lsp")
require("config.go")
require("config.lang")
