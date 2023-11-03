return {
    "Vigemus/iron.nvim",
    keys = {
        { "<Leader>io", ":IronRepl<CR><C-w>+<C-w>-", "Toggle Iron REPL" },
        { "<Leader>ih", ":IronReplHere<CR>", "Iron REPL here" },
        { "<Leader>if", ":IronFocus<CR> i", "Iron focus here" },
        {
            "<Leader>iq",
            function()
                require("iron.core").close_repl()
            end,
            "Exit Iron REPL",
        },
        {
            "<Leader>ip",
            [[:IronSend using Pkg; Pkg.activate("."); using Revise<CR>]],
            desc = "Activate current Julia environment",
        },
    },
    config = function()
        require("iron.core").setup({
            config = {
                -- Highlights the last sent block with bold
                highlight_last = false,
                -- highlight_last = "IronLastSent",

                -- Toggling behavior is on by default.
                -- Other options are: `single` and `focus`
                visibility = require("iron.visibility").toggle,

                -- Scope of the repl
                -- By default it is one for the same `pwd`
                -- Other options are `tab_based` and `singleton`
                scope = require("iron.scope").path_based,

                -- Wether the repl buffer is a "throwaway" buffer or not
                scratch_repl = true,

                -- Automatically closes the repl window on process end
                close_window_on_exit = true,

                -- Repl position. Check `iron.view` for more options
                -- repl_open_cmd = "topleft 12 split",
                -- repl_open_cmd = "botright 12 split",
                repl_open_cmd = "vsplit",
                -- repl_open_cmd = require("iron.view").bottom(12),

                -- -- Alternatively, pass a function, which is evalueated when a repl is open.
                -- repl_open_cmd = require('iron.view').curry.right(function()
                --     return vim.o.columns / 2
                -- end),

                -- If the repl buffer is listed
                buflisted = false,

                repl_definition = {
                    python = require("iron.fts.python").ipython,
                    matlab = {
                        command = {
                            "env",
                            "LD_PRELOAD=/usr/lib/libstdc++.so",
                            -- "LD_LIBRARY_PATH=/usr/lib/xorg/modules/dri/",
                            "MESA_LOADER_DRIVER_OVERRIDE=i965", -- Force old driver for Matlab 2019a
                            -- "MESA_LOADER_DRIVER_OVERRIDE=iris", -- Default driver?
                            "matlab",
                            "-nosplash",
                            "-nodesktop",
                        },
                    },
                    julia = {
                        command = {
                            "julia",
                            "-t",
                            "auto",
                        },
                    },
                },
            },

            -- Iron doesn't set keymaps by default anymore. Set them here
            -- or use `should_map_plug = true` and map from you vim files
            keymaps = {
                send_motion = "<space>usc",
                visual_send = "<space>usc",
                send_line = "<space>usl",
                send_mark = "<space>us.",
                interrupt = "<space>us<space>",
                clear = "<space>il",
            },

            -- keymaps         = {
            --     send_motion = "<space>usc",
            --     visual_send = "<space>usc",
            --     send_file   = "<space>usf",
            --     send_line   = "<space>usl",
            --     send_mark   = "<space>usm",
            --     mark_motion = "<space>umc",
            --     mark_visual = "<space>umc",
            --     remove_mark = "<space>umd",
            --     cr          = "<space>us<cr>",
            --     interrupt   = "<space>us<space>",
            --     exit        = "<space>usq",
            --     clear       = "<space>ucl",
            -- },

            -- -- If the highlight is on, you can change how it looks
            -- -- For the available options, check nvim_set_hl
            -- highlight = {
            --     italic = true
            -- }
        })

        vim.keymap.set("v", "<C-CR>", "<space>usc", { desc = "Send visual to Iron REPL", remap = true })
        vim.keymap.set("n", "<C-CR>", "0<Leader>usc$j", { desc = "Send line to Iron REPL and advance", remap = true })
        vim.keymap.set("n", "<S-CR>", "}{jvip<space>usc}", { desc = "Send paragraph to IRON REPL", remap = true })
    end,
}
