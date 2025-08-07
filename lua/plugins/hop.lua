return {
    'smoka7/hop.nvim',
    version = "2.7.2",
    lazy = true,
    keys = {
        { "gw", vim.cmd.HopWord, desc = "Hop to a word" }
    },
    config = function()
        require("hop").setup {}
    end
}
