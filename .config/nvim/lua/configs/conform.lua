local options = {
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    --
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    json = { { "jq", "prettierd" } },
    -- mjml = { { "prettierd", "prettier" } },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
