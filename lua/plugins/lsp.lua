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

            -- 2. The Modern Way (New for 0.11+)
            -- Instead of require('lspconfig'), we use the native vim.lsp.config
            
            -- Setup Lua Language Server
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
			completion = { callSnippet = "Replace" },
			workspace = { checkThirdParty = false,},
                        diagnostics = {
                            globals = { 'vim' }, -- Stop Neovim from complaining about the 'vim' variable
                        },
                    },
                },
            })

            -- 3. Tell Neovim to actually start the servers
            vim.lsp.enable('lua_ls')
            -- If you add more, like python: vim.lsp.enable('pyright')

            -- 4. Keymaps (Standard LSP shortcuts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP Hover Info" })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Actions" })
        end
    }
}
