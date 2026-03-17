return {
    {
        'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup({})
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        lazy = false,
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    enable_close = true,           -- Auto close tags
                    enable_rename = true,          -- Auto rename pairs of tags
                    enable_close_on_slash = false, -- Auto close on trailing </
                },
                -- This is the key for TSX:
                per_filetype = {
                    ["typescriptreact"] = {
                        enable_close = true,
                    }
                }
            })
        end
    },
}
