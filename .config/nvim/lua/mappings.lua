require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>tt", "<cmd>Trouble mydiag_errors <cr>", {desc = "Open Trouble in error mode"})


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
local M = {}

M.dap = {
  -- plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  -- plugin = true,
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

for name, maps in pairs(M) do
  for mode, data in pairs(maps) do
    for key, val in pairs(data) do
      map(mode, key, val[1], { desc=val[2]})
    end
  end
end
