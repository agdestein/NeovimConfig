return {
    "utilyre/barbecue.nvim",
    enabled = true,
    name = "barbecue",
    -- event = { "BufReadPre", "BufNewFile" },
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        -- "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
        -- configurations go here
        show_modified = true,
    },
}
