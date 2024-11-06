return {
    { "nvim-neotest/nvim-nio" },
    { "mfussenegger/nvim-dap" },
    { "jay-babu/mason-nvim-dap.nvim" },
    { "sindrets/diffview.nvim" },
    {
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
    },
    {
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
    },
    {
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
    },
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
