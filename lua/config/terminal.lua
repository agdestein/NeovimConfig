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

local Iron = require("iron")

Iron.core.set_config({
    repl_open_cmd = "botright 12 split",
})

Iron.core.add_repl_definitions({
    matlab = {
        matlab = {
            command = {
                "env",
                "LD_PRELOAD=/usr/lib/libstdc++.so",
                "LD_LIBRARY_PATH=/usr/lib/xorg/modules/dri/",
                "MESA_LOADER_DRIVER_OVERRIDE=i965 matlab",
                "matlab",
                "-nosplash",
                "-nodesktop",
            },
        },
    },
})

WhichKey.register({
    ["<C-j>"] = { "<Cmd>stopinsert!<CR>", "Visual mode" },
}, { mode = "t", noremap = true })

-- Disable default keybindings
vim.g.iron_map_defaults = false
vim.g.iron_map_extended = false

WhichKey.register({
    i = {
        name = "Terminal",
        t = { ":ToggleTerm<CR>", "Toggle terminal" },
        o = { ":IronRepl<CR>", "Toggle Iron REPL" },
        h = { ":IronReplHere<CR>", "Iron REPL here" },
        r = { Iron.core.repeat_cmd, "Repeat Iron command" },
        l = { "<Plug>(iron-clear)<CR>", "Clear Iron REPL" },
        -- n = { Iron.core.interrupt, "Interrupt Iron REPL" },
        n = { "<Plug>(iron-interrupt)<CR>", "Interrupt Iron REPL" },
        f = { ":IronFocus<CR>i", "Focus Iron REPL" },
        q = { "<Plug>(iron-exit)<CR>", "Exit Iron REPL" },
        p = { [[:IronSend! using Pkg; Pkg.activate(\\".\\")<CR>]], "Activate current Julia environment" },
    },
}, { prefix = "<leader>", noremap = true })

WhichKey.register({
    ["<C-CR>"] = { "<Plug>(iron-send-line)<CR>", "Send line to Iron REPL and advance" },
    ["<S-CR>"] = { "vap<C-CR>))", "Send paragraph to IRON REPL", noremap = false },
    -- ["<C-CR>"] = { "vip;<Plug>(iron-visual-send)<CR>", "Send paragraph to Iron REPL" },
}, {}) --{ noremap = true })

WhichKey.register({
    ["<C-CR>"] = { "<Plug>(iron-visual-send)<CR>", "Send visual to Iron REPL" },
    -- ["<S-CR>"] = { Iron.core.visual_send, "Send visual to Iron REPL" },
}, { mode = "v", noremap = true })
