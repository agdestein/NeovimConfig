WhichKey = require("which-key")

WhichKey.setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<Plug>", "<plug>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
})

WhichKey.register({
    ["<left>"] = { ":wincmd <<CR>", "Decrease width" },
    ["<right>"] = { ":wincmd ><CR>", "Increase width" },
    ["<down>"] = { ":wincmd +<CR>", "Increase height" },
    ["<up>"] = { ":wincmd -<CR>", "Decrease height" },
    ["[q"] = { ":cprev<CR>", "Previous item" },
    ["]q"] = { ":cnext<CR>", "Next item" },
    ["<F1>"] = { ":set number!<CR> :set relativenumber!<CR>", "Toggle line numbers" },
    ["<C-j>"] = { ":bprev<CR>", "Previous buffer" },
    ["<C-k>"] = { ":bnext<CR>", "Next buffer" },
    ["<leader>"] = {
        name = "Leader",
        -- p = { "\"_dP", "Delete without yank", mode = "x"},
        [","] = {
            name = "Directory",
            c = { ":cd %:p:h<CR>", "Change directory to current file" },
            p = { ":pwd<CR>", "Print working directory" },
        },
        c = { ":bp | bd #<CR>", "Close buffer" },
        C = { ":bd<CR>", "Close buffer" },
        b = { ":Telescope buffers<CR>", "Buffers" },
        i = {
            name = "Terminal",
        },
        k = {
            name = "LSP",
            w = {
                name = "Workspace",
            },
        },
        q = {
            name = "Neovim",
            e = { ":edit $MYVIMRC<CR>", "Edit Neovim config" },
            l = { ":Lazy<CR>", "Lazy" },
        },
        t = {
            name = "Todo",
        },
    },
}, {
    -- silent = true,
})

WhichKey.register({
    ["<C-j>"] = { "<Cmd>stopinsert!<CR><C-w><C-w>", "Visual mode and switch window" },
    -- ["<M-j>"] = { "<Cmd>stopinsert!<CR>", "Visual mode" },
}, { mode = "t" })
