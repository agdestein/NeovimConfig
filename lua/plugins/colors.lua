return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        -- enabled = false,
        priority = 1000,
        opts = {
            flavour = "auto", -- latte, frappe, macchiato, mocha
            background = {    -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- disables setting the background color.
            show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
            term_colors = true,             -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false,            -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15,          -- percentage of the shade to apply to the inactive window
            },
            no_italic = false,              -- Force no italic
            no_bold = false,                -- Force no bold
            no_underline = false,           -- Force no underline
            styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" },    -- Change the style of comments
                conditionals = {},
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
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            color_overrides = {},
            custom_highlights = function(colors)
                return {
                    CursorLine = { bg = colors.none },
                    -- TreesitterContextBottom = {
                    --     sp = colors.surface0,
                    --     -- style = { "underline" },
                    --     style = {},
                    -- },
                }
            end,
            highlight_overrides = {},
            default_integrations = false,
            integrations = {
                barbecue = {
                    dim_dirname = true,
                    bold_basename = true,
                    dim_context = false,
                    alt_background = false,
                },
                cmp = true,
                flash = true,
                gitsigns = true,
                markdown = true,
                mini = {
                    enabled = true,
                    indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                },

                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        ok = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },

                neogit = true,
                neotree = true,
                noice = true,
                notifier = true,
                render_markdown = true,
                symbols_outline = true,
                telescope = {
                    enabled = true,
                    -- style = "nvchad"
                },
                treesitter = true,
                treesitter_context = true,
                which_key = false,
            },
        },
    },
}
