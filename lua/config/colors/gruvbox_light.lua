vim.cmd("hi clear")

vim.opt.termguicolors = true

vim.o.background = "light"

local palette = require("gruvbox.palette")

require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    -- overrides = {
    --     SignColumn = {bg = "#ff9900"},
    -- },
    dim_inactive = false,
    transparent_mode = true,
})

vim.cmd("colorscheme gruvbox")

vim.api.nvim_set_hl(0 , "Headline1" , { fg = palette.faded_orange , bg = "#f9eabe" , bold = true })
vim.api.nvim_set_hl(0 , "Headline2" , { fg = palette.faded_aqua   , bg = "#f4edc2" , bold = true })
vim.api.nvim_set_hl(0 , "Headline3" , { fg = palette.faded_purple , bg = "#f7eac4" , bold = true })
vim.api.nvim_set_hl(0 , "Headline4" , { fg = palette.faded_green  , bg = "#f6ecbe" , bold = true })
vim.api.nvim_set_hl(0 , "Headline5" , { fg = palette.faded_blue   , bg = "#f2ecc4" , bold = true })
vim.api.nvim_set_hl(0 , "Headline6" , { fg = palette.faded_yellow , bg = "#f9edbf" , bold = true })
vim.api.nvim_set_hl(0 , "CodeBlock" , { bg = palette.light0_soft })

-- vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE })
-- vim.api.nvim_set_hl(0, "TabLine", { guibg = NONE, ctermbg = NONE })
--
-- vim.api.nvim_set_hl(0, "StatusLine", { guibg = NONE, ctermbg = NONE })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { guibg = NONE, ctermbg = NONE })
-- vim.api.nvim_set_hl(0, "WinSeparator", { guibg = NONE, ctermbg = NONE })

vim.g.nvim_markdown_preview_theme = "gruvbox_light"

vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palette.colors.dark1 })
