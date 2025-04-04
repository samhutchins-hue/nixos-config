return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				c = { "clang_format" },
			},
		},
	},
	{
		"nvim-lspconfig",
		opts = function(_, opts)
			opts.servers.clangd = {}
		end,
	},
}
