return {
	'mikavilpas/yazi.nvim',
	requires = {
		'nvim-lua/plenary.nvim'
	},
	config = function()
		require('yazi').setup({})
	end
}
