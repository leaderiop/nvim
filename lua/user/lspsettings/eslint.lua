return {
  settings = {
    -- Helps ESLint find the eslintrc when it's placed in a subfolder
    workingDirectory = { mode = "location" },
  },
  -- Custom root_dir function to better detect project root
  root_dir = function(filename, bufnr)
    local util = require("lspconfig.util")
    -- Try to find package.json, .eslintrc.js, .eslintrc.json, etc.
    local root = util.root_pattern(
      -- ESLint 9 flat config files
      "eslint.config.js",
      "eslint.config.mjs",
      -- Traditional ESLint config files
      ".eslintrc.js",
      ".eslintrc.cjs",
      ".eslintrc.yaml",
      ".eslintrc.yml",
      ".eslintrc.json",
      ".eslintrc",
      "package.json"
    )(filename, bufnr)
    
    -- Fallback to git root or current directory
    return root or util.find_git_ancestor(filename) or util.path.dirname(filename)
  end,
  -- Run ESLint on save
  -- on_attach = function(client, bufnr)
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     buffer = bufnr,
  --     callback = function()
  --       vim.cmd("EslintFixAll")
  --     end,
  --   })
  -- end,
  -- Specify filetypes ESLint should work with
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
    "svelte",
    "astro",
  },
}
