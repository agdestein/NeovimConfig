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

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
    return args[1]
end

-- 'recursive' dynamic snippet. Expands to some text followed by itself.
local struct_entry
struct_entry = function()
    return sn(
        nil,
        c(1, {
            -- Order is important, sn(...) first would cause infinite loop of expansion.
            t(""),
            sn(nil, {
                t({ "", "\t" }),
                i(1, "field"),
                t("::"),
                i(2, "fieldType"),
                c(3, {
                    sn(nil, {
                        t({ " = " }),
                        i(1, "default_value"),
                    }),
                    t(""),
                }),
                d(4, struct_entry, {}),
            }),
        })
    )
end

ls.add_snippets("julia", {

    s("struct", {
        -- Choice: Switch between two different Nodes, first parameter is its position, second a list of nodes.
        c(1, {
            t("Base.@kwdef "),
            t(""),
        }),
        t("struct "),
        i(2, "StructName"),
        c(3, {
            sn(nil, {
                t("{"),
                i(1, "T"),
                t("}"),
            }),
            t(""),
        }),
        c(4, {
            -- sn: Nested Snippet. Instead of a trigger, it has a position, just like insert-nodes. !!! These don't expect a 0-node!!!!
            -- Inside Choices, Nodes don't need a position as the choice node is the one being jumped to.
            sn(nil, {
                t(" <: "),
                -- restoreNode: stores and restores nodes.
                -- pass position, store-key and nodes.
                i(1, "AbstractSuperType"),
                c(2, {
                    sn(nil, {
                        t("{"),
                        i(1, "T"),
                        t("}"),
                    }),
                    t(""),
                }),
            }),
            t(""),
        }),
        d(5, struct_entry, {}),
        t({ "", "end" }),
    }),

    s("fn", {
        t("function "),
        i(1),
        t("("),
        i(2),
        t({ ")", "\t" }),
        i(3),
        t({ "", "end"}),
    }),

    s("fn_doc", {
        t({"\"\"\"", "\t"}),
        f(copy, 1),
        t("("),
        f(copy, 2),
        t({")", "", ""}),
        i(3),
        t({ "", "\"\"\"", "function " }),
        i(1),
        t("("),
        i(2, ""),
        t({ ")", "\t" }),
        i(4),
        t({ "", "end"}),
    }),

    s("for", {
        t("for "),
        i(1, "i"),
        t(" ∈ "),
        i(2, "1:n"),
        t({"", "\t"}),
        i(3),
        t({"", "end"}),
    }),

    s("while", {
        t("while "),
        i(1, "condition"),
        t({"", "\t"}),
        i(2),
        t({"", "end"}),
    }),

    s("do", {
        i(1, "outer_function"),
        t("("),
        i(2, "outer_args..."),
        t(") do"),
        n(3, " "),
        i(3, "args..."),
        t({"", "\t"}),
        i(4, "# Function body"),
        t({"", "end"}),
    }),

    s("comp", {
        c(1, {t("["), t("(")}),
        i(2, "f(x)"),
        t(" for "),
        i(3, "x"),
        t(" ∈ "),
        i(4, "xvals"),
        t("]"),
    }),

    s("cite", {
        t("["),
        i(1, "Article"),
        t("](@cite)"),
    }),

    s("@testset", {
        t("@testset \""),
        i(1, "Name"),
        t({"\" begin", "\t"}),
        i(2, "@test a ≈ b"),
        t({"", "end"}),
    }),
})