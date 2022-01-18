-- Remove any previous highlighting
vim.cmd("hi clear")

vim.opt.termguicolors = true
vim.cmd("colorscheme monokai")

vim.g.monokai_bold = "1"
vim.g.monokai_italic = "1"
vim.g.monokai_transparent_bg = "1"
vim.g.monokai_contrast_dark = "medium"

-- Enable transparency
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=2")

vim.g.airline_theme = "monokai"

-- vim.cmd("hi! link Type                    MonokaiBlue")
vim.cmd("hi! link juliaType               MonokaiYellow")
vim.cmd("hi! link juliaSymbol             MonokaiAqua")

vim.cmd("hi! link juliaFunction           MonokaiBlueBold")
vim.cmd("hi! link juliaFunctionDefinition MonokaiBlueBold")
vim.cmd("hi! link juliaFunctionCall       MonokaiBlue")
vim.cmd("hi! link juliaMacro              MonokaiBlueBold")

vim.cmd("hi! link juliaParDelim           MonokaiOrange")
vim.cmd("hi! link juliaSemicolon          MonokaiOrange")
vim.cmd("hi! link juliaColon              MonokaiOrange")
vim.cmd("hi! link juliaComma	          MonokaiOrange")

vim.cmd("hi! link Operator                MonokaiOrange")
-- vim.cmd("hi! link juliaOperator		     MonokaiOrange")
-- vim.cmd("hi! link juliaRangeOperator	     MonokaiOrange")
-- vim.cmd("hi! link juliaCTransOperator     MonokaiOrange")
-- vim.cmd("hi! link juliaTernaryOperator    MonokaiOrange")
-- vim.cmd("hi! link juliaTypeOperator	     MonokaiOrange")
-- vim.cmd("hi! link juliaDotted             MonokaiOrange")
