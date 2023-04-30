return {

    -- {
    --     "folke/noice.nvim",
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         -- { "rcarriga/nvim-notify", opts = { animate = false } },
    --     },
    -- },

    -- "nvim-lua/popup.nvim",
    -- "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    -- "akinsho/bufferline.nvim",

    -- {
    --     "freddiehaddad/feline.nvim",
    --     opts = {
    --         -- theme = "gruvbox",
    --     },
    -- },

    "folke/which-key.nvim",
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- { "j-hui/fidget.nvim", opts = {} },
            { "folke/neodev.nvim", opts = {} },

            {
                "SmiteshP/nvim-navbuddy",
                dependencies = {
                    "SmiteshP/nvim-navic",
                    "MunifTanjim/nui.nvim",
                },
                config = function()
                    require("nvim-navbuddy").setup({ lsp = { auto_attach = true } })
                    vim.keymap.set("n", "<Leader>an", ":Navbuddy<CR>")
                end,
            },
        },
    },

    { "numToStr/Comment.nvim", opts = {} },
    { "TimUntersberger/neogit", opts = { disable_commit_confirmation = true } },
    "ggandor/leap.nvim",
    { "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
            return vim.fn.executable("make") == 1
        end,
    },
    "nvim-telescope/telescope-bibtex.nvim",

    -- "monaqa/dial.nvim",
    "chiel92/vim-autoformat",
    "mjbrownie/swapit",
    "godlygeek/tabular",
    "norcalli/nvim-colorizer.lua",
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            -- signs = {
            --     add = { text = "│" },
            --     change = { text = "│" },
            --     delete = { text = "_" },
            --     topdelete = { text = "‾" },
            --     changedelete = { text = "~" },
            --     untracked = { text = "┆" },
            -- },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
                -- Options passed to nvim_open_win
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
            yadm = {
                enable = false,
            },
        },
    },
    -- {
    --     "kyazdani42/nvim-tree.lua",
    --     version = "nightly",
    --     opts = {},
    -- },
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    { "folke/todo-comments.nvim", opts = {} },
    "L3MON4D3/LuaSnip",
    "akinsho/toggleterm.nvim",
    "Vigemus/iron.nvim",
    "LnL7/vim-nix",
    "dag/vim-fish",
    "cespare/vim-toml",
    "lervag/vimtex",
    "JuliaEditorSupport/julia-vim",
    "andreypopp/julia-repl-vim",
    -- "kdheepak/JuliaFormatter.vim",
    "elkowar/yuck.vim",
    "preservim/vim-markdown",
    -- "davidgranstrom/nvim-markdown-preview",
    { dir = "$HOME/projects/nvim-markdown-preview" },
    "ron-rs/ron.vim",

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-cmdline",
            "petertriho/cmp-git",
            "kdheepak/cmp-latex-symbols",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            -- "hrsh7th/cmp-omni",
            "hrsh7th/cmp-path",
            "f3fora/cmp-spell",
            "lukas-reineke/cmp-rg",
        },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            char = "┊",
            show_trailing_blankline_indent = false,
        },
    },

    {
        "kiyoon/jupynium.nvim",
        build = "pip3 install --user .",
        -- build = "conda run --no-capture-output -n jupynium pip install .",
        -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
    },

    "stevearc/aerial.nvim",

    "duane9/nvim-rg",
    -- {
    --     "lukas-reineke/headlines.nvim",
    --
    --     opts = {
    --         markdown = {
    --             headline_highlights = {
    --                 "Headline1",
    --                 "Headline2",
    --                 "Headline3",
    --                 "Headline4",
    --                 "Headline5",
    --                 "Headline6",
    --             },
    --             codeblock_highlight = "CodeBlock",
    --             dash_highlight = "Dash",
    --             quote_highlight = "Quote",
    --         },
    --     },
    -- },
    "ellisonleao/gruvbox.nvim",
    { "catppuccin/nvim", name = "catppuccin" },
    "Mofiqul/dracula.nvim",
    "tanvirtin/monokai.nvim",
    "shaunsingh/nord.nvim",
    "navarasu/onedark.nvim",
    "folke/lsp-colors.nvim",
    "folke/tokyonight.nvim",

    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        build = ":TSUpdate",
    },
}
