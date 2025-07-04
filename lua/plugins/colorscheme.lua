return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		-- config = function()
		-- 	-- load the colorscheme here
		-- 	vim.cmd([[colorscheme catppuccin-mocha]])
		-- end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd([[colorscheme tokyonight-storm]])
		end,
	},
	{
		"marko-cerovac/material.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		-- config = function()
		-- 	vim.cmd([[colorscheme material-palenight]])
		-- end,
	},
	{
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		-- config = function()
		-- 	vim.cmd([[colorscheme onedark]])
		-- end,
	},
	{
		"nickkadutskyi/jb.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		-- config = function()
		-- 	vim.cmd([[colorscheme jb]])
		-- end,
	},
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		-- config = function()
		-- 	vim.cmd([[colorscheme bamboo]])
		-- end,
	},
}
