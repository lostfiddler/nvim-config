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
      { '<leader>to', '<cmd>Telescope vim_options<cr>', desc = 'List vim options'},
      { '<leader>ts', '<cmd>Telescope spell_suggestions<cr>', desc = 'Spell suggestions'},
      { '<leader>tm', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'List symbols'},
      { '<leader>td', '<cmd>Telescope diagnostics<cr>', desc = 'Lsp Diagnostics'}
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
              ['<c-y>'] = function(prompt_bufnr)
                  local selection = require('telescope.actions.state').get_selected_entry()
                  local content = selection.message or selection.text or selection.value

                  if type(content) ~= "string" then
                    content = tostring(content)
                  end

                  vim.fn.setreg('+', content)

                  actions.close(prompt_bufnr)

                  vim.schedule(function()
                      vim.notify("Copied: " .. content, vim.log.levels.INFO)
                  end)
              end,
            },
          },
        },
      })
    end,
  },
}
