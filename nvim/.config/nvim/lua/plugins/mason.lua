require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	firewall = {
		enabled = true,
	},
})

require("mason-lspconfig").setup({
	automatic_enable = false,
	ensure_installed = {
		"cssls",
		"eslint",
		"emmet_language_server",
		"html",
		"jsonls",
		"lua_ls",
		"marksman",
		"oxfmt",
		"oxlint",
		"svelte",
		"tailwindcss",
		"taplo",
		"vtsls",
		"yamlls",
	},
})
