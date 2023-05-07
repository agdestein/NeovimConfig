local note_dir = os.getenv("HOME") .. "/notes"
local home_dir = note_dir .. "/home"
local work_dir = note_dir .. "/work"
local zet_dir = note_dir .. "/zettels"

local function create_note(dir)
    return function()
        local id = os.date("%Y%m%d%H%M%S")
        vim.cmd(string.format("edit %s/%d.md", dir, id))
        local title = os.date("# New note %Y/%m/%d %A %H:%M")
        vim.api.nvim_put({title}, "", false, false)
        vim.cmd(":normal 0ll")
    end
end

WhichKey.register({
    n = {
        name = "Crete note",
        z = {
            create_note(zet_dir),
            "Create new zettel",
        },
        w = {
            create_note(work_dir),
            "Create new work note",
        },
        h = {
            create_note(home_dir),
            "Create personal note",
        },
    },
    z = {
        a = {
            function()
                require("telescope.builtin").live_grep({ hidden = true, cwd = note_dir })
            end,
            "Search all notes",
        },
        z = {
            function()
                require("telescope.builtin").live_grep({ hidden = true, cwd = zet_dir })
            end,
            "Search zettelkasten",
        },
        w = {
            function()
                require("telescope.builtin").live_grep({ hidden = true, cwd = work_dir })
            end,
            "Search work",
        },
        h = {
            function()
                require("telescope.builtin").live_grep({ hidden = true, cwd = home_dir })
            end,
            "Search home",
        },
    }
}, { prefix = "<Leader>", noremap = true })
