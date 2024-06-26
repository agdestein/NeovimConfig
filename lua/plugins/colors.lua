return {
    {
        "Mofiqul/vscode.nvim",
        enabled = false,
        lazy = false,
        config = function()
            require("vscode").setup({
                -- Alternatively set style in setup
                -- style = 'light'

                -- Enable transparent background
                transparent = false,

                -- Enable italic comment
                italic_comments = true,

                -- Underline `@markup.link.*` variants
                underline_links = true,

                -- -- Disable nvim-tree background color
                -- disable_nvimtree_bg = true,

                -- Override colors (see ./lua/vscode/colors.lua)
                -- color_overrides = {
                --     vscLineNumber = '#FFFFFF',
                -- },

                -- -- Override highlight groups (see ./lua/vscode/theme.lua)
                -- group_overrides = {
                --     -- this supports the same val table as vim.api.nvim_set_hl
                --     -- use colors from this colorscheme by requiring vscode.colors!
                --     Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
                -- }
            })
            require('vscode').load()
        end,
    },
    {
        "RRethy/base16-nvim",
        enabled = false,
        lazy = false,
        config = function()
            require("base16-colorscheme").setup({
                -- base00 = "#151515",
                base00 = "#181818",
                base01 = "#202020",
                base02 = "#303030",
                base03 = "#505050",
                base04 = "#b0b0b0",
                base05 = "#d0d0d0",
                base06 = "#e0e0e0",
                base07 = "#f5f5f5",
                -- base08 = "#ac4142",
                base08 = "#ac4242",
                base09 = "#d28445",
                base0A = "#f4bf75",
                base0B = "#90a959",
                base0C = "#75b5aa",
                base0D = "#6a9fb5",
                base0E = "#aa759f",
                base0F = "#8f5536",
            })

            -- "#ac4242"

            -- require('base16-colorscheme').with_config({
            --     telescope = true,
            --     indentblankline = true,
            --     notify = true,
            --     ts_rainbow = true,
            --     cmp = true,
            --     illuminate = true,
            --     dapui = true,
            -- })
            -- vim.cmd("colorscheme base16-classic-dark")
            vim.o.background = "dark"
            -- vim.cmd("highlight Identifier guifg=#ac4242")
            vim.cmd("highlight TSVariable guifg=#d0d0d0")
        end,
    },
    {
        "projekt0n/github-nvim-theme",
        enabled = false,
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("github-theme").setup({
                options = {
                    -- Compiled file's destination location
                    compile_path = vim.fn.stdpath("cache") .. "/github-theme",
                    compile_file_suffix = "_compiled", -- Compiled file suffix
                    hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
                    hide_nc_statusline = true, -- Override the underline style for non-active statuslines
                    transparent = true, -- Disable setting background
                    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                    dim_inactive = false, -- Non focused panes set to alternative background
                    module_default = true, -- Default enable value for modules
                    -- styles = { -- Style to be applied to different syntax groups
                    --     comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
                    --     functions = "NONE",
                    --     keywords = "NONE",
                    --     variables = "NONE",
                    --     conditionals = "NONE",
                    --     constants = "NONE",
                    --     numbers = "NONE",
                    --     operators = "NONE",
                    --     strings = "NONE",
                    --     types = "NONE",
                    -- },
                    inverse = { -- Inverse highlight for different types
                        match_paren = false,
                        visual = false,
                        search = false,
                    },
                    darken = { -- Darken floating windows and sidebar-like windows
                        floats = false,
                        sidebars = {
                            enabled = true,
                            list = {}, -- Apply dark background to specific windows
                        },
                    },
                    modules = { -- List of various plugins and additional options
                        -- ...
                    },
                },
                palettes = {
                    -- github_dark = {
                    --     bg1 = "#000000",
                    --     bg2 = "#000000",
                    --     bg3 = "#000000",
                    --     bg4 = "#000000",
                    -- },
                },
                specs = {},
                groups = {},
            })

            vim.cmd("colorscheme github_dark_default")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        -- enabled = false,
        opts = {
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
                barbecue = {
                    dim_dirname = true,
                    bold_basename = true,
                    dim_context = true,
                    alt_background = false,
                },
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
                notifier = true,
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

                        -- CursorLine = { bg = colors.base },

                        -- StatusLine = { fg = colors.base, bg = colors.maroon},
                        -- StatusLineNC = { fg = colors.base, bg = colors.maroon},
                        -- WinSeparator = { bg = colors.base, fg = colosurface2rs.maroon},

                        -- WinBar = { bg = colors.mantle },
                        -- WinBarNC = { bg = colors.mantle },

                        NotifyERRORBorder = { fg = colors.red },
                        NotifyERRORIcon = { fg = colors.red },
                        NotifyERRORTitle = { fg = colors.red },
                        NotifyWARNBorder = { fg = colors.peach },
                        NotifyWARNIcon = { fg = colors.peach },
                        NotifyWARNTitle = { fg = colors.peach },
                        NotifyINFOBorder = { fg = colors.green },
                        NotifyINFOIcon = { fg = colors.green },
                        NotifyINFOTitle = { fg = colors.green },
                        NotifyDEBUGIcon = { fg = colors.subtext1 },
                        NotifyDEBUGTitle = { fg = colors.subtext1 },
                        NotifyDEBUGBorder = { fg = colors.overaly1 },
                        NotifyTRACEBorder = { fg = colors.overaly0 },
                        NotifyTRACEIcon = { fg = colors.mauve },
                        NotifyTRACETitle = { fg = colors.mauve },
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
                        NotifyERRORIcon = { fg = colors.red },
                        NotifyERRORTitle = { fg = colors.red },
                        NotifyWARNBorder = { fg = colors.peach },
                        NotifyWARNIcon = { fg = colors.peach },
                        NotifyWARNTitle = { fg = colors.peach },
                        NotifyINFOBorder = { fg = colors.green },
                        NotifyINFOIcon = { fg = colors.green },
                        NotifyINFOTitle = { fg = colors.green },
                        NotifyDEBUGIcon = { fg = colors.subtext1 },
                        NotifyDEBUGTitle = { fg = colors.subtext1 },
                        NotifyDEBUGBorder = { fg = colors.overaly1 },
                        NotifyTRACEBorder = { fg = colors.overaly0 },
                        NotifyTRACEIcon = { fg = colors.mauve },
                        NotifyTRACETitle = { fg = colors.mauve },
                    }
                end,
            },
        },
    },
    {
        "Mofiqul/dracula.nvim",
        enabled = false,
        opts = {
            -- show the '~' characters after the end of buffers
            show_end_of_buffer = true, -- default false

            -- use transparent background
            transparent_bg = true, -- default false

            -- -- set custom lualine background color
            -- lualine_bg_color = "#282a36", -- default nil

            -- set italic comment
            italic_comment = true, -- default false

            -- overrides the default highlights see `:h synIDattr`
            overrides = {
                -- Examples
                -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
                -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
                -- Nothing = {} -- clear highlight of Nothing
                CursorLine = { bg = "NONE" },
                TelescopeNormal = { bg = "NONE" },
                ["@float"] = { link = "@number" },
                VertSplit = { fg = "#44475a" },
                Special = { fg = "#50fa7b", italic = false },
            },
        },
    },
    {
        "ellisonleao/gruvbox.nvim",
        enabled = true,
        opts = {
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
            overrides = {
                CursorLine = { bg = "NONE" },
                CursorLineNr = { link = "Normal" },
                -- SignColumn = { bg = "NONE" },

                -- AlphaButtons = {},
                -- AlphaShortcut = {},
                -- AlphaHeader = {},
                -- A = {},lphaButtons = {},
                -- AlphaFooter = {},
                ["@text.todo.unchecked.markdown"] = { link = "Comment" },
                ["@text.todo.checked.markdown"] = { link = "Comment" },
                ["Delimiter"] = { link = "Comment" },
            },
            dim_inactive = false,
            transparent_mode = true,
        },
    },
    {
        "tanvirtin/monokai.nvim",
        enabled = false,
        opts = {
            palette = { base2 = "#272822" },
        },
    },
    {
        "shaunsingh/nord.nvim",
        enabled = false,
        -- opts = {},
        config = function(_, opts)
            vim.g.nord_contrast = false
            vim.g.nord_borders = true
            vim.g.nord_disable_background = true
            vim.g.nord_italic = true
            vim.g.nord_uniform_diff_background = true
            vim.g.nord_bold = false
        end,
    },
    {
        "folke/tokyonight.nvim",
        enabled = false,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "day", -- The theme is used when the background is set to light
            transparent = true, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark", -- style for floating windows
            },
            sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
            day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = false, -- dims inactive windows
            lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

            --- You can override specific color groups to use other groups or a hex color
            --- function will be called with a ColorScheme table
            ---@param colors ColorScheme
            on_colors = function(colors) end,

            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            ---@param highlights Highlights
            ---@param colors ColorScheme
            on_highlights = function(highlights, colors) end,
        },
    },
    {
        "navarasu/onedark.nvim",
        enabled = false,
        opts = {
            -- Main options --
            style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            transparent = true, -- Show/hide background
            term_colors = true, -- Change terminal color as per the selected theme style
            ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
            cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

            -- toggle theme style ---
            -- toggle_style_key = "<leader>ts", -- Default keybinding to toggle
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
                -- Headline1 = { fg = "#d19a66", bg = "#303236", bold = true },
                -- Headline2 = { fg = "#e5c07b", bg = "#313338", bold = true },
                -- Headline3 = { fg = "#98c379", bg = "#2e3437", bold = true },
                -- Headline4 = { fg = "#689d6a", bg = "#2b3237", bold = true },
                -- Headline5 = { fg = "#56b6c2", bg = "#2a333b", bold = true },
                -- Headline6 = { fg = "#61afef", bg = "#2b333d", bold = true },
                -- CodeBlock = { bg = "#21252B" },
                CursorLine = { bg = "NONE" },
            },

            -- Plugins Config --
            diagnostics = {
                darker = true, -- darker colors for diagnostic
                undercurl = true, -- use undercurl instead of underline for diagnostics
                background = false, -- use background color for virtual text
            },
        },
    },
}
