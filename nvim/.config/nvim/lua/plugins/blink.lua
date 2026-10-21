require("lazydev").setup({
	ft = "lua",
	library = {
		{
			path = "${3rd}/luv/library",
			words = { "vim%.uv" },
		},
	},
})

local cmp = require("blink.cmp")
local pairs = require("blink.pairs")

cmp.build():pwait()
pairs.build():pwait()

---@module 'blink.cmp'
---@type blink.cmp.Config
cmp.setup({
	fuzzy = {
		implementation = "lua",
	},

	keymap = {
		preset = "none",

		["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" },
		["<CR>"] = { "accept", "fallback" },

		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },

		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },

		["<C-n>"] = { "select_next", "show" },
		["<C-p>"] = { "select_prev", "show" },

		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },

		["<S-k>"] = { "show_signature", "hide_signature", "fallback" },
	},

	completion = {
		list = {
			selection = {
				preselect = false,
				auto_insert = false,
			},
		},
		menu = {
			auto_show = true,
		},
		documentation = {
			auto_show = false,
		},
		ghost_text = {
			enabled = false,
			show_with_menu = false,
		},
		accept = {
			auto_brackets = {
				enabled = true,
				kind_resolution = {
					enabled = true,
				},
			},
		},
	},

	cmdline = {
		enabled = true,
		keymap = { preset = "cmdline" },
		completion = {
			menu = { auto_show = true },
		},
	},

	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			lsp = {
				opts = {
					tailwind_color_icon = "󱓻",
				},
			},
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},

	appearance = {
		use_nvim_cmp_as_default = false,
		nerd_font_variant = "mono",
	},

	snippets = {
		preset = "luasnip",
	},
})

--- @module 'blink.pairs'
--- @type blink.pairs.Config
pairs.setup()

require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/lua/snippets" } })
