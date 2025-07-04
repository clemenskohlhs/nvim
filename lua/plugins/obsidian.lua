return {

	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
			"Saghen/blink.cmp",
			"folke/snacks.nvim",
		},

		keys = {
			{ "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "Obsidian Backlinks" },
			{ "<leader>od", "<cmd>ObsidianDailies<CR>", desc = "Obsidian Daily Notes" },
			{ "<leader>ol", "<cmd>ObsidianLinks<CR>", desc = "Obsidian Links" },
			{ "<leader>on", "<cmd>ObsidianNew<CR>", desc = "Obsidian New Note" },
			{ "<leader>oN", "<cmd>ObsidianNewFromTemplate<CR>", desc = "Obsidian New Note From Template" },
			{ "<leader>oo", "<cmd>ObsidianOpen<CR>", desc = "Obsidian Open In App" },
			{ "<leader>of", "<cmd>ObsidianQuickSwitch<CR>", desc = "Obsidian File Search" },
			{ "<leader>og", "<cmd>ObsidianSearch<CR>", desc = "Obsidian Grep Search" },
			{ "<leader>oT", "<cmd>ObsidianTags<CR>", desc = "Obsidian Search Tags" },
			{ "<leader>ot", "<cmd>ObsidianTemplate<CR>", desc = "Obsidian Template" },
			{ "<leader>ow", "<cmd>ObsidianWorkspace<CR>", desc = "Obsidian Workspace" },
		},
		---@module 'obsidian'
		---@type obsidian.config.ClientOpts
		opts = {
			workspaces = {
				{
					name = "Vault",
					path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault",
				},
				{
					name = "Basketball",
					path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Basketball",
				},
			},

			notes_subdir = "0 - Inbox",

			new_notes_location = "notes_subdir",

			completion = {
				nvim_cmp = false,
				blink = true,
			},

			picker = {
				name = "snacks.pick",
			},
			templates = {
				folder = "7 - Templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
				-- A map for custom variables, the key should be the variable and the value a function
				substitutions = {},
			},
			daily_notes = {
				-- Optional, if you keep daily notes in a separate directory.
				folder = "1 - Dailies",
				-- Optional, if you want to change the date format for the ID of daily notes.
				date_format = "%Y/%m-%b/%Y-%m-%d-%a",
				-- Optional, if you want to change the date format of the default alias of daily notes.
				alias_format = "%B %-d, %Y",
				-- Optional, default tags to add to each new daily note created.
				default_tags = { "daily-notes" },
				-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
				template = "Daily",
				-- Optional, if you want `Obsidian yesterday` to return the last work day or `Obsidian tomorrow` to return the next work day.
				workdays_only = true,
			},

			wiki_link_func = "use_alias_only",

			-- Optional, customize how note file names are generated given the ID, target directory, and title.
			---@param spec { id: string, dir: obsidian.Path, title: string|? }
			---@return string|obsidian.Path The full path to the new note.
			note_path_func = function(spec)
				-- This is equivalent to the default behavior.
				local path = spec.dir / tostring(spec.title)
				return path:with_suffix(".md")
			end,

			-- Optional, alternatively you can customize the frontmatter data.
			---@return table
			note_frontmatter_func = function(note)
				-- Add the title of the note as an alias.
				if note.title then
					note:add_alias(note.title)
				end

				local current_date_link = "[[" .. os.date("%Y-%m-%d-%a") .. "]]"
				local out = { id = note.id, aliases = note.aliases, tags = note.tags, date = current_date_link }

				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end

				return out
			end,
		},
	},
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<leader>o", group = "obsidian", icon = " ", mode = { "n", "v" } },
			},
		},
	},
}
