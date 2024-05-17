local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"node_modules", ".git"},
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ['<c-d'] = actions.delete_buffer + actions.move_to_top,
            }
        },
        initial_mode = 'normal'
    }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
