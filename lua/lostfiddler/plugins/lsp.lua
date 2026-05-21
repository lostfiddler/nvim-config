return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/lazydev.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    require("lazydev").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "ts_ls", "cssls", "html", "clangd", "lua_ls", "csharp_ls", "jsonls" },
    })

    vim.diagnostic.config({ virtual_text = false })
    vim.o.updatetime = 250
    vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil,{focus=false})]])

    -- Use the new native config system
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local servers = { "ts_ls", "cssls", "html", "clangd", "lua_ls", "csharp_ls", "jsonls" }

    for _, server_name in ipairs(servers) do
      local opts = {
        capabilities = capabilities,
      }

      -- Custom logic for ts_ls
      if server_name == "ts_ls" then
        opts.cmd = { "typescript-language-server.cmd", "--stdio" }
        opts.filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
        opts.root_dir = vim.fs.root(0, { "tsopts.json", "package.json", ".git" })
        opts.single_file_support = false
        opts.settings = {
          typescript = { tsserver = { useSeparateSyntaxServer = true } },
        }
      end

      -- Custom logic for jsonls
      if server_name == "jsonls" then
        opts.cmd = { "vscode-json-language-server", "--stdio" }
        opts.filetypes = { "json", "jsonc" }
        opts.root_markers = { "package.json", ".git" }
        opts.settings = {
          json = {
            validate = { enable = true },
            schemas = {
              { fileMatch = { "package.json" }, url = "https://schemastore.org/package.json" },
              { fileMatch = { "tsopts.json" }, url = "https://schemastore.org/tsopts.json" },
            },
          },
        }
      end

      vim.lsp.config(server_name, opts)
      vim.lsp.enable(server_name)
    end

    local border = "rounded"

    -- This sets the border globally for all float windows (hover, signature, etc.)
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end
end,
}
