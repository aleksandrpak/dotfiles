-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local env_theme = os.getenv("NVIM_THEME")
local theme = env_theme or "chadracula"

---@type ChadrcConfig
local M = {
    base46 = {
        theme = theme,
    },
    mason = {
        pkgs = {
            "bash-language-server",
            "debugpy",
        },
        skip = {
            "beancount-language-server",
            "nil",
            "lua-language-server",
            "stylua",
            "shellcheck",
            "shellharden",
            "shfmt",
            "delve",
            "gotools",
            "gopls",
            "gofumpt",
            "goimports",
            "golines",
            "black",
            "pyright",
            "mdformat",
            "markdownlint-cli",
            "rust-analyzer",
        },
    },
}

return M
