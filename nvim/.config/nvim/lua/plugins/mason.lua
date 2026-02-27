return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					border = "rounded",
				},
			},
		},
		"neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason-lspconfig").setup({
			automatic_enable = {
				exclude = {
					"eslint",
				},
			},
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
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"eslint_d",
			},
		})
	end,
}
