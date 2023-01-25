return require("config.module").export(function(use)

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',

            'SirVer/ultisnips',
            'quangnguyen30192/cmp-nvim-ultisnips',
        },
        config = function()
            local cmp = require('cmp')

            -- sumneko_lua will complain about nil check
            if cmp == nil then
                return
            end

            local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body)
                    end,
                },
                completion = {
                    completeopt = "menuone,noinsert,noselect",
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-y>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
                    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
                    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
                    ["<Tab>"] = cmp.mapping(
                        function(fallback)
                            cmp_ultisnips_mappings.compose { "select_next_item", "jump_forwards" } (fallback)
                        end,
                        { "i", "s" }
                    ),
                    ["<S-Tab>"] = cmp.mapping(
                        function(fallback)
                            cmp_ultisnips_mappings.compose { "select_prev_item", "jump_backwards" } (fallback)
                        end,
                        { "i", "s" }
                    ),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'ultisnips' },
                    { name = 'nvim_lsp_signature_help' },
                }, {
                    { name = 'buffer' },
                })
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'cmp_git' },
                }, {
                    { name = 'buffer' },
                })
            })

            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end
    }

end)
