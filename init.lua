-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Key Bindings

-- Delete word after the cursor in normal mode
vim.api.nvim_set_keymap("n", "<C-Del>", "dw", { noremap = true, silent = true })
-- Delete word before the cursor in normal mode
vim.api.nvim_set_keymap("n", "<C-BS>", "db", { noremap = true, silent = true })
-- Delete word before the cursor in insert mode
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })
-- Delete word after the cursor in insert mode
vim.api.nvim_set_keymap("i", "<C-Del>", "<C-O>dw", { noremap = true, silent = true })

-- nvim-tree setup (if applicable)
require("nvim-tree").setup({})

-- Function to toggle nvim-tree focus
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

require("nvim-tree").setup({
  sync_root_with_cwd = true, -- Sync nvim-tree with the current directory
  respect_buf_cwd = true, -- Respect the buffer's current directory
  update_cwd = true, -- Change tree's root directory to match cwd
})

require("lazy").setup({
  plugins = {
    {
      "stevearc/oil.nvim",
      tag = "0.1.5",
      opts = {
        extensions_list = { "fzf" },
      },
      dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "stevearc/oil-fzf-native.nvim", build = "make" },
      },
      config = function()
        require("telescope").setup({
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = "smart_case",
            },
          },
        })
        require("telescope").load_extension("fzf")
      end,
    },
  },
})

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- Keybinding for toggling nvim-tree focus
vim.keymap.set(
  "n",
  "<leader>e",
  toggle_nvim_tree_focus,
  { desc = "Toggle NvimTree Focus", noremap = true, silent = true }
)
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
-- vim.o.guicursor = "n-v-i-c:ver25"
