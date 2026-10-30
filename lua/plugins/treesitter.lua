local parsers = {
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
    "slint",

    "nix",

    "sql",

    "python",

    "bash",

    "cooklang",
}

return {
    "nvim-treesitter/nvim-treesitter",
    -- Does not support lazy loading.
    lazy = false,
    build = ":TSUpdate",
    config = function()
        -- Already installed parsers are skipped, so this only does work on a fresh machine.
        require("nvim-treesitter").install(parsers)

        -- The main branch no longer has a highlight module, highlighting is
        -- started per buffer with neovim's own treesitter api instead.
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local max_filesize = 1000 * 1024 -- 1 MB
                local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
                if ok and stats and stats.size > max_filesize then
                    return
                end

                -- Fails when there is no parser for the filetype, which is fine.
                pcall(vim.treesitter.start, args.buf)
            end,
            desc = "Start treesitter highlighting",
        })
    end
}
