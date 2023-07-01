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

                -- if client.server_capabilities.document_highlight then
                --     vim.cmd([[
                --         augroup lsp_document_highlight
                --             autocmd! * <buffer>
                --             autocmd! CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                --             autocmd! CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                --         augroup END
                --     ]])
                -- end
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
            signs = true,
            update_in_insert = false,
        })

        vim.lsp.protocol.CompletionItemKind = {
            "   (Text) ",
            "   (Method)",
            "   (Function)",
            "   (Constructor)",
            " ﴲ  (Field)",
            "   (Variable)",
            "   (Class)",
            " ﰮ  (Interface)",
            "   (Module)",
            " 襁 (Property)",
            "   (Unit)",
            "   (Value)",
            " 練 (Enum)",
            "   (Keyword)",
            "   (Snippet)",
            "   (Color)",
            "   (File)",
            "   (Reference)",
            "   (Folder)",
            "   (EnumMember)",
            " ﲀ  (Constant)",
            " ﳤ  (Struct)",
            "   (Event)",
            "   (Operator)",
            "   (TypeParameter)",
        }

        local lsp = require("lspconfig")

        -- Python
        lsp.pylsp.setup({
            capabilities = create_capabilities(),
        })

        -- Markdown
        lsp.marksman.setup({
            capabilities = create_capabilities(),
        })

        -- LaTeX
        lsp.texlab.setup({
            capabilities = create_capabilities(),
        })

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
        lsp.rnix.setup({
            capabilities = create_capabilities(),
        })

        -- -- CSS
        -- lsp.tailwindcss.setup({
        --     capabilities = create_capabilities(),
        -- })

        -- Julia
        -- https://github.com/fredrikekre/.dotfiles/blob/master/.config/nvim/init.vim#L73-L91
        local REVISE_LANGUAGESERVER = false
        lsp.julials.setup({
            on_new_config = function(new_config, _)
                local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
                -- local julia = vim.fn.expand("/usr/bin/julia")
                if REVISE_LANGUAGESERVER then
                    new_config.cmd[5] = (new_config.cmd[5]):gsub(
                        "using LanguageServer",
                        "using Revise; using LanguageServer; if isdefined(LanguageServer, :USE_REVISE); LanguageServer.USE_REVISE[] = true; end"
                    )
                elseif require("lspconfig").util.path.is_file(julia) then
                    new_config.cmd[1] = julia
                end
            end,
            -- This just adds dirname(fname) as a fallback (see nvim-lspconfig#1768).
            root_dir = function(fname)
                local util = require("lspconfig.util")
                return util.root_pattern("Project.toml")(fname)
                    or util.find_git_ancestor(fname)
                    or util.path.dirname(fname)
            end,
            capabilities = create_capabilities(),
        })

        -- Lua
        lsp.lua_ls.setup({
            capabilities = create_capabilities(),
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",

                        -- -- Setup your lua path
                        -- path = runtime_path,
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })
    end,
}
