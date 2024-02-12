local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.nvim_test = {
  -- plugin = true,
  n = {
    ["<leader>tn"] = {
      function()
        require("nvim-test").run('nearest')
      end,
      "Test nearest method"
    },
    ["<leader>tl"] = {
      function()
        require("nvim-test").run_last()
      end,
      "Test last method"
    }
  }
}


M.telescope = {
  n = {
    ["<leader>fq"] = {
      function()
        require("telescope.builtin").resume({
          noremap = true,
          silent = true,
          desc = "Resume",
        })
      end,
      "Resume Live Grep"
    }
  }
}


return M

