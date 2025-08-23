return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.6.0",
    opts = {
        keymap = {
            preset = "none",
            ["<C-j>"] = { "select_next" },
            ["<C-k>"] = { "select_prev" },
            ["<C-d>"] = { "scroll_documentation_down" },
            ["<C-f>"] = { "scroll_documentation_up" },
            ["<C-y>"] = { "select_and_accept" },
            ["Esc"] = { "cancel" },
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
        signature = {
            enabled = true,
            -- window = {
            --     show_documentation = false,
            -- },
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

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = {
            implementation = "prefer_rust_with_warning",
        }
    },
    opts_extend = { "sources.default" }
}
