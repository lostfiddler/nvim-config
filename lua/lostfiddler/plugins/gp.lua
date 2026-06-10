return {
	"robitx/gp.nvim",
	config = function()
		require("gp").setup({
			providers = {
				openai = {
					disable = true,
				},
				googleai = {
					endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}",
					secret = os.getenv("GEMINI_API_KEY"),
				},
			},
			agents = {
				{
					name = "ChatGPT3-5",
					disable = true,
				},
				{
					name = "GeminiFlash",
					provider = "googleai",
					model = { model = "gemini-2.5-flash", temperature = 0.7 },
					chat = true,
					command = true,
					-- inline = true,
					-- Crucial instruction: Tell it to output RAW code only, no markdown backticks
					system_prompt = "You are an AI programming assistant.",
				},
			},
			chat_confirm_delete = false,
			-- styling for popup
			---@type "single" | "double" | "rounded" | "solid" | "shadow" | "none"
			style_popup_border = "rounded",
			-- margins are number of characters or lines
			style_popup_margin_bottom = 4,
			style_popup_margin_left = 1,
			style_popup_margin_right = 2,
			style_popup_margin_top = 0,
			style_popup_max_width = 160,
		})
		vim.keymap.set("n", "<leader>ai", "<cmd>GpChatToggle popup<cr>", { desc = " Popup Chat" })
	end,
}
