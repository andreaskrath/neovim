function Map(mode, key, action, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, key, action, options)
end

-- Show diagnostic under cursor
Map("n", "<leader>e", function()
    vim.diagnostic.open_float()
end, { desc = "Show diagnostic under cursor" })

Map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Show code action under cursor" })
Map("n", "gd", vim.lsp.buf.definition, { desc = "Show code action under cursor" })
Map("n", "gD", vim.lsp.buf.declaration, { desc = "Show code action under cursor" })
Map("n", "gt", vim.lsp.buf.type_definition, { desc = "Show code action under cursor" })
Map("n", "<leader>r", vim.lsp.buf.rename, { desc = "Show code action under cursor" })

-- Move to first non-whitespace character
Map("n", "gs", "^")
Map("v", "gs", "^")

-- Move to start of line
Map("n", "gh", "0")
Map("v", "gh", "0")

-- Move to end of line
Map("n", "gl", "$")
Map("v", "gl", "$")

-- Redo
Map("n", "U", "<C-r>")

-- Move cursor to end of yanked section
Map("v", "y", "y`]")

-- Keep selection when indenting
Map("v", ">", ">gv")
Map("v", "<", "<gv")

-- Move to next item in quicklist
Map("n", "<C-j>", "<CMD>cnext<CR>")

-- Move to previous item in quicklist
Map("n", "<C-k>", "<CMD>cprev<CR>")

-- Clears
Map("n", "0", "<Nop>")
Map("n", "$", "<Nop>")
Map("n", "<C-r>", "<Nop>")
Map("v", "0", "<Nop>")
Map("v", "$", "<Nop>")
