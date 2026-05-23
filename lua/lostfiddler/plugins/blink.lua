return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = "*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
        preset = 'none',
        ['<Tab>'] = {
            function(cmp)
                if cmp.is_visible() then return cmp.select_next() end
            end,
            'snippet_forward',
            'fallback'
        },
        ['<S-Tab>'] = {
            function(cmp)
                if cmp.is_visible() then return cmp.select_prev() end
            end,
            'snippet_backward',
            'fallback'
        },
        ['<C-j>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<CR>'] = { 'accept', 'fallback' },
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
        documentation = { auto_show = false },
        menu = {
            border = 'rounded',
            winblend = 0,
            scrollbar = false,
            min_width = 100,
        }
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
          cmdline = {
              name = 'cmdline',
              module = 'blink.cmp.sources.cmdline'
          }
      }
    },

    cmdline = {
        sources = function()
            local type = vim.fn.getcmdtype()
            -- Search forward and backward
            if type == '/' or type == '?' then return { 'buffer' } end
            -- Commands
            if type == ':' then return { 'cmdline' } end
            return {}
        end,
        enabled = true,
        keymap = {
            preset = 'inherit',
            ['<CR>'] = {'fallback'}
        },
        completion = {menu = {auto_show = true}},
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
