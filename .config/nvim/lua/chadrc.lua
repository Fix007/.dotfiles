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
    "black",
    "debugpy",
    "djlint",
    "flake8",
    "isort",
    "jq",
    "jq-lsp",
    "mypy",
    "prettierd",
    "pyright",
    "ruff",
    "typescript-language-server",
    "vue-language-server",
  },
}

vim.diagnostic.config {
  virtual_lines = {
    only_current_line = true,
  },
}

return M
