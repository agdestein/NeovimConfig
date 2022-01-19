Packer = require("packer")

vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

Packer.startup(function(use)
	use("nvim-lua/plenary.nvim")
	use("windwp/nvim-spectre")
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")
	use("JuliaEditorSupport/julia-vim")
	use("neovim/nvim-lspconfig")
	use("dag/vim-fish")
	use("cespare/vim-toml")
	use("lervag/vimtex")
	use("kdheepak/JuliaFormatter.vim")
	use("chiel92/vim-autoformat")
	use("preservim/NERDTree")
	use("ryanoasis/vim-devicons")
	use("tpope/vim-unimpaired")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	})
	use("tpope/vim-commentary")
	use("tpope/vim-fugitive")
	use("mjbrownie/swapit")
	use("jpalardy/vim-slime")
	use("mroavi/vim-julia-cell")
	use({ "neoclide/coc.nvim", branch = "release" })
	use("chrisbra/Colorizer")
	use("github/copilot.vim")
	use("godlygeek/tabular")
	use("plasticboy/vim-markdown")
	use("davidgranstrom/nvim-markdown-preview")
	use("norcalli/nvim-colorizer.lua")
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
	})
	use("folke/zen-mode.nvim")
	use("tpope/vim-surround")

	-- Colorschemes
	use("morhetz/gruvbox")
	use({ "dracula/vim", as = "dracula" })
	use("~/.config/nvim/lua/colorloaders/monokai")
end)
