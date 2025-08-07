return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
    },
    lazy = true,
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find files"
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Grep search"
        },
        {
            "<leader>Dd",
            function()
                require("telescope.builtin").diagnostics({ bufnr = 0 })
            end,
            desc = "Document diagnostics"
        },
        {
            "<leader>Dw",
            function()
                require("telescope.builtin").diagnostics()
            end,
            desc = "Workspace diagnostics (depends on LSP)"
        },
        {
            "<leader>s",
            function()
                require("telescope.builtin").lsp_document_symbols()
            end,
            desc = "Document symbols"
        },
        {
            "<leader>S",
            function()
                require("telescope.builtin").lsp_workspace_symbols()
            end,
            desc = "Workspace symbols (depends on LSP)"
        },
    },
    config = function()
        require('telescope').setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                    },
                },
                borderchars = {
                    prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
                    results = { " ", " ", " ", " ", " ", " ", " ", " " },
                    preview = { " ", " ", " ", " ", " ", " ", " ", " " },
                },
                sorting_strategy = "ascending",
                initial_mode = "normal",
            },
            extensions = {
                ['ui-select'] = {
                    require("telescope.themes").get_cursor {}
                }
            }
        })

        -- Load extensions
        require('telescope').load_extension('file_browser')
        require('telescope').load_extension('ui-select')

        -- Set highlight groups
        local colors = {
            bg = "#282828",
            bg_dark = "#1d2021",
            bg_light = "#32302f",
            fg = "#ebdbb2",
            accent = "#83a598",
            gray = "#928374",
        }

        -- Prompt
        vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = colors.accent, bg = colors.bg_dark })
        vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = colors.bg_dark })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.bg_dark, bg = colors.bg_dark })
        vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = colors.fg, bg = colors.bg_dark })

        -- Results
        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = colors.bg })
        vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.bg, bg = colors.bg })
        vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = colors.fg, bg = colors.bg })
        vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = colors.bg })
        vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = colors.bg_light })
        vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = colors.accent, bg = colors.bg_light })

        -- Preview
        vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = colors.bg })
        vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colors.bg, bg = colors.bg })
        vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = colors.fg, bg = colors.bg })

        -- Other
        vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = colors.accent, bold = true })
        vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { bg = colors.bg_light })
        vim.api.nvim_set_hl(0, "TelescopeCountBorder", { fg = colors.bg, bg = colors.bg })
    end
}
