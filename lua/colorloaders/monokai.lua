local vim = vim

-- Remove any previous highlighting
vim.cmd("hi clear")

vim.opt.termguicolors = true
vim.cmd("colorscheme monokai")

colors = {
    fg = "#f8f8f0",
    grey = "#8F908A",
    -- bg = "#23324d",
    bg = "#222426",
    magenta = "#f92672",
    green = "#a6e22e",
    cyan = "#66d9ef",
    yellow = "#e6db74",
    orange = "#fd971f",
    blue = "#ae81ff",
    red = "#e95678",
    violet = "#e95678",
    dark_blue = "#23324d",
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

-- Enable transparency
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=2")

vim.cmd("hi! link juliaSymbol Number")

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

-- M.classic = {
--   name = 'monokai',
--   base0 = '#222426',
--   base1 = '#272a30',
--   base2 = '#26292C',
--   base3 = '#2E323C',
--   base4 = '#333842',
--   base5 = '#4d5154',
--   base6 = '#9ca0a4',
--   base7 = '#b1b1b1',
--   base8 = '#e3e3e1',
--   border = '#a1b5b1',
--   brown = '#504945',
--   white = '#f8f8f0',
--   grey = '#8F908A',
--   black = '#000000',
--   pink = '#f92672',
--   green = '#a6e22e',
--   aqua = '#66d9ef',
--   yellow = '#e6db74',
--   orange = '#fd971f',
--   purple = '#ae81ff',
--   red = '#e95678',
--   diff_add = '#3d5213', diff_remove = '#4a0f23',
--   diff_change = '#27406b',
--   diff_text = '#23324d',
-- }
