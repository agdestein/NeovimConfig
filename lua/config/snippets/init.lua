local ls = require("luasnip")
local types = require("luasnip.util.types")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix

ls.config.set_config({
    history = true,

    -- Update more often, :h events for more info.
    updateevents = "TextChanged,TextChangedI",

    -- Snippets aren't automatically removed if their text is deleted.
    -- `delete_check_events` determines on which events (:h events) a check for
    -- deleted snippets is performed.
    -- This can be especially useful when `history` is enabled.
    delete_check_events = "TextChanged",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "●", "Normal" } },
                -- virt_text = { { "choiceNode", "Comment" } },
            },
        },
        [types.insertNode] = {
            active = {
                virt_text = { { "●", "Comment" } },
            },
        },
    },

    -- treesitter-hl has 100, use something higher (default is 200).
    ext_base_prio = 300,

    -- minimal increase in priority.
    ext_prio_increase = 1,
    enable_autosnippets = true,

    -- mapping for cutting selected text so it's usable as SELECT_DEDENT,
    -- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
    store_selection_keys = "<Tab>",

    -- luasnip uses this function to get the currently active filetype. This
    -- is the (rather uninteresting) default, but it's possible to use
    -- eg. treesitter for getting the current filetype by setting ft_func to
    -- require("luasnip.extras.filetype_functions").from_cursor (requires
    -- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
    -- the current filetype in eg. a markdown-code block or `vim.cmd()`.
    ft_func = function()
        return vim.split(vim.bo.filetype, ".", true)
    end,
    -- ft_func = require("luasnip.extras.filetype_functions").from_cursor,

    -- -- Also load julia and tex when a markdown-file is opened.
    -- -- Other filetypes just load themselves.
    -- load_ft_func = require("luasnip.extras.filetype_functions").extend_load_ft({
    --     markdown = { "julia", "tex" },
    -- }),
})

WhichKey.register({
    ["<C-s>"] = {
        name = "Snippets",
        ["<C-j>"] = { ls.expand_or_jump, "Next node" },
        ["<C-k>"] = {
            function()
                return ls.jump(-1)
            end,
            "Previous node",
        },
        l = {
            function()
                return ls.change_choice(1)
            end,
            "Next choice",
        },
        h = {
            function()
                return ls.change_choice(-1)
            end,
            "Previous choice",
        },
    },
}, { mode = "i" })

require("config/snippets/julia")
require("config/snippets/latex")
require("config/snippets/lua")
require("config/snippets/markdown")
require("config/snippets/matlab")
require("config/snippets/python")

ls.add_snippets("all", {
    s("ternary", {
        -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
        i(1, "cond"),
        t(" ? "),
        i(2, "then"),
        t(" : "),
        i(3, "else"),
    }),
})
