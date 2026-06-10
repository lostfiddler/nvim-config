return {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    dependencies = {
        "saghen/blink.cmp",
    },
    opts = function()
        -- Fetch capabilities natively from your completion manager
        local capabilities =
            require("blink.cmp").get_lsp_capabilities()

        return {
            -- Points directly to the Microsoft Roslyn compiler wrapper managed by Mason
            exe = vim.fn.stdpath("data")
                .. "/mason/bin/microsoft-codeanalysis-languageserver.cmd",

            args = {
                "--logLevel=Information",
                "--extensionLogDirectory="
                    .. vim.fs.dirname(
                        vim.lsp.get_log_path()
                    ),
            },

            config = {
                capabilities = capabilities,
                settings = {
                    ["csharp|backgroundAnalysis"] = {
                        dotnetCompilerDiagnosticsScope = "full",
                        dotnetAnalyzerDiagnosticsScope = "full",
                    },
                    -- CRITICAL STEP FOR UNITY: Forces the server to build virtual
                    -- source views out of compiled closed engine DLLs
                    ["csharp|metadataAsSource"] = {
                        dotnetNavigateToDecompiledSources = true,
                    },
                },
            },

            -- Unity-specific solution filter strategy
            choose_sln = function(sln)
                for _, path in ipairs(sln) do
                    if
                        path:match("Assembly%-CSharp%.sln")
                    then
                        return path
                    end
                end
                return sln[1]
            end,
        }
    end,
}
