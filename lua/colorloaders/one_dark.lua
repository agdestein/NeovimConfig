vim.cmd("hi clear")

vim.opt.termguicolors = true

local onedark = require("onedark")

onedark.load()

onedark.setup({
    -- Main options --
    style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false, -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    -- toggle theme style ---
    toggle_style_key = "<leader>ts", -- Default keybinding to toggle
    toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
    },
})

colors = {
    fg        = "#abb2bf",
    comment   = "#5c6370",
    -- bg        = "#4b5263",
    bg        = "#3A3F4B",
    violet    = "#c678dd",
    dark_blue = "#61afef",
    border    = "#4b5263",
    orange    = "#d19a66",
    -- orange    = "#be5046",
    red       = "#e06c75",
    green     = "#98c379",
    yellow    = "#e5c07b",
    blue      = "#61afef",
    magenta   = "#c678dd",
    cyan      = "#56b6c2",
}

--[[
#282c34
#abb2bf
#e06c75
#be5046
#98c379
#e5c07b
#d19a66
#61afef
#c678dd
#56b6c2
#4b5263
#5c6370
]]

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

-- vim.cmd("hi StatusLine guibg=" .. colors.bg .. " guifg=" .. colors.bg)
-- vim.cmd("hi StatusLineNC guibg=" .. colors.bg .. "  guifg=" .. colors.bg)

-- vim.cmd("hi WinSeparator guibg=NONE")
vim.cmd("hi WinSeparator guibg=NONE guifg=" .. colors.bg)
-- vim.cmd("hi WinSeparator guibg=NONE guifg=" .. colors.comment)

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
