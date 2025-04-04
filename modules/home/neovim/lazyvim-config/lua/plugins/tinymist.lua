return {
	{
		"nvim-lspconfig",
		opts = function(_, opts)
			opts.servers.tinymist = {}
		end,
	},
}
