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

use {
    'norcalli/nvim-colorizer.lua',

    config = function()
        require('colorizer').setup()
    end,
}

require("config.explorer")
require("config.cmp")
require("config.lsp")
require("config.lualine")
require("config.coverage")
