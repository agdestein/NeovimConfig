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

local function create_linked_note(dir, edit, after)
    return function()
        vim.ui.input(
            { prompt = "Enter note title: "},
            function(title)
                local id = os.date("%Y%m%d%H%M%S")
                vim.cmd("cd " .. dir)
                -- vim.cmd(string.format("i[%s](%d.md)<Esc>", title, id))
                vim.api.nvim_put({ string.format("[%s](%d.md)", title, id) }, "", after, false)
                vim.cmd(string.format(edit .. " %d.md", id))
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
-- vim.keymap.set("n", "<Leader>ai", create_linked_note(note_dir, "edit", false), { desc = "Add note" })
-- vim.keymap.set("n", "<Leader>aa", create_linked_note(note_dir, "edit", true), { desc = "Add note (edit)" })
vim.keymap.set("n", "<Leader>aa", create_linked_note(note_dir, "sp", true), { desc = "Add note (split)" })
vim.keymap.set("n", "<Leader>av", create_linked_note(note_dir, "vsp", true), { desc = "Add note (vsplit)" })
vim.keymap.set("n", "<Leader>ad", insert_date, { desc = "Insert date" })
vim.keymap.set("n", "<Leader>am", ":MarkdownPreview<CR>")

vim.keymap.set("n", "<Leader>z", function()
    require("telescope.builtin").live_grep({ hidden = true, cwd = note_dir })
end, { desc = "Search notes" })
