vim.cmd("hi clear")

vim.opt.termguicolors = true
vim.cmd("colorscheme dracula")

vim.g.dracula_bold = "1"
vim.g.dracula_italic = "1"
vim.g.dracula_underline = "1"

-- vim.cmd("hi! link Type                    DraculaBlue")
-- vim.cmd("hi! link juliaType               DraculaBlue")
vim.cmd("hi! link juliaSymbol             DraculaRed")
vim.cmd("hi! link juliaSymbolS            DraculaRed")

vim.cmd("hi! link juliaFunction           DraculaGreenBold")
vim.cmd("hi! link juliaFunctionDefinition DraculaGreenBold")
vim.cmd("hi! link juliaFunctionDef        DraculaGreenBold")
vim.cmd("hi! link juliaFunctionCall       DraculaGreen")
vim.cmd("hi! link juliaMacro              DraculaGreenBold")

vim.cmd("hi! link juliaParDelim           DraculaOrange")
vim.cmd("hi! link juliaSemicolon          DraculaOrange")
vim.cmd("hi! link juliaColon              DraculaOrange")
vim.cmd("hi! link juliaComma	          DraculaOrange")

-- vim.cmd("hi! link Operator                DraculaOrange")
-- vim.cmd("hi! link juliaOperator		     DraculaOrange")
-- vim.cmd("hi! link juliaRangeOperator	     DraculaOrange")
-- vim.cmd("hi! link juliaCTransOperator     DraculaOrange")
-- vim.cmd("hi! link juliaTernaryOperator    DraculaOrange")
-- vim.cmd("hi! link juliaTypeOperator	     DraculaOrange")
-- vim.cmd("hi! link juliaDotted             DraculaOrange")

colors = {
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

-- vim.cmd("hi TabLineFill guibg=" .. colors.bg .. " guifg=" .. colors.bg)
vim.cmd("hi StatusLine  guibg=" .. colors.bg .. " guifg=" .. colors.bg)
vim.cmd("hi StatusLineNC  guibg=" .. colors.bg .. "  guifg=" .. colors.bg)

vim.cmd("hi TelescopeBorder guifg=" .. colors.magenta)
-- vim.cmd("hi TelescopePromptBorder guifg=" .. colors.magenta)
-- vim.cmd("hi TelescopeResultsBorder guifg=" .. colors.magenta)
-- vim.cmd("hi TelescopePreviewBorder guifg=" .. colors.magenta)

-- Enable transparency
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
