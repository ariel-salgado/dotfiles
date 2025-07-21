return {
	"stevearc/oil.nvim",
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		require("oil").setup({
			default_file_explorer = true, 
			columns = {},
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
			skip_confirm_for_simple_edits = true,
		})

		vim.keymap.set("n", "<leader>cd", "<CMD>Oil<CR>", { desc = "open parent directory" })
		vim.keymap.set("n", "<leader>cf", require("oil").toggle_float, { desc = "open parent directory on a floating window" })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil", 
			callback = function()
				vim.opt_local.cursorline = true
			end,
		})
	end
}
