-- Remove any previous highlighting
vim.cmd("hi clear")

-- Gruvbox color scheme
vim.opt.termguicolors = true
vim.cmd("colorscheme gruvbox")

vim.g.gruvbox_bold = "1"
vim.g.gruvbox_italic = "1"
vim.g.gruvbox_transparent_bg = "1"
vim.g.gruvbox_contrast_dark = "medium"

-- Enable transparency
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=2")

vim.g.airline_theme = "gruvbox"

vim.cmd("hi! link Type                    GruvboxBlue")
vim.cmd("hi! link juliaType               GruvboxBlue")
vim.cmd("hi! link juliaSymbol             GruvboxGreen")

vim.cmd("hi! link juliaFunction           GruvboxAquaBold")
vim.cmd("hi! link juliaFunctionDefinition GruvboxAquaBold")
vim.cmd("hi! link juliaFunctionCall       GruvboxAqua")
vim.cmd("hi! link juliaMacro              GruvboxAquaBold")

vim.cmd("hi! link juliaParDelim           GruvboxYellow")
vim.cmd("hi! link juliaSemicolon          GruvboxYellow")
vim.cmd("hi! link juliaColon              GruvboxYellow")
vim.cmd("hi! link juliaComma	          GruvboxYellow")

vim.cmd("hi! link Operator                GruvboxOrange")
-- vim.cmd("hi! link juliaOperator		     GruvboxOrange")
-- vim.cmd("hi! link juliaRangeOperator	     GruvboxOrange")
-- vim.cmd("hi! link juliaCTransOperator     GruvboxOrange")
-- vim.cmd("hi! link juliaTernaryOperator    GruvboxOrange")
-- vim.cmd("hi! link juliaTypeOperator	     GruvboxOrange")
-- vim.cmd("hi! link juliaDotted             GruvboxOrange")
