local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("BufRead,BufNewFile", {
    pattern = "*.tex",
    callback = function()
        -- vim.opt_local.textwidth = 92
        -- vim.o.spell = true
    end,
})

autocmd("BufRead,BufNewFile", {
    pattern = "*.jl",
    callback = function()
        -- vim.o.ls = 1
    end,
})

autocmd("TermOpen", {
    callback = function()
        vim.o.number = false
        vim.o.relativenumber = false
        vim.o.signcolumn = "no"
        vim.o.cursorline = false
    end,
})

autocmd("BufRead,BufNewFile", {
    pattern = "*.md",
    callback = function()
        -- vim.opt_local.textwidth = 80
        -- vim.o.spell = true
    end,
})

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})
