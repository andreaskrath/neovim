return {
    'smoka7/hop.nvim',
    lazy = true,
    keys = {
        { "gw", vim.cmd.HopWord, desc = "Hop to a word" }
    },
    config = function()
        require("hop").setup {}
    end
}
