---@module "conform"
local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
})

---@type table<string, fun(client: vim.lsp.Client, bufnr: integer)>
local fix_all = {
	oxlint = function(client, bufnr)
		client:request_sync("workspace/executeCommand", {
			command = "oxc.fixAll",
			arguments = { { uri = vim.uri_from_bufnr(bufnr) } },
		}, 1000, bufnr)
	end,
	eslint = function(client, bufnr)
		client:request_sync("workspace/executeCommand", {
			command = "eslint.applyAllFixes",
			arguments = { { uri = vim.uri_from_bufnr(bufnr), version = vim.lsp.util.buf_versions[bufnr] } },
		}, 1000, bufnr)
	end,
}

---@param bufnr integer
---@param name string
local function get_client(bufnr, name)
	return vim.lsp.get_clients({ bufnr = bufnr, name = name })[1]
end

---@param bufnr? integer
local function format(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	local oxlint = get_client(bufnr, "oxlint")
	if oxlint then
		conform.format({ bufnr = bufnr, formatters = { "oxfmt" }, timeout_ms = 1000 })
		fix_all.oxlint(oxlint, bufnr)
		return
	end

	local eslint = get_client(bufnr, "eslint")
	if eslint then
		fix_all.eslint(eslint, bufnr)
		return
	end

	conform.format({ bufnr = bufnr, lsp_format = "fallback", timeout_ms = 1000 })
end

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
	callback = function(args)
		if vim.bo[args.buf].buftype == "" then
			format(args.buf)
		end
	end,
})

vim.keymap.set("n", "fm", function()
	format()
end, { desc = "Format file" })
