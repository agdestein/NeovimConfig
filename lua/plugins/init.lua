return {

    -- "nvim-lua/popup.nvim",
    -- "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    -- "akinsho/bufferline.nvim",

    { "folke/which-key.nvim", event = "VeryLazy" },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            -- { "j-hui/fidget.nvim", opts = {} },
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
    },

    { "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },
    {
        "TimUntersberger/neogit",
        cmd = "Neogit",
        keys = {
            { "<Leader>ag", ":Neogit<CR>" },
        },
        opts = { disable_commit_confirmation = true },
    },

    -- "monaqa/dial.nvim",
    {
        "chiel92/vim-autoformat",
        cmd = "Autoformat",
        keys = { { "<Leader>af", ":Autoformat<CR>" } },
    },
    { "mjbrownie/swapit", event = "VeryLazy" },
    { "godlygeek/tabular", cmd = "Tabularize" },
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
        ft = { "tex", "bib" },
        config = function()
            vim.g.vimtex_view_method = "zathura"
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

    -- {
    --     "JuliaEditorSupport/julia-vim",
    --     keys = {
    --         { "<Leader>jb", ":call julia#toggle_function_blockassign()<CR>", "Toggle function block" },
    --     },
    --     config = function()
    --         vim.g.latex_to_unicode_tab = "off"
    --         vim.g.latex_to_unicode_auto = false
    --         vim.g.julia_indent_align_import = false
    --         vim.g.julia_indent_align_brackets = false
    --         vim.g.julia_indent_align_funcargs = false
    --         vim.cmd("hi link juliaParDelim Delimiter")
    --         vim.cmd("hi link juliaSemicolon Operator")
    --         vim.cmd("hi link juliaFunctionCall Identifier")
    --     end,
    -- },

    {
        "andreypopp/julia-repl-vim",
        keys = {
            { "<Leader>jc", ":JuliaREPLConnect<CR>", "Connect to remote Julia REPL" },
            { "<Leader>jd", "}{jvip :JuliaREPLSend<CR> }", "Send region to remote Julia REPL" },
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
    {
        "preservim/vim-markdown",
        ft = "markdown",
        config = function()
            vim.g.vim_markdown_math = true
            vim.g.vim_markdown_fenced_languages = { "bibtex=bib" }
        end,
    },
    { "ron-rs/ron.vim", ft = "ron" },

    {
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
            "hrsh7th/cmp-nvim-lua",
            -- "hrsh7th/cmp-omni",
            "hrsh7th/cmp-path",
            "f3fora/cmp-spell",
            "lukas-reineke/cmp-rg",
        },
    },

    { "RRethy/vim-illuminate", event = { "BufReadPost", "BufNewFile" } },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            char = "┊",
            show_trailing_blankline_indent = false,
        },
    },

    { "duane9/nvim-rg", cmd = "Rg" },

    "ellisonleao/gruvbox.nvim",
    { "catppuccin/nvim", name = "catppuccin" },
    "Mofiqul/dracula.nvim",
    "tanvirtin/monokai.nvim",
    "shaunsingh/nord.nvim",
    "navarasu/onedark.nvim",
    "folke/tokyonight.nvim",
}
