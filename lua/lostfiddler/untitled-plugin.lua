vim.api.nvim_create_user_command('Test', 'echo "Hello!"', {})
vim.keymap.set('n', '<Leader>e', ':Test<cr>')
