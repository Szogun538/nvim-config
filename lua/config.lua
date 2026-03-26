vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.numberwidth = 4
vim.lsp.enable('lua_ls')
vim.opt.scrolloff = 6
if vim.fn.has("persistent_undo") == 1 then
    local target_path = vim.fn.expand('~/.filter_undo')

    -- Create the directory if it doesn't exist
    if vim.fn.isdirectory(target_path) == 0 then
        os.execute("mkdir -p " .. target_path)
    end

    vim.opt.undodir = target_path
    vim.opt.undofile = true
end
