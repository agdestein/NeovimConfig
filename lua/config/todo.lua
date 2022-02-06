require("todo-comments").setup({})
 
WhichKey.register({
    t = {
        name = "Todo",
        l = {":TodoLocList<CR>", "Loc list"},
        t = {":TodoTrouble<CR>", "Trouble"},
        q = {":TodoQuickFix<CR>", "Quick fix"},
        s = {":TodoTelescope<CR>", "Telescope"},
    },
}, { prefix = "<leader>", description = "Todo" })
