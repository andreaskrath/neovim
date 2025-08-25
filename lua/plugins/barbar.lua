return {
    "romgrk/barbar.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = { "BufAdd" },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    config = function()
        require("barbar").setup({
            animation = false,
            clickable = false,
            highlight_visible = true,
            icons = {
                buffer_index = true,
                button = false,
                filetype = {
                    enabled = false,
                },
                separator = {
                    left = "",
                    right = "",
                },
                separator_at_end = false,
                inactive = {
                    separator = {
                        left = "",
                        right = "",
                    },
                },
            },
        })

        -- Set highlight groups
        local colors = {
            bg = "#32302f",
            orange = "#fe8019",
            white = "#ffffff",
            green = "#b8bb26",
            gray = "#7c6f64",
            tabline_default = "#3c3836",
        }

        vim.api.nvim_set_hl(0, "BufferCurrent", { fg = colors.green, bg = colors.bg })
        vim.api.nvim_set_hl(0, "BufferCurrentIndex", { fg = colors.orange, bg = colors.bg })
        vim.api.nvim_set_hl(0, "BufferCurrentMod", { fg = colors.green, bg = colors.bg })
        vim.api.nvim_set_hl(0, "BufferCurrentModBtn", { fg = colors.white, bg = colors.bg })

        vim.api.nvim_set_hl(0, "BufferVisibleIndex", { fg = colors.orange, bg = colors.tabline_default })
        vim.api.nvim_set_hl(0, "BufferVisibleMod", { fg = colors.gray, bg = colors.tabline_default })
        vim.api.nvim_set_hl(0, "BufferVisibleModBtn", { fg = colors.white, bg = colors.tabline_default })

        vim.api.nvim_set_hl(0, "BufferInactiveIndex", { fg = colors.orange, bg = colors.tabline_default })
        vim.api.nvim_set_hl(0, "BufferInactiveMod", { fg = colors.gray, bg = colors.tabline_default })
        vim.api.nvim_set_hl(0, "BufferInactiveModBtn", { fg = colors.white, bg = colors.tabline_default })
    end,
    keys = {
        -- Close current buffer
        {
            "<leader>c",
            vim.cmd.BufferClose,
            desc = "Close current buffer",
            mode = { "n" },
        },
        -- Navigate buffers
        {
            "gn",
            vim.cmd.BufferNext,
            desc = "Move to next buffer",
            mode = { "n" },
        },
        {
            "gp",
            vim.cmd.BufferPrevious,
            desc = "Move to previous buffer",
            mode = { "n" },
        },
        {
            "<A-1>",
            function() vim.cmd.BufferGoto(1) end,
            desc = "Goto buffer 1",
            mode = { "n" },
        },
        {
            "<A-2>",
            function() vim.cmd.BufferGoto(2) end,
            desc = "Goto buffer 2",
            mode = { "n" },
        },
        {
            "<A-3>",
            function() vim.cmd.BufferGoto(3) end,
            desc = "Goto buffer 3",
            mode = { "n" },
        },
        {
            "<A-4>",
            function() vim.cmd.BufferGoto(4) end,
            desc = "Goto buffer 4",
            mode = { "n" },
        },
        {
            "<A-5>",
            function() vim.cmd.BufferGoto(5) end,
            desc = "Goto buffer 5",
            mode = { "n" },
        },
        {
            "<A-6>",
            function() vim.cmd.BufferGoto(6) end,
            desc = "Goto buffer 6",
            mode = { "n" },
        },
        {
            "<A-7>",
            function() vim.cmd.BufferGoto(7) end,
            desc = "Goto buffer 7",
            mode = { "n" },
        },
        {
            "<A-8>",
            function() vim.cmd.BufferGoto(8) end,
            desc = "Goto buffer 8",
            mode = { "n" },
        },
        {
            "<A-9>",
            function() vim.cmd.BufferGoto(9) end,
            desc = "Goto buffer 9",
            mode = { "n" },
        },
    },
}
