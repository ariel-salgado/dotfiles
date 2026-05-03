return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			local languages = {
				"bash",
				"javascript",
				"typescript",
				"lua",
				"markdown",
				"markdown_inline",
				"regex",
				"svelte",
				"html",
				"json",
				"jsdoc",
				"yaml",
				"toml",
				"xml",
				"css",
				"zsh",
			}

			for _, language in ipairs(languages) do
				ts.install(language)
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = languages,
				callback = function()
					vim.treesitter.start()
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})

			vim.treesitter.language.register("bash", "zsh")
			vim.treesitter.language.register("markdown", "mdx")

			vim.keymap.set("x", "<C-Space>", function()
				require("vim.treesitter._select").select_parent(vim.v.count1)
			end)
			vim.keymap.set("x", "<BS>", function()
				require("vim.treesitter._select").select_child(vim.v.count1)
			end)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		events = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}
