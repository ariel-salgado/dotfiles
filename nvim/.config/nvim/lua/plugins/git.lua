return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
		},
	},
	{
		"chrisgrieser/nvim-tinygit",
		dependencies = "nvim-telescope/telescope.nvim",
		opts = {
			commit = {
				border = "rounded",
				spellcheck = true,
				subject = {
					enforceTyep = true,
				},
			},
			push = {
				confirmationSound = false,
			},
			history = {
				diffPopup = {
					border = "rounded",
				},
			},
		},
		config = function(_, opts)
			require("tinygit").setup(opts)

			vim.keymap.set("n", "<leader>ga", function()
				require("tinygit").interactiveStaging()
			end, { desc = "git add" })
			vim.keymap.set("n", "<leader>gc", function()
				require("tinygit").smartCommit()
			end, { desc = "git commit" })
			vim.keymap.set("n", "<leader>gp", function()
				require("tinygit").push()
			end, { desc = "git push" })
			vim.keymap.set("n", "<leader>gu", function()
				require("tinygit").undoLastCommitOrAmend()
			end, { desc = "undo last commit/ammend" })
		end,
	},
}
