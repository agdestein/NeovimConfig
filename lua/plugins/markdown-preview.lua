return {
    -- "davidgranstrom/nvim-markdown-preview",
    dir = "$HOME/projects/nvim-markdown-preview",
    cmd = "MarkdownPreview",
    config = function()
        vim.g.nvim_markdown_preview_format = "markdown"
        -- vim.g.nvim_markdown_preview_format = "gfm"
    end,
}
