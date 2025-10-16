return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	opts = {},
	config = function(_, opts)
		require("todo-comments").setup(opts)

		vim.keymap.set("n", "<leader>ft", function()
			require("telescope").extensions["todo-comments"].todo()
		end, { desc = "Open TODOs with Telescope" })
	end,
}
