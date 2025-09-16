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
	opts = {
		ensure_installed = {
			"cssls",
			"emmet_ls",
			"html",
			"jsonls",
			"marksman",
			"svelte",
			"tailwindcss",
			"taplo",
			"ts_ls",
			"yamlls",
		},
	},
	config = function(_, opts)
		require("mason-lspconfig").setup(opts)
		require("mason-tool-installer").setup({
			ensure_installed = {
				"eslint_d",
				"stylua",
			},
		})
	end,
}
