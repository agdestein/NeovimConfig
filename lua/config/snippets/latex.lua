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
        t({ "", "\t\\frametitle{" }),
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

    s(
        "it",
        fmt(
            [[
                \begin{itemize}
                    \item <>
                \end{itemize}
            ]],
            { i(1) },
            { delimiters = "<>" }
        )
    ),

    s(
        "en",
        fmt(
            [[
                \begin{enumerate}
                    \item <>
                \end{enumerate}
            ]],
            { i(1) },
            { delimiters = "<>" }
        )
    ),

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

    s(
        "f",
        fmt(
            [[
                \frac{<>}{<>}
            ]],
            { i(1), i(2) },
            { delimiters = "<>" }
        )
    ),

    s(
        "pd",
        fmt(
            [[
                \frac{\partial <>}{\partial <>}
            ]],
            { i(2), i(1, "t") },
            { delimiters = "<>" }
        )
    ),

    s(
        "pd",
        fmt(
            [[
                \frac{\partial <>}{\partial <>}
            ]],
            { i(2), i(1, "t") },
            { delimiters = "<>" }
        )
    ),

    s(
        "pd2",
        fmt(
            [[
                \frac{\partial^2 <>}{\partial <>^2}
            ]],
            { i(2), i(1, "x") },
            { delimiters = "<>" }
        )
    ),

    s(
        "dd",
        fmt(
            [[
                \frac{\mathrm{d} <>}{\mathrm{d} t}
            ]],
            { i(1) },
            { delimiters = "<>" }
        )
    ),

    s(
        "b",
        fmt(
            [[
                \bar{<>}
            ]],
            { i(1) },
            { delimiters = "<>" }
        )
    ),
    s(
        "bb",
        fmt(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            { i(1), i(2), f(copy, 1) },
            { delimiters = "<>" }
        )
    ),


    s("mc", fmt("\\mathcal{<>}", { i(1) }, { delimiters = "<>" })),
    s("mr", fmt("\\mathrm{<>}", { i(1) }, { delimiters = "<>" })),
    s("ms", fmt("\\mathsf{<>}", { i(1) }, { delimiters = "<>" })),

    s("d", t("\\mathrm{d}")),
    s("e", t("\\mathrm{e}")),
    s("h", t("\\frac{1}{2}")),
    s("i", t("\\in ")),
    s("n", t("\\nabla ")),
    s("n2", t("\\nabla^2 ")),
    s("p", t("\\partial ")),
    s("R", t("\\mathbb{R}")),
    s("E", t("\\mathbb{E}")),
    s("ub", t("\\bar{u}")),

    s({ trig = ";a", snippetType = "autosnippet" }, t("\\alpha")),
    s({ trig = ";b", snippetType = "autosnippet" }, t("\\beta")),
    s({ trig = ";g", snippetType = "autosnippet" }, t("\\gamma")),
    s({ trig = ";G", snippetType = "autosnippet" }, t("\\Gamma")),
    s({ trig = ";d", snippetType = "autosnippet" }, t("\\delta")),
    s({ trig = ";D", snippetType = "autosnippet" }, t("\\Delta")),
    s({ trig = ";e", snippetType = "autosnippet" }, t("\\epsilon")),
    s({ trig = ";ve", snippetType = "autosnippet" }, t("\\varepsilon")),
    s({ trig = ";z", snippetType = "autosnippet" }, t("\\zeta")),
    s({ trig = ";Z", snippetType = "autosnippet" }, t("\\Zeta")),
    s({ trig = ";h", snippetType = "autosnippet" }, t("\\eta")),
    s({ trig = ";o", snippetType = "autosnippet" }, t("\\theta")),
    s({ trig = ";vo", snippetType = "autosnippet" }, t("\\vartheta")),
    s({ trig = ";O", snippetType = "autosnippet" }, t("\\Theta")),
    s({ trig = ";k", snippetType = "autosnippet" }, t("\\kappa")),
    s({ trig = ";l", snippetType = "autosnippet" }, t("\\lambda")),
    s({ trig = ";L", snippetType = "autosnippet" }, t("\\Lambda")),
    s({ trig = ";m", snippetType = "autosnippet" }, t("\\mu")),
    s({ trig = ";n", snippetType = "autosnippet" }, t("\\nu")),
    s({ trig = ";x", snippetType = "autosnippet" }, t("\\xi")),
    s({ trig = ";X", snippetType = "autosnippet" }, t("\\Xi")),
    s({ trig = ";i", snippetType = "autosnippet" }, t("\\pi")),
    s({ trig = ";I", snippetType = "autosnippet" }, t("\\Pi")),
    s({ trig = ";r", snippetType = "autosnippet" }, t("\\rho")),
    s({ trig = ";s", snippetType = "autosnippet" }, t("\\sigma")),
    s({ trig = ";vs", snippetType = "autosnippet" }, t("\\varsigma")),
    s({ trig = ";S", snippetType = "autosnippet" }, t("\\Sigma")),
    s({ trig = ";t", snippetType = "autosnippet" }, t("\\tau")),
    s({ trig = ";f", snippetType = "autosnippet" }, t("\\phi")),
    s({ trig = ";vf", snippetType = "autosnippet" }, t("\\varphi")),
    s({ trig = ";F", snippetType = "autosnippet" }, t("\\Phi")),
    s({ trig = ";c", snippetType = "autosnippet" }, t("\\chi")),
    s({ trig = ";p", snippetType = "autosnippet" }, t("\\psi")),
    s({ trig = ";P", snippetType = "autosnippet" }, t("\\Psi")),
    s({ trig = ";w", snippetType = "autosnippet" }, t("\\omega")),
    s({ trig = ";W", snippetType = "autosnippet" }, t("\\Omega")),

    s(
        "ig",
        fmt(
            [[
                \includegraphics[width=<>\textwidth]{<>}
            ]],
            { i(1), i(2, "figure") },
            { delimiters = "<>" }
        )
    ),

    s(
        "fig",
        fmt(
            [[
                \begin{figure}
                    \centering
                    <> 
                    \caption{<>}
                    \label{fig:<>}
                \end{figure}
            ]],
            { i(1, "content"), i(2, "Caption."), i(3, "label") },
            { delimiters = "<>" }
        )
    ),

    s(
        "us",
        fmt(
            [[
                \underset{<>}{<>} 
            ]],
            { i(1), i(2, "\\min") },
            { delimiters = "<>" }
        )
    ),

    s("on", fmt("\\operatorname{<>}", {i(1)}, {delimiters = "<>"})),
})
