-- Flavour: "latte", "frappe", "macchiato", "mocha"
vim.g.catppuccin_flavour = "mocha"
vim.g.nvim_markdown_preview_theme = "catppuccin"

vim.cmd("colorscheme catppuccin")

vim.o.cursorline = true

-- vim.cmd(":hi CursorLine cterm=underline term=underline ctermbg=NONE guibg=NONE")
vim.cmd(":hi CursorLine ctermbg=NONE guibg=NONE")
