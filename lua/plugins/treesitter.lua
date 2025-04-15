return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "php",
      },
      highlight = {
        enable = true,
      },
    },
  },
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },
}
