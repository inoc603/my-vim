return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },


    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {}
        end
    },

    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("symbols-outline").setup()
        end
    },


    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "jose-elias-alvarez/null-ls.nvim",
            'hrsh7th/cmp-nvim-lsp',
            'folke/trouble.nvim',
            'simrat39/symbols-outline.nvim',
        },
        config = function()
            local trouble = require("trouble")

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format { async = false }
                    end
                })

                local opts = { buffer = bufnr }

                -- format the file
                vim.keymap.set("n", '<leader>f', function() vim.lsp.buf.format { timeout_ms = 5000 } end, opts)
                -- open floating window at cursor
                vim.keymap.set("n", '<leader>e', vim.diagnostic.open_float, opts)
                -- go to the next diagnostic
                vim.keymap.set("n", '<leader>k', vim.diagnostic.goto_next, opts)
                -- go to the previous diagnostic
                vim.keymap.set("n", '<leader>j', vim.diagnostic.goto_prev, opts)
                -- go to type definition
                vim.keymap.set("n", 'gD', vim.lsp.buf.type_definition, opts)
                -- go to definition
                vim.keymap.set("n", 'gd', vim.lsp.buf.definition, opts)
                -- show document for object at the current position
                vim.keymap.set("n", 'K', vim.lsp.buf.hover, opts)
                -- rename the object at the current opsition
                vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename, opts)
                -- bring up code actions for the current position
                vim.keymap.set("n", '<leader>ca', vim.lsp.buf.code_action, opts)


                local open = function(mode)
                    return function()
                        trouble.open({ mode = mode })
                    end
                end

                -- show references for the current object
                vim.keymap.set("n", 'gr', open("lsp_references"), opts)
                -- show implementations for the current interface
                vim.keymap.set("n", 'gi', open("lsp_implementations"), opts)
                -- show all diagnostics
                vim.keymap.set("n", '<leader>d', open("document_diagnostics"), opts)
                vim.keymap.set("n", '<leader>D', open("workspace_diagnostics"), opts)
                -- close the trouble window
                vim.keymap.set("n", '<leader><leader>d', trouble.close, opts)
            end

            local lsp = require('lspconfig')

            local capabilities = require('cmp_nvim_lsp').default_capabilities(
                vim.lsp.protocol.make_client_capabilities()
            )

            local function setup(server, server_opts)
                server_opts.on_attach = on_attach
                server_opts.flags = {
                    -- this is the default in Nvim 0.7+
                    debounce_text_changes = 150,
                }
                if not server_opts.capabilities then
                    server_opts.capabilities = capabilities
                end
                lsp[server].setup(server_opts)
            end

            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.diagnostics.buf,
                    null_ls.builtins.formatting.buf,
                    null_ls.builtins.formatting.sqlfluff.with({
                        extra_args = { "--dialect", "mysql" }, -- change to your dialect
                    }),
                    null_ls.builtins.diagnostics.sqlfluff.with({
                        extra_args = { "--dialect", "mysql" }, -- change to your dialect
                    }),
                },
                on_attach = on_attach,
            })

            setup("tsserver", {})

            setup("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {}
                }
            })

            setup("lua_ls", {
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = {
                                'vim', -- neovim
                                'hs'   -- hammerspoon
                            },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
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
                        memoryMode = "DegradeClosed",
                        gofumpt = true,
                    },
                },
            })

            setup("vuels", {})

            setup("graphql", {})

            local path = require('lspconfig/util').path

            local function get_python_path(workspace)
                -- Use activated virtualenv.
                if vim.env.VIRTUAL_ENV then
                    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
                end

                -- Use the python from venv configured in pyrightconfig.json
                if vim.fn.filereadable(path.join(workspace, "pyrightconfig.json")) then
                    local conf = vim.fn.json_decode(vim.fn.readfile(path.join(workspace, "pyrightconfig.json")))
                    local python_from_pyrightconfig_json = path.join(workspace, conf["venvPath"], conf["venv"],
                        "bin/python")
                    if vim.fn.executable(python_from_pyrightconfig_json) then
                        return python_from_pyrightconfig_json
                    end
                end

                return ""
            end

            setup("pyright", {
                before_init = function(_, config)
                    local python_path = get_python_path(config.root_dir)
                    if python_path ~= '' then
                        config.settings.python.pythonPath = python_path
                    end
                end
            })

            setup("bufls", {})
        end
    },

    {
        'stevearc/dressing.nvim',
        config = function()
            require('dressing').setup {
                input = {
                    win_options = {
                        winblend = 0,
                    }
                }
            }
        end
    },
}
