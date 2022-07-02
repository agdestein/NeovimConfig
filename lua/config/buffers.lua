require("bufferline").setup({
    options = {
        numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both"

        indicator_icon = "▎",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",

        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        diagnostics = false, --"coc", -- false | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,

        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number, buf_numbers)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                return true
            end
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                return true
            end
            -- filter out based on arbitrary rules
            -- e.g. filter out vim wiki buffer from tabline in your work repo
            if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                return true
            end
            -- filter out by it's index number in list (don't show first buffer)
            if buf_numbers[1] ~= buf_number then
                return true
            end
        end,

        -- offsets = {{filetype = "NvimTree", text = "File Explorer" | function , text_align = "left" | "center" | "right"}},
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist

        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' }
        enforce_regular_tabs = false,
        always_show_bufferline = false,
        sort_by = "id", -- 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        offsets = {
            {
                filetype = "NvimTree",
                text = function()
                    return vim.fn.getcwd()
                end,
                highlight = "Directory",
                text_align = "left",
            },
        },
        -- custom_areas = {
        --     right = function()
        --         local result = {}
        --         local seve = vim.diagnostic.severity
        --         local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
        --         local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
        --         local info = #vim.diagnostic.get(0, { severity = seve.INFO })
        --         local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
        --
        --         if error ~= 0 then
        --             table.insert(result, { text = "  " .. error, guifg = colors.red })
        --         end
        --
        --         if warning ~= 0 then
        --             table.insert(result, { text = "  " .. warning, guifg = colors.yellow })
        --         end
        --
        --         if hint ~= 0 then
        --             table.insert(result, { text = "  " .. hint, guifg = colors.green })
        --         end
        --
        --         if info ~= 0 then
        --             table.insert(result, { text = "  " .. info, guifg = colors.blue })
        --         end
        --         return result
        --     end,
        -- },
    },
})

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
    ["1"] = { ":BufferLineGoToBuffer 1<CR>", "Go to buffer 1" },
    ["2"] = { ":BufferLineGoToBuffer 2<CR>", "Go to buffer 2" },
    ["3"] = { ":BufferLineGoToBuffer 3<CR>", "Go to buffer 3" },
    ["4"] = { ":BufferLineGoToBuffer 4<CR>", "Go to buffer 4" },
    ["5"] = { ":BufferLineGoToBuffer 5<CR>", "Go to buffer 5" },
    ["6"] = { ":BufferLineGoToBuffer 6<CR>", "Go to buffer 6" },
    ["7"] = { ":BufferLineGoToBuffer 7<CR>", "Go to buffer 7" },
    ["8"] = { ":BufferLineGoToBuffer 8<CR>", "Go to buffer 8" },
    ["9"] = { ":BufferLineGoToBuffer 9<CR>", "Go to buffer 9" },
}, { prefix = "<leader>b", mode = "n", noremap = true, silent = true })

WhichKey.register({
    ["<leader>c"] = { ":bp | bd #<CR>", "Close buffer" },
    ["<leader>C"] = { ":bd<CR>", "Close buffer" },
    ["<C-j>"] = { ":BufferLineCyclePrev<CR>", "Previous buffer" },
    ["<C-k>"] = { ":BufferLineCycleNext<CR>", "Next buffer" },
}, { mode = "n", noremap = true, silent = true })
