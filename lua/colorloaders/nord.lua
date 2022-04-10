local vim = vim

-- Remove any previous highlighting
vim.cmd("hi clear")

vim.opt.termguicolors = true
vim.cmd("colorscheme nord")

vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true

-- Load the colorscheme
require("nord").set()

colors = {
    fg = "#ECEFF4",
    grey = "#4C566A",
    -- bg = "#2E3440",
    bg = "#3B4252",
    -- bg = "#434C5E",
    -- bg = "#4C566A",
    comment = "#616E88",
    magenta = "#B48EAD",
    green = "#A3BE8C",
    cyan = "#88C0D0",
    yellow = "#EBCB8B",
    orange = "#D08770",
    blue = "#5E81AC",
    red = "#BF616A",
    violet = "#B48EAD",
    dark_blue = "#5E81AC",
    border = "#4C566A",
}

-- #D8DEE9
-- #E5E9F0

vim.cmd("hi! link juliaSymbol Number")
vim.cmd("hi! link juliaSymbolS Number")

vim.cmd("hi! link juliaFunction           Function")
vim.cmd("hi! link juliaFunctionDefinition Function")
vim.cmd("hi! link juliaFunctionDef        Function")
vim.cmd("hi! link juliaFunctionCall       Function")
vim.cmd("hi! link juliaMacro              Function")
-- vim.cmd("hi juliaMacro guifg=" .. colors.green)

-- vim.cmd("hi juliaParDelim  guifg=" .. colors.yellow)
-- vim.cmd("hi juliaSemicolon guifg=" .. colors.yellow)
-- vim.cmd("hi juliaColon     guifg=" .. colors.yellow)
-- vim.cmd("hi juliaComma	   guifg=" .. colors.yellow)

-- vim.cmd("hi TabLineFill guibg=" .. colors.bg .. " guifg=" .. colors.bg)
-- vim.cmd("hi BufferLineFill guibg=" .. colors.bg .. " guifg=" .. colors.bg)
vim.cmd("hi StatusLine guibg=" .. colors.bg .. " guifg=" .. colors.bg)
vim.cmd("hi StatusLineNC guibg=" .. colors.bg .. "  guifg=" .. colors.bg)
vim.cmd("hi WinSeparator guibg=NONE guifg=" .. colors.comment)

vim.cmd("hi TelescopeBorder guifg=" .. colors.border)
-- vim.cmd("hi TelescopePromptBorder guifg=" .. colors.cyan)
-- vim.cmd("hi TelescopeResultsBorder guifg=" .. colors.cyan)
-- vim.cmd("hi TelescopePreviewBorder guifg=" .. colors.cyan)

-- Enable transparency
-- vim.cmd("hi TelescopeNormal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
-- vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
-- vim.cmd("hi Number guibg=NONE ctermbg=NONE")
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi Normal guibg=#2E3440 ctermbg=NONE")
-- vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")

-- Enable transparency
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
-- vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
-- vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=2")
