-- Remove any previous highlighting
vim.cmd("hi clear")

vim.opt.termguicolors = true
vim.cmd("colorscheme dracula")

vim.g.dracula_bold = "1"
vim.g.dracula_italic = "1"
vim.g.dracula_underline = "1"

-- Enable transparency
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=2")

vim.g.airline_theme = "dracula"

-- vim.cmd("highlight EndOfBuffer ctermfg=bg")

-- vim.cmd("hi! link Type                    DraculaBlue")
-- vim.cmd("hi! link juliaType               DraculaBlue")
vim.cmd("hi! link juliaSymbol             DraculaRed")

vim.cmd("hi! link juliaFunction           DraculaGreenBold")
vim.cmd("hi! link juliaFunctionDefinition DraculaGreenBold")
vim.cmd("hi! link juliaFunctionDef        DraculaGreenBold")
vim.cmd("hi! link juliaFunctionCall       DraculaGreen")
vim.cmd("hi! link juliaMacro              DraculaGreenBold")

vim.cmd("hi! link juliaParDelim           DraculaOrange")
vim.cmd("hi! link juliaSemicolon          DraculaOrange")
vim.cmd("hi! link juliaColon              DraculaOrange")
vim.cmd("hi! link juliaComma	             DraculaOrange")

-- vim.cmd("hi! link Operator                DraculaOrange")
-- vim.cmd("hi! link juliaOperator		     DraculaOrange")
-- vim.cmd("hi! link juliaRangeOperator	     DraculaOrange")
-- vim.cmd("hi! link juliaCTransOperator     DraculaOrange")
-- vim.cmd("hi! link juliaTernaryOperator    DraculaOrange")
-- vim.cmd("hi! link juliaTypeOperator	     DraculaOrange")
-- vim.cmd("hi! link juliaDotted             DraculaOrange")
