return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "amongus",
			})
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
}
