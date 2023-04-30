vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("config/plugins")

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
-- require("config/lualine")
-- require("config/evilline")
require("config/markdown")
require("config/neotree")
require("config/search")
require("config/snippets")
require("config/terminal")
require("config/treesitter")
require("config/zettels")

vim.g.winbar = true
vim.o.ls = 3
vim.o.ch = 0
