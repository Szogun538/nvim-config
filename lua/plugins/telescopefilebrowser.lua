return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- ADD THIS DEPENDENCY
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			extensions = {
				file_browser = {
					respect_gitignore = false,
					hidden = true,
					grouped = true, -- Shows folders first
					initial_mode = "insert",
				},
			},
		})
		-- Load the extension
		telescope.load_extension("file_browser")
	end
}
