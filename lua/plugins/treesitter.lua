return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        {
            "nvim-treesitter/nvim-treesitter-context",
            keys = {
                { "[c", function() require("treesitter-context").go_to_context(vim.v.count1) end, silent = true },
            },
        },
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({

            -- A list of parser names, or "all"
            ensure_installed = "all",

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = false,

            -- -- List of parsers to ignore installing (for "all")
            -- ignore_install = { "javascript" },

            highlight = {
                enable = true, -- false will disable the whole extension
                -- disable = { "latex" },
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = "<M-space>",
                    node_decremental = "<BS>",
                },
            },
            indent = { enable = true, disable = { "python" } },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        -- ["ac"] = "@class.outer",
                        -- ["ic"] = "@class.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        -- ["]c"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        -- ["]C"] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        -- ["[c"] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        -- ["[C"] = "@class.outer",
                    },
                },
                swap = {
                    enable = true,
                    -- swap_next = {
                    --     ["<leader>a"] = "@parameter.inner",
                    -- },
                    -- swap_previous = {
                    --     ["<leader>A"] = "@parameter.inner",
                    -- },
                },
            },
        })
    end,
}
