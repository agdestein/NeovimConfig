vim.keymap.set("n", "<Leader>,c", ":cd %:p:h<CR>", { desc = "Change directory to current file" })
vim.keymap.set("n", "<Leader>,p", ":pwd<CR>", { desc = "Print working directory" })
vim.keymap.set("n", "<Leader>,y", [[:let @+=expand("%")<CR>]], { desc = "Yank file name" })
vim.keymap.set("n", "<Leader>c", ":bp | bd #<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<Leader>C", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<Leader>ae", ":edit $MYVIMRC<CR>", { desc = "Edit Neovim config" })
vim.keymap.set("n", "<Leader>al", ":Lazy<CR>", { desc = "Lazy" })

vim.keymap.set("n", "<left>", ":wincmd <<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<right>", ":wincmd ><CR>", { desc = "Increase width" })
vim.keymap.set("n", "<down>", ":wincmd +<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<up>", ":wincmd -<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "[q", ":cprev<CR>", { desc = "Previous item" })
vim.keymap.set("n", "]q", ":cnext<CR>", { desc = "Next item" })
vim.keymap.set("n", "<F1>", ":set number!<CR> :set relativenumber!<CR>", { desc = "Toggle line numbers" })
vim.keymap.set("n", "<C-j>", ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-k>", ":bnext<CR>", { desc = "Next buffer" })

vim.keymap.set("t", "<C-j>", "<Cmd>stopinsert!<CR><C-w><C-w>", { desc = "Visual mode and switch window" })