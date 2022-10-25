local dracula = require("dracula")

vim.cmd("hi clear")

vim.opt.termguicolors = true

dracula.setup({
    -- show the '~' characters after the end of buffers
    show_end_of_buffer = true, -- default false

    -- use transparent background
    transparent_bg = false, -- default false

    -- set custom lualine background color
    lualine_bg_color = "#44475a", -- default nil

    -- set italic comment
    italic_comment = true, -- default false

    -- overrides the default highlights see `:h synIDattr`
    overrides = {
        -- Examples
        -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
        -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
        -- Nothing = {} -- clear highlight of Nothing
    },
})

vim.cmd("colorscheme dracula")

-- vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE })
-- vim.api.nvim_set_hl(0, "TabLine", { guibg = NONE, ctermbg = NONE })

-- vim.cmd("hi WinSeparator guibg=NONE guifg=#6272a4")
