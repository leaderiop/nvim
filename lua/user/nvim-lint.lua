return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require "lint"
    local wk = require "which-key"

    lint.linters_by_ft = {
      -- Remove ESLint from nvim-lint since we're using the ESLint LSP server
      javascript = { "eslint", "eslint_d" },
      typescript = { "eslint", "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      python = { "flake8" },
    }
    local lintgroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lintgroup,
      callback = function()
        local get_clients = vim.lsp.get_clients
        local client = get_clients({ bufnr = 0 })[1] or {}
        lint.try_lint(nil, { cwd = client.root_dir })
      end,
    })
    wk.add {
      {
        "<leader>ll",
        function()
          local get_clients = vim.lsp.get_clients
          local client = get_clients({ bufnr = 0 })[1] or {}
          lint.try_lint(nil, { cwd = client.root_dir })
        end,
        desc = "Lint",
      },
    }
    vim.keymap.set("n", "<leader>ll", function()
      local get_clients = vim.lsp.get_clients
      local client = get_clients({ bufnr = 0 })[1] or {}
      lint.try_lint(nil, { cwd = client.root_dir })
    end, { desc = "trigger linting for current file" })
  end,
}
