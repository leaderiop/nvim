local M = {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true,
    },
    picker = {
      sources = {
        explorer = {
          files = {
            hidden = true,
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("snacks").explorer {}
      end,
      desc = "Explorer Snacks (root dir)",
    },
  },
}

return M
