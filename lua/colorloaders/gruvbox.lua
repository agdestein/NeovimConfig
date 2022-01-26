-- Remove any previous highlighting
vim.cmd("hi clear")

vim.opt.termguicolors = true
vim.cmd("colorscheme gruvbox")

vim.g.gruvbox_bold = "1"
vim.g.gruvbox_italic = "1"
vim.g.gruvbox_transparent_bg = "1"
vim.g.gruvbox_contrast_dark = "medium"

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

colors = {
    -- bg = "#1d2021",
    -- bg = "#202020",
    bg = "#282828",
    fg = "#ebdbb2",
    -- orange = "#FE8019",
    orange = "#D65D0E",
    comment = "#928374",
    red = "#cc241d",
    violet = "#cc241d",
    green = "#98971a",
    yellow = "#d79921",
    blue = "#458588",
    magenta = "#b16286",
    cyan = "#689d6a",
    darkblue = "#21222c",
    black = "#1d2021",
}

-- vim.cmd("hi TabLineFill '#282828' '#282828'")
vim.cmd("hi TabLineFill guibg=" .. colors.bg .. " guifg=" .. colors.bg)
vim.cmd("hi StatusLine  guibg=" .. colors.bg .. " guifg=" .. colors.bg)
vim.cmd("hi StatusLineNC  guibg=" .. colors.bg .. "  guifg=" .. colors.bg)

vim.cmd("hi TelescopeBorder guifg=" .. colors.magenta)
-- vim.cmd("hi TelescopePromptBorder guifg=" .. colors.magenta)
-- vim.cmd("hi TelescopeResultsBorder guifg=" .. colors.magenta)
-- vim.cmd("hi TelescopePreviewBorder guifg=" .. colors.magenta)

-- Enable transparency
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
