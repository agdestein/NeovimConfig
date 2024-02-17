local note_dir = os.getenv("HOME") .. "/notes"

local function create_note(dir)
    return function()
        local id = os.date("%Y%m%d%H%M%S")
        vim.cmd("cd " .. dir)
        vim.cmd(string.format("edit %d.md", id))
        local title = os.date("# New note %Y/%m/%d %A %H:%M")
        vim.api.nvim_put({ title }, "", false, false)
        vim.cmd(":normal 0ll")
    end
end

local function create_linked_note(dir, after)
    return function()
        vim.ui.input(
            { prompt = "Enter note title: "},
            function(title)
                local id = os.date("%Y%m%d%H%M%S")
                vim.cmd("cd " .. dir)
                -- vim.cmd(string.format("i[%s](%d.md)<Esc>", title, id))
                vim.api.nvim_put({ string.format("[%s](%d.md)", title, id) }, "", after, false)
                vim.cmd(string.format("edit %d.md", id))
                vim.api.nvim_put({ "# " .. title }, "", false, false)
                -- vim.cmd(":normal 0ll")
            end
        )
    end
end

local function insert_date()
    vim.api.nvim_put({ os.date("%Y/%m/%d %A %H:%M") }, "", true, false)
end

vim.keymap.set("n", "<Leader>ao", create_note(note_dir), { desc = "Create note" })
vim.keymap.set("n", "<Leader>ai", create_linked_note(note_dir, false), { desc = "Create note and insert link at cursor" })
vim.keymap.set("n", "<Leader>aa", create_linked_note(note_dir, true), { desc = "Create note and insert link after cursor" })
vim.keymap.set("n", "<Leader>ad", insert_date, { desc = "Insert date" })
vim.keymap.set("n", "<Leader>ac", ":e .week.md<CR>", { silent = true, desc = "Current week" })
vim.keymap.set("n", "<Leader>at", ":e .todo.md<CR>", { silent = true, desc = "Current week" })
vim.keymap.set("n", "<Leader>am", ":MarkdownPreview<CR>")

vim.keymap.set("n", "<Leader>fz", function()
    require("telescope.builtin").live_grep({ hidden = true, cwd = note_dir })
end, { desc = "Search notes" })
