return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- Lazy-load on these keybindings
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
      { '<leader>to', '<cmd>Telescope vim_options<cr>', desc = 'List vim options'},
      { '<leader>ts', '<cmd>Telescope spell_suggestions<cr>', desc = 'Spell suggestions'},
      { '<leader>tm', '<cmd>Telescope aerial<cr>', desc = 'List symbols'},
      { '<leader>td', '<cmd>Telescope diagnostics<cr>', desc = 'Lsp Diagnostics'}
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

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
          extensions = {
              aerial = {
                  -- Set the width of the first two columns (the second
                  -- is relevant only when show_columns is set to 'both')
                  col1_width = 4,
                  col2_width = 30,
                  -- How to format the symbols
                  format_symbol = function(symbol_path, filetype)
                      if filetype == "json" or filetype == "yaml" then
                          return table.concat(symbol_path, ".")
                      else
                          -- This joins the Class and Method with a " > " 
                          return table.concat(symbol_path, " > ")
                      end
                  end,
                  -- Available modes: symbols, lines, both
                  show_columns = "both",
                  show_nesting = {
                      ["_"] = true,
                  }
              }
          },
      })
      telescope.load_extension('aerial')
  end,
  },
}
