vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 4
vim.opt.textwidth = 100

vim.opt.termguicolors = true
vim.opt.guicursor = 'a:blinkwait700-blinkon400-blinkoff250,i:ver10'
vim.opt.signcolumn = 'number'

vim.opt.fillchars = 'eob: '

vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
