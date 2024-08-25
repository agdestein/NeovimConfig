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
        { "<Leader>o", ":Telescope lsp_dynamic_workspace_symbols<CR>", desc = "Find symbols" },
        { "<Leader>r", ":Telescope oldfiles<CR>", desc = "Oldfiles" },
        { "<Leader>p", ":Telescope find_files no_ignore=true<CR>", desc = "Find (all) files" },
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
                bibtex = { depth = 2 },
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
