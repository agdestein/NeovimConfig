vim.cmd("hi clear")

vim.opt.termguicolors = true

local onedark = require("onedark")

onedark.setup({
    -- Main options --
    style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false, -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

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

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Override default colors
    colors = {},

    -- Override highlight groups
    highlights = {
        Headline1 = { fg = "#d19a66", bg = "#303236", bold = true },
        Headline2 = { fg = "#e5c07b", bg = "#313338", bold = true },
        Headline3 = { fg = "#98c379", bg = "#2e3437", bold = true },
        Headline4 = { fg = "#689d6a", bg = "#2b3237", bold = true },
        Headline5 = { fg = "#56b6c2", bg = "#2a333b", bold = true },
        Headline6 = { fg = "#61afef", bg = "#2b333d", bold = true },
        CodeBlock = { bg = "#21252B" },
    },

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
    },
})

onedark.load()

vim.g.nvim_markdown_preview_theme = "one_dark"
