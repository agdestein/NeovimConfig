return {
    -- "davidgranstrom/nvim-markdown-preview",
    dir = "$HOME/projects/nvim-markdown-preview",
    -- event = "VeryLazy",
    ft = { "markdown" },
    config = function()
        vim.g.nvim_markdown_preview_format = "markdown"
        -- vim.g.nvim_markdown_preview_format = "gfm"
    end,
}
