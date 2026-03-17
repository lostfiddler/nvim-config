return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        -- Ensure these are installed
        ensure_installed = { "tsx", "typescript", "html", "javascript" },
        highlight = { enable = true },
      })
    end,
  },
}
