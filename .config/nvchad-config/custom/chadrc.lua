---@type ChadrcConfig 
 local M = {}
 M.ui = {theme = 'bearded-arc'}
 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"

vim.diagnostic.config(
  {
    virtual_lines = {
      only_current_line = true
    }
  }
)

 return M
