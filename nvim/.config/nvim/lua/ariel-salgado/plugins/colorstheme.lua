return { 
	'olivercederborg/poimandres.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require('poimandres').setup {
			disable_background = true,
		}
	end,	
	init = function()
		vim.cmd("colorscheme poimandres")
	end
}
