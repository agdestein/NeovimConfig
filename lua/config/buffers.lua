require("bufferline").setup({})

-- vim.api.nvim_set_keymap("n", "<leader>c", ":bd<CR>", {})
-- vim.api.nvim_set_keymap("n", "<C-j>", ":bprev<CR>", {})
-- vim.api.nvim_set_keymap("n", "<C-k>", ":bnext<CR>", {})

WhichKey.register({
    name = "Buffers",
    c = { ":BufferLinePickClose<CR>", "Pick buffer to close" },
    o = { ":BufferLinePick<CR>", "Pick buffer" },
    j = { ":BufferLineCyclePrev<CR>", "Previous buffer" },
    k = { ":BufferLineCycleNext<CR>", "Next buffer" },
    h = { ":BufferLineMovePrev<CR>", "Move buffer left" },
    l = { ":BufferLineMoveNext<CR>", "Move buffer right" },
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
    ["-"] = { ":BufferLineCloseLeft<CR>", "Close left buffers" },
    ["+"] = { ":BufferLineCloseRight<CR>", "Close right buffers" },
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
