local utils = require("configs.utils")

local options = {
    formatters_by_ft = {
        beancount = { "bean-format" },
        lua = { "stylua" },
        markdown = { "mdformat" },
        nix = { "nixfmt" },
        sh = { "shfmt", "shellharden", "shellcheck" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

if not utils.at_google() then
    options.formatters_by_ft.go = { "goimports", "gofumpt", "golines" }
    options.formatters_by_ft.python = { "black" }
end

return options
