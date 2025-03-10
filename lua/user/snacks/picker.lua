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
        Snacks.picker.files { layout = "select" }
      end,
      desc = "Find File",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep { layout = "telescope" }
      end,
      desc = "Grep Word",
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Search Visual Selection or Word",
      mode = { "v", "x" },
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Projects",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
  },
}

return M
