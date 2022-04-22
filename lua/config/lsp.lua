local lsp = require("lspconfig")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
WhichKey.register({
    ["[d"] = { vim.diagnostic.goto_prev, "Previous diagnostic" },
    ["]d"] = { vim.diagnostic.goto_next, "Next diagnostic" },
    ["<space>ke"] = { vim.diagnostic.open_float, "Diagnostic open float" },
    ["<space>kq"] = { vim.diagnostic.setloclist, "Diagnostic set location list" },
}, { noremap = true, silent = true })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    WhichKey.register({
        K = { vim.lsp.buf.hover, "Hover" },
        ["<leader>k"] = {
            name = "LSP",
            c = { vim.lsp.buf.code_action, "Code action" },
            d = { vim.lsp.buf.definition, "Definition" },
            D = { vim.lsp.buf.declaration, "Declaration" },
            f = { vim.lsp.buf.formatting, "Formatting" },
            i = { vim.lsp.buf.implementation, "Implementation" },
            k = { vim.lsp.buf.signature_help, "Signature help" },
            r = { vim.lsp.buf.references, "References" },
            R = { vim.lsp.buf.rename, "Rename" },
            t = { vim.lsp.buf.type_definition, "Type definition" },
            w = {
                name = "Workspace",
                a = { vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
                r = { vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
                l = {
                    function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end,
                    "List workspace folders",
                },
            },
        },
    }, { noremap = true, buffer = bufnr, silent = true })

    if client.resolved_capabilities.document_highlight then
        vim.cmd([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd! CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd! CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]])
    end
end

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
    return capabilities
end

-- disable virtual text (recommended for julia)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
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

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pylsp", "julials", "texlab" }
for _, server in pairs(servers) do
    lsp[server].setup({
        on_attach = on_attach,
        capabilities = create_capabilities(),
    })
end

lsp.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = create_capabilities(),
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
    },
})
