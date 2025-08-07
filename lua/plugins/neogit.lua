return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    version = "*",
    lazy = true,
    keys = {
        { "<leader>G", vim.cmd.Neogit, desc = "Open Neogit" },
    },
    config = function()
        require("neogit").setup {
            disable_hint = true,
            fetch_after_checkout = false,
            status = {
                show_head_commit_hash = false,
            },
            integrations = {
                telescope = true,
            },
            sections = {
                rebase = {
                    folded = false,
                    hidden = false,
                },
                recent = {
                    folded = false,
                    hidden = false,
                },
                unpulled_upstream = {
                    folded = false,
                    hidden = false,
                },
                unpulled_pushRemote = {
                    folded = false,
                    hidden = false,
                }
            }
        }
    end
}
