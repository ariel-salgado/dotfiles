vim.o.cmdheight = 0

require("tiny-cmdline").setup({
	position = { x = "50%", y = "25%" },
	on_reposition = require("tiny-cmdline").adapters.blink,
})

require("tiny-code-action").setup({
	picker = {
		"buffer",
		opts = {
			auto_preview = true,
			keymaps = {
				preview = nil,
				close = { "q", "<Esc>" },
				select = "<CR>",
				preview_close = { "q", "<Esc>" },
			},
		},
	},
})

vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

vim.api.nvim_create_autocmd("User", {
	pattern = "TinyCodeActionWindowEnterMain",
	callback = function(ev)
		vim.keymap.set("n", "<C-j>", "j", {
			buffer = ev.data.buf,
			silent = true,
		})

		vim.keymap.set("n", "<C-k>", "k", {
			buffer = ev.data.buf,
			silent = true,
		})
	end,
})
