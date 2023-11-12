-- Load the colorscheme
require("nord").set()
vim.cmd("colorscheme nord")

vim.g.nvim_markdown_preview_theme = "nord"

vim.cmd([[  autocmd TermOpen * setlocal winhighlight=Normal:Normal,SignColumn:Normal]])

vim.o.cursorline = false

vim.cmd("highlight! link NeoTreeDotfile Comment")
vim.cmd("highlight! link NeoTreeMessage Comment")
vim.cmd("highlight NeoTreeGitUntracked guifg=#D08770")
vim.cmd("highlight NeoTreeGitConflict guifg=#D08770")

vim.cmd("highlight MsgArea guibg=#2E3440")
