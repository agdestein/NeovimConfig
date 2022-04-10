-- Autoformat
vim.api.nvim_set_keymap("n", "<leader>af", ":Autoformat<CR>", {})
vim.g.formatdef_latexindent = "'latexindent -'"
-- vim.g.formatdef_lua = "'stylua -f ~/.config/nvim/stylua.toml'"
vim.g.formatdef_python = "black"
