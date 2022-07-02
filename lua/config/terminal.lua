require("toggleterm").setup({
    -- size can be a number or function which is passed the current terminal
    -- size = 20 | function(term)
    --   if term.direction == "horizontal" then
    --     return 15
    --   elseif term.direction == "vertical" then
    --     return vim.o.columns * 0.4
    --   end
    -- end,
    -- open_mapping = [[<c-\>]],
    -- on_open = fun(t: Terminal), -- function to run when the terminal opens
    -- on_close = fun(t: Terminal), -- function to run when the terminal closes
    -- hide_numbers = true, -- hide the number column in toggleterm buffers
    -- shade_filetypes = {},
    -- shade_terminals = true,
    -- shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    -- start_in_insert = true,
    -- insert_mappings = true, -- whether or not the open mapping applies in insert mode
    -- terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    -- persist_size = true,
    -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
    -- close_on_exit = true, -- close the terminal window when the process exits
    -- shell = vim.o.shell, -- change the default shell
    -- -- This field is only relevant if direction is set to 'float'
    -- float_opts = {
    --   -- The border key is *almost* the same as 'nvim_open_win'
    --   -- see :h nvim_open_win for details on borders however
    --   -- the 'curved' border is a custom border type
    --   -- not natively supported but implemented in this plugin.
    --   border = 'single' | 'double' | 'shadow' | 'curved'
    --   width = <value>,
    --   height = <value>,
    --   winblend = 3,
    --   highlights = {
    --     border = "Normal",
    --     background = "Normal",
    --   }
    -- }
})

WhichKey.register({
    ["<C-j>"] = { "<Cmd>stopinsert!<CR><C-w>k", "Visual mode and window up" },
    ["<M-j>"] = { "<Cmd>stopinsert!<CR>", "Visual mode" },
}, { mode = "t", noremap = true })

local iron = require("iron.core")

iron.setup({
    config = {
        -- Highlights the last sent block with bold
        highlight_last = "IronLastSent",

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

        -- -- Wether iron should map the `<plug>(..)` mappings
        -- should_map_plug = true,

        -- Repl position. Check `iron.view` for more options
        repl_open_cmd = "botright 12 split",
        -- repl_open_cmd = require("iron.view").curry.bottom(12),

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
                    "LD_LIBRARY_PATH=/usr/lib/xorg/modules/dri/",
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
                    "-t 8",
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
        cr = "<space>us<cr>",
        interrupt = "<space>us<space>",
        exit = "<space>usq",
        clear = "<space>ucl",
    },
})

WhichKey.register({
    i = {
        name = "Terminal",
        t = { ":ToggleTerm<CR>", "Toggle terminal" },
        o = { ":IronRepl<CR>", "Toggle Iron REPL" },
        h = { ":IronReplHere<CR>", "Iron REPL here" },
        r = { "<space>us.", "Repeat Iron command" },
        l = { "<space>ucl", "Clear Iron REPL" },
        -- n = { iron.interrupt, "Interrupt Iron REPL" },
        n = { "<space>us<space>", "Interrupt Iron REPL" },
        f = { ":IronFocus<CR>i", "Focus Iron REPL" },
        q = { "<space>usq", "Exit Iron REPL" },
        p = { [[:IronSend! using Pkg; Pkg.activate(\\".\\")<CR>]], "Activate current Julia environment" },
    },
}, { prefix = "<leader>", noremap = true })

WhichKey.register({
    -- ["<C-CR>"] = { "<Plug>(iron-visual-send)<CR>", "Send visual to Iron REPL" },
    ["<C-CR>"] = { "<space>usc", "Send visual to Iron REPL" },
}, { mode = "v", noremap = false })

WhichKey.register({
    ["<C-CR>"] = { "<space>uslj", "Send line to Iron REPL and advance" },
    ["<S-CR>"] = { "}{jvip<space>usc}", "Send paragraph to IRON REPL", noremap = false },
}, { noremap = false }) --{ noremap = true })
