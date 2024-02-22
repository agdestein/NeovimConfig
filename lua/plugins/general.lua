return {

    -- "nvim-lua/popup.nvim",
    -- "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    -- "akinsho/bufferline.nvim",

    { "mbbill/undotree", keys = { { "<Leader>au", ":UndotreeToggle<CR>", { silent = true } } } },

    { "tpope/vim-fugitive" },

    { "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        keys = {
            { "<Leader>g", ":Neogit<CR>" },
        },
        opts = { disable_commit_confirmation = true },
    },

    { "poljar/typos.nvim", enabled = false, event = { "BufEnter" }, opts = {} },

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
                -- gitcommit = false,
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

    -- "monaqa/dial.nvim",
    {
        "chiel92/vim-autoformat",
        cmd = "Autoformat",
        keys = { { "<Leader>af", ":Autoformat<CR>" } },
    },
    { "mjbrownie/swapit", event = "VeryLazy" },
    {
        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        keys = {
            { "<Leader>ac", ":ColorizerToggle<CR>" },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = { "TodoTrouble", "TodoTelescope", "TodoQuickFix" },
        event = { "BufReadPost", "BufNewFile" },
        keys = {
            { "<Leader>tl", ":TodoLocList<CR>" },
            { "<Leader>tq", ":TodoQuickFix<CR>" },
            { "<Leader>ts", ":TodoTelescope<CR>" },
        },
        opts = {},
    },

    { "L3MON4D3/LuaSnip", event = "InsertEnter" },
    { "LnL7/vim-nix", ft = "nix" },
    { "dag/vim-fish", ft = "fish" },
    { "cespare/vim-toml", ft = "toml" },
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

    {
        "JuliaEditorSupport/julia-vim",
        enabled = false,
        ft = "julia",
        keys = {
            { "<Leader>jb", ":call julia#toggle_function_blockassign()<CR>", "Toggle function block" },
        },
        config = function()
            vim.g.latex_to_unicode_tab = "off"
            vim.g.latex_to_unicode_auto = false
            vim.g.julia_indent_align_import = false
            vim.g.julia_indent_align_brackets = false
            vim.g.julia_indent_align_funcargs = false
            vim.cmd("hi link juliaParDelim Delimiter")
            vim.cmd("hi link juliaSemicolon Operator")
            vim.cmd("hi link juliaFunctionCall Identifier")
        end,
    },

    {
        "andreypopp/julia-repl-vim",
        keys = {
            { "<Leader>jc", ":JuliaREPLConnect<CR>", "Connect to remote Julia REPL", silent = true },
            { "<Leader>d", "}{jvip :JuliaREPLSend<CR> }", "Send region to remote Julia REPL", silent = true },
        },
    },

    -- {
    --     "kdheepak/JuliaFormatter.vim",
    --     keys = {
    --         { "<Leader>jf", ":JuliaFormatterFormat<CR>" },
    --     },
    --     config = function()
    --         vim.g.JuliaFormatter_use_sysimage = false
    --     end,
    -- },

    { "elkowar/yuck.vim", ft = "yuck" },

    { "godlygeek/tabular", cmd = "Tabularize" },

    {
        "preservim/vim-markdown",
        enabled = false,
        branch = "master",
        ft = "markdown",
        config = function()
            -- vim.g.vim_markdown_math = true
            vim.g.vim_markdown_auto_insert_bullets = false
            vim.g.vim_markdown_new_list_item_indent = false
            vim.g.vim_markdown_fenced_languages = { "bibtex=bib" }
            vim.g.vim_markdown_no_default_key_mappings = true
        end,
    },

    { "ron-rs/ron.vim", ft = "ron" },

    { "RRethy/vim-illuminate", event = { "BufReadPost", "BufNewFile" } },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        main = "ibl",
        opts = {
            -- indent = {
            --     char = "┊",
            -- },
            -- whitespace = { highlight = { "Whitespace", "NonText" } },
            scope = {
                enabled = false,
                exclude = { language = { "lua" } },
                show_start = false,
                show_end = false,
            },
        },
    },

    { "duane9/nvim-rg", cmd = "Rg" },

    {
        "edluffy/hologram.nvim",
        enabled = false,
        opts = {
            auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
        },
    },

    {
        "chrishrb/gx.nvim",
        event = { "BufEnter" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    -- paste an image to markdown from the clipboard
    -- :PasteImg,
    { "ekickx/clipboard-image.nvim", ft = "markdown", opts = {} },

    {
        "simrat39/symbols-outline.nvim",
        event = { "BufEnter" },
        keys = {
            { "<Leader>as", ":SymbolsOutline<CR>" },
        },
        opts = {},
    },

    {
        "Bekaboo/dropbar.nvim",
        enabled = false,
        opts = {},
    },

    {
        "topaxi/gh-actions.nvim",
        cmd = "GhActions",
        -- keys = {
        --     { "<leader>gh", "<cmd>GhActions<cr>", desc = "Open Github Actions" },
        -- },
        -- optional, you can also install and use `yq` instead.
        build = "make",
        dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
        opts = {},
    },

    {
        -- For use with Kitty
        "3rd/image.nvim",
        enabled = false,
        ft = "markdown",
        opts = {},
    },

    {
        "kaarmu/typst.vim",
        enabled = false,
        ft = "typst",
    },

    {
        "romgrk/barbar.nvim",
        enabled = false,
        dependencies = {
            "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
            "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
            auto_hide = true,
            -- highlight_visible = false,
        },
        -- version = "^1.0.0", -- optional: only update when a new 1.x version is released
    },

    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                mode = "tabs",
                always_show_bufferline = false,
                -- indicator = {
                --     style = "underline",
                -- }
            },
        },
    },
}
