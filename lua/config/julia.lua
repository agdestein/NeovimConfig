-- Julia
-- vim.g.default_julia_version = "1.7"

vim.g.latex_to_unicode_tab = "on"
vim.g.latex_to_unicode_auto = false

vim.g.julia_indent_align_import = false
vim.g.julia_indent_align_brackets = false
vim.g.julia_indent_align_funcargs = false

WhichKey.register({
    j = {
        name = "Julia",
        b = { ":call julia#toggle_function_blockassign()<CR>", "Toggle function block" },
        c = { ":JuliaREPLConnect<CR>", "Connect to remote Julia REPL" },
    },
    d = { "}{jvip :JuliaREPLSend<CR> }", "Send region to remote Julia REPL" },
}, { prefix = "<leader>", noremap = true })
