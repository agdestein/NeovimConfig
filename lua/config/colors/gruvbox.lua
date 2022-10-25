vim.cmd("hi clear")

vim.opt.termguicolors = true

vim.o.background = "dark"

local palette = require("gruvbox.palette")

require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
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
    transparent_mode = false,
})

vim.cmd("colorscheme gruvbox")

vim.api.nvim_set_hl(0, "Headline1", { fg = palette.bright_orange, bg = "#303030", bold = true })
vim.api.nvim_set_hl(0, "Headline2", { fg = palette.bright_yellow, bg = "#303030", bold = true })
vim.api.nvim_set_hl(0, "Headline3", { fg = palette.bright_green, bg = "#303030", bold = true })
vim.api.nvim_set_hl(0, "Headline4", { fg = palette.bright_cyan, bg = "#303030", bold = true })
vim.api.nvim_set_hl(0, "Headline5", { fg = palette.bright_red, bg = "#303030", bold = true })
vim.api.nvim_set_hl(0, "Headline6", { fg = palette.light1, bg = "#303030", bold = true })
vim.api.nvim_set_hl(0, "CodeBlock", { bg = "#1d2021" })

-- vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE })
-- vim.api.nvim_set_hl(0, "TabLine", { guibg = NONE, ctermbg = NONE })
--
-- vim.api.nvim_set_hl(0, "StatusLine", { guibg = NONE, ctermbg = NONE })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { guibg = NONE, ctermbg = NONE })
-- vim.api.nvim_set_hl(0, "WinSeparator", { guibg = NONE, ctermbg = NONE })
