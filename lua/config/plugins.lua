local Packer = require("packer")

vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

Packer.startup(function(use)
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")
    use("kyazdani42/nvim-web-devicons")
    -- use("nvim-lualine/lualine.nvim")

    -- use("akinsho/bufferline.nvim")
    use("folke/which-key.nvim")

    use("neovim/nvim-lspconfig")

    use("numToStr/Comment.nvim")
    use("TimUntersberger/neogit")
    use({
        "ggandor/leap.nvim",
        config = function()
            require("leap").set_default_keymaps()
        end,
    })

    use("nvim-telescope/telescope.nvim")

    use("chiel92/vim-autoformat")
    use("mjbrownie/swapit")
    use("godlygeek/tabular")
    use("norcalli/nvim-colorizer.lua")
    use({
        "kyazdani42/nvim-tree.lua",
        tag = "nightly",
    })

    use("folke/todo-comments.nvim")
    use("folke/trouble.nvim")
    use("L3MON4D3/LuaSnip")

    use("akinsho/toggleterm.nvim")
    use("hkupty/iron.nvim")

    -- Language support
    use("dag/vim-fish")
    use("cespare/vim-toml")
    use("lervag/vimtex")
    use("JuliaEditorSupport/julia-vim")
    use("andreypopp/julia-repl-vim")
    use("kdheepak/JuliaFormatter.vim")

    use("preservim/vim-markdown")
    use("davidgranstrom/nvim-markdown-preview")

    use("ron-rs/ron.vim")

    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-calc")
    use("hrsh7th/cmp-cmdline")
    use("petertriho/cmp-git")
    use("kdheepak/cmp-latex-symbols")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    -- use("hrsh7th/cmp-omni")
    use("hrsh7th/cmp-path")
    use("hrsh7th/nvim-cmp")
    use("f3fora/cmp-spell")
    use("lukas-reineke/cmp-rg")

    use("duane9/nvim-rg")

    use("lukas-reineke/headlines.nvim")

    -- Colorschemes
    use("ellisonleao/gruvbox.nvim")
    use({ "catppuccin/nvim", as = "catppuccin" })
    use("Mofiqul/dracula.nvim")
    use("tanvirtin/monokai.nvim")
    use("shaunsingh/nord.nvim")
    use("navarasu/onedark.nvim")
    use("folke/lsp-colors.nvim")

    use("nvim-treesitter/nvim-treesitter")
end)

-- use({
--     'myusername/example',        -- The plugin location string
--     -- The following keys are all optional
--     disable = boolean,           -- Mark a plugin as inactive
--     as = string,                 -- Specifies an alias under which to install the plugin
--     installer = function,        -- Specifies custom installer. See "custom installers" below.
--     updater = function,          -- Specifies custom updater. See "custom installers" below.
--     after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
--     rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
--     opt = boolean,               -- Manually marks a plugin as optional.
--     branch = string,             -- Specifies a git branch to use
--     tag = string,                -- Specifies a git tag to use. Supports '*' for "latest tag"
--     commit = string,             -- Specifies a git commit to use
--     lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
--     run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
--     requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
--     rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
--     config = string or function, -- Specifies code to run after this plugin is loaded.
--     -- The setup key implies opt = true
--     setup = string or function,  -- Specifies code to run before this plugin is loaded.
--     -- The following keys all imply lazy-loading and imply opt = true
--     cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
--     ft = string or list,         -- Specifies filetypes which load this plugin.
--     keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
--     event = string or list,      -- Specifies autocommand events which load this plugin.
--     fn = string or list          -- Specifies functions which load this plugin.
--     cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
--     module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
--     -- with one of these module names, the plugin will be loaded.
--     module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
--         requiring a string which matches one of these patterns, the plugin will be loaded.
-- })
