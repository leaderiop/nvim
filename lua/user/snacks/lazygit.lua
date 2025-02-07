local M = {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    lazygit = {
      -- your lazygit configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  keys = {
    {
      "<leader>gg",
      function()
        require("snacks").lazygit { layout = "vscode" }
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gl",
      function()
        require("snacks").lazygit.log()
      end,
      desc = "Lazygit Logs",
    },
  },
}

return M
