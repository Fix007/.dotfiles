local M = {}

M.nvimtree = {
  view = {
    adaptive_size = true
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}


return M
