Packer = require("packer")

vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

Packer.startup(function(use)
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
	use("Xuyuanp/nerdtree-git-plugin")
	use("tpope/vim-commentary")
	use("tpope/vim-fugitive")
	use("mjbrownie/swapit")
	use({ "junegunn/fzf", run = "fzf#install()" })
	use("junegunn/fzf.vim")
	use("jpalardy/vim-slime")
	use("mroavi/vim-julia-cell")
	use({ "neoclide/coc.nvim", branch = "release" })
	use("neoclide/coc-vimtex")
	use("jremmen/vim-ripgrep")
	use("chrisbra/Colorizer")
	use("github/copilot.vim")
	use("godlygeek/tabular")
	use("plasticboy/vim-markdown")
	use({ "iamcco/markdown-preview.nvim", run = "mkdp#util#install()" })
	use("norcalli/nvim-colorizer.lua")

	-- Colorschemes
	use("morhetz/gruvbox")
	use({ "dracula/vim", as = "dracula" })
	use("~/.config/nvim/lua/colorloaders/monokai")
end)
