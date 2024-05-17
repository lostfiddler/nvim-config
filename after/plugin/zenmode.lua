require('zen-mode').setup({
    on_open = function()
        vim.fn.system('tmux set-option -g status off')
    end,
    on_close = function()
        vim.fn.system('tmux set-option -g status on')
    end
})
