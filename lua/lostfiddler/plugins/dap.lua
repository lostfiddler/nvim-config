return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",

        -- UI
        "igorlfs/nvim-dap-view"
    },
    config = function()
        local dap = require("dap");
        local mason_dap = require("mason-nvim-dap");
        local dap_view = require("dap-view");

        mason_dap.setup({
            ensure_installed = { "js" },
            automatic_installation = true,
            handlers = {},
        })


        local js_debug_path = vim.fs.joinpath(
            vim.fn.stdpath("data"),
            "mason",
            "packages",
            "js-debug-adapter",
            "js-debug",
            "src",
            "dapDebugServer.js"
        )
        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                args = { js_debug_path, "${port}" },
            }
        }

        dap.configurations.javascript = {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
                console = "integratedTerminal"
            },
        }

        -- Automatically mirror JS config for TypeScript
        dap.configurations.typescript = dap.configurations.javascript

        -- UI configuration https://igorlfs.github.io/nvim-dap-view/home
        dap_view.setup({
            auto_toggle = true,
            virtual_text = {
                enabled = false
            },
            winbar = {
                controls = {
                    enabled = true
                }
            },
            windows = {
                position = "above",
                terminal = {
                    hide = true
                }
            },
            hover = {
                border = "rounded"
            },
        })

        local dap_signs = {
            DapBreakpoint = {
                text = "🔴",
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = ""
            },
            DapBreakpointCondition = {
                text = "🔍",
                texthl =
                "DiagnosticSignWarn",
                linehl = "",
                numhl = ""
            },
            DapLogPoint = {
                text = "📝",
                texthl = "DiagnosticSignInfo",
                linehl = "",
                numhl = ""
            },
            DapStopped = {
                text = "▶️",
                texthl = "DiagnosticSignHint",
                linehl = "Visual",
                numhl = "DiagnosticSignHint"
            },
            DapBreakpointRejected = {
                text = "🚫",
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = ""
            },
        }

        for sign_name, sign_desc in pairs(dap_signs) do
            vim.fn.sign_define(sign_name, sign_desc)
        end

        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
        vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
        vim.keymap.set(
            "n",
            "<leader>du",
            function() dap_view.toggle() end,
            { desc = "Toggle DAP UI Manually" }
        )
        vim.keymap.set("n", "<leader>dh", function()
            local widgets = require("dap.ui.widgets")
            widgets.hover(vim.fn.expand("<cexpr>"), {
                border = "rounded",
            })
        end, {desc = "Dap View Hover"})
    end
}

