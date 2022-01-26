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
    use("glepnir/galaxyline.nvim")
    use("akinsho/bufferline.nvim")
    use("folke/which-key.nvim")

    -- -- LSP
    -- use("neovim/nvim-lspconfig")
    use({ "neoclide/coc.nvim", branch = "release" })

    -- use("windwp/nvim-spectre")
    use({
        "windwp/nvim-spectre",
        config = function()
            require("spectre").setup({})
        end,
    })
    use("tpope/vim-commentary")
    use("tpope/vim-unimpaired")
    use("tpope/vim-fugitive")
    use("tpope/vim-surround")
    use("folke/zen-mode.nvim")
    use("ggandor/lightspeed.nvim")
    use("nvim-telescope/telescope.nvim")
    use("chiel92/vim-autoformat")
    use("mjbrownie/swapit")
    use("jpalardy/vim-slime")
    use("godlygeek/tabular")
    use("norcalli/nvim-colorizer.lua")
    use({
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({})
        end,
    })
    use("github/copilot.vim")

    -- Language support
    use("dag/vim-fish")
    use("cespare/vim-toml")
    use("lervag/vimtex")
    use("JuliaEditorSupport/julia-vim")
    use("kdheepak/JuliaFormatter.vim")
    use("mroavi/vim-julia-cell")
    use("plasticboy/vim-markdown")
    use("davidgranstrom/nvim-markdown-preview")

    -- Colorschemes
    use("morhetz/gruvbox")
    use({ "dracula/vim", as = "dracula" })
    use("tanvirtin/monokai.nvim")

    use("nvim-treesitter/nvim-treesitter")
end)
