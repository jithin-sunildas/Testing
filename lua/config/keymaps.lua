-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Toggle Nvim Tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
--vim.keymap.set("n", "<leader>e", toggle_nvim_tree_focus, { desc = "Toggle NvimTree Focus" })

-- Toggle Terminal
vim.keymap.set("n", "<C-\\>", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
-- Open Terminal in Horizontal Split
vim.keymap.set("n", "<leader>th", function()
  require("toggleterm").toggle(1, nil, nil, "horizontal")
end, { desc = "Terminal (Horizontal)" })
-- Open Terminal in Vertical Split
vim.keymap.set("n", "<leader>tv", function()
  require("toggleterm").toggle(1, nil, nil, "vertical")
end, { desc = "Terminal (Vertical)" })
-- Open Floating Terminal
vim.keymap.set("n", "<leader>tf", function()
  require("toggleterm").toggle(1, nil, nil, "float")
end, { desc = "Terminal (Floating)" })

-- Custom behavior for DOWN arrow key in both Normal and Insert mode
vim.keymap.set("n", "<Down>", function()
  if vim.fn.line(".") == vim.fn.line("$") then
    -- If on the last line, move to the end of the last word
    vim.cmd("normal! $")
  else
    -- Otherwise, move down
    vim.cmd("normal! j")
  end
end, { desc = "Move down, go to the end of last word if last line" })
vim.keymap.set("i", "<Down>", function()
  if vim.fn.line(".") == vim.fn.line("$") then
    -- If on the last line, move to the end of the last word
    vim.cmd("normal! $")
  else
    -- Otherwise, move down in insert mode
    vim.cmd("normal! j")
  end
end, { desc = "Move down, go to the end of last word if last line in insert mode" })

-- Custom behavior for UP arrow key in both Normal and Insert mode
vim.keymap.set("n", "<Up>", function()
  if vim.fn.line(".") == 1 then
    -- If on the first line, move to the beginning of the first word
    vim.cmd("normal! 0")
  else
    -- Otherwise, move up
    vim.cmd("normal! k")
  end
end, { desc = "Move up, go to the beginning of first word if first line" })
vim.keymap.set("i", "<Up>", function()
  if vim.fn.line(".") == 1 then
    -- If on the first line, move to the beginning of the first word
    vim.cmd("normal! 0")
  else
    -- Otherwise, move up in insert mode
    vim.cmd("normal! k")
  end
end, { desc = "Move up, go to the beginning of first word if first line in insert mode" })

-- Word navigation
vim.keymap.set("n", "<C-Right>", function()
  -- Move to the next word in Normal mode
  vim.cmd("normal! w")
end, { desc = "Move to the next word with Ctrl+Right in Normal mode" })
vim.keymap.set("i", "<C-Right>", function()
  -- Move to the next word in Insert mode
  vim.cmd("normal! w")
end, { desc = "Move to the next word with Ctrl+Right in Insert mode" })
vim.keymap.set("n", "<C-Left>", function()
  -- Move to the previous word in Normal mode
  vim.cmd("normal! b")
end, { desc = "Move to the previous word with Ctrl+Left in Normal mode" })
vim.keymap.set("i", "<C-Left>", function()
  -- Move to the previous word in Insert mode
  vim.cmd("normal! b")
end, { desc = "Move to the previous word with Ctrl+Left in Insert mode" })
-- Custom behavior for Ctrl+h and Ctrl+l in Normal mode
vim.keymap.set("n", "<C-h>", function()
  -- Move cursor left one character
  vim.cmd("normal! h")
end, { desc = "Move left with Ctrl+h in Normal mode" })
vim.keymap.set("n", "<C-l>", function()
  -- Move cursor right one character
  vim.cmd("normal! l")
end, { desc = "Move right with Ctrl+l in Normal mode" })

-- Continuity
--vim.keymap.set("n", "<Right>", function()
-- Check if we're at the end of the line
--if vim.fn.col(".") == vim.fn.col("$") then
-- If at the end of the line, move to the first character of the next line
--vim.cmd("normal! j0")
--else
-- Otherwise, move right
--vim.cmd("normal! l")
--end
--end, { desc = "Move right and go to next line if at the end" })
vim.keymap.set("n", "<Right>", function()
  -- Check if we're at the end of the line
  if vim.fn.col(".") == vim.fn.col("$") then
    -- If at the end of the line, move to the first character of the next line
    vim.cmd("normal! j0")
  else
    -- Otherwise, move right
    vim.cmd("normal! l")
  end
end, { desc = "Move right and go to next line if at the end in insert mode" })
vim.keymap.set("n", "<Left>", function()
  -- Check if we're at the beginning of the line
  if vim.fn.col(".") == 1 then
    -- If at the beginning, move to the last character of the previous line
    vim.cmd("normal! k$")
    vim.cmd("normal! l")
  else
    -- Otherwise, move left
    vim.cmd("normal! h")
  end
end, { desc = "Move left and go to previous line if at the beginning" })
vim.keymap.set("i", "<Left>", function()
  -- Check if we're at the beginning of the line
  if vim.fn.col(".") == 1 then
    -- If at the beginning, move to the last character of the previous line
    vim.cmd("normal! k$")
    vim.cmd("normal! l")
  else
    -- Otherwise, move left
    vim.cmd("normal! h")
  end
end, { desc = "Move left and go to previous line if at the beginning in insert mode" })
