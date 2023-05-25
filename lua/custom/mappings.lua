local M = {}


M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require("crates").upgrade_all_crates()
      end,
      "updates crates"
    },
    ["<leader>rct"] = {
      function (_,opts)
        require("crates").toggle(opts)
      end,
      "Toggle Crates"
    },
    ["<leader>rcr"]= {
      function (_,opts)
        require("crates").reload(opts)
      end,
      "Reload Crates"
    }
  }
}

return M
