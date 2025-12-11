local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("all", {
    s("clj", {
        t("<code className=\"language-js\">"),
        i(0),
        t("</code>")
    }),
    s("plj", {
        t("<pre className=\"language-js\"><code>"),
        i(0),
        t("</code></pre>")
    }),
    s("ka", {
        t({
            "<span ",
            "  dangerouslySetInnerHTML={{",
            "    __html: katex.renderToString(\""
        }),
        i(0),
        t({"\")",
            "  }}",
            "/>"
        })
    })
})
