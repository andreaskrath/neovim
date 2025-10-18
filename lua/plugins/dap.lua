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

        dap.adapters.codelldb = {
            type = 'server',
            port = "${port}",
            executable = {
                command = 'codelldb',
                args = { "--port", "${port}" },
            }
        }

        dap.configurations.rust = {
            {
                name = "Launch main",
                type = "codelldb",
                request = "launch",
                program = function()
                    -- Build the project first
                    vim.fn.system('cargo build')
                    -- Get the binary name from Cargo.toml or use workspace folder name
                    local cwd = vim.fn.getcwd()
                    local workspace_name = vim.fn.fnamemodify(cwd, ':t')
                    return cwd .. '/target/debug/' .. workspace_name
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                skipFiles = {
                    "/rustc/**",
                    "~/.rustup/**",
                    "~/.cargo/registry/**",
                },
                justMyCode = true,
                args = {},
                runInTerminal = false,
                sourceLanguages = { "rust" },
            },
            {
                name = "Launch with args",
                type = "codelldb",
                request = "launch",
                program = function()
                    vim.fn.system('cargo build')
                    local cwd = vim.fn.getcwd()
                    local workspace_name = vim.fn.fnamemodify(cwd, ':t')
                    return cwd .. '/target/debug/' .. workspace_name
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                skipFiles = {
                    "/rustc/**",
                    "~/.rustup/**",
                    "~/.cargo/registry/**",
                },
                justMyCode = true,
                args = function()
                    local args_string = vim.fn.input('Arguments: ')
                    return vim.split(args_string, " ")
                end,
                runInTerminal = false,
                sourceLanguages = { "rust" },
            },
            {
                name = "Debug tests",
                type = "codelldb",
                request = "launch",
                program = function()
                    -- Build tests
                    vim.fn.system('cargo test --no-run')
                    -- Find the test executable
                    local output = vim.fn.system(
                        "cargo test --no-run --message-format=json 2>/dev/null | jq -r 'select(.executable != null) | .executable' | head -1")
                    return vim.fn.trim(output)
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                skipFiles = {
                    "/rustc/**",
                    "~/.rustup/**",
                    "~/.cargo/registry/**",
                },
                justMyCode = true,
                args = {},
                runInTerminal = false,
                sourceLanguages = { "rust" },
            },
        }
    end
}
