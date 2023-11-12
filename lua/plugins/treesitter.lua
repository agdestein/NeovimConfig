return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({

            -- A list of parser names, or "all"
            ensure_installed = {
                "bash",
                "bibtex",
                "c",
                "cpp",
                "css",
                "dot",
                "fish",
                "fortran",
                "gitcommit",
                "gitignore",
                "html",
                "json",
                "json5",
                "julia",
                "kdl",
                "latex",
                "lua",
                "markdown",
                "markdown_inline",
                "matlab",
                "norg",
                "python",
                "query",
                "r",
                "rasi",
                "regex",
                "ron",
                "rust",
                "toml",
                "vim",
                "vimdoc",
                "yaml",
                "yuck",
            },

            -- -- Install parsers synchronously (only applied to `ensure_installed`)
            -- sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = false,

            -- -- List of parsers to ignore installing (for "all")
            -- ignore_install = { "javascript" },

            highlight = {
                enable = true, -- false will disable the whole extension

                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                disable = {
                    -- "julia",
                    "latex",
                    -- "markdown",
                    -- "matlab",
                },

                -- -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- -- Instead of true it can also be a list of languages
                -- additional_vim_regex_highlighting = { "julia" },
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
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]c"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        ["]C"] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[c"] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[C"] = "@class.outer",
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
