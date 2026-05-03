vim.lsp.inlay_hint.enable()

vim.lsp.config("eslint", {
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"html",
		"markdown",
		"json",
		"jsonc",
		"yaml",
		"toml",
		"xml",
		"gql",
		"graphql",
		"astro",
		"svelte",
		"css",
		"less",
		"scss",
		"pcss",
		"postcss",
	},
	settings = {
		rulesCustomizations = {
			{ rule = "style/*", severity = "off", fixable = true },
			{ rule = "format/*", severity = "off", fixable = true },
			{ rule = "*-indent", severity = "off", fixable = true },
			{ rule = "*-spacing", severity = "off", fixable = true },
			{ rule = "*-spaces", severity = "off", fixable = true },
			{ rule = "*-order", severity = "off", fixable = true },
			{ rule = "*-dangle", severity = "off", fixable = true },
			{ rule = "*-newline", severity = "off", fixable = true },
			{ rule = "*quotes", severity = "off", fixable = true },
			{ rule = "*semi", severity = "off", fixable = true },
		},
	},
})

vim.lsp.config("svelte", {
	settings = {
		typescript = {
			inlayHints = false,
		},
	},
})

vim.lsp.enable({
	"cssls",
	"eslint",
	"emmet_language_server",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"svelte",
	"tailwindcss",
	"taplo",
	"vtsls",
	"yamlls",
})
