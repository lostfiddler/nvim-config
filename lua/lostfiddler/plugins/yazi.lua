return {
	'mikavilpas/yazi.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
    lazy = false,
	config = function()
		require('yazi').setup({
            open_for_directories = true,
            floating_window_scaling_factor = 1,
        })
	end
}
