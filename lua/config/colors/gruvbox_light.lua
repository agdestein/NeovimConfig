vim.cmd("hi clear")

vim.opt.termguicolors = true

vim.o.background = "light"

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
    overrides = {
        -- SignColumn = {bg = "#ff9900"}
    },
    dim_inactive = false,
    transparent_mode = false,
})

vim.cmd("colorscheme gruvbox")

-- vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE })
-- vim.api.nvim_set_hl(0, "TabLine", { guibg = NONE, ctermbg = NONE })
--
-- vim.api.nvim_set_hl(0, "StatusLine", { guibg = NONE, ctermbg = NONE })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { guibg = NONE, ctermbg = NONE })
-- vim.api.nvim_set_hl(0, "WinSeparator", { guibg = NONE, ctermbg = NONE })
