return {
	cmd = { 'lua-language-server', '--stdio' },
	filetypes = { 'lua' },
	root_markers = {
		".git",
		".luacheckrc",
		".luarc.json",
		".luarc.jsonc",
		".stylua.toml",
		"selene.toml",
		"selene.yml",
		"stylua.toml",
	},
	settings = {
		Lua = {
			diagnostics = { globals = { 'vim' } },
			telemetry = { enable = false },
			runtime = { version = "LuaJIT" },
		},
	},
}
