vim.cmd("hi clear")

vim.opt.termguicolors = true

vim.o.background = "dark"

require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true, -- will make italic comments and special strings
    inverse = true, -- invert background for search, diffs, statuslines and errors
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    contrast = "", -- can be "hard" or "soft"
    overrides = {},
})

vim.cmd("colorscheme gruvbox")

local colors = {
    bg       = "#3c3836",
    fg       = "#ebdbb2",
    orange   = "#D65D0E",
    comment  = "#928374",
    red      = "#cc241d",
    violet   = "#cc241d",
    green    = "#98971a",
    yellow   = "#d79921",
    blue     = "#458588",
    magenta  = "#b16286",
    cyan     = "#689d6a",
    darkblue = "#21222c",
    black    = "#1d2021",
}

-- vim.cmd("hi WinSeparator  guibg=NONE guifg=" .. colors.comment)

vim.cmd("hi TelescopePromptBorder guifg=" .. colors.blue)
vim.cmd("hi TelescopeResultsBorder guifg=" .. colors.green)
vim.cmd("hi TelescopePreviewBorder guifg=" .. colors.cyan)
