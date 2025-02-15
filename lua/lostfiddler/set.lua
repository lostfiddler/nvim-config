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
vim.opt.textwidth = 79

vim.opt.termguicolors = true
vim.opt.guicursor = 'a:blinkwait700-blinkon400-blinkoff250,i:ver10'
vim.opt.signcolumn = 'number'

vim.opt.fillchars = 'eob: '

vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')

vim.filetype.add({
    filename = {[".mybash_config"] = "mybash_config"}
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.mybash_config",  -- Match your custom file extension
  command = "setfiletype bash",   -- Set the filetype to 'bash'
})
