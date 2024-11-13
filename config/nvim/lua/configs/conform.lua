local utils = require("configs.utils")

local options = {
    formatters_by_ft = {
        beancount = { "bean-format" },
        lua = { "stylua" },
        markdown = { "mdformat" },
        nix = { "nixfmt" },
        sh = { "shfmt", "shellharden", "shellcheck" },
        yaml = { "yamlfmt" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

if utils.at_google() then
    options.default_format_opts = {
        lsp_format = "prefer",
    }

    options.formatters_by_ft.borg = { "gclfmt" }
    options.formatters_by_ft.gcl = { "gclfmt" }
    options.formatters_by_ft.patchpanel = { "gclfmt" }
    options.formatters_by_ft.bzl = { "buildifier" }
    options.formatters_by_ft.c = { "clang_format" }
    options.formatters_by_ft.cpp = { "clang_format" }
    options.formatters_by_ft.javascript = { "prettier" }
    options.formatters_by_ft.typescript = { "prettier" }
    options.formatters_by_ft.javascriptreact = { "prettier", lsp_format = "never" }
    options.formatters_by_ft.typescriptreact = { "prettier" }
    options.formatters_by_ft.css = { "prettier" }
    options.formatters_by_ft.scss = { "prettier" }
    options.formatters_by_ft.html = { "prettier" }
    options.formatters_by_ft.json = { "prettier" }
    options.formatters_by_ft.dart = { "tidy_dart", "dartfmt" }
    options.formatters_by_ft.go = { "goimports", "gofmt" }
    options.formatters_by_ft.java = { "google-java-format" }
    options.formatters_by_ft.jslayout = { "jslfmt" }
    options.formatters_by_ft.markdown = { "mdformat" }
    options.formatters_by_ft.ncl = { "nclfmt" }
    options.formatters_by_ft.python = { "pyformat" }
    options.formatters_by_ft.piccolo = { "pyformat" }
    options.formatters_by_ft.soy = { "soyfmt" }
    options.formatters_by_ft.textpb = { "txtpbfmt" }
    options.formatters_by_ft.proto = { "protofmt" }
    options.formatters_by_ft.sql = { "format_sql" }
    options.formatters_by_ft.googlesql = { "format_sql" }
    options.formatters_by_ft.terraform = { "terraform" }

    options.formatters = {
        gclfmt = {
            command = "/google/data/ro/projects/borg/gclfmt",
            args = {},
            stdin = true,
            range_args = function(ctx)
                return { "--incremental", "--lines", ctx.range.start[1], ":", ctx.range["end"][1], "-" }
            end,
        },
        mdformat = {
            command = "/google/bin/releases/corpeng-engdoc/tools/mdformat",
            args = {},
            range_args = function(ctx)
                return { "-", "--lines", ctx.range.start[1], ":", ctx.range["end"][1] }
            end,
            stdin = true,
        },
        nclfmt = {
            command = "/google/src/head/depot/google3/configlang/ncl/release/nclfmt.k8",
            args = { "-" },
            stdin = true,
        },
        jslfmt = {
            command = "/google/data/ro/projects/gws/tools/direct/jslayout_builder",
            args = { "--mode=format", "-" },
            stdin = true,
        },
        txtpbfmt = {
            command = "/google/bin/releases/text-proto-format/public/fmt",
            args = {},
            stdin = true,
        },
        protofmt = {
            command = "/google/bin/releases/client-proto-wg/protofmt/protofmt",
            args = {},
            stdin = true,
        },
        format_sql = {
            command = "/google/data/ro/teams/googlesql-formatter/fmt",
            args = {},
            stdin = true,
        },
        pyformat = {
            command = "pyformat",
            args = { "--assume_filename", "$FILENAME" },
            stdin = true,
            range_args = function(ctx)
                return { "--lines", ctx.range.start[1] .. "-" .. ctx.range["end"][1] }
            end,
        },
        soyfmt = {
            command = "/google/data/rw/teams/frameworks-web-tools/soy/format/live/bin_deploy.jar",
            args = { "--assume_filename", "$FILENAME" },
            stdin = true,
            range_args = function(ctx)
                return { "--lines", ctx.range.start[1] .. "-" .. ctx.range["end"][1] }
            end,
        },
        tidy_dart = {
            command = "/google/data/ro/teams/tidy_dart/tidy_dart",
            args = { "--stdinFilename", "$FILENAME" },
            stdin = true,
        },
        dartfmt = {
            command = "/usr/lib/google-dartlang/bin/dart",
            args = { "format" },
            stdin = true,
        },
        terraform = {
            command = "/google/data/ro/teams/terraform/bin/terraform",
            args = {},
            stdin = true,
        },
        prettier = {
            command = "/google/data/ro/teams/prettier/prettier",
            args = { "--stdin-filepath", "$FILENAME" },
            stdin = true,
        },
    }
else
    options.formatters_by_ft.go = { "goimports", "gofumpt", "golines" }
    options.formatters_by_ft.python = { "black" }
    options.formatters_by_ft.rust = { "rustfmt" }
end

return options
