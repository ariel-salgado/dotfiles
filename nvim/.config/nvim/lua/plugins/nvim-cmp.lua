return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"onsails/lspkind.nvim",
		"luckasRanarison/tailwind-tools.nvim",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"nvim-lua/plenary.nvim",
		{
			"antosha417/nvim-lsp-file-operations",
			config = true,
		},
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "supermaven" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					ellipsis_char = "...",
					symbol_map = {
						Copilot = "",
						Supermaven = "",
					},
					show_labelDetails = true,
					before = require("tailwind-tools.cmp").lspkind_format,
				}),
			},
		})

		-- `/` search cmdline completion
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- `:` command-line completion
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})
	end,
}
