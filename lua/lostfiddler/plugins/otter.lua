return {
    "jmbuhr/otter.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "neovim/nvim-lspconfig",
    },
    opts = {
        lsp = {
            diagnostic_update_events = {
                "TextChanged",
                "TextChangedI",
            },
        },
    },
}
