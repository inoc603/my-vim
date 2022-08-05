local function keymap(mode, opts)
    return function(key, f)
        vim.keymap.set(mode, key, f, opts)
    end
end

require("nvim-tree").setup {
    filters = {
        custom = { '^.git' }
    },
    renderer = {
        highlight_git = true,
    },
}

do
    local n = keymap("n", { noremap = true, silent = true })
    n('<space>e', vim.diagnostic.open_float)
    n('<leader>j', vim.diagnostic.goto_prev)
    n('<leader>k', vim.diagnostic.goto_next)
    -- n('<space>q', vim.diagnostic.setloclist)
    --
    local nt_api = require("nvim-tree.api")

    n("<c-\\>", nt_api.tree.toggle)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions

    local n = keymap('n', { noremap = true, silent = true, buffer = bufnr })

    n('gD', vim.lsp.buf.declaration)
    n('gd', vim.lsp.buf.definition)
    n('K', vim.lsp.buf.hover)
    n('<space>D', vim.lsp.buf.type_definition)
    n('<space>rn', vim.lsp.buf.rename)
    n('<space>ca', vim.lsp.buf.code_action)


    local open = function(mode)
        return function()
            require("trouble").open({ mode = mode })
        end
    end

    n('gr', open("lsp_references"))
    n('gi', open("lsp_implementations"))
    n('<leader>d', open("document_diagnostics"))


    -- "<cmd>Trouble lsp_references<cr>"
    n('<space>f', vim.lsp.buf.formatting)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}


local lsp = require('lspconfig')

local cmp = require('cmp')

if cmp ~= nil then
    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
            { name = 'nvim_lsp_signature_help' },
        }, {
            { name = 'buffer' },
        })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
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



local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local function setup(server, server_opts)
    server_opts.on_attach = on_attach
    server_opts.flags = lsp_flags
    server_opts.capabilities = capabilities
    lsp[server].setup(server_opts)
end

setup("tsserver", {})

setup("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {}
    }
})

setup("sumneko_lua", {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
            format = {
                enable = true,
                -- NOTE: the value should be STRING!!
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "4",
                }
            },
        },
    },
})

setup("gopls", {
    cmd = { "gopls", "-remote=auto" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            memoryMode = "DegradeClosed"
        },
    },
})

require('dressing').setup({
    input = {
        winblend = 0,
    }
})

require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
