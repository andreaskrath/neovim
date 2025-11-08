return {
    'nvim-treesitter/nvim-treesitter-context',
    lazy = false,
    keys = {
        {
            "<leader>U",
            function()
                require("treesitter-context").go_to_context(vim.v.count1)
            end,
            desc = "Move up to context"
        },
    },
    config = function()
        require("treesitter-context").setup({
            enable = true,
            multiwindow = false,
            max_lines = 0,
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 20,
            trim_scope = 'outer',
            mode = 'cursor',
            separator = nil,
            zindex = 20,
            on_attach = nil,
        })
    end
}
