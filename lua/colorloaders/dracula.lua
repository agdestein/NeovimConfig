vim.cmd("hi clear")

vim.opt.termguicolors = true

vim.g.dracula_bold = "1"
vim.g.dracula_italic = "1"
vim.g.dracula_underline = "1"

vim.cmd("colorscheme dracula")

colors = {
    -- termbg = "#282a36",
    bg = "#3a3c4e",
    fg = "#f8f8f2",
    red = "#ff5555",
    green = "#50fa7b",
    orange = "#ffb86c",
    yellow = "#f1fa8c",
    blue = "#caa9fa",
    violet = "#ff5555",
    magenta = "#ff79c6",
    cyan = "#8be9fd",
    darkblue = "#21222c",
    comment = "#6272a4",
    black = "#191a21",
}

vim.cmd("hi WinSeparator  guibg=NONE guifg=" .. colors.comment)

-- vim.cmd("hi TelescopeBorder guifg=" .. colors.magenta)
vim.cmd("hi TelescopePromptBorder guifg=" .. colors.cyan)
vim.cmd("hi TelescopeResultsBorder guifg=" .. colors.blue)
vim.cmd("hi TelescopePreviewBorder guifg=" .. colors.magenta)
