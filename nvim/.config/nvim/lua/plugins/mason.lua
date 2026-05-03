return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
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
		},
		automatic_enable = false,
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					border = "rounded",
				},
			},
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					"stylua",
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
}
