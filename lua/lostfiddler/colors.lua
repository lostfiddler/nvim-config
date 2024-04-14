--require('gruvbox').setup({
--    transparent_mode = true,
--})
require('catppuccin').setup({
    flavour = 'mocha', -- latte, frappe, macchiato, mocha
    transparent_background = true,
})
vim.cmd.colorscheme 'catppuccin'

--vim.api.nvim_set_hl(0, 'Normal', {bg='none'})

--vim.api.nvim_set_hl(0, 'LineNr', {bg = 'none'})
--vim.api.nvim_set_hl(0, "TabLineFill", {cterm=NONE, ctermbg=15})
--vim.api.nvim_set_hl(0, "TabLineSel", {cterm=NONE, ctermfg=15, ctermbg=NONE})

-- Telescope colors
--vim.api.nvim_set_hl(0, "TelescopeNormal", {bg='none'})
--vim.api.nvim_set_hl(0, "TelescopeBorder", {ctermfg=15, ctermbg=NONE})
--vim.api.nvim_set_hl(0, "TelescopeSelection", {bg='none'})
--vim.api.nvim_set_hl(0, "TelescopePromptNormal", {ctermfg=15, ctermbg=NONE})
--vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {ctermfg=15, ctermbg=NONE})
--vim.api.nvim_set_hl(0, "TelescopePromptCounter", {ctermfg=15, ctermbg=NONE})
