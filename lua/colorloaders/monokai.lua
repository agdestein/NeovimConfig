vim.cmd("hi clear")

vim.opt.termguicolors = true

local monokai = require("monokai")

vim.cmd("colorscheme monokai")
monokai.setup({
    palette = {base2 = "#272822"},
})

-- vim.cmd("colorscheme monokai")
