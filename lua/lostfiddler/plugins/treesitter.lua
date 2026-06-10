vim.api.nvim_create_autocmd('FileType', {
    pattern = {"typescriptreact", "javascriptreact", "html", "typescript", "javascript"},
    callback = function() vim.treesitter.start() end,
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			-- ts.setup() NOTE treesitter sets up itself now
			ts.install({ "tsx", "typescript", "html", "javascript", "lua", "c", "c_sharp", "cpp", "css", "bash" })
		end,
	},
}
