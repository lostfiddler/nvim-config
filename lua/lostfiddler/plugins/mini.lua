return {
    'nvim-mini/mini.nvim',
    config = function()
        require('mini.pairs').setup({})
        require('mini.cursorword').setup({})
        require('mini.notify').setup({})
        require('mini.indentscope').setup({})
        -- Disable for certain filetypes
        vim.api.nvim_create_autocmd({ "FileType", "TermOpen" }, {
            desc = "Disable indentscope for certain filetypes",
            callback = function()
                local ignore_filetypes = {
                    "aerial",
                    "help",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "terminal",
                }
                if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) or vim.bo.buftype == "terminal" then
                    vim.b.miniindentscope_disable = true
                    pcall(vim.fn['MiniIndentscope.undraw'])
                end
            end,
        })
    end
}
