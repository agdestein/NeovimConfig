vim.cmd("hi clear")

vim.opt.termguicolors = true

local catppuccin = require("catppuccin")

catppuccin.setup({
    transparent_background = false,
    term_colors = false,
    styles = {
        comments = "italic",
        functions = "NONE",
        keywords = "NONE",
        strings = "NONE",
        variables = "NONE",
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
            },
            underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
            },
        },
        lsp_trouble = true,
        cmp = true,
        lsp_saga = false,
        gitgutter = false,
        gitsigns = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = false,
            transparent_panel = false,
        },
        neotree = {
            enabled = false,
            show_root = false,
            transparent_panel = false,
        },
        which_key = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        dashboard = true,
        neogit = true,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = true,
        markdown = true,
        lightspeed = false,
        ts_rainbow = false,
        hop = false,
        notify = true,
        telekasten = false,
        symbols_outline = true,
    },
})

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

vim.cmd("colorscheme catppuccin")


-- colors = {
--     fg = "#D9E0EE",
--     comment = "#6E6C7E",
--     bg = "#161320",
--     -- bg = "#1A1826",
--     -- bg = "#302D41",
--     violet = "#DDB6F2",
--     dark_blue = "#96CDFB",
--     border = "#575268",
--     orange = "#F8BD96",
--     red = "#F28FAD",
--     green = "#ABE9B3",
--     yellow = "#FAE3B0",
--     blue = "#96CDFB",
--     magenta = "#F5C2E7",
--     cyan = "#89DCEB",
-- }
-- vim.cmd("hi WinSeparator guifg=#6E6C7E")
