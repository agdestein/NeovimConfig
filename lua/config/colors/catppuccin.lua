vim.cmd("hi clear")

vim.opt.termguicolors = true

-- Flavour: "latte", "frappe", "macchiato", "mocha"
vim.g.catppuccin_flavour = "latte"

local catppuccin = require("catppuccin")

catppuccin.setup({
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    transparent_background = true,
    term_colors = false,
    compile = {
        enabled = false,
        path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        coc_nvim = false,
        lsp_trouble = false,
        cmp = true,
        lsp_saga = false,
        gitgutter = false,
        gitsigns = true,
        leap = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = false,
        },
        neotree = {
            enabled = true,
            show_root = true,
            transparent_panel = false,
        },
        dap = {
            enabled = false,
            enable_ui = false,
        },
        which_key = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        dashboard = false,
        neogit = true,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = false,
        markdown = true,
        lightspeed = false,
        ts_rainbow = false,
        hop = false,
        notify = false,
        telekasten = false,
        symbols_outline = true,
        mini = false,
        aerial = false,
        vimwiki = false,
        beacon = false,
    },
    color_overrides = {
        latte = {
            -- overlay0 = "#ff0000",
            surface1 = "#ACB0BE",
        },
    },
    highlight_overrides = {
        mocha = function(colors)
            return {
                -- Headline1 = { fg = colors.peach,    bg = "#342d37", bold = true },
                -- Headline2 = { fg = colors.yellow,   bg = "#34323b", bold = true },
                -- Headline3 = { fg = colors.green,    bg = "#2c323a", bold = true },
                -- Headline4 = { fg = colors.sapphire, bg = "#272f41", bold = true },
                -- Headline5 = { fg = colors.mauve,    bg = "#2f2c42", bold = true },
                -- Headline6 = { fg = colors.text,     bg = "#303042", bold = true },
                Headline1 = { fg = colors.peach, bg = "#292532", bold = true },
                Headline2 = { fg = colors.yellow, bg = "#292834", bold = true },
                Headline3 = { fg = colors.green, bg = "#252834", bold = true },
                Headline4 = { fg = colors.sapphire, bg = "#222638", bold = true },
                Headline5 = { fg = colors.mauve, bg = "#272538", bold = true },
                Headline6 = { fg = colors.text, bg = "#272738", bold = true },
                CodeBlock = { bg = "#272738" },

                -- StatusLine = { fg = colors.base, bg = colors.maroon},
                -- StatusLineNC = { fg = colors.base, bg = colors.maroon},
                -- WinSeparator = { bg = colors.base, fg = colosurface2rs.maroon},
            }
        end,

        latte = function(colors)
            return {
                Headline1 = { fg = colors.peach, bg = "#f0eae9", bold = true },
                Headline2 = { fg = colors.yellow, bg = "#eeecea", bold = true },
                Headline3 = { fg = colors.green, bg = "#e6edeb", bold = true },
                Headline4 = { fg = colors.sapphire, bg = "#e5edf2", bold = true },
                Headline5 = { fg = colors.mauve, bg = "#eae8f5", bold = true },
                Headline6 = { fg = colors.lavender, bg = "#e9ecf5", bold = true },
                CodeBlock = { bg = "#e6e9ef" },

                -- StatusLine = { fg = colors.base, bg = colors.maroon},
                -- StatusLineNC = { fg = colors.base, bg = colors.maroon},
                -- WinSeparator = { bg = colors.base, fg = colors.maroon},

                NotifyERRORBorder = { fg = colors.red },
                NotifyERRORIcon =   { fg = colors.red },
                NotifyERRORTitle =  { fg = colors.red },
                NotifyWARNBorder =  { fg = colors.peach },
                NotifyWARNIcon =    { fg = colors.peach },
                NotifyWARNTitle =   { fg = colors.peach },
                NotifyINFOBorder =  { fg = colors.green },
                NotifyINFOIcon =    { fg = colors.green },
                NotifyINFOTitle =   { fg = colors.green },
                NotifyDEBUGIcon =   { fg = colors.subtext1 },
                NotifyDEBUGTitle =  { fg = colors.subtext1 },
                NotifyDEBUGBorder = { fg = colors.overaly1 },
                NotifyTRACEBorder = { fg = colors.overaly0 },
                NotifyTRACEIcon =   { fg = colors.mauve },
                NotifyTRACETitle =  { fg = colors.mauve },
            }
        end,
    },
})

vim.cmd("colorscheme catppuccin")

-- vim.g.nvim_markdown_preview_theme = "catppuccin"
vim.g.nvim_markdown_preview_theme = "catppuccin_latte"
