return {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")

        dapui.setup({
            layouts = {
                {
                    elements = {
                        -- Note: elements are displayed in opposite order
                        -- Meaning console is right, scopes is left
                        { id = "console", size = 0.5 },
                        { id = "scopes",  size = 0.5 },
                    },
                    position = "bottom",
                    size = 20,
                },
                {
                    elements = {
                        { id = "stacks",  size = 0.5 },
                        { id = "watches", size = 0.5 },
                    },
                    position = "left",
                    size = 50,
                },
            },
        })

        -- Auto open/close UI
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,
}
