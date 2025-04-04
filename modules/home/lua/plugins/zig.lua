return {
	{
		"chomosuke/typst-preview.nvim",
		lazy = false, -- or ft = 'typst'
		version = "1.*",
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				zls = {},
				tinymist = {},
			},
		},
	},
}
