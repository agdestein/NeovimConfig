local ls = require("luasnip")

local ai = require("luasnip.nodes.absolute_indexer")
local c = ls.choice_node
local conds = require("luasnip.extras.expand_conditions")
local d = ls.dynamic_node
local dl = require("luasnip.extras").dynamic_lambda
local events = require("luasnip.util.events")
local extras = require("luasnip.extras")
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local i = ls.insert_node
local isn = ls.indent_snippet_node
local l = require("luasnip.extras").lambda
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local p = require("luasnip.extras").partial
local postfix = require("luasnip.extras.postfix").postfix
local r = ls.restore_node
local rep = require("luasnip.extras").rep
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local types = require("luasnip.util.types")

-- In a markdown file: search markdown-, then julia-, then tex-, then all-snippets.
ls.filetype_extend("markdown", {
    -- "julia",
    "tex"
})

ls.add_snippets("markdown", {
    s("```", {
        t("```"),
        i(1, "language"),
        t({ "", "" }),
        i(2, "code"),
        t({ "", "```" }),
    }),
})

ls.add_snippets("markdown", {
    s("ar", {
        t("<https://arxiv.org/abs/"),
        i(1, "xxxx.xxxxx"),
        t(">"),
    }),
})

ls.add_snippets("markdown", {
    s("-", {
        -- t("- [ ] " .. os.date("%H:%M") .. " "),
        f(function(args) return "- [ ] " .. os.date("%H:%M") .. " " end, {}),
    }),
})
