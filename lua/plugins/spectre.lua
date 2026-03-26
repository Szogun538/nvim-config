return {
	'nvim-pack/nvim-spectre',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		require('spectre').setup({
			-- You can change the search engine here if you prefer 'fd'
			default = {
				find = {
					cmd = "rg",
					options = { "ignore-case" }
				}
			}
		})
	end
}
