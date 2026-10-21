vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "fff.nvim" and (kind == "install" or kind == "update") then
			if not ev.data.active then
				vim.cmd.packadd("fff.nvim")
			end
			require("fff.download").download_or_build_binary()
		end
	end,
})

require("fff").setup({
	lazy_sync = true,
	prompt = "> ",
	title = "Find Files",
	layout = {
		height = 0.85,
		width = 0.85,
	},
	keymaps = {
		move_up = { "<Up>", "<C-k>" },
		move_down = { "<Down>", "<C-j>" },
	},
	git = {
		status_text_color = true,
	},
})

require("fff_plus").setup({
	legacy_commands = false,
})

vim.keymap.set("n", "ff", function()
	require("fff").find_files()
end, { desc = "Open file picker" })

vim.keymap.set("n", "fg", function()
	require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
end, { desc = "Live fuzzy grep word" })

vim.keymap.set("n", "<leader>fs", function()
	require("fff_plus").smart()
end, { desc = "Smart file picker" })

vim.keymap.set("n", "<leader>wd", function()
	require("fff_plus").diagnostics()
end, { desc = "Workspace diagnostics" })

vim.keymap.set("n", "<leader>gs", function()
	require("fff_plus").git_status()
end, { desc = "Git status" })
