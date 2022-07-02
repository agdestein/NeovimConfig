vim.cmd("hi clear")

vim.opt.termguicolors = true

colors = {
    fg = "#f8f8f0",
    grey = "#8F908A",
    bg = "#383830",
    magenta = "#e95678",
    green = "#a6e22e",
    cyan = "#66d9ef",
    yellow = "#e6db74",
    orange = "#fd971f",
    blue = "#ae81ff",
    red = "#f92672",
    violet = "#f92672",
    dark_blue = "#23324d",
    comment = "#75715E",
    border = "#a1b5b1",
}

local monokai = require("monokai")
local palette = monokai.classic
monokai.setup({
    palette = {base2 = "#272822"},
})


vim.cmd("colorscheme monokai")

vim.cmd("hi TabLineFill guibg=" .. colors.bg .. " guifg=" .. colors.bg)
vim.cmd("hi StatusLine  guibg=" .. colors.bg .. " guifg=" .. colors.bg)
vim.cmd("hi StatusLineNC guibg=" .. colors.bg .. "  guifg=" .. colors.bg)
vim.cmd("hi WinSeparator guibg=NONE guifg=" .. colors.bg)
