require("treesj").setup({
	use_default_keymaps = false,
})

vim.keymap.set("n", "<leader>m", function()
	require("treesj").toggle({
		split = {
			recursive = true,
		},
	})
end)
