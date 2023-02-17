vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true

require("config/plugins")
require("config/keybindings")
require("config/settings")
require("config/colors/colors")
require("config/autocommands")
-- require("config/bufferline")
require("config/completion")
require("config/julia")
require("config/latex")
require("config/leap")
require("config/lsp")
require("config/lualine")
require("config/markdown")
require("config/neotree")
-- require("config/noice")
require("config/search")
require("config/snippets")
require("config/terminal")
require("config/treesitter")
require("config/zettels")

vim.o.ls = 0
