-- Normal mode remappings --
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>ex', '<cmd>Explore<cr>')
vim.keymap.set('n', '<leader>sc', ':setlocal spell spelllang=en_us<cr>')
vim.keymap.set('n', '<s-cr>', 'o<esc>')
vim.keymap.set('n', 'th', '<cmd>tabprev<cr>')
vim.keymap.set('n', 'tl', '<cmd>tabnext<cr>')
vim.keymap.set('n', 'tn', '<cmd>tabnew<cr>')
vim.keymap.set('n', '<c-j>', '<cmd>m .+1<cr>')
vim.keymap.set('n', '<c-k>', '<cmd>m .-2<cr>')
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<cr>:pwd<cr>') -- change directory to that of current file
