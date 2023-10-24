local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

-- autocmd("BufRead,BufNewFile", {
--     pattern = "*.tex",
--     callback = function()
--         -- vim.opt_local.textwidth = 92
--         -- vim.o.spell = true
--         vim.keymap.set(
--             "i",
--             "<C-f>",
--             [[<Esc>:silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>]],
--             { silent = true }
--         )
--         vim.keymap.set(
--             "n",
--             "<Leader><C-f>",
--             [[:silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>]],
--             { silent = true }
--         )
--     end,
-- })

-- autocmd("BufRead,BufNewFile", {
--     pattern = "*.jl",
--     callback = function()
--         -- vim.o.ls = 1
--     end,
-- })

autocmd("TermOpen", {
    callback = function()
        vim.o.number = false
        vim.o.relativenumber = false
        vim.o.signcolumn = "no"
        vim.o.cursorline = false
    end,
})

-- autocmd("BufRead,BufNewFile", {
--     pattern = "*.md",
--     callback = function()
--         -- vim.opt_local.textwidth = 80
--         -- vim.o.spell = true
--     end,
-- })

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

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("wrap_spell", { clear = false }),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})
