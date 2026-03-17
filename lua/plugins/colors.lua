return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        opts = {
            flavour = "mocha",
            no_italic = true,
            transparent_background = true,
            integrations = {
                telescope = {
                    enabled = true,
                },
            },
            custom_highlights = function(colors)
                return {
                    TelescopeNormal = {bg = 'none'},
                    TelescopeBorder = {fg = 'black', bg = 'none'},
                    TelescopeResultsTitle = {bg = 'none', fg = 'red'},
                    TelescopePromptTitle = {bg = 'none', fg = 'red'},
                    YaziFloatBorder = {bg = 'none', fg = 'black'},
                }
            end
        },
        config = function (_, opts)
            require('catppuccin').setup(opts)
            vim.cmd.colorscheme 'catppuccin'
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            styles = {
                italic = false,
                transparency = true,
            }
        },
        config = function (_, opts)
            require("rose-pine").setup(opts)
        end
    }
}
-- Use :Telescope colorscheme to change colorscheme 🙂
-- use :Telescope highlights to see hl groups
--
-- vim.api.nvim_set_hl(0, 'DiffAdd', {fg='#1e1e2e', bg='#a6e3a1'})
-- vim.api.nvim_set_hl(0, 'DiffDelete', {fg='#1e1e2e', bg='#f38ba8'})
-- vim.api.nvim_set_hl(0, 'DiffChange', {bg='#1e1e2e'})
-- vim.api.nvim_set_hl(0, 'DiffText', {fg='#f9e2af', bg='#1e1e2e'})
-- --vim.api.nvim_set_hl(0, 'Normal', {bg='none'})
