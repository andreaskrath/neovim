return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    lazy = true,
    cmd = { "Neogit" },
    keys = {
        { "<leader>G", vim.cmd.Neogit, desc = "Open Neogit" },
    },
    config = function()
        require("neogit").setup {
            remember_settings = true,
            use_per_project_settings = false,
            disable_hint = true,
            highlight = {
                -- Neogit takes its red from the foreground of ErrorMsg, which gruvbox draws inverted,
                -- so the red ends up being the background color and deleted lines become unreadable.
                red = require("gruvbox").palette.bright_red,
            },
            fetch_after_checkout = false,
            status = {
                show_head_commit_hash = false,
            },
            integrations = {
                telescope = true,
                diffview = false,
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
