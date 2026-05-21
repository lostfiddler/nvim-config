return {
    'stevearc/aerial.nvim',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function ()
        require("aerial").setup({
            show_guides = true,
            layout = {
                max_width = { 40, 0.2 },
                width = nil,
                min_width = 10,
            },
            backends = { "treesitter" },
        })
    end
}
