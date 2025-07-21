return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") 

		local mode = {
			'mode',
			fmt = function(str)
				return ' ' .. str
			end,
		}

		local diff = {
			'diff',
			colored = true,
			symbols = { added = ' ', modified = ' ', removed = ' ' }, 
		}

		local filename = {
			'filename',
			file_status = true,
			path = 0,
		}

		local branch = {'branch', icon = {'', color={fg='#A6D4DE'}}, '|'}

		lualine.setup({
			icons_enabled = true,
			options = {
				theme = 'poimandres',
				-- component_separators = { left = "|", right = "|" },
				-- section_separators = { left = "|", right = "" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { diff, filename },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "filetype" },
				},
			},
		})
	end,
}
