vim.lsp.config("rust_analyzer", {
    settings = {
        ['rust-analyzer'] = {
            procMacro = {
                enable = true,
            },
            cargo = {
                autoreload = true,
                allFeatures = true,
                buildScripts = {
                    enable = true,
                },
            },
            completion = {
                autoimport = {
                    enable = true,
                },
                autoself = {
                    enable = true,
                },
            },
            check = {
                command = "clippy",
                extraArgs = {
                    "--tests", "--", "-W", "clippy::all",
                },
            },
            lens = {
                enable = true,
                debug = {
                    enable = true,
                },
                implementations = {
                    enable = true,
                },
                references = {
                    adt = {
                        enable = true,
                    },
                    enumVariant = {
                        enable = true,
                    },
                    method = {
                        enable = true,
                    },
                    trait = {
                        enable = true,
                    },
                },
            },
        },
    },
})

vim.lsp.enable({ "rust_analyzer", "lua_ls", "gopls", "ruff", "taplo", "ts_ls", "svelte", "pyright" })
