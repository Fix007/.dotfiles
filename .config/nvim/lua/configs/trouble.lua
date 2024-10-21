local options = {
  severity = vim.diagnostic.severity.ERROR,
  warn_no_results = false, -- show a warning when there are no results
  open_no_results = true, -- open the trouble window when there are no results
  win = {
    type = "split", -- split window
    relative = "win", -- relative to current window
    position = "right", -- right side
    size = 0.5, -- 30% of the window
  },
  modes = {
    mydiag_errors = {
      mode = "diagnostics",
      filter = {
        any = {
          buf = 0, -- current buffer
          {
            severity = vim.diagnostic.severity.ERROR, -- errors only
            -- limit to files in the current project
            function(item)
              return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
            end,
          },
        },
      },
    },

    mydiag_all = {
      mode = "diagnostics",
      filter = {
        any = {
          buf = 0, -- current buffer
          {
            severity = { min = vim.diagnostic.severity.INFO },
            -- limit to files in the current project
            function(item)
              return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
            end,
          },
        },
      },
    },
  },
}

return options
