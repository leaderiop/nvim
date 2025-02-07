return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    local wk = require "which-key"
    conform.setup {
      formatters_by_ft = {
        lua = { "stylua" },
        svelte = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        python = { "isort", "black", stop_after_first = true },
      },
    }

    wk.add {
      {
        "<leader>lf",
        function()
          conform.format {
            lsp_fallback = true,
            async = true,
            timeout_ms = 500,
            stop_after_first = true,
          }
        end,
        desc = "Format",
      },
    }
  end,
}
