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
    b = { ":Telescope buffers<CR>", "Buffers" },
    c = { ":Telescope current_buffer_fuzzy_find<CR>", "Current buffer fuzzy find" },
    e = { ":Telescope live_grep<CR>", "Live grep" },
    d = {
        function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end,
        "[/] Fuzzily search in current buffer",
    },
    h = { ":Telescope help_tags<CR>", "Help tags" },
    i = { ":Telescope registers<CR>", "Registers" },
    k = { ":Telescope keymaps<CR>", "Keymaps" },
    o = { ":Telescope find_files<CR>", "Find files" },
    p = { ":Telescope find_files no_ignore=true<CR>", "Find (all) files" },
    r = { ":Telescope oldfiles<CR>", "Oldfiles" },
    w = { ":Telescope grep_string<CR>", "Grep string" },
}, { prefix = "<leader>f", noremap = true })
