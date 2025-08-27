local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = {
      -- "autoflake",
      "isort",
      "black",
    },
    javascript = {
      -- "prettierd",
      "prettier",
      stop_after_first = true,
    },
    typescript = {
      -- "prettierd",
      "prettier",
      stop_after_first = true,
    },
    vue = {
      -- "prettierd",
      "prettier",
      stop_after_first = true,
    },
    json = {
      "jq",
      "prettierd",
      stop_after_first = true,
    },
    mjml = {
      "prettierd",
      "prettier",
      stop_after_first = true,
    },
    yaml = { "yamlfmt" },
    -- bicep = { "bicep" },
    -- markdown = { "markdownlint-cli2" },
    groovy = { "npm-groovy-lint" },
    java = { "google-java-format" },
    kotlin = { "ktlint" },

    ["*"] = { "codespell" },
    ["_"] = { "trim_whitespace" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 5000,
    lsp_fallback = true,
  },
}

return options
