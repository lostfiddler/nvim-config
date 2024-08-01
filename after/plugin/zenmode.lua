require('zen-mode').setup({
    window = {
        width = 90
    },
    on_open = function()
        vim.fn.system('tmux set-option -g status off')
    end,
    on_close = function()
        vim.fn.system('tmux set-option -g status on')
    end
})
