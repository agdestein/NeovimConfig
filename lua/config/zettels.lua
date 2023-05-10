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

vim.keymap.set("n", "<Leader>zn", create_note(note_dir), { desc = "Create note" })

vim.keymap.set("n", "<Leader>fz", function()
    require("telescope.builtin").live_grep({ hidden = true, cwd = note_dir })
end, { desc = "Search notes" })
