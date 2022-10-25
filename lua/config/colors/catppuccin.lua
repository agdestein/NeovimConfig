vim.cmd("hi clear")

vim.opt.termguicolors = true

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

local catppuccin = require("catppuccin")

catppuccin.setup({
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    transparent_background = false,
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
        gitsigns = false,
        leap = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = false,
        },
        neotree = {
            enabled = false,
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
    highlight_overrides = {
        mocha = function(colors)
            return {
                -- Headline1 = { fg = colors.peach,    bg = "#342d37", bold = true },
                -- Headline2 = { fg = colors.yellow,   bg = "#34323b", bold = true },
                -- Headline3 = { fg = colors.green,    bg = "#2c323a", bold = true },
                -- Headline4 = { fg = colors.sapphire, bg = "#272f41", bold = true },
                -- Headline5 = { fg = colors.mauve,    bg = "#2f2c42", bold = true },
                -- Headline6 = { fg = colors.text,     bg = "#303042", bold = true },
                Headline1 = { fg = colors.peach,    bg = "#292532", bold = true },
                Headline2 = { fg = colors.yellow,   bg = "#292834", bold = true },
                Headline3 = { fg = colors.green,    bg = "#252834", bold = true },
                Headline4 = { fg = colors.sapphire, bg = "#222638", bold = true },
                Headline5 = { fg = colors.mauve,    bg = "#272538", bold = true },
                Headline6 = { fg = colors.text,     bg = "#272738", bold = true },
                CodeBlock = { bg = "#272738"},

                -- StatusLine = { fg = colors.base, bg = colors.maroon},
                -- StatusLineNC = { fg = colors.base, bg = colors.maroon},
                -- WinSeparator = { bg = colors.base, fg = colors.maroon},
            }
        end,
    },

    -- local color_palette = {
    -- 	rosewater = "#F5E0DC",
    -- 	flamingo = "#F2CDCD",
    -- 	pink = "#F5C2E7",
    -- 	mauve = "#CBA6F7",
    -- 	red = "#F38BA8",
    -- 	maroon = "#EBA0AC",
    -- 	peach = "#FAB387",
    -- 	yellow = "#F9E2AF",
    -- 	green = "#A6E3A1",
    -- 	teal = "#94E2D5",
    -- 	sky = "#89DCEB",
    -- 	sapphire = "#74C7EC",
    -- 	blue = "#89B4FA",
    -- 	lavender = "#B4BEFE",
    --
    -- 	text = "#CDD6F4",
    -- 	subtext1 = "#BAC2DE",
    -- 	subtext0 = "#A6ADC8",
    -- 	overlay2 = "#9399B2",
    -- 	overlay1 = "#7F849C",
    -- 	overlay0 = "#6C7086",
    -- 	surface2 = "#585B70",
    -- 	surface1 = "#45475A",
    -- 	surface0 = "#313244",
    --
    -- 	base = "#1E1E2E",
    -- 	mantle = "#181825",
    -- 	crust = "#11111B",
    -- }
})

vim.cmd("colorscheme catppuccin")
