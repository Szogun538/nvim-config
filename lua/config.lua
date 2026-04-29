vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.numberwidth = 4
vim.lsp.enable('lua_ls')
vim.opt.scrolloff = 6
vim.opt.wrap = false
if vim.fn.has("persistent_undo") == 1 then
    local target_path = vim.fn.expand('~/.filter_undo')

    -- Create the directory if it doesn't exist
    if vim.fn.isdirectory(target_path) == 0 then
        os.execute("mkdir -p " .. target_path)
    end

    vim.opt.undodir = target_path
    vim.opt.undofile = true
end
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  callback = function()
    local name = vim.api.nvim_buf_get_name(0)
    if name ~= "" then
      -- Show just the filename, or use name for full path
      vim.opt.titlestring = vim.fn.fnamemodify(name, ":t")
    else
      vim.opt.titlestring = "[No Name]"
    end
  end,
})

vim.opt.title = true
vim.opt.wrap = false
