return {
	"mg979/vim-visual-multi",
	branch = "master",
	event = "BufReadPre",
	init = function()
		vim.g.VM_default_mappings = 0
		vim.g.VM_maps = {
			["Find Under"] = "<C-n>",
			["Find Subword Under"] = "<C-n>",
		}
	end,
}
