vim = vim

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("plugins")
require("config/which-key")
require("config/settings")

require("colorloaders/colors")
require("config/treesitter")

require("config/buffers")
require("config/galaxyline")
require("config/search")
require("config/coc")
require("config/julia")
require("config/latex")
require("config/markdown")
