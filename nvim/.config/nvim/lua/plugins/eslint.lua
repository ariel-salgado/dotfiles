return {
	"esmuellert/nvim-eslint",
	event = "InsertEnter",
	opts = {
		root_dir = function(bufnr, on_dir)
			local root_markers =
				{ "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock", "deno.lock" }
			root_markers = vim.fn.has("nvim-0.11.4") == 1 and { root_markers, { ".git" } }
				or vim.list_extend(root_markers, { ".git" })
			local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
			local filename = vim.api.nvim_buf_get_name(bufnr)
			local eslint_config_files = {
				".eslintrc",
				".eslintrc.js",
				".eslintrc.cjs",
				".eslintrc.yaml",
				".eslintrc.yml",
				".eslintrc.json",
				"eslint.config.js",
				"eslint.config.mjs",
				"eslint.config.cjs",
				"eslint.config.ts",
				"eslint.config.mts",
				"eslint.config.cts",
			}
			local eslint_config_files_with_package_json =
				require("lspconfig.util").insert_package_json(eslint_config_files, "eslintConfig", filename)
			local is_buffer_using_eslint = vim.fs.find(eslint_config_files_with_package_json, {
				path = filename,
				type = "file",
				limit = 1,
				upward = true,
				stop = vim.fs.dirname(project_root),
			})[1]
			if not is_buffer_using_eslint then
				return
			end

			on_dir(project_root)
		end,
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
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
		handlers = {
			["eslint/openDoc"] = function(_, result)
				if result then
					vim.ui.open(result.url)
				end
				return {}
			end,
			["eslint/confirmESLintExecution"] = function(_, result)
				if not result then
					return
				end
				return 4 -- approved
			end,
			["eslint/probeFailed"] = function()
				vim.notify("[lspconfig] ESLint probe failed.", vim.log.levels.WARN)
				return {}
			end,
			["eslint/noLibrary"] = function()
				vim.notify("[lspconfig] Unable to find ESLint library.", vim.log.levels.WARN)
				return {}
			end,
		},
		settings = {
			useESLintClass = true,
			experimental = { useFlatConfig = true },
			codeAction = {
				disableRuleComment = {
					enable = true,
					location = "separateLine",
				},
				showDocumentation = {
					enable = true,
				},
			},
			codeActionOnSave = {
				mode = "all",
			},
			format = true,
			quiet = false,
			onIgnoredFiles = "off",
			options = {},
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
			run = "onType",
			problems = {
				shortenToSingleLine = false,
			},
			nodePath = nil,
			workingDirectory = { mode = "auto" },
		},
	},
}
