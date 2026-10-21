vim.pack.add({
	{
		name = "blink.lib",
		src = "https://github.com/saghen/blink.lib",
	},
	{
		name = "blink.cmp",
		src = "https://github.com/saghen/blink.cmp",
	},
	{
		name = "blink.pairs",
		src = "https://github.com/saghen/blink.pairs",
		version = vim.version.range("*"),
	},
	{
		name = "LuaSnip",
		version = "v2.5.0",
		build = "make install_jsregexp",
		src = "https://github.com/L3MON4D3/LuaSnip",
	},
	{
		name = "lazydev",
		src = "https://github.com/folke/lazydev.nvim",
	},
	{
		name = "rose-pine",
		src = "https://github.com/rose-pine/neovim",
	},
	{
		name = "nvim-ts-context-commentstring",
		src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
	},
	{
		name = "Comment",
		src = "https://github.com/numToStr/Comment.nvim",
	},
	{
		name = "conform",
		src = "https://github.com/stevearc/conform.nvim",
	},
	{
		name = "gitsigns",
		src = "https://github.com/lewis6991/gitsigns.nvim",
	},
	{
		name = "guess-indent",
		src = "https://github.com/nmac427/guess-indent.nvim",
	},
	{
		name = "lualine",
		src = "https://github.com/nvim-lualine/lualine.nvim",
	},
	{
		name = "nvim-web-devicons",
		src = "https://github.com/nvim-tree/nvim-web-devicons",
	},
	{
		name = "mason",
		src = "https://github.com/mason-org/mason.nvim",
	},
	{
		name = "mason-lspconfig",
		src = "https://github.com/mason-org/mason-lspconfig.nvim",
	},
	{
		name = "nvim-lspconfig",
		src = "https://github.com/neovim/nvim-lspconfig",
	},
	{
		name = "oil",
		src = "https://github.com/stevearc/oil.nvim",
	},
	{
		name = "oil-git",
		src = "https://github.com/malewicz1337/oil-git.nvim",
	},
	{
		name = "nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
	},
	{
		name = "schema-store",
		src = "https://github.com/b0o/SchemaStore.nvim",
	},
	{
		name = "nvim-ts-autotag",
		src = "https://github.com/windwp/nvim-ts-autotag",
	},
	{
		name = "vim-visual-multi",
		branch = "master",
		src = "https://github.com/mg979/vim-visual-multi",
	},
	{
		name = "treesj",
		src = "https://github.com/Wansmer/treesj",
	},
	{
		name = "tiny-cmdline.nvim",
		src = "https://github.com/rachartier/tiny-cmdline.nvim",
	},
	{
		name = "tiny-code-action.nvim",
		src = "https://github.com/rachartier/tiny-code-action.nvim",
	},
	{
		name = "fff",
		src = "https://github.com/dmtrKovalenko/fff.nvim",
	},
	{
		name = "fff-plus",
		src = "https://github.com/vinitkumar/fff-plus.nvim",
	},
})
