require("nvim-tree").setup({})

vim.api.nvim_set_keymap("", "<F3>", ":NvimTreeToggle<CR>", { silent = true })
vim.api.nvim_set_keymap("", "<F2>", ":NvimTreeFindFileToggle<CR>", { silent = true })

