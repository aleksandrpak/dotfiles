local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        go = { "goimports", "gofumpt", "golines" },
        nix = { "nixfmt" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

return options
