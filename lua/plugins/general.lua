return {

    { "tpope/vim-fugitive" },

    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        keys = {
            { "<Leader>g", ":Neogit<CR>", desc = "Neogit" },
        },
        opts = { disable_commit_confirmation = true },
    },

    { "poljar/typos.nvim", enabled = false, event = { "BufEnter" }, opts = {} },

    {
        "jpalardy/vim-slime",
        lazy = false,
        init = function()
            -- these two should be set before the plugin loads
            vim.g.slime_target = "neovim"
            vim.g.slime_no_mappings = true
        end,
        config = function()
            vim.g.slime_input_pid = false
            vim.g.slime_suggest_default = true
            vim.g.slime_menu_config = false
            vim.g.slime_neovim_ignore_unlisted = false

            -- called MotionSend but works with textobjects as well
            vim.keymap.set("n", "gs", "<Plug>SlimeMotionSend", { remap = true, silent = false })
            vim.keymap.set("n", "gss", "<Plug>SlimeLineSend", { remap = true, silent = false })
            vim.keymap.set("x", "gs", "<Plug>SlimeRegionSend", { remap = true, silent = false })
            vim.keymap.set("n", "gz", "<Plug>SlimeParagraphSend", { remap = true, silent = false })
            vim.keymap.set("n", "<Leader>az", "<Plug>SlimeConfig", { remap = true, silent = false })
            vim.keymap.set("n", "<C-CR>", ":SlimeSendCurrentLine<CR>j", {})
            vim.keymap.set("n", "<S-CR>", "}{jvip:SlimeSend<CR>}", {})
        end,
    },

    {
        "zbirenbaum/copilot.lua",
        event = { "BufEnter" },
        opts = {
            panel = {
                enabled = false,
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "<leader>gr",
                    open = "<M-CR>",
                },
                layout = {
                    position = "bottom", -- | top | left | right
                    ratio = 0.4,
                },
            },
            suggestion = {
                enabled = false,
                auto_trigger = false,
                debounce = 75,
                keymap = {
                    accept = "<M-l>",
                    accept_word = false,
                    accept_line = false,
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
            },
            filetypes = {
                -- yaml = false,
                markdown = true,
                -- help = false,
                gitcommit = true,
                -- gitrebase = false,
                -- hgcommit = false,
                -- svn = false,
                -- cvs = false,
                -- ["."] = false,
            },
            copilot_node_command = "node", -- Node.js version must be > 18.x
            server_opts_overrides = {},
        },
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },

    -- Increment Bools/Dates etc
    { "mjbrownie/swapit", event = "VeryLazy" },

    {
        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
    },

    { "L3MON4D3/LuaSnip", event = "InsertEnter" },
    {
        "lervag/vimtex",
        -- VimTeX should not be lazy loaded for reverse synctex to work
        lazy = false,
        ft = { "tex", "bib" },
        config = function()
            vim.g.vimtex_view_method = "zathura"
            -- vim.g.vimtex_view_method = "zathura_simple"
            -- vim.g.vimtex_view_method = "sioyek"
            vim.g.vimtex_quickfix_mode = "0"
            -- vim.g.vimtex_syntax_enabled = "0"
            vim.g.vimtex_compiler_latexmk = {
                options = {
                    "-pdf",
                    "-shell-escape",
                    "-verbose",
                    "-file-line-error",
                    "-synctex=1",
                    "-interaction=nonstopmode",
                },
            }
        end,
    },

    { "godlygeek/tabular", cmd = "Tabularize" },

    { "RRethy/vim-illuminate", event = { "BufReadPost", "BufNewFile" } },

    {
        "hedyhli/outline.nvim",
        cmd = { "Outline", "OutlineOpen" },
        keys = {
            { "<leader>as", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {},
    },

    {
        "Bekaboo/dropbar.nvim",
        enabled = false,
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "topaxi/gh-actions.nvim",
        cmd = "GhActions",
        build = "make",
        dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
        opts = {},
    },

}
