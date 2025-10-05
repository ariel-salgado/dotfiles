return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "master",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				modules = {},
				ignore_install = {},
				ensure_installed = {
					"bash",
					"javascript",
					"typescript",
					"tsx",
					"lua",
					"markdown",
					"markdown_inline",
					"regex",
					"svelte",
					"vue",
					"html",
					"json",
					"jsonc",
					"yaml",
					"toml",
					"xml",
					"graphql",
					"astro",
					"css",
					"scss",
				},
				sync_install = false,
				auto_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "ss",
						node_incremental = "si",
						scope_incremental = "sc",
						node_decremental = "sd",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
						},
						selection_modes = {
							["@parameter.outer"] = "v",
							["@function.outer"] = "V",
							["@class.outer"] = "<c-v>",
						},
						include_surrounding_whitespace = true,
					},
				},
			})

			vim.filetype.add({
				extension = {
					mdx = "mdx",
				},
			})

			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		events = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = true,
				},
			})
		end,
	},
}
