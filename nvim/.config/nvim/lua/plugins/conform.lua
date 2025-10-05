return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = {}
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "eslint", "prettierd", "prettier", stop_after_first = true },
			typescript = { "eslint", "prettierd", "prettier", stop_after_first = true },
			svelte = { "eslint", "prettierd", "prettier", stop_after_first = true },
		},
	},
}
