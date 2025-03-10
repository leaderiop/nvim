return {
  "sekke276/dark_flat.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("dark_flat").setup {
      transparent = true,
      themes = function(colors)
        return {
          Normal = { bg = colors.lmao },
          DiffChange = { fg = colors.white:darken(0.7) },
          ErrorMsg = { fg = colors.purple, standout = true },
          ["@lsp.type.keyword"] = { link = "@keyword" },
        }
      end,
      italics = false,
    }
  end,
}
