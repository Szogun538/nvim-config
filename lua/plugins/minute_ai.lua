return {
	{
		"milanglacier/minuet-ai.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("minuet").setup({
				provider = "claude",
				provider_options = {
					claude = {
						model = "claude-sonnet-4-20250514",
						api_key = "ANTHROPIC_API_KEY", -- or set via env variable
					},
				},
			})
		end,
	}
}
