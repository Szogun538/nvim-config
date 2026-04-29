return {
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true -- It only loads when another plugin (like Telescope) needs it
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = { "node_modules" },
          -- This line ensures icons are enabled in the picker
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
          },
        },
        pickers = {
          find_files = {
            disable_devicons = false, -- Ensure this is NOT set to true
          },
        },
      })
    end
  }
}
