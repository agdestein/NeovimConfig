return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-cmdline",
        "petertriho/cmp-git",
        "kdheepak/cmp-latex-symbols",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lua",
        -- "hrsh7th/cmp-omni",
        "hrsh7th/cmp-path",
        "f3fora/cmp-spell",
        "lukas-reineke/cmp-rg",
        "onsails/lspkind-nvim",
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        lspkind.init()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,noselect",
                -- autocomplete = false,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = {
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.close(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }, { "i", "c" }),
                ["<tab>"] = cmp.config.disable,
            },

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            formatting = {
                format = lspkind.cmp_format({
                    with_text = true,
                    menu = {
                        luasnip = "[snip]",
                        nvim_lsp = "[LSP]",
                        buffer = "[buf]",
                        path = "[path]",
                        spell = "[spell]",
                        treesitter = "[TS]",
                        -- calc = "[calc]",
                        -- omni = "[omni]",
                        latex_symbols = "[tex]",
                        -- emoji = "[emoji]",
                        rg = "[rg]",
                    },
                }),
            },

            sources = {
                { name = "path" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "latex_symbols" },
                { name = "luasnip" },
                { name = "nvim_lua" },
                { name = "nvim_lsp" },
                { name = "nvim_lsp_lsp_signature_help" },
                -- { name = "calc" },
                -- { name = "omni" },
                { name = "buffer" },
                { name = "rg", keyword_length = 3 },
                { name = "spell" },
            },

            -- view = {
            --     entries = "native",
            -- },

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
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })
    end,
}
