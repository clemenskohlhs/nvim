return {
	-- autopairs
	-- https://github.com/windwp/nvim-autopairs

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{ -- commenting plugin
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
	},
	{ -- lazydev.nvim is a plugin that properly configures LuaLS for editing your Neovim config by lazily updating your workspace libraries.
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "LazyVim", words = { "LazyVim" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
				{ path = "lazy.nvim", words = { "LazyVim" } },
			},
		},
	},
}
