return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "c",

                "vimdoc",

                "rust",

                "go",
                "gomod",
                "gosum",

                "lua",
                "luadoc",

                "typescript",
                "javascript",
                "svelte",
                "jsdoc",
                "css",

                "toml",
                "json",
                "json5",
                "just",
                "dockerfile",
                "gitcommit",
                "git_rebase",
                "git_config",
                "gitattributes",
                "gitignore",

                "markdown",
                "markdown_inline",
                "typst",

                "nix",

                "sql",

                "python",

                "bash",
            },
            highlight = {
                enable = true,
                disable = function(lang, buf)
                    local max_filesize = 1000 * 1024 -- 1 MB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end
            },
        }
    end
}
