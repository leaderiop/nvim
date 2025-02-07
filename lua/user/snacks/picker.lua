local M = {
  "folke/snacks.nvim",
  opts = {
    picker = {
      layout = {
        preset = "telescope",
        cycle = false,
      },
    },
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("snacks").picker.files { layout = "select" }
      end,
      desc = "Find File",
    },
    {
      "<leader>fw",
      function()
        require("snacks").picker.grep { layout = "telescope" }
      end,
      desc = "Grep Word",
    },
    {
      "<leader>fs",
      function()
        require("snacks").picker.grep_word()
      end,
      desc = "Search Visual Selection or Word",
      mode = { "v", "x" },
    },
  },
}

return M
