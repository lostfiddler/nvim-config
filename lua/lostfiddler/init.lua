require("lostfiddler.config.options")
require("lostfiddler.config.keymaps")
require("lostfiddler.config.lazy")

local au_ftsettings = vim.api.nvim_create_augroup("LostFiddlerFtSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = au_ftsettings,
	callback = function(args)
		-- args.match contains the name of the filetype (e.g., "python")
		local ft = args.match
		local ok, _ = pcall(require, "lostfiddler.ftsettings." .. ft)
		if not ok then
			-- Optional: Quietly fail if a filetype doesn't have a config file yet
			return
		end
	end,
})
