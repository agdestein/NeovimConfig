local zet_dir = "/home/syver/zettels"

WhichKey.register({
    z = {
        name = "Zettels",
        n = {
            function()
                local id = os.date("%Y%m%d%H%M%S")
                vim.cmd(string.format("edit %s/%d.md", zet_dir, id))
            end,
            "Create new zettel",
        },
        f = { function()
            require("telescope.builtin").live_grep({hidden = true, cwd = zet_dir})
        end, "Find zettels" },
    },
}, { prefix = "<Leader>", noremap = true })
