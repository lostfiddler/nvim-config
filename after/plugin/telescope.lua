local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"node_modules", ".git"},
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
                ['<c-k>'] = actions.move_selection_previous,
                ['<c-j>'] = actions.move_selection_next
            }
        },
        initial_mode = 'insert'
    }
}
