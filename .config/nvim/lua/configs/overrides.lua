local M = {}

M.nvimtree = {
  view = {
    adaptive_size = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 1000,
  },
  renderer = {
    highlight_git = true,
    group_empty = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
