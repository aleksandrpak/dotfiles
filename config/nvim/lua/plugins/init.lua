local utils = require("configs.utils")

local plugins = {
    { "nvim-neotest/nvim-nio" },
    { "sindrets/diffview.nvim" },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- for format on save
        opts = require("configs.conform"),
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "beancount",
                "go",
                "lua",
                "markdown",
                "nix",
                "python",
            },
        },
    },
}

if utils.at_google() then
    table.insert(plugins, {
        "nvim-telescope/telescope.nvim",
        -- Add telescope-codesearch as a dependency of telescope.nvim.
        -- This ensures that telescope-codesearch is loaded when telescope.nvim is
        -- loaded. So if you use the `Telescope` ex-command `codesearch` will
        -- immediately appear as one of the available pickers.
        dependencies = {
            {
                "vintharas/telescope-codesearch.nvim",
                url = "sso://user/vintharas/telescope-codesearch.nvim",
                keys = {
                    {
                        "<leader>fc",
                        "<cmd>Telescope codesearch find_files<cr>",
                        desc = "Find codesearch files",
                    },
                    {
                        "<leader>fq",
                        "<cmd>Telescope codesearch find_query<cr>",
                        desc = "Find codesearch query",
                    },
                },
                config = function()
                    local telescope = require("telescope")
                    telescope.setup({
                        defaults = {
                            -- Common paths in google3 repos are collapsed following the example of Cider
                            -- It is nice to keep this as a user config rather than part of
                            -- telescope-codesearch because it can be reused by other telescope pickers.
                            path_display = function(opts, path)
                                -- Do common substitutions
                                path = path:gsub("^/google/src/cloud/[^/]+/[^/]+/google3/", "google3/", 1)
                                path = path:gsub("^google3/video/youtube/creator/studio/", "g3/v/y/c/s/", 1)
                                path = path:gsub("^google3/video/youtube/creator/", "g3/v/y/c/", 1)
                                path = path:gsub("^google3/video/youtube/", "g3/v/y/", 1)
                                path = path:gsub("^google3/video/", "g3/v/", 1)
                                path = path:gsub("^google3/java/com/google/", "g3/j/c/g/", 1)
                                path = path:gsub("^google3/javatests/com/google/", "g3/jt/c/g/", 1)
                                path = path:gsub("^google3/third_party/", "g3/3rdp/", 1)
                                path = path:gsub("^google3/", "g3/", 1)

                                -- Do truncation. This allows us to combine our custom display formatter
                                -- with the built-in truncation.
                                -- `truncate` handler in transform_path memoizes computed truncation length in opts.__length.
                                -- Here we are manually propagating this value between new_opts and opts.
                                -- We can make this cleaner and more complicated using metatables :)
                                local new_opts = {
                                    path_display = {
                                        truncate = true,
                                    },
                                    __length = opts.__length,
                                }
                                path = require("telescope.utils").transform_path(new_opts, path)
                                opts.__length = new_opts.__length
                                return path
                            end,
                        },
                    })

                    -- This asks telescope to load the codesearch extension and makes
                    -- the 'codesearch' picker available through the `Telescope` command.
                    telescope.load_extension("codesearch")
                end,
            },
        },
    })
else
    table.insert(plugins, { "mfussenegger/nvim-dap" })
    table.insert(plugins, { "jay-babu/mason-nvim-dap.nvim" })

    table.insert(plugins, {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    })

    table.insert(plugins, {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function(_, opts)
            require("dap-go").setup(opts)
        end,
    })

    table.insert(plugins, {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function(_, opts)
            require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
        end,
    })
end

return plugins