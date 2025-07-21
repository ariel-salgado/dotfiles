return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim", build = "make" 
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.load_extension("fzf")

		telescope.setup({
			defaults = {
				-- path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = 'telescope find files'  })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'telescope live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'telescope help tags' })
	end
}
