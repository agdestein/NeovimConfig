vim.cmd("hi clear")

vim.opt.termguicolors = true

vim.o.background = "light"
vim.cmd("colorscheme gruvbox")

-- vim.cmd("colorscheme gruvbox-baby")

-- vim.cmd("hi! link Type                    GruvboxBlue")
-- vim.cmd("hi! link juliaType               GruvboxBlue")
vim.cmd("hi! link juliaSymbol             GruvboxPurple")
vim.cmd("hi! link juliaSymbolS            GruvboxPurple")

vim.cmd("hi! link juliaFunction           GruvboxGreenBold")
vim.cmd("hi! link juliaFunctionDefinition GruvboxGreenBold")
vim.cmd("hi! link juliaFunctionDef        GruvboxGreenBold")
vim.cmd("hi! link juliaFunctionCall       GruvboxAqua")
vim.cmd("hi! link juliaMacro              GruvboxBlueBold")

-- vim.cmd("hi! link juliaParDelim           GruvboxYellow")
-- vim.cmd("hi! link juliaSemicolon          GruvboxYellow")
-- vim.cmd("hi! link juliaColon              GruvboxYellow")
-- vim.cmd("hi! link juliaComma              GruvboxYellow")

vim.cmd("hi! link Operator                GruvboxOrange")
-- vim.cmd("hi! link juliaOperator		     GruvboxOrange")
-- vim.cmd("hi! link juliaRangeOperator	     GruvboxOrange")
-- vim.cmd("hi! link juliaCTransOperator     GruvboxOrange")
-- vim.cmd("hi! link juliaTernaryOperator    GruvboxOrange")
-- vim.cmd("hi! link juliaTypeOperator	     GruvboxOrange")
-- vim.cmd("hi! link juliaDotted             GruvboxOrange")

colors = {
    bg       = "#ebdbb2",
    -- bg       = "#d5c4a1",
    fg       = "#3c3836",
    comment  = "#665c54",
    orange   = "#D65D0E",
    red      = "#cc241d",
    violet   = "#cc241d",
    green    = "#98971a",
    yellow   = "#d79921",
    blue     = "#458588",
    magenta  = "#b16286",
    cyan     = "#689d6a",
    darkblue = "#076678",
    black    = "#fbf1c7",
}
--[[
dark0_hard  = #1d2021
dark0       = #282828
dark0_soft  = #32302f
dark1       = #3c3836
dark2       = #504945
dark3       = #665c54
dark4       = #7c6f64
dark4_256   = #7c6f64

gray_245    = #928374
gray_244    = #928374

light0_hard = #f9f5d7
light0      = #fbf1c7
light0_soft = #f2e5bc
light1      = #ebdbb2
light2      = #d5c4a1
light3      = #bdae93
light4      = #a89984
light4_256  = #a89984

bright_red     = #fb4934
bright_green   = #b8bb26
bright_yellow  = #fabd2f
bright_blue    = #83a598
bright_purple  = #d3869b
bright_aqua    = #8ec07c
bright_orange  = #fe8019

neutral_red    = #cc241d
neutral_green  = #98971a
neutral_yellow = #d79921
neutral_blue   = #458588
neutral_purple = #b16286
neutral_aqua   = #689d6a
neutral_orange = #d65d0e

faded_red      = #9d0006
faded_green    = #79740e
faded_yellow   = #b57614
faded_blue     = #076678
faded_purple   = #8f3f71
faded_aqua     = #427b58
faded_orange   = #af3a03
]]

-- vim.cmd("hi TabLineFill guibg=" .. colors.bg .. " guifg=" .. colors.bg)

vim.cmd("hi SignColumn guibg=NONE")
-- vim.cmd("hi StatusLine  guibg=" .. colors.bg .. " guifg=" .. colors.bg)
-- vim.cmd("hi StatusLineNC  guibg=" .. colors.bg .. "  guifg=" .. colors.bg)

vim.cmd("hi WinSeparator  guibg=NONE guifg=" .. colors.bg)

-- vim.cmd("hi TelescopeBorder guifg=" .. colors.magenta)
vim.cmd("hi TelescopePromptBorder guifg=" .. colors.blue)
vim.cmd("hi TelescopeResultsBorder guifg=" .. colors.green)
vim.cmd("hi TelescopePreviewBorder guifg=" .. colors.cyan)

-- Enable transparency
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
