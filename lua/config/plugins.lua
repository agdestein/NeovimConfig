local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- {
    --     "folke/noice.nvim",
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         -- { "rcarriga/nvim-notify", opts = { animate = false } },
    --     },
    -- },

    -- "nvim-lua/popup.nvim",
    -- "nvim-lua/plenary.nvim",
    -- "kyazdani42/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    -- "akinsho/bufferline.nvim",
    "folke/which-key.nvim",
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "j-hui/fidget.nvim", opts = {} },
            { "folke/neodev.nvim", opts = {} },
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

    "chiel92/vim-autoformat",
    "mjbrownie/swapit",
    "godlygeek/tabular",
    "norcalli/nvim-colorizer.lua",
    { "lewis6991/gitsigns.nvim", opts = {} },
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
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    { "folke/todo-comments.nvim", opts = {} },
    "L3MON4D3/LuaSnip",
    "akinsho/toggleterm.nvim",
    "hkupty/iron.nvim",
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
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
    },
})
