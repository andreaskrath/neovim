vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
    end,
    desc = "Disable semantic token parsing for LSPs",
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.slint",
    callback = function()
        vim.bo.filetype = "slint"
    end,
    desc = "Set filetype for .slint files",
})
