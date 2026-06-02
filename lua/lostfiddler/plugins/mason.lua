return {
	{
		"williamboman/mason.nvim",
		config = true, -- Automatically runs require("mason").setup()
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				-- lsp servers
				"ts_ls",
				"cssls",
				"html",
				"clangd",
				"lua_ls",
				"csharp_ls",
				"jsonls",
				"bashls",
			},
		},
	},
	{
		"zapling/mason-conform.nvim",
		dependencies = { "williamboman/mason.nvim", "stevearc/conform.nvim" },
		opts = {
			ensure_installed = {
				"stylua",
				"prettier",
				"clang-format",
				"shfmt",
			},
			automatic_installation = true,
		},
	},
}
