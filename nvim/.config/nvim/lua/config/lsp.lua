local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")

if ok then
	capabilities = blink.get_lsp_capabilities(capabilities)
end

vim.lsp.config("*", {
	capabilities = capabilities,
})

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
	"oxfmt",
	"oxlint",
	"svelte",
	"tailwindcss",
	"taplo",
	"vtsls",
	"yamlls",
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		---@diagnostic disable-next-line: redefined-local
		local opts = { buffer = ev.buf, silent = true }

		opts.desc = "Show LSP references"
		vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)

		opts.desc = "Go to declaration"
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		opts.desc = "Show LSP definitions"
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

		opts.desc = "Show LSP implementations"
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

		opts.desc = "Show LSP type definitions"
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

		-- opts.desc = "See available code actions"
		-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		opts.desc = "Smart rename"
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "Show line diagnostics"
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		opts.desc = "Show documentation for what is under cursor"
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		opts.desc = "Restart LSP"
		vim.keymap.set("n", "<leader>lr", function()
			for _, client in ipairs(vim.lsp.get_clients()) do
				client:stop(true)
			end
			vim.cmd("e")
		end, opts)
	end,
})
