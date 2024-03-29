return {
    "nvim-neorg/neorg",
    enabled = false,
    event = "VeryLazy",
    build = ":Neorg sync-parsers",
    opts = {
        load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.export"] = {},
            ["core.integrations.treesitter"] = {},
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.dirman"] = { -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        notes = "~/notes",
                    },
                },
            },
        },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
}
