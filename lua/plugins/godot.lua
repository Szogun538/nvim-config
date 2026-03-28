-- return {
--   {
--     "lommix/godot.nvim",
--     lazy = true,
--     dependencies = { "mfussenegger/nvim-dap" },
--     cmd = { "GodotDebug", "GodotBreakAtCursor", "GodotStep", "GodotQuit", "GodotContinue" },
--     opts = {
--       bin = "godot",
--       dap = {
--         host = "127.0.0.1",
--         port = 6006,
--       },
--       lsp = {
--         auto_setup = false, -- disable godot.nvim's built-in LSP setup
--       },
--       expose_commands = true,
--       gui = {
--         console_config = {
--           anchor = "SW",
--           border = "double",
--           col = 1,
--           height = 10,
--           relative = "editor",
--           row = 99999,
--           style = "minimal",
--           width = 99999,
--         },
--       },
--     },
--   },
-- }
return {
  {
    "mfussenegger/nvim-dap",
    ft = { "gdscript", "gdresource" },
    config = function()
      local dap = require("dap")

      -- Godot DAP config
      dap.adapters.godot = {
        type = "server",
        host = "127.0.0.1",
        port = 6006,
      }

      dap.configurations.gdscript = {
        {
          type = "godot",
          request = "launch",
          name = "Launch Godot",
          project = "${workspaceFolder}",
        },
      }

      -- Commands to match what godot.nvim provided
      vim.api.nvim_create_user_command("GodotDebug", dap.continue, {})
      vim.api.nvim_create_user_command("GodotStep", dap.step_over, {})
      vim.api.nvim_create_user_command("GodotContinue", dap.continue, {})
      vim.api.nvim_create_user_command("GodotQuit", dap.terminate, {})
      vim.api.nvim_create_user_command("GodotBreakAtCursor", function()
        dap.toggle_breakpoint()
        dap.continue()
      end, {})
    end,
  },
}
