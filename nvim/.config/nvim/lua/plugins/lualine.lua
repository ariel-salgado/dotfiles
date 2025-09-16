return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			icons_enabled = true,
			theme = "rose-pine",
		},
		sections = {
			lualine_a = {
				{
					"mode",
					fmt = function(str)
						return " " .. str
					end,
				},
			},
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				{
					"filename",
					path = 4,
				},
			},
			lualine_x = {},
			lualine_y = { "filetype" },
			lualine_z = { "location" },
		},
	},
}
