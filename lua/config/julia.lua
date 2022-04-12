-- Julia
vim.g.default_julia_version = "1.7"

vim.g.julia_indent_align_import = false
vim.g.julia_indent_align_brackets = false
vim.g.julia_indent_align_funcargs = false

WhichKey.register({
    j = {
        name = "Julia",
        b = { ":call julia#toggle_function_blockassign()<CR>", "Toggle function block" },
    },
}, { prefix = "<leader>", noremap = true })
