vim.keymap.set("n", "<Leader>.", [[:let @+=expand("%:.")<CR>]], { desc = "Yank file name" })
vim.keymap.set("n", "<Leader>x", ":bp | bd #<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<Leader>X", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<Leader>al", ":Lazy<CR>", { desc = "Lazy" })
vim.keymap.set("n", "<Leader>c", ":cclose<CR>")

vim.keymap.set("n", "<left>", ":wincmd <<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<right>", ":wincmd ><CR>", { desc = "Increase width" })
vim.keymap.set("n", "<down>", ":wincmd +<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<up>", ":wincmd -<CR>", { desc = "Decrease height" })

vim.keymap.set("n", "[q", ":cprev<CR>", { desc = "Previous item", silent = true })
vim.keymap.set("n", "]q", ":cnext<CR>", { desc = "Next item", silent = true })
vim.keymap.set("n", "<C-j>", ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-k>", ":bnext<CR>", { desc = "Next buffer" })

-- vim.keymap.set("n", "<Leader>ij", ":vsplit term://julia --project<CR>i", { desc = "Open Julia REPL" })
vim.keymap.set("t", "<C-j>", "<Cmd>stopinsert!<CR><C-w><C-w>", { desc = "Visual mode and switch window" })

vim.keymap.set(
    "i",
    "<C-f>",
    [[<Esc>:silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>]],
    { silent = true }
)
vim.keymap.set(
    "n",
    "<Leader><C-f>",
    [[:silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>]],
    { silent = true }
)
