-- WhichKey.register(
--     { ["<C-h>"] = { [[copilot#Accept("\<CR>")]], "Accept suggestion" } },
--     { "i", silent = true, expression = true }
-- )

vim.cmd([[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]])
vim.g.copilot_no_tab_map = true
