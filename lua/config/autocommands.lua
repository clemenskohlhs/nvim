-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Treat .cnf files as JSON
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "Treat .cnf files as JSON",
	pattern = "*.cnf",
	callback = function()
		vim.bo.filetype = "json"
	end,
})
