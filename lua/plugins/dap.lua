return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui"
    },
    version = "0.10.0",
    lazy = true,
    keys = {
        { "<C-S-j>", vim.cmd.DapStepOver,         desc = "Step over (down)" },
        { "<C-S-k>", vim.cmd.DapContinue,         desc = "Continue (up)" },
        { "<C-S-h>", vim.cmd.DapStepOut,          desc = "Step out (left)" },
        { "<C-S-l>", vim.cmd.DapStepIn,           desc = "Step in (right)" },
        { "<C-S-n>", vim.cmd.DapToggleBreakpoint, desc = "Toggle breakpoint" },
        { "<C-S-m>", vim.cmd.DapTerminate,        desc = "Quit debugging" },
    },
    config = function()
        local dap = require("dap")

        dap.adapters.debugpy = {
            type = "executable",
            command = "python",
            args = { "-m", "debugpy.adapter" },
        }

        dap.configurations.python = {
            {
                type = 'debugpy',
                request = 'launch',
                name = 'Main',
                program = '${workspaceFolder}/src/main.py',
                cwd = '${workspaceFolder}',
                justMyCode = false,
                console = 'integratedTerminal',
            },
            {
                type = 'debugpy',
                request = 'launch',
                name = 'File',
                program = '${file}',
                cwd = '${workspaceFolder}',
                justMyCode = false,
                console = 'integratedTerminal',
            },
        }
    end
}
