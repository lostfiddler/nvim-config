return {
	{
		'alvan/vim-closetag',
		config = function()
			vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.ts,*.jsx,*.tsx"
		end
	},
	{
		'kylechui/nvim-surround',
		config = function()
			require('nvim-surround').setup({})
		end
	}
}
