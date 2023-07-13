-- Load the colorscheme
require("nord").set()
vim.cmd("colorscheme nord")

vim.g.nvim_markdown_preview_theme = "nord"


vim.cmd([[  autocmd TermOpen * setlocal winhighlight=Normal:Normal,SignColumn:Normal]])
