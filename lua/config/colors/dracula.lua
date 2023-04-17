local dracula = require("dracula")
local colors = dracula.colors()

vim.cmd("hi clear")

vim.opt.termguicolors = true

dracula.setup({
    -- show the '~' characters after the end of buffers
    show_end_of_buffer = true, -- default false

    -- use transparent background
    transparent_bg = true, -- default false

    -- -- set custom lualine background color
    -- lualine_bg_color = "#44475a", -- default nil

    -- set italic comment
    italic_comment = true, -- default false

    -- overrides the default highlights see `:h synIDattr`
    overrides = {
        -- Examples
        -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
        -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
        -- Nothing = {} -- clear highlight of Nothing
        CursorLine = { ctermbg = "NONE" },
        TelescopeNormal = { ctermbg = "NONE" },
    },
})

vim.cmd("colorscheme dracula")

-- vim.api.nvim_set_hl(0, "Headline1", { fg = colors.pink,   bg = "#332e3d", bold = true })
-- vim.api.nvim_set_hl(0, "Headline2", { fg = colors.cyan,   bg = "#2d3440", bold = true })
-- vim.api.nvim_set_hl(0, "Headline3", { fg = colors.green,  bg = "#2a3439", bold = true })
-- vim.api.nvim_set_hl(0, "Headline4", { fg = colors.purple, bg = "#2f2f40", bold = true })
-- vim.api.nvim_set_hl(0, "Headline5", { fg = colors.yellow, bg = "#32343a", bold = true })
-- vim.api.nvim_set_hl(0, "Headline6", { fg = colors.red,    bg = "#332c38", bold = true })
-- vim.api.nvim_set_hl(0, "CodeBlock", { bg = "#21222C" })

-- vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE })
-- vim.api.nvim_set_hl(0, "TabLine", { guibg = NONE, ctermbg = NONE })

-- vim.api.nvim_set_hl(0, "StatusLine", { bg = NONE})
-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = colors.menu })
-- vim.api.nvim_set_hl(0, "WinSeparator", { guibg = NONE, ctermbg = NONE })

-- vim.cmd("hi WinSeparator guibg=NONE guifg=#6272a4")

vim.g.nvim_markdown_preview_theme = "dracula"
