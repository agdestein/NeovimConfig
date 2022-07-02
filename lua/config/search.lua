local telescope = require("telescope")

telescope.setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            -- "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                -- ["<C-h>"] = "which_key"
            },
        },
        prompt_prefix = "❯ ",
        selection_caret = "→ ",
    },
})

WhichKey.register({
    name = "Telescope",
    o = { ":Telescope find_files<CR>", "Find files" },
    p = { ":Telescope find_files no_ignore=true<CR>", "Find (all) files" },
    e = { ":Telescope live_grep<CR>", "Live grep" },
    w = { ":Telescope grep_string<CR>", "Grep string" },
    b = { ":Telescope buffers<CR>", "Buffers" },
    h = { ":Telescope help_tags<CR>", "Help tags" },
    k = { ":Telescope keymaps<CR>", "Keymaps" },
    r = { ":Telescope registers<CR>", "Registers" },
    c = { ":Telescope current_buffer_fuzzy_find<CR>", "Current buffer fuzzy find" },
}, { prefix = "<leader>f", noremap = true })


-- Search and replace
local Spectre = require("spectre")

Spectre.setup({})

-- Normal mode
WhichKey.register({
    name = "Spectre",
    o = { Spectre.open, "Open Spectre" },
    w = {
        function()
            Spectre.open_visual({ select_word = true })
        end,
        "Search word",
    },
    f = { Spectre.open_file_search, "Search in file" },
}, { prefix = "<leader>s", noremap = true })

-- Visual mode
WhichKey.register({
    s = {
        function()
            Spectre.open_visual()
        end,
        "Search selection"
    },
}, { mode = "v", prefix = "<leader>", noremap = true })
