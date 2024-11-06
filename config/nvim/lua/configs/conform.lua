local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        go = { "goimports", "gofumpt", "golines" },
        nix = { "nixfmt" },
        sh = { "shfmt", "shellharden", "shellcheck" },
        beancount = { "bean-format" },
        markdown = { "mdformat" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

return options
