return {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    -- event = "VeryLazy",
    lazy = false,
    dependencies = {
        "folke/noice.nvim",
    },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                -- theme = "auto",
                theme = { normal = { c = { bg = "none" } } },

                -- component_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },
                -- component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                -- component_separators = { left = "│", right = "│" },
                -- component_separators = { left = "|", right = "|" },
                -- component_separators = { left = "│", right = "│" },
                -- component_separators = { left = "·", right = "·" },
                disabled_filetypes = {
                    statusline = { "dashboard", "alpha", "starter" },
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
                -- lualine_a = { "mode" },
                -- lualine_b = { "branch", "diff", "diagnostics" },
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    "mode",
                    "branch",
                    "diff",
                    "diagnostics",

                    "filename",

                    -- -- Mid section
                    -- {
                    --     function()
                    --         return "%="
                    --     end,
                    -- },

                    -- -- LSP
                    -- {
                    --     -- Lsp server name .
                    --     function()
                    --         local msg = "No Active Lsp"
                    --         local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                    --         local clients = vim.lsp.get_active_clients()
                    --         if next(clients) == nil then
                    --             return msg
                    --         end
                    --         for _, client in ipairs(clients) do
                    --             local filetypes = client.config.filetypes
                    --             if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    --                 return client.name
                    --             end
                    --         end
                    --         return msg
                    --     end,
                    --     -- icon = " LSP:",
                    --     icon = " ",
                    --     -- color = { fg = colors.cyan, gui = "bold" },
                    -- },
                },
                lualine_x = {

                    {
                        require("noice").api.status.search.get,
                        cond = require("noice").api.status.search.has,
                        -- color = { fg = "#ff9e64" },
                    },

                    {
                        require("noice").api.status.mode.get,
                        cond = require("noice").api.status.mode.has,
                        -- color = { fg = "#ff9e64" },
                    },

                    {
                        require("noice").api.status.command.get,
                        cond = require("noice").api.status.command.has,
                        -- color = { fg = "#ff9e64" },
                    },

                    -- "filetype",

                    -- {
                    --     require("noice").api.status.message.get_hl,
                    --     cond = require("noice").api.status.message.has,
                    -- },

                    -- "encoding",
                    -- "fileformat",

                    "progress",
                    "location",
                },
                lualine_y = {},
                lualine_z = {},
                -- lualine_y = { "progress" },
                -- lualine_z = { "location" },
            },
            -- inactive_sections = {
            --     lualine_a = {},
            --     lualine_b = {},
            --     lualine_c = { "filename" },
            --     lualine_x = { "location" },
            --     lualine_y = {},
            --     lualine_z = {},
            -- },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            -- extensions = { "neo-tree", "lazy" },
        })
    end,
}
