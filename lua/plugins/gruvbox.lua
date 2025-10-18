return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    config = function()
        require("gruvbox").setup({
            terminal_colors = true,
            palette_overrides = {
                dark0 = "#32302f",
            },
        })
        vim.cmd("colorscheme gruvbox")
    end,
}
