vim.cmd("hi clear")

vim.opt.termguicolors = true

local monokai = require("monokai")
local palette = monokai.classic

vim.cmd("colorscheme monokai")
monokai.setup({
    palette = {base2 = "#272822"},
})

vim.cmd("colorscheme monokai")
