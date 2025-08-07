return {
    'stevearc/oil.nvim',
    config = function()
        require("oil").setup({
            keymaps = {
                ["?"] = { "actions.show_help", mode = "n" },
                ["<C-h>"] = { "actions.parent", mode = "n" },
                ["<C-l>"] = { "actions.select", mode = "n" },
            },
        })

        vim.keymap.set("n", "<leader>F", vim.cmd.Oil, { noremap = true, silent = true, desc = "Oil file editor" })
    end,
    lazy = false,
}
