-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local lspconfigs = require("lspconfig.configs")
local nvlsp = require("nvchad.configs.lspconfig")
local utils = require("configs.utils")

lspconfig.nil_ls.setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
})

lspconfig.bashls.setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
})

lspconfig.beancount.setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
})

if utils.at_google() then
    lspconfigs.ciderlsp = {
        default_config = {
            cmd = {
                "/google/bin/releases/cider/ciderlsp/ciderlsp",
                "--tooltag=nvim-lsp",
                "--noforward_sync_responses",
            },
            -- From the table at http://go/ciderlsp
            filetypes = {
                "c",
                "cpp",
                "objc",
                "objcpp",
                "java",
                "kotlin",
                "go",
                "python",
                "typescript",
                "typescriptreact",
                "proto",
                "textproto",
                "dart",
                "bzl",
                "cs",
                "googlesql",
                "eml",
                "mlir",
                "dataz",
                "soy",
                "graphql",

                -- CiderLSP does have some support for more filetypes that are
                -- not listed in the table above.
                "javascript",
                "javascriptreact",
                "css",
                "scss",
                "html",
                "json",
                "jslayout",
                "gcl",
                "borg",
                "markdown",
                "piccolo",
                "ncl",
                "conf",
            },
            root_dir = lspconfig.util.root_pattern(".citc"),
            settings = {},
        },
    }

    lspconfig.ciderlsp.setup({
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
        on_attach = function(client, bufnr)
            -- TODO(b/324369022): Diagnostics don't show up when first openinga
            -- a file. The below is done to remedy this, a `textDocument/didChange`
            -- call is made that gets updated diagnostics.
            -- Remove when this bug is fixed.
            client.request("textDocument/didChange", {
                textDocument = { uri = vim.uri_from_bufnr(bufnr), version = 2 },
            }, function() end)

            nvlsp.on_attach()
        end,
    })

    lspconfigs.analysislsp = {
        default_config = {
            cmd = { "/google/bin/users/lerm/glint-ale/analysis_lsp/server", "--lint_on_save=false", "--max_qps=10" },
            filetypes = { "c", "cpp", "java", "kotlin", "objc", "proto", "textproto", "go", "python", "bzl" },
            -- root_dir = lspconfig.util.root_pattern('BUILD'),
            root_dir = function(fname)
                return string.match(fname, "(/google/src/cloud/[%w_-]+/[%w_-]+/).+$")
            end,
            settings = {},
        },
    }

    lspconfig.analysislsp.setup({
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    })
else
    lspconfig.pyright.setup({
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    })

    lspconfig.rust_analyzer.setup({
        on_attach = nvlsp.on_attach,
        capabilities = nvlsp.capabilities,
    })

    lspconfig.gopls.setup({
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                    unusedparams = true,
                },
            },
        },
    })
end
