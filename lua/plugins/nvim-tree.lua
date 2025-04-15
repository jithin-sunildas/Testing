return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30, -- Set the width of the file tree
      },
      filters = {
        dotfiles = false, -- Show hidden files
      },
      git = {
        enable = true, -- Show git status
      },
      sync_root_with_cwd = true, -- Sync nvim-tree with the current directory
      respect_buf_cwd = true, -- Respect the buffer's current directory
      update_cwd = true, -- Change tree's root directory to match cwd
    })
  end,
}
