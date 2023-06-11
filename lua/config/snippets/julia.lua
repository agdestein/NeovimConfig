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

    -- Greek letters
    s({ trig = ";a", wordTrig = false, snippetType = "autosnippet" }, t("α")),
    s({ trig = ";b", wordTrig = false, snippetType = "autosnippet" }, t("β")),
    s({ trig = ";g", wordTrig = false, snippetType = "autosnippet" }, t("γ")),
    s({ trig = ";G", wordTrig = false, snippetType = "autosnippet" }, t("Γ")),
    s({ trig = ";d", wordTrig = false, snippetType = "autosnippet" }, t("δ")),
    s({ trig = ";D", wordTrig = false, snippetType = "autosnippet" }, t("Δ")),
    s({ trig = ";e", wordTrig = false, snippetType = "autosnippet" }, t("ϵ")),
    s({ trig = ";ve",wordTrig = false, snippetType = "autosnippet" }, t("ε")),
    s({ trig = ";z", wordTrig = false, snippetType = "autosnippet" }, t("ζ")),
    s({ trig = ";Z", wordTrig = false, snippetType = "autosnippet" }, t("Ζ")),
    s({ trig = ";h", wordTrig = false, snippetType = "autosnippet" }, t("η")),
    s({ trig = ";o", wordTrig = false, snippetType = "autosnippet" }, t("θ")),
    s({ trig = ";vo",wordTrig = false, snippetType = "autosnippet" }, t("ϑ")),
    s({ trig = ";O", wordTrig = false, snippetType = "autosnippet" }, t("Θ")),
    s({ trig = ";k", wordTrig = false, snippetType = "autosnippet" }, t("κ")),
    s({ trig = ";l", wordTrig = false, snippetType = "autosnippet" }, t("λ")),
    s({ trig = ";L", wordTrig = false, snippetType = "autosnippet" }, t("Λ")),
    s({ trig = ";m", wordTrig = false, snippetType = "autosnippet" }, t("μ")),
    s({ trig = ";n", wordTrig = false, snippetType = "autosnippet" }, t("ν")),
    s({ trig = ";x", wordTrig = false, snippetType = "autosnippet" }, t("ξ")),
    s({ trig = ";X", wordTrig = false, snippetType = "autosnippet" }, t("Ξ")),
    s({ trig = ";i", wordTrig = false, snippetType = "autosnippet" }, t("π")),
    s({ trig = ";I", wordTrig = false, snippetType = "autosnippet" }, t("Π")),
    s({ trig = ";r", wordTrig = false, snippetType = "autosnippet" }, t("ρ")),
    s({ trig = ";s", wordTrig = false, snippetType = "autosnippet" }, t("σ")),
    s({ trig = ";vs",wordTrig = false, snippetType = "autosnippet" }, t("ς")),
    s({ trig = ";S", wordTrig = false, snippetType = "autosnippet" }, t("Σ")),
    s({ trig = ";t", wordTrig = false, snippetType = "autosnippet" }, t("τ")),
    s({ trig = ";f", wordTrig = false, snippetType = "autosnippet" }, t("ϕ")),
    s({ trig = ";vf",wordTrig = false, snippetType = "autosnippet" }, t("φ")),
    s({ trig = ";F", wordTrig = false, snippetType = "autosnippet" }, t("Φ")),
    s({ trig = ";c", wordTrig = false, snippetType = "autosnippet" }, t("χ")),
    s({ trig = ";p", wordTrig = false, snippetType = "autosnippet" }, t("ψ")),
    s({ trig = ";P", wordTrig = false, snippetType = "autosnippet" }, t("Ψ")),
    s({ trig = ";w", wordTrig = false, snippetType = "autosnippet" }, t("ω")),
    s({ trig = ";W", wordTrig = false, snippetType = "autosnippet" }, t("Ω")),

    -- Subscripts
    s({ trig = ";0", wordTrig = false, snippetType = "autosnippet" }, t("₀")),
    s({ trig = ";1", wordTrig = false, snippetType = "autosnippet" }, t("₁")),
    s({ trig = ";2", wordTrig = false, snippetType = "autosnippet" }, t("₂")),
    s({ trig = ";3", wordTrig = false, snippetType = "autosnippet" }, t("₃")),
    s({ trig = ";4", wordTrig = false, snippetType = "autosnippet" }, t("₄")),
    s({ trig = ";5", wordTrig = false, snippetType = "autosnippet" }, t("₅")),
    s({ trig = ";6", wordTrig = false, snippetType = "autosnippet" }, t("₆")),
    s({ trig = ";7", wordTrig = false, snippetType = "autosnippet" }, t("₇")),
    s({ trig = ";8", wordTrig = false, snippetType = "autosnippet" }, t("₈")),
    s({ trig = ";9", wordTrig = false, snippetType = "autosnippet" }, t("₉")),
    s({ trig = ";-", wordTrig = false, snippetType = "autosnippet" }, t("₋")),
    s({ trig = ";+", wordTrig = false, snippetType = "autosnippet" }, t("₊")),
})
