local vim = vim

vim.cmd("hi clear")

vim.opt.termguicolors = true
vim.cmd("colorscheme monokai")

colors = {
    fg = "#f8f8f0",
    grey = "#8F908A",
    bg = "#383830",
    magenta = "#e95678",
    green = "#a6e22e",
    cyan = "#66d9ef",
    yellow = "#e6db74",
    orange = "#fd971f",
    blue = "#ae81ff",
    red = "#f92672",
    violet = "#f92672",
    dark_blue = "#23324d",
    comment = "#75715E",
    border = "#a1b5b1",
}

local monokai = require("monokai")
local palette = monokai.classic
monokai.setup({
    -- palette = {
    -- 	-- diff_text = '#133337',
    -- },
    palette = palette,
    custom_hlgroups = {
        TabLineFill = {
            fg = colors.bg,
            bg = colors.bg,
        },
        StatusLine = {
            fg = colors.bg,
            bg = colors.bg,
        },
        StatusLineNC = {
            fg = colors.bg,
            bg = colors.bg,
        },
    },
})

vim.cmd("hi! link juliaSymbol Number")
vim.cmd("hi! link juliaSymbolS Number")

vim.cmd("hi! link juliaFunction           Function")
vim.cmd("hi! link juliaFunctionDefinition Function")
vim.cmd("hi! link juliaFunctionDef        Function")
vim.cmd("hi! link juliaFunctionCall       Function")
-- vim.cmd("hi! link juliaMacro              Function")
vim.cmd("hi juliaMacro guifg=" .. palette.green)

vim.cmd("hi juliaParDelim  guifg=" .. palette.base8)
vim.cmd("hi juliaSemicolon guifg=" .. palette.base8)
vim.cmd("hi juliaColon     guifg=" .. palette.base8)
vim.cmd("hi juliaComma	   guifg=" .. palette.base8)

vim.cmd("hi TabLineFill guibg=" .. colors.bg .. " guifg=" .. colors.bg)
vim.cmd("hi StatusLine  guibg=" .. colors.bg .. " guifg=" .. colors.bg)
vim.cmd("hi StatusLineNC guibg=" .. colors.bg .. "  guifg=" .. colors.bg)
vim.cmd("hi WinSeparator guibg=NONE guifg=" .. colors.bg)

vim.cmd("hi TelescopeBorder guifg=" .. colors.border)
-- vim.cmd("hi TelescopePromptBorder guifg=" .. colors.cyan)
-- vim.cmd("hi TelescopeResultsBorder guifg=" .. colors.cyan)
-- vim.cmd("hi TelescopePreviewBorder guifg=" .. colors.cyan)

-- Enable transparency
vim.cmd("hi TelescopeNormal guibg=NONE ctermbg=NONE")
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
-- vim.cmd("hi Number guibg=NONE ctermbg=NONE")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")

-- Enable transparency
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
-- vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
-- vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=2")
