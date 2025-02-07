local M = {
  "chrisgrieser/nvim-various-textobjs",
  lazy = false,
}

function M.config()
  require("various-textobjs").setup()

  vim.keymap.set({ "o", "x" }, "aw", '<cmd>lua require("various-textobjs").subword("outer")<CR>')
  vim.keymap.set({ "o", "x" }, "iw", '<cmd>lua require("various-textobjs").subword("inner")<CR>')
end

return M
