-- VimTeX
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_mode = "0"
vim.g.vimtex_compiler_latexmk = {
    options = {
        "-pdf",
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
    },
}
