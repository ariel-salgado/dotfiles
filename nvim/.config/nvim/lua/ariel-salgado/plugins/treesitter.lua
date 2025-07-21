return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({ 
				highlight = { enable = true },
				indent = { enable = true },
				sync_install = false,
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"markdown",
					"markdown_inline",
					"svelte",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"query",
					"vimdoc",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
					},
				},
				additional_vim_regex_highlighting = false,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		enabled = true,
		ft = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,           
					enable_rename = true,         
					enable_close_on_slash = false,
				},
				per_filetype = {
					["html"] = {
						enable_close = true, 
					},
					["typescriptreact"] = {
						enable_close = true,
					},
				},
			})
		end,
	},
}
