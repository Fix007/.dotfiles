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
    "bicep-lsp",
    "black",
    "codespell",
    "debugpy",
    "djlint",
    "flake8",
    "isort",
    "jq",
    "jq-lsp",
    "markdownlint-cli2",
    "marksman",
    "mypy",
    "prettierd",
    "pyright",
    "ruff",
    "ruff-lsp",
    "typescript-language-server",
    "vetur-vls",
    "vue-language-server",
    "yaml-language-server",
    "yamlfmt",
    "yq",
  },
}

vim.diagnostic.config {
  virtual_lines = {
    current_line = true,
  },
}

return M
