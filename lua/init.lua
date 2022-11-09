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
-- FIXME: The following code actually does not work at all. Because I config
-- every package with the config option of packer.nvim, which only run once
-- when the package is loaded, even if I reload my config module, the config
-- function will not be reloaded or re-run. For now we'll just restart nvim
-- every time and run PackerCompile to see the changes tak effect.
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "{lua/config/*.lua}",
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

if (vim.fs.find("~/.local/share/venv/neovim/bin/python3"))
then
    vim.g.python3_host_prog = "~/.local/share/venv/neovim/bin/python"
    vim.g.python_host_prog = "~/.local/share/venv/neovim/bin/python"
    vim.g.loaded_ruby_provider = 0
    vim.g.loaded_node_provider = 0
    vim.g.loaded_perl_provider = 0
end

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
require("config.treesitter")
