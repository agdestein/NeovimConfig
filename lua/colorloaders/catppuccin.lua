vim.cmd("hi clear")

vim.opt.termguicolors = true

local catppuccin = require("catppuccin")

catppuccin.setup({
    transparent_background = false,
})

vim.cmd("colorscheme catppuccin")

colors = {
    fg = "#D9E0EE",
    comment = "#6E6C7E",
    bg = "#161320",
    -- bg = "#1A1826",
    -- bg = "#302D41",
    violet = "#DDB6F2",
    dark_blue = "#96CDFB",
    border = "#575268",
    orange = "#F8BD96",
    red = "#F28FAD",
    green = "#ABE9B3",
    yellow = "#FAE3B0",
    blue = "#96CDFB",
    magenta = "#F5C2E7",
    cyan = "#89DCEB",
}

vim.cmd("hi! link juliaSymbol Number")
vim.cmd("hi! link juliaSymbolS Number")

vim.cmd("hi! link juliaFunction           Function")
vim.cmd("hi! link juliaFunctionDefinition Function")
vim.cmd("hi! link juliaFunctionDef        Function")
vim.cmd("hi! link juliaFunctionCall       Function")
vim.cmd("hi! link juliaMacro              Function")
-- vim.cmd("hi juliaMacro guifg=" .. colors.green)
--
-- vim.cmd("hi juliaParDelim  guifg=" .. colors.yellow)
-- vim.cmd("hi juliaSemicolon guifg=" .. colors.yellow)
-- vim.cmd("hi juliaColon     guifg=" .. colors.yellow)
-- vim.cmd("hi juliaComma	   guifg=" .. colors.yellow)

-- vim.cmd("hi TabLineFill guibg=" .. colors.bg .. " guifg=" .. colors.bg)
-- vim.cmd("hi BufferLineFill guibg=" .. colors.bg .. " guifg=" .. colors.bg)
vim.cmd("hi StatusLine guibg=" .. colors.bg .. " guifg=" .. colors.bg)
vim.cmd("hi StatusLineNC guibg=" .. colors.bg .. "  guifg=" .. colors.bg)
-- vim.cmd("hi WinSeparator guibg=NONE")
vim.cmd("hi WinSeparator guibg=NONE guifg=" .. colors.comment)

-- vim.cmd("hi TelescopeBorder guifg=" .. colors.border)
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
