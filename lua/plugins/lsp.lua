return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "j-hui/fidget.nvim", enabled = false, opts = {} },
        { "folke/neodev.nvim", opts = {} },
        {
            "SmiteshP/nvim-navbuddy",
            dependencies = {
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim",
            },
            opts = { lsp = { auto_attach = true } },
            cmd = "Navbuddy",
            keys = { { "<Leader>an", ":Navbuddy<CR>" } },
        },
    },
    config = function()
        -- Mappings
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
        vim.keymap.set("n", "<Leader>ke", vim.diagnostic.open_float, { desc = "Diagnostic open float" })
        vim.keymap.set("n", "<Leader>kq", vim.diagnostic.setloclist, { desc = "Diagnostic set location list" })

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                vim.keymap.set("n", "<leader>kc", vim.lsp.buf.code_action, { desc = "Code action", buffer = ev.buf })
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration", buffer = ev.buf })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition", buffer = ev.buf })
                vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = "Type definition", buffer = ev.buf })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = ev.buf })
                vim.keymap.set("n", "<leader>kf", vim.lsp.buf.format, { desc = "Format", buffer = ev.buf })
                vim.keymap.set(
                    "n",
                    "<leader>ki",
                    vim.lsp.buf.implementation,
                    { desc = "Implementation", buffer = ev.buf }
                )
                vim.keymap.set(
                    "n",
                    "<leader>kk",
                    vim.lsp.buf.signature_help,
                    { desc = "Signature help", buffer = ev.buf }
                )
                vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References", buffer = ev.buf })
                vim.keymap.set("n", "<leader>kr", vim.lsp.buf.rename, { desc = "Rename", buffer = ev.buf })
                vim.keymap.set(
                    "n",
                    "<leader>kt",
                    vim.lsp.buf.type_definition,
                    { desc = "Type definition", buffer = ev.buf }
                )
                vim.keymap.set(
                    "n",
                    "<leader>kwa",
                    vim.lsp.buf.add_workspace_folder,
                    { desc = "Add workspace folder", buffer = ev.buf }
                )
                vim.keymap.set(
                    "n",
                    "<leader>kwr",
                    vim.lsp.buf.remove_workspace_folder,
                    { desc = "Remove workspace folder", buffer = ev.buf }
                )
                vim.keymap.set("n", "<leader>kwl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, { desc = "List workspace folders", buffer = ev.buf })
            end,
        })

        local function create_capabilities()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            capabilities.textDocument.completion.completionItem.preselectSupport = true
            capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
            capabilities.textDocument.completion.completionItem.deprecatedSupport = true
            capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
            capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
            capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
            capabilities.textDocument.completion.completionItem.resolveSupport = {
                properties = { "documentation", "detail", "additionalTextEdits" },
            }
            capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown" }
            capabilities.textDocument.codeAction = {
                dynamicRegistration = true,
                codeActionLiteralSupport = {
                    codeActionKind = {
                        valueSet = (function()
                            local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
                            table.sort(res)
                            return res
                        end)(),
                    },
                },
            }
            require("cmp_nvim_lsp").default_capabilities(capabilities)
            return capabilities
        end

        -- Disable virtual text (recommended for julia)
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
            underline = false,
            signs = false,
            update_in_insert = false,
        })

        local lsp = require("lspconfig")

        -- Python
        lsp.pylsp.setup({ capabilities = create_capabilities() })

        -- Markdown
        lsp.marksman.setup({ capabilities = create_capabilities() })

        -- Matlab
        lsp.matlab_ls.setup({ capatilities = create_capabilities() })

        -- Fortran
        lsp.fortls.setup({ capabilities = create_capabilities() })

        -- LaTeX
        lsp.texlab.setup({ capabilities = create_capabilities() })

        -- Rust
        lsp.rust_analyzer.setup({
            capabilities = create_capabilities(),
            cmd = {
                "rustup",
                "run",
                "stable",
                "rust-analyzer",
            },
        })

        -- Nix
        lsp.rnix.setup({ capabilities = create_capabilities() })

        lsp.yamlls.setup({ capabilities = create_capabilities() })

        -- Julia
        -- https://github.com/fredrikekre/.dotfiles/blob/master/.config/nvim/init.vim#L73-L91
        lsp.julials.setup({
            capabilities = create_capabilities(),
            settings = {
                julia = {
                    symbolCacheDownload = true,
                    lint = {
                        -- missingrefs = "all",
                        missingrefs = "none",
                        iter = true,
                        lazy = true,
                        modname = true,
                    },
                },
            },
        })

        -- Lua
        lsp.lua_ls.setup({
            capabilities = create_capabilities(),
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
                    return
                end

                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            -- Make the server aware of Neovim runtime files
                            vim.env.VIMRUNTIME
                            -- Depending on the usage, you might want to add additional paths here.
                            -- "${3rd}/luv/library"
                            -- "${3rd}/busted/library",
                        }
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                        -- library = vim.api.nvim_get_runtime_file("", true)
                    }
                })
            end,
            settings = {
                Lua = {}
            }
        })
    end,
}
