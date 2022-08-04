do
    local close_buffers = require("close_buffers")
    close_buffers.setup({})
    vim.api.nvim_create_user_command('Bdi', function()
        close_buffers.wipe({ type = 'hidden' })
    end, { force = true })
end

require("config.lsp")
require("config.lualine")
require("config.coverage")
