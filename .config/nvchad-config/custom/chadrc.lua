---@type ChadrcConfig 
 local M = {}
 M.ui = {
  theme = 'palenight',
  transparency = true,
}
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
