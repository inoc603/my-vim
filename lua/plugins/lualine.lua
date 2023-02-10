return {
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            local gruvbox = require 'lualine.themes.gruvbox'

            -- set the backgroud color of the buffer line and status line in insert
            -- and command mode to the same color as normal mode so they don't flash
            -- that much when switching mode and saving files.
            gruvbox.insert.c.bg = gruvbox.normal.c.bg
            gruvbox.command.c.bg = gruvbox.normal.c.bg

            require('lualine').setup({
                options = {
                    icons_enabled = false,
                    theme = 'gruvbox',
                    component_separators = { left = '|', right = '|' },
                    section_separators = { left = ' ', right = ' ' },
                    always_divide_middle = true,
                    globalstatus = false,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {
                        { 'filename', path = 1 }, -- relative path
                    },
                    lualine_x = { 'encoding', 'filetype' },
                    lualine_y = {},
                    lualine_z = { 'location' }
                },
                tabline = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {
                        {
                            'buffers',
                            show_filename_only = false, -- show shortened relative path
                            buffers_color = {
                                active = { fg = gruvbox.normal.a.fg, bg = gruvbox.normal.a.bg },
                                inactive = 'lualine_c_inactive',
                            },
                            symbols = {
                                alternate_file = '', -- don't identify the alternate file
                            },
                        },
                    },
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                }
            })
        end
    }
}
