--require('gruvbox').setup({
--    transparent_mode = true,
--})
require('catppuccin').setup({
    flavour = 'mocha', -- latte, frappe, macchiato, mocha
    transparent_background = true,
})
vim.cmd.colorscheme 'catppuccin' --kitten

vim.api.nvim_set_hl(0, 'DiffAdd', {fg='#1e1e2e', bg='#a6e3a1'})
vim.api.nvim_set_hl(0, 'DiffDelete', {fg='#1e1e2e', bg='#f38ba8'})
vim.api.nvim_set_hl(0, 'DiffChange', {bg='#1e1e2e'})
vim.api.nvim_set_hl(0, 'DiffText', {fg='#f9e2af', bg='#1e1e2e'})
--vim.api.nvim_set_hl(0, 'Normal', {bg='none'})

--vim.api.nvim_set_hl(0, 'LineNr', {bg = 'none'})
--vim.api.nvim_set_hl(0, "TabLineFill", {cterm=NONE, ctermbg=15})
--vim.api.nvim_set_hl(0, "TabLineSel", {cterm=NONE, ctermfg=15, ctermbg=NONE})

--  colors
vim.api.nvim_set_hl(0, "TelescopeNormal", {bg='none'})
vim.api.nvim_set_hl(0, "TelescopeBorder", {ctermfg=15, ctermbg=NONE})
vim.api.nvim_set_hl(0, "TelescopeSelection", {bg='none'})
vim.api.nvim_set_hl(0, "TelescopePromptNormal", {ctermfg=15, ctermbg=NONE})
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {ctermfg=15, ctermbg=NONE})
vim.api.nvim_set_hl(0, "TelescopePromptCounter", {ctermfg=15, ctermbg=NONE})
