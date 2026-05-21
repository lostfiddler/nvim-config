return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      -- Basic configuration
      ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })

      -- Your custom snippets
      ls.add_snippets("all", {
        s("clj", {
          t('<code className="language-js">'),
          i(0),
          t("</code>")
        }),
        s("plj", {
          t('<pre className="language-js"><code>'),
          i(0),
          t("</code></pre>")
        }),
        s("ka", {
          t({
            "<span ",
            '  dangerouslySetInnerHTML={{',
            '    __html: katex.renderToString("'
          }),
          i(0),
          t({
            '")',
            "  }}",
            "/>"
          })
        })
      })

      -- Optional: Keymaps to expand snippets if not already in your cmp config
      vim.keymap.set({ "i", "s" }, "<C-K>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })
    end,
  },
}
