-- Julia
vim.g.default_julia_version = "1.7"
vim.g.julia_cell_delimit_cells_by = "tags"

WhichKey.register({
    j = {
        name = "Julia",
        c = { ":JuliaCellExecuteCell<CR>", "Execute cell" },
        x = { ":JuliaCellExecuteCellJump<CR>", "Execute cell and jump" },
        j = { ":JuliaCellNextCell<CR>", "Jump to next cell" },
        k = { ":JuliaCellPrevCell<CR>", "Jump to previous cell" },
        b = { ":call julia#toggle_function_blockassign()<CR>", "Toggle function block" },
        f = { ":JuliaFormatterFormat<CR>", "Format code" },
    },
}, { prefix = "<leader>" })
