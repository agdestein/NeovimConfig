local luasnip = require("luasnip")
local cmp = require("cmp")

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    completion = {
        completeopt = "menu,menuone,noselect",
        -- autocomplete = false,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }, { "i", "c" }), -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<tab>"] = cmp.config.disable,
    },

    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    -- formatting = {
    --     format = lspkind.cmp_format({
    --         with_text = true,
    --         -- menu = {
    --         --     buffer = "[buf]",
    --         --     nvim_lsp = "[LSP]",
    --         --     path = "[path]",
    --         -- },
    --     }),
    -- },

    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        -- { name = "copilot" },
        { name = "latex_symbols" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        -- { name = "calc" },
        -- { name = "omni" },
        { name = "buffer" },
    },

    -- view = { entries = native },
    experimental = {
        ghost_text = true,
    },
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = "buffer" },
    }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

-- WhichKey.register({
--     ["<C-]>"] = { "<C-x><C-]>", "" },
--     ["<C-f>"] = { "<C-x><C-f>", "" },
--     ["<C-d>"] = { "<C-x><C-d>", "" },
--     ["<C-l>"] = { "<C-x><C-l>", "" },
-- }, { mode = "i", expr = true, noremap = true})

-- vim.api.nvim_set_keymap("i", "^]", "^X^]", { noremap = true, expr = true, silent = true })
-- vim.api.nvim_set_keymap("i", "^F", "^X^F", { noremap = true, expr = true, silent = true })
-- vim.api.nvim_set_keymap("i", "^D", "^X^D", { noremap = true, expr = true, silent = true })
-- vim.api.nvim_set_keymap("i", "^L", "^X^L", { noremap = true, expr = true, silent = true })
