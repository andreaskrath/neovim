return {
    "nvim-lualine/lualine.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup {
            options = {
                theme = "gruvbox-material",
                globalstatus = true,
                always_show_tabline = true,
                section_separators = "",
                component_separators = "",
            },
            sections = {
                lualine_a = { { "mode", separator = nil } },
                lualine_b = { "branch", "diff" },
                lualine_c = { { "filename", path = 1 } },

                lualine_x = { "diagnostics" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        }
    end
}
