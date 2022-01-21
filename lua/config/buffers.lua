require("bufferline").setup({})

-- vim.api.nvim_set_keymap("n", "<leader>c", ":bd<CR>", {})
-- vim.api.nvim_set_keymap("n", "<C-j>", ":bprev<CR>", {})
-- vim.api.nvim_set_keymap("n", "<C-k>", ":bnext<CR>", {})

WhichKey.register({
    name = "Buffers",
    c = { ":bd<CR>", "Close buffer" },

    -- These commands will navigate through buffers in order regardless of which mode you are using
    -- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
    j = { ":BufferLineCyclePrev<CR>", "Previous buffer" },
    k = { ":BufferLineCycleNext<CR>", "Next buffer" },

    -- These commands will move the current buffer backwards or forwards in the bufferline
    h = { ":BufferLineMovePrev<CR>", "Move buffer left" },
    l = { ":BufferLineMoveNext<CR>", "Move buffer right" },

    -- These commands will sort buffers by directory, language, or a custom criteria
    e = { ":BufferLineSortByExtension<CR>", "Sort buffers by extension" },
    d = { ":BufferLineSortByDirectory<CR>", "Sort buffers by directory" },
    i = {
        function()
            require("bufferline").sort_buffers_by(function(buf_a, buf_b)
                return buf_a.id < buf_b.id
            end)
        end,
        "Sort buffers by id",
    },

    -- Buffer numbers
    ["1"] = {":BufferLineGoToBuffer 1<CR>", "Go to buffer 1"},
    ["2"] = {":BufferLineGoToBuffer 2<CR>", "Go to buffer 2"},
    ["3"] = {":BufferLineGoToBuffer 3<CR>", "Go to buffer 3"},
    ["4"] = {":BufferLineGoToBuffer 4<CR>", "Go to buffer 4"},
    ["5"] = {":BufferLineGoToBuffer 5<CR>", "Go to buffer 5"},
    ["6"] = {":BufferLineGoToBuffer 6<CR>", "Go to buffer 6"},
    ["7"] = {":BufferLineGoToBuffer 7<CR>", "Go to buffer 7"},
    ["8"] = {":BufferLineGoToBuffer 8<CR>", "Go to buffer 8"},
    ["9"] = {":BufferLineGoToBuffer 9<CR>", "Go to buffer 9"},
}, { prefix = "<leader>b", mode = "n", noremap = true, silent = true })

WhichKey.register({
    ["<leader>c"] = { ":bd<CR>", "Close buffer" },
    ["<C-j>"] = { ":BufferLineCyclePrev<CR>", "Previous buffer" },
    ["<C-k>"] = { ":BufferLineCycleNext<CR>", "Next buffer" },
}, { mode = "n", noremap = true, silent = true })
