-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "palenight",
  transparency = true,

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.mason = {
  command = true,
  pkgs = {
    "autoflake",
    "bicep-lsp",
    "black",
    "codespell",
    "debugpy",
    "djlint",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "flake8",
    "google-java-format",
    "gopls",
    "gradle-language-server",
    "isort",
    "jdtls",
    "jq",
    "jq-lsp",
    "markdownlint-cli2",
    "marksman",
    "mypy",
    "npm-groovy-lint",
    "prettierd",
    "pyright",
    "ruff",
    "typescript-language-server",
    "vetur-vls",
    "vue-language-server",
    "yaml-language-server",
    "yamlfmt",
    "yq",
  },
}

vim.diagnostic.config {
  virtual_lines = false,
}

return M
