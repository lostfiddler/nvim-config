-- Normal mode remappings --
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>ex', '<cmd>Explore<cr>')
vim.keymap.set('n', '<leader>sc', ':setlocal spell spelllang=en_us<cr>')


-- Insert mode remappings --
-- replaced with a plugin
-- vim.keymap.set('i', "'", "''<left>", {noremap = true})
-- vim.keymap.set('i', '"', '""<left>', {noremap = true})
-- vim.keymap.set('i', '(', '()<left>', {noremap = true})
-- vim.keymap.set('i', '[', '[]<left>', {noremap = true})
-- vim.keymap.set('i', '{', '{}<left>', {noremap = true})
-- 
-- vim.api.nvim_set_keymap('i', ')', [[strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"]], {expr = true, noremap = true})
-- vim.api.nvim_set_keymap('i', ']', [[strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"]], {expr = true, noremap = true})
-- vim.api.nvim_set_keymap('i', '}', [[strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"]], {expr = true, noremap = true})
