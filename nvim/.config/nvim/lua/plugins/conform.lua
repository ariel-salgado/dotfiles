return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		format_on_save = function(bufnr)
			local ft = vim.bo[bufnr].filetype
			if vim.tbl_contains({ "javascript", "typescript", "svelte" }, ft) then
				local ok = pcall(function()
					vim.cmd("LspEslintFixAll")
				end)
				if not ok then
					require("conform").format({ bufnr = bufnr, lsp_format = "fallback", timeout_ms = 500 })
				end
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		formatters_by_ft = {
			lua = { "stylua" },
		},
	},
	keys = {
		{
			"<leader>fm",
			function()
				vim.schedule(function()
					local ft = vim.bo.filetype
					if vim.tbl_contains({ "javascript", "typescript", "svelte" }, ft) then
						local ok = pcall(function()
							vim.cmd("LspEslintFixAll")
						end)
						if not ok then
							require("conform").format({ async = true, lsp_format = "fallback" })
						end
					else
						require("conform").format({ async = true, lsp_format = "fallback" })
					end
				end)
			end,
			mode = { "n", "v" },
			desc = "Format buffer or range",
		},
	},
}
