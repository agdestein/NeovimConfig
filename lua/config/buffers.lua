WhichKey.register({
    ["<leader>c"] = { ":bp | bd #<CR>", "Close buffer" },
    ["<leader>C"] = { ":bd<CR>", "Close buffer" },
    ["<C-j>"] = { ":bprev<CR>", "Previous buffer" },
    ["<C-k>"] = { ":bnext<CR>", "Next buffer" },
    ["<leader>b"] = { ":Telescope buffers<CR>", "Buffers" },
}, { mode = "n", noremap = true, silent = true })
