local Packer = require("packer")

vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

Packer.startup(function(use)
    use("nvim-lua/plenary.nvim")
    use("ryanoasis/vim-devicons")
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lualine/lualine.nvim")
    use("akinsho/bufferline.nvim")
    use("folke/which-key.nvim")

    use({
        "goolord/alpha-nvim",
        config = function()
            require("alpha").setup(require("alpha.themes.startify").config)
        end,
    })
    use({
        "andythigpen/nvim-coverage",
        config = function()
            require("coverage").setup()
        end,
    })

    -- LSP
    use("neovim/nvim-lspconfig")

    use("rafcamlet/nvim-luapad")

    -- use("windwp/nvim-spectre")
    use("windwp/nvim-spectre")
    use("numToStr/Comment.nvim")
    -- use("tpope/vim-commentary")
    -- use("tpope/vim-unimpaired")
    -- use("tpope/vim-fugitive")
    use("TimUntersberger/neogit")
    -- use("tpope/vim-surround")
    -- use("folke/zen-mode.nvim")
    use("pocco81/truezen.nvim")
    use("ggandor/lightspeed.nvim")
    use("nvim-telescope/telescope.nvim")
    use("chiel92/vim-autoformat")
    use("mjbrownie/swapit")
    use("jpalardy/vim-slime")
    use("godlygeek/tabular")
    use("norcalli/nvim-colorizer.lua")
    use("kyazdani42/nvim-tree.lua")
    use("github/copilot.vim")
    use("folke/todo-comments.nvim")
    use("folke/trouble.nvim")
    use("L3MON4D3/LuaSnip")
    use("lewis6991/gitsigns.nvim")

    use("akinsho/toggleterm.nvim")
    use("hkupty/iron.nvim")

    use("nvim-lua/popup.nvim")

    -- Language support
    use("dag/vim-fish")
    use("cespare/vim-toml")
    use("lervag/vimtex")
    use("JuliaEditorSupport/julia-vim")
    use("plasticboy/vim-markdown")
    use("davidgranstrom/nvim-markdown-preview")
    use({ "oberblastmeister/neuron.nvim", branch = "unstable" })

    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-calc")
    use("hrsh7th/cmp-copilot")
    use("hrsh7th/cmp-cmdline")
    use("petertriho/cmp-git")
    use("kdheepak/cmp-latex-symbols")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    -- use("hrsh7th/cmp-omni")
    use("hrsh7th/cmp-path")
    use("hrsh7th/nvim-cmp")

    use("jose-elias-alvarez/null-ls.nvim")

    -- Colorschemes
    use("ellisonleao/gruvbox.nvim")
    -- use("luisiacc/gruvbox-baby")
    use({ "catppuccin/nvim", as = "catppuccin" })
    use({ "dracula/vim", as = "dracula" })
    use("tanvirtin/monokai.nvim")
    use("shaunsingh/nord.nvim")
    use("navarasu/onedark.nvim")
    use("folke/lsp-colors.nvim")

    use("nvim-treesitter/nvim-treesitter")
end)
