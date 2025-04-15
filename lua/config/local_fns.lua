local function toggle_nvim_tree_focus()
  local view = require("nvim-tree.view")
  if view.is_visible() then
    if vim.api.nvim_get_current_win() == view.get_winnr() then
      vim.cmd("wincmd p") -- Switch to the previous window
    else
      vim.cmd("NvimTreeFocus") -- Focus nvim-tree
    end
  else
    vim.cmd("NvimTreeToggle") -- Toggle nvim-tree if not visible
  end
end

