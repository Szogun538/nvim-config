local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

-- Telescope Shortcuts
vim.keymap.set('n', '<leader>ff', function()
	require('telescope.builtin').find_files({
		initial_mode = "insert",
	})
end, { desc = 'Telescope find files' })

vim.keymap.set('n', '<leader>fh', function()
	require('telescope').extensions.file_browser.file_browser({
		cwd = vim.fn.expand("%:p:h"),
		initial_mode = "insert",
		respect_git_ignore = false,
		hidden = true,
		grouped = true,
		depth = 2,
	})
end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fs', function()
    require('telescope.builtin').live_grep()
end)

vim.keymap.set("n", "<leader>nf", function()
	local name = vim.fn.input("Filename: ")
	local current_dir = vim.fn.expand("%:p:h")
	if name == "" then return end
	if name ~= "" then
		vim.cmd("edit " .. current_dir .. "/" .. name)
	end
end)
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
	callback = function()
		local file = vim.fn.expand("%:p")
		vim.fn.jobstart({ "xdg-open", file }, { detach = true })
		vim.api.nvim_buf_delete(0, { force = true })
	end,
})
vim.keymap.set("n", "<leader>fw", function()
	vim.lsp.buf.format()
end, { desc = "Format code (Respectful White Space)" })

vim.keymap.set("n", "<leader>ct", function()
	local old_text = vim.fn.escape(vim.fn.input("Search for: "), [[/\]])
	if old_text == "" then return end
	vim.fn.setreg('/', old_text)
	vim.opt.hlsearch = true
	vim.cmd("redraw")
	local new_text = vim.fn.escape(vim.fn.input("Replace with: "), [[/\]])
	vim.cmd(":%s/" .. old_text .. "/" .. new_text .. "/g")
end
)
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
