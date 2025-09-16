return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"benomahony/oil-git.nvim",
	},
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		default_file_explorer = true,
		columns = {
			"icon",
		},
		skip_confirm_for_simple_edits = true,
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
		},
		use_default_keymaps = false,
		view_options = {
			show_hidden = true,
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)

		vim.keymap.set("n", "<leader>cd", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
