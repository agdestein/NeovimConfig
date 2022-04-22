vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
    pattern = "*.tex",
    callback = function()
        vim.opt_local.textwidth = 92
    end,
})
