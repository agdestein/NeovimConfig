-- Julia
-- vim.g.default_julia_version = "1.7"

vim.g.latex_to_unicode_tab = "on"
vim.g.latex_to_unicode_auto = false

vim.g.julia_indent_align_import = false
vim.g.julia_indent_align_brackets = false
vim.g.julia_indent_align_funcargs = false

vim.g.JuliaFormatter_use_sysimage = true

vim.cmd("hi link juliaParDelim Delimiter")
vim.cmd("hi link juliaSemicolon Operator")
vim.cmd("hi link juliaFunctionCall Identifier")

WhichKey.register({
    j = {
        name = "Julia",
        b = { ":call julia#toggle_function_blockassign()<CR>", "Toggle function block" },
        c = { ":JuliaREPLConnect<CR>", "Connect to remote Julia REPL" },
        f = { ":JuliaFormatterFormat<CR>", "Format file" },
    },
    d = { "}{jvip :JuliaREPLSend<CR> }", "Send region to remote Julia REPL" },
}, { prefix = "<leader>", noremap = true })


WhichKey.register({
    jf = { ":JuliaFormatterFormat<CR>", "Format selection", mode = "v" },
}, { prefix = "<leader>", noremap = true })
