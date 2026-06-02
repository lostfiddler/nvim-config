return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- Lazy load on file open
	keys = {
		{
			"<leader>p",
			function()
				require("conform").format({
					async = true,
					lsp_format = "fallback",
				})
			end,
			mode = { "n", "v" },
			desc = "Format buffer or visual selection",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" }, -- Uses first available
			typescript = { "prettier" },
			markdown = { "prettier" },
			css = { "prettier" },
			cs = { "clang-format" },
			bash = { "shfmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },
		},
		notify_on_error = true,
	},
}
