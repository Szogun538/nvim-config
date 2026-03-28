return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- 1. Setup Mason as usual
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
			})

			-- 2. Setup Lua Language Server
			vim.lsp.config('lua_ls', {
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
						workspace = { checkThirdParty = false },
						diagnostics = {
							globals = { 'vim' },
						},
					},
				},
			})

			-- 3. Setup GDScript (Godot must be open — it hosts the LSP on port 6005)
			vim.lsp.config('gdscript', {
				cmd = { "nc", "localhost", "6005" }, -- Linux/Mac
				-- cmd = vim.lsp.rpc.connect("127.0.0.1", 6005), -- Windows
				filetypes = { "gdscript", "gdresource" },
			})

			-- 4. Enable servers
			vim.lsp.enable('lua_ls')
			vim.lsp.enable('gdscript')

			-- 5. Keymaps
			vim.keymap.set('n', 'K', function()
				vim.lsp.buf.hover({ split = "below", height = 15 })
			end, { desc = "LSP Hover Info" })
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Actions" })
		end
	}
}
