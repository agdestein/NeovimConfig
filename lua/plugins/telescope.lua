return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        "nvim-telescope/telescope-bibtex.nvim",
    },
    cmd = "Telescope",
    keys = {
        { "<Leader>b", ":Telescope buffers<CR>", desc = "Buffers" },
        { "<leader>:", ":Telescope command_history<CR>", desc = "Command History" },
        { "<Leader>s", ":Telescope current_buffer_fuzzy_find<CR>", desc = "Current buffer fuzzy find" },
        {
            "<Leader>w",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find(
                    require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
                )
            end,
            desc = "Fuzzily search in current buffer",
        },
        { "<Leader>/", ":Telescope live_grep<CR>", desc = "Live grep" },
        { "<Leader>f", ":Telescope find_files<CR>", desc = "Find files" },
        -- { "<Leader>fg", ":Telescope git_commits<CR>", desc = "Find git commits" },
        -- { "<Leader>fh", ":Telescope help_tags<CR>", desc = "Help tags" },
        -- { "<Leader>fi", ":Telescope registers<CR>", desc = "Registers" },
        -- { "<Leader>fk", ":Telescope keymaps<CR>", desc = "Keymaps" },
        { "<Leader>o", ":Telescope oldfiles<CR>", desc = "Oldfiles" },
        { "<Leader>p", ":Telescope find_files no_ignore=true<CR>", desc = "Find (all) files" },
        -- { "<Leader>fs", ":Telescope git_status<CR>", desc = "Find git status" },
        -- { "<Leader>ft", ":Telescope bibtex<CR>", desc = "BibTeX" },
        { "<Leader>*", ":Telescope grep_string<CR>", desc = "Grep string" },
        { "<Leader>y", ":Telescope lsp_document_symbols<CR>", desc = "Find LSP symbols" },
    },
    config = function()
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
            extensions = {
                bibtex = {
                    -- Depth for the *.bib file
                    depth = 2,

                    -- -- Custom format for citation label
                    -- custom_formats = {},
                    --
                    -- -- Format to use for citation label.
                    -- -- Try to match the filetype by default, or use 'plain'
                    -- format = "",
                    --
                    -- -- Path to global bibliographies (placed outside of the project)
                    -- global_files = {},
                    --
                    -- -- Define the search keys to use in the picker
                    -- search_keys = { "author", "year", "title" },
                    --
                    -- -- Template for the formatted citation
                    -- citation_format = "{{author}} ({{year}}), {{title}}.",
                    --
                    -- -- Only use initials for the authors first name
                    -- citation_trim_firstname = true,
                    --
                    -- -- Max number of authors to write in the formatted citation
                    -- -- following authors will be replaced by "et al."
                    -- citation_max_auth = 2,
                    --
                    -- -- Context awareness disabled by default
                    -- context = false,
                    --
                    -- -- Fallback to global/directory .bib files if context not found
                    -- -- This setting has no effect if context = false
                    -- context_fallback = true,
                    --
                    -- -- Wrapping in the preview window is disabled by default
                    -- wrap = false,
                },
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                },
            },
        })
        telescope.load_extension("noice")
        telescope.load_extension("bibtex")
        telescope.load_extension("fzf")
    end,
}
