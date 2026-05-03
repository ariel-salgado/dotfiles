return {
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			pre_hook = function()
				if vim.bo.filetype == "typescriptreact" or vim.bo.filetype == "javascriptreact" then
					require("ts_context_commentstring.internal").calculate_commentstring()
				end
			end,
		},
	},
}
