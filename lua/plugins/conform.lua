return {
    'stevearc/conform.nvim',
    config = function()
        require("conform").setup({
            format_on_save = {
                timeout_ms = 5000,
                lsp_format = "fallback",
            },
            formatters_by_ft = {
                lua = { "stylua", lsp_format = "fallback" },
                nix = { "alejandra" },
                rust = { "rustfmt", lsp_format = "fallback" },
                toml = { "taplo" },
                go = { "gofmt" },
                python = { "ruff_format" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                svelte = { "prettierd", "prettier", stop_after_first = true },
            },

            formatters = {
                ruff_format = {
                    append_args = { "--line-length", "120" },
                },
            },
        })
    end
}
