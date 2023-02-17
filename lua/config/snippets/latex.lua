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

local tex = {}

tex.in_mathzone = function()
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

tex.in_text = function()
    return not tex.in_mathzone()
end

-- tex.in_beamer = function()
--     local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
--     for _, line in ipairs(lines) do
--      if line:match("\\documentclass{beamer}") then
--          return true
--      end
--     end
--     return false
-- end

-- Use `vimtex` to detect
tex.in_beamer = function()
    return vim.b.vimtex.documentclass == "beamer"
end

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
    return args[1]
end

-- 'recursive' dynamic snippet. Expands to some text followed by itself.
local rec_ls
rec_ls = function()
    return sn(
        nil,
        c(1, {
            -- Order is important, sn(...) first would cause infinite loop of expansion.
            t(""),
            sn(nil, {
                t({ "", "\t\\item " }),
                i(1),
                d(2, rec_ls, {}),
            }),
        })
    )
end

ls.add_snippets("tex", {
    s("frame", {
        t("\\begin{frame}"),
        c(1, { t(""), t("[allowframebreaks]") }),
        t({"", "\t\\frametitle{"}),
        i(2, "frame title"),
        t({ "}", "\t" }),
        i(3),
        t({ "", "\\end{frame}" }),
    }, { condition = tex.in_beamer }),

    s("eq", {
        t("\\begin{equation}"),
        n(1, " \\label{eq:"),
        i(1, ""),
        n(1, "}"),
        t({ "", "\t" }),
        i(2),
        t({ "", "\\end{equation}" }),
    }),

    s("item", {
        t({ "\\begin{itemize}", "\t\\item " }),
        i(1),
        d(2, rec_ls, {}),
        t({ "", "\\end{itemize}" }),
    }),

    s("enum", {
        t({ "\\begin{enumerate}", "\t\\item " }),
        i(1),
        d(2, rec_ls, {}),
        t({ "", "\\end{enumerate}" }),
    }),

    s("op1", {
        t("\\"),
        i(1, "operator"),
        t("{"),
        i(2, "arg"),
        t("}"),
    }),

    s("op2", {
        t("\\"),
        i(1, "operator"),
        t("{"),
        i(2, "arg1"),
        t("}{"),
        i(3, "arg2"),
        t("}"),
    }),

    s("f", {
        t("\\frac{"),
        i(1, "arg1"),
        t("}{"),
        i(2, "arg2"),
        t("}"),
    }),

    s("dd", {
        t("\\frac{"),
        c(3, { t("\\partial "), t("\\mathrm{d} ")}),
        i(2, ""),
        t("}{"),
        f(copy, 3),
        i(1, "x"),
        t("}"),
    }),

    s("e", t("\\mathrm{e}")),
    s("d", t("\\mathrm{d}")),
    s("R", t("\\mathbb{R}")),
    s("ub", t("\\bar{u}")),

    s("includegraphics", {
        t("\\includegraphics[width="),
        i(1),
        t("\\textwidth]{"),
        i(2, "figure.pdf"),
        t("}"),
    }),

    s("figure", {
        t({"\\begin{figure}", "\t"}),
        i(1, "content"),
        t({"", "\t\\caption{"}),
        i(2, "Caption."),
        t({"}", "\t\\label{fig:"}),
        i(3, "label"),
        t({"}", "\\end{figure}"}),
    }),

    s("lim", {
        t("\\underset{"),
        i(1, "x"),
        t(" \\to "),
        i(2, "0"),
        t("}{\\lim}"),
    }),

    s("left", {
        t("\\left( "),
        i(1, "content"),
        t(" \\right)"),
    }),
})
