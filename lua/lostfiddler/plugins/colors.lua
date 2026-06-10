local colorscheme = "catppuccin"

local comment_keyword_group = vim.api.nvim_create_augroup("SmartCommentKeywords", { clear = true })

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "Syntax" }, {
	group = comment_keyword_group,
	pattern = "*",
	callback = function()
		-- Clear old local matches to prevent duplication leaks
		for _, match in ipairs(vim.fn.getmatches()) do
			if match.group == "Todo" then
				vim.fn.matchdelete(match.id)
			end
		end

		-- NEW PATTERNS WITH LOOKBEHIND OPERATORS:
		-- \v           -> Very Magic mode (modern regex syntax)
		-- (\/\/|\-\-) -> Matches // or --
		-- .{-}         -> Non-greedy search (stops immediately when it hits the word)
		-- @<=          -> The lookbehind operator (tells Vim: "verify this matches, but don't color it")
		-- <...>        -> Strict word boundaries
		local pattern = [[\v((\/\/|\-\-).{-})@<=<(WARN|NOTE|INFO|BUG)>]]

		-- Force high-priority rendering over the gray text
		vim.fn.matchadd("Todo", pattern, 101)
	end,
})

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		opts = {
			flavour = "mocha",
			no_italic = true,
			transparent_background = true,
			integrations = {
				telescope = {
					enabled = true,
				},
			},
			custom_highlights = function(colors)
				return {
					TelescopeNormal = { bg = "none" },
					TelescopeBorder = { fg = "black", bg = "none" },
					TelescopeTitle = { bg = "none", fg = "red" },
					TelescopeResultsTitle = { bg = "none", fg = "red" },
					TelescopePromptTitle = { bg = "none", fg = "red" },
					TelescopePreviewTitle = { bg = "none", fg = "red" },
					YaziFloatBorder = { bg = "none", fg = "black" },
					NormalFloat = { bg = "none" },
					NormalSB = { bg = "none" },
					FloatTitle = { bg = "none", fg = "red" },
					FloatBorder = { bg = "none", fg = "black" },
					BlinkCmpMenuBorder = { bg = "none", fg = "black" },
					LineNr = { bg = "none", fg = "#7c7f93" },
					Todo = { fg = "#1e1e2e", bg = "#89b4fa" },
				}
			end,
			compile = {
				enabled = true,
				clear_on_upstatus = true,
				user_signals = true,
				plugins = {}, -- leave empty
				-- This function forces Neovim's regex engine to bind your custom words
				-- directly to Catppuccin's native Todo/Warning design blocks!
				custom_hooks = function()
					-- \v means modern regex, \b finds strict word boundaries
					vim.fn.matchadd("DiagnosticWarn", [[\v\b(WARN|WARNING)\b]], 100)
					vim.fn.matchadd("DiagnosticHint", [[\v\b(NOTE|INFO)\b]], 100)
				end,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme(colorscheme)
		end,
	},
	-- {
	--     "rose-pine/neovim",
	--     name = "rose-pine",
	--     opts = {
	--         styles = {
	--             italic = false,
	--             transparency = true,
	--         }
	--     },
	--     config = function (_, opts)
	--         require("rose-pine").setup(opts)
	--         vim.cmd.colorscheme(colorscheme)
	--     end
	-- },
	-- {
	--     "mofiqul/dracula.nvim",
	--     name = "dracula",
	--     config = function()
	--         require("dracula").setup({
	--             transparent_bg = true,
	--         })
	--         vim.cmd.colorscheme(colorscheme)
	--     end
	-- }
}

-- Use :Telescope colorscheme to change colorscheme 🙂
-- use :Telescope highlights to see hl groups
--
-- vim.api.nvim_set_hl(0, 'DiffAdd', {fg='#1e1e2e', bg='#a6e3a1'})
-- vim.api.nvim_set_hl(0, 'DiffDelete', {fg='#1e1e2e', bg='#f38ba8'})
-- vim.api.nvim_set_hl(0, 'DiffChange', {bg='#1e1e2e'})
-- vim.api.nvim_set_hl(0, 'DiffText', {fg='#f9e2af', bg='#1e1e2e'})
-- --vim.api.nvim_set_hl(0, 'Normal', {bg='none'})
