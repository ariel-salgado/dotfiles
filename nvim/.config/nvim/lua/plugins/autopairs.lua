return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")
		local ts_conds = require("nvim-autopairs.ts-conds")

		npairs.setup({
			check_ts = true,
			enable_check_bracket_line = false,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
				java = false,
			},
		})

		npairs.add_rules({
			Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
			Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
		})

		-- Insertion with surrounding check
		local function rule2(a1, ins, a2, lang)
			npairs.add_rule(Rule(ins, ins, lang)
				:with_pair(function(opts)
					return a1 .. a2 == opts.line:sub(opts.col - #a1, opts.col + #a2 - 1)
				end)
				:with_move(cond.none())
				:with_cr(cond.none())
				:with_del(function(opts)
					local col = vim.api.nvim_win_get_cursor(0)[2]
					return a1 .. ins .. ins .. a2 == opts.line:sub(col - #a1 - #ins + 1, col + #ins + #a2) -- insert only works for #ins == 1 anyway
				end))
		end

		rule2("(", "*", ")", "ocaml")
		rule2("(*", " ", "*)", "ocaml")
		rule2("(", " ", ")")

		npairs.add_rule(Rule("<", ">", {
			"-html",
			"-javascriptreact",
			"-typescriptreact",
		}):with_pair(cond.before_regex("%a+:?:?$", 3)):with_move(function(opts)
			return opts.char == ">"
		end))
	end,
}
