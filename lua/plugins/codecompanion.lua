-- This file configures AI-powered coding assistance and diff visualization plugins

return {
	-- Mini.diff plugin for diff visualization
	{
		"echasnovski/mini.diff",
		config = function()
			local diff = require("mini.diff")
			diff.setup({
				-- Enable git diff visualization
				source = diff.gen_source.git(),
				-- Configure diff options
				view = {
					style = "sign", -- Show diff signs in the sign column
					signs = { add = "▎", change = "▎", delete = "▁" },
				},
			})
		end,
	},
	-- CodeCompanion: AI coding assistant plugin
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Lua utility functions
			"nvim-treesitter/nvim-treesitter", -- Syntax parsing
			"MeanderingProgrammer/render-markdown.nvim", -- Render markdown in chat
			"folke/snacks.nvim", -- file picker
		},

		-- Key mappings for CodeCompanion features
		keys = {
			{ "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Chat" },
			{ "<leader>cv", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "CodeCompanion Add Text" },
			{ "<leader>cp", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
			{ "<leader>ci", "<cmd>CodeCompanion<cr>", mode = "v", desc = "CodeCompanion Inline" },
		},

		-- Plugin configuration options
		opts = {
			providers = {
				pickers = "snacks",
				help = "snacks",
				images = "snacks",
				action_palette = "snacks",
			},
			strategies = {
				-- Chat strategy uses Anthropic's AI model
				chat = {
					adapter = "gemini",
				},
				-- Inline assistance also uses Anthropic's AI model
				inline = {
					adapter = "gemini",
				},
				cmd = {
					adapter = "gemini",
				},
			},
		},
	},
}
