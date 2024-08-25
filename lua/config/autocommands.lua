local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TermOpen", {
    callback = function()
        vim.o.number = false
        vim.o.relativenumber = false
        vim.o.signcolumn = "no"
        vim.o.cursorline = false
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

-- resize splits if window got resized
autocmd({ "VimResized" }, {
    group = augroup("resize_splits", { clear = false }),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- -- wrap and check for spell in text filetypes
-- vim.api.nvim_create_autocmd("FileType", {
--     group = augroup("wrap_spell", { clear = false }),
--     pattern = { "gitcommit", "markdown" },
--     callback = function()
--         vim.opt_local.wrap = true
--         -- vim.opt_local.spell = true
--     end,
-- })
