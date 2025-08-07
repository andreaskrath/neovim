return {
    "luukvbaal/statuscol.nvim",
    version = "*",
    config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
            clickmod = nil,
            relculright = true,
            segments = {
                {
                    text = {
                        builtin.lnumfunc,
                    }
                },
                {
                    text = { "%s" },
                }
            }
        })
    end
}
