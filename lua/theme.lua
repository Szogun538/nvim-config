require("gruvbox").setup({
	termianl_color = true,
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, highlight, statusline and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = true,
})
-- Force the terminal cursor to Orange (#fe8019) when entering Neovim
vim.api.nvim_create_autocmd({"UIEnter", "ColorScheme"}, {
    callback = function()
        -- \27 is the ESC key. ]12; sets text cursor color.
        io.stdout:write("\27]12;#fe8019\7")
    end,
})

-- Optional: Reset the cursor back to white/default when you LEAVE Neovim
vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
        io.stdout:write("\27]12;#ffffff\7") -- Change #ffffff to your preferred terminal default
    end,
})
