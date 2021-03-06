local vim = vim

-- Remove any previous highlighting
vim.cmd("hi clear")

vim.opt.termguicolors = true

vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true

-- Load the colorscheme
require("nord").set()
vim.cmd("colorscheme nord")
