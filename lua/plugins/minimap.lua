return {
    "wfxr/minimap.vim",
    -- 'cmd' tells Lazy to only load this plugin when you actually run the minimap commands, 
    -- which keeps your Neovim startup time blazing fast!
    cmd = {
        "Minimap",
        "MinimapClose",
        "MinimapToggle",
        "MinimapRefresh",
        "MinimapUpdateHighlight",
    },
    config = function()
        -- Minimap Settings
        vim.g.minimap_width = 10                  -- How wide the minimap is (default is 10)
        vim.g.minimap_auto_start = 0              -- 0 = don't open automatically
        vim.g.minimap_auto_start_win_enter = 0
        
        -- Optional: Link Minimap colors to your theme (like Gruvbox)
        vim.g.minimap_highlight_range = 1
        vim.g.minimap_highlight_search = 1
    end,
    -- Here is your keyboard shortcut!
    keys = {
        -- Press <leader> (usually Space) + m to toggle the minimap
        { "<leader>m", "<cmd>MinimapToggle<CR>", desc = "Toggle Minimap" },
    },
}
