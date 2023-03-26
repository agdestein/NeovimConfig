vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true

require("config/plugins")
require("config/keybindings")
require("config/settings")
require("config/colors/colors")
require("config/aerial")
require("config/autocommands")
require("config/completion")
require("config/julia")
require("config/jupynium")
require("config/latex")
require("config/leap")
require("config/lsp")
require("config/lualine")
require("config/markdown")
require("config/neotree")
require("config/search")
require("config/snippets")
require("config/terminal")
require("config/treesitter")
require("config/zettels")

vim.o.ls = 0
