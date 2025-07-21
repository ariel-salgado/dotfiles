return {
	{
		'echasnovski/mini.comment',
		version = false,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require('ts_context_commentstring').setup {
				enable_autocmd = false,
			}

			require("mini.comment").setup {
				options = {
					custom_commentstring = function()
						return require('ts_context_commentstring.internal').calculate_commentstring({ key =
							'commentstring' })
							or vim.bo.commentstring
					end,
				},
			}
		end
	},
	{
		"echasnovski/mini.surround",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			custom_surroundings = nil,
			highlight_duration = 300,
			mappings = {
				add = 'sa',
				delete = 'ds',
				find = 'sf', 
				find_left = 'sF',   
				highlight = 'sh',    
				replace = 'sr',        
				update_n_lines = 'sn',

				suffix_last = 'l', 
				suffix_next = 'n',
			},
			n_lines = 20,
			respect_selection_type = false,
			search_method = 'cover',
			silent = false,
		},
	},
}
