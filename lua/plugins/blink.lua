return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    -- main is the unreleased v2 rewrite, the 1.x releases are what this config is written for.
    version = "1.*",
    opts = {
        keymap = {
            preset = "none",
            ["<C-j>"] = { "select_next" },
            ["<C-k>"] = { "select_prev" },
            ["<C-d>"] = { "scroll_documentation_down" },
            ["<C-f>"] = { "scroll_documentation_up" },
            ["<C-y>"] = { "select_and_accept" },
            ["<C-x>"] = { "cancel" },
        },
        appearance = {
            nerd_font_variant = "mono"
        },
        completion = {
            documentation = {
                auto_show = true,
            },
            list = {
                selection = {
                    preselect = false,
                },
            },
        },
        cmdline = {
            keymap = {
                preset = "inherit",
            },
            completion = {
                menu = {
                    auto_show = true,
                },
            },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = {
            implementation = "prefer_rust_with_warning",
        }
    },
    opts_extend = { "sources.default" }
}
