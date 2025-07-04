-- CodeCompanion plugin configuration
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
			-- Open CodeCompanion chat interface
			{ "<leader>cc", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion Chat" },

			-- Show available actions (normal and visual mode)
			{ "<leader>ca", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },

			-- Toggle CodeCompanion interface
			{ "<leader>ct", "<cmd>CodeCompanionToggle<cr>", desc = "CodeCompanion Toggle" },
			-- Inline AI assistance for selected code (visual mode only)
			{ "<leader>ci", "<cmd>CodeCompanion<cr>", mode = "v", desc = "CodeCompanion Inline" },
			-- Quick chat command interface
			{ "<leader>cq", "<cmd>CodeCompanionCmd<cr>", desc = "CodeCompanion Quick Chat" },
			-- Apply suggested changes
			{ "<leader>cy", "<cmd>CodeCompanionAdd<cr>", desc = "CodeCompanion Apply Changes" },
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
					adapter = "anthropic",
				},
				-- Inline assistance also uses Anthropic's AI model
				inline = {
					adapter = "anthropic",
				},
			},
		},
	},
}
