return {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    lazy = false,
    dependencies = {
        "folke/noice.nvim",
    },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                -- theme = "catppuccin",
                theme = { normal = { c = { bg = "none" } } },
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = vim.go.laststatus == 3,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    "mode",
                    "branch",
                    "diff",
                    "diagnostics",
                    "filename",
                },
                lualine_x = {
                    {
                        require("noice").api.status.search.get,
                        cond = require("noice").api.status.search.has,
                    },
                    {
                        require("noice").api.status.mode.get,
                        cond = require("noice").api.status.mode.has,
                    },
                    {
                        require("noice").api.status.command.get,
                        cond = require("noice").api.status.command.has,
                    },
                    "progress",
                    "location",
                },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {
                "fugitive",
                "lazy",
                "neo-tree",
                "quickfix",
                "symbols-outline",
            },
        })
    end,
}
