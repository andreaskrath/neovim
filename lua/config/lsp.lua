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

vim.lsp.enable({ "rust_analyzer", "lua_ls", "gopls", "ruff", "taplo", "ts_ls", "svelte", "pyright", "nil_ls", "slint_lsp", "jsonls" })

vim.diagnostic.config({
    signs = false
})

-- rust-analyzer turns the rustdoc fences it knows about (no_run, ignore, ...) into ```rust
-- and drops the lines rustdoc hides, but it does not know about `standalone_crate`, so those
-- blocks show up unhighlighted with the hidden lines in them. This does the same thing for them,
-- both hover and blink's documentation window go through this function.
local convert_input_to_markdown_lines = vim.lsp.util.convert_input_to_markdown_lines
vim.lsp.util.convert_input_to_markdown_lines = function(...)
    local lines = convert_input_to_markdown_lines(...)

    local processed = {}
    local in_code_block = false
    local is_standalone_crate = false
    for _, line in ipairs(lines) do
        local header = line:match("^```(.*)") or line:match("^~~~(.*)")
        local trimmed = vim.trim(line)
        if header then
            in_code_block = not in_code_block
            if in_code_block then
                is_standalone_crate = vim.list_contains(vim.split(header, "[,%s]"), "standalone_crate")
                table.insert(processed, is_standalone_crate and "```rust" or line)
            else
                -- The block may have been opened with ~~~, which no longer matches the rewritten ```.
                table.insert(processed, is_standalone_crate and "```" or line)
                is_standalone_crate = false
            end
        elseif is_standalone_crate and (trimmed == "#" or trimmed:match("^#[ \t]")) then
            -- Hidden by rustdoc.
        elseif is_standalone_crate and trimmed:match("^##") then
            -- Escaped `#`, rustdoc shows it as a single one.
            table.insert(processed, (line:gsub("#", "", 1)))
        else
            table.insert(processed, line)
        end
    end

    -- Callers can pass in a table that gets appended to, so it has to be edited in place.
    for i = 1, math.max(#lines, #processed) do
        lines[i] = processed[i]
    end
    return lines
end
