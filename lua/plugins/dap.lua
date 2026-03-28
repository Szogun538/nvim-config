return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",  -- nice UI for debugging
      "nvim-neotest/nvim-nio", -- required by dap-ui
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Open/close dapui automatically when debugging starts/stops
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      dapui.setup()

      -- Keymaps
    end,
  },
}
