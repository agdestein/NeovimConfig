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

    use("rafcamlet/nvim-luapad")

    -- use("windwp/nvim-spectre")
    use("windwp/nvim-spectre")
    use("tpope/vim-commentary")
    use("tpope/vim-unimpaired")
    use("tpope/vim-fugitive")
    use("tpope/vim-surround")
    use("folke/zen-mode.nvim")
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
    -- use("folke/trouble.nvim")
    use("L3MON4D3/LuaSnip")

    use("akinsho/toggleterm.nvim")
    use("hkupty/iron.nvim")

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
    use("ellisonleao/gruvbox.nvim")
    -- use("luisiacc/gruvbox-baby")
    use({ "dracula/vim", as = "dracula" })
    use("tanvirtin/monokai.nvim")
    use("shaunsingh/nord.nvim")
    use({ "catppuccin/nvim", as = "catppuccin" })
    use("folke/lsp-colors.nvim")

    use("nvim-treesitter/nvim-treesitter")
end)
