return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20, -- Height of terminal window (or width if horizontal)
      open_mapping = [[<C-\>]], -- Keybinding to toggle the terminal
      hide_numbers = true, -- Hide line numbers
      shade_filetypes = {},
      shade_terminals = true, -- Apply a background shade to the terminal
      shading_factor = 2, -- Degree of shading
      start_in_insert = true, -- Start in insert mode
      persist_size = true,
      direction = "float", -- Other options: "horizontal", "vertical", "tab"
      close_on_exit = true, -- Close terminal when the process exits
      shell = vim.o.shell, -- Default shell
      float_opts = {
        border = "curved", -- Border style: "single", "double", "shadow", etc.
        winblend = 10,
      },
    })
  end,
}
