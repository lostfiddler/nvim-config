return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- Lazy-load on these keybindings
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      vim.api.nvim_set_hl(0, 'TelescopeTitle', {fg = 'violet', bg = 'blue'})

      telescope.setup({
        defaults = {
          initial_mode = 'insert',
          file_ignore_patterns = { "node_modules", ".git" },
          mappings = {
            i = {
              ['<esc>'] = actions.close,
              -- Your custom buffer deletion mapping
              ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
              ['<c-k>'] = actions.move_selection_previous,
              ['<c-j>'] = actions.move_selection_next,
            },
          },
        },
      })
    end,
  },
}
