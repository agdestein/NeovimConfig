vim.cmd("hi clear")

vim.opt.termguicolors = true

vim.o.background = "dark"

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
    overrides = {},
    dim_inactive = false,
    transparent_mode = true,
})

vim.cmd("colorscheme gruvbox")

-- vim.api.nvim_set_hl(0, "Headline1", { fg = palette.bright_orange, bg = "#312b27", bold = true })
-- vim.api.nvim_set_hl(0, "Headline2", { fg = palette.bright_yellow, bg = "#312e28", bold = true })
-- vim.api.nvim_set_hl(0, "Headline3", { fg = palette.bright_green,  bg = "#2e2e27", bold = true })
-- vim.api.nvim_set_hl(0, "Headline4", { fg = palette.bright_cyan,   bg = "#2b2e2b", bold = true })
-- vim.api.nvim_set_hl(0, "Headline5", { fg = palette.bright_purple, bg = "#2f2b2d", bold = true })
-- vim.api.nvim_set_hl(0, "Headline6", { fg = palette.blue,          bg = "#292d2d", bold = true })
-- vim.api.nvim_set_hl(0, "CodeBlock", { bg = palette.dark0_hard })

-- vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE })
-- vim.api.nvim_set_hl(0, "TabLine", { guibg = NONE, ctermbg = NONE })

-- vim.api.nvim_set_hl(0, "StatusLine", { guibg = "NONE", ctermbg = "NONE" })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { guibg = "NONE", ctermbg = "NONE" })
-- vim.api.nvim_set_hl(0, "WinSeparator", { guibg = "NONE", ctermbg = "NONE" })

-- vim.api.nvim_set_hl(0, "StatusLine",   { ctermbg = "NONE" })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { ctermbg = "NONE" })
-- vim.api.nvim_set_hl(0, "WinSeparator", { bg = ""})

vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = "NONE" })
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FABD2F" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palette.colors.light1 })

vim.g.nvim_markdown_preview_theme = "gruvbox"
