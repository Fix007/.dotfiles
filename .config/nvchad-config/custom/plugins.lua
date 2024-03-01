local overrides = require("custom.configs.overrides")

local plugins = {
  -- override plugin configs
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_existed["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "isort",
        "black",
        "flake8",
        "debugpy",
        "mypy",
        "ruff",
        "pyright@1.1.343",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-lua/plenary.nvim"
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "folke/trouble.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    opts ={
       severity = vim.diagnostic.severity.ERROR,
    }
  },
  {
    "Aasim-A/scrollEOF.nvim",
    event = "LspAttach",
    config = function()
      require("scrollEOF").setup()
    end,
  },
  {
    "klen/nvim-test",
    event = "LspAttach",
    config = function()
      require('nvim-test').setup()
    end
  },
  {
    "andythigpen/nvim-coverage",
    event = "LspAttach",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("coverage").setup()
    end,
  },
  {
    "talha-akram/noctis.nvim",
    event = "LspAttach",
  },
  {
    "kdheepak/lazygit.nvim",
    event = "LspAttach",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
  },
{
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- "vue", "svelte",

        "python",
       -- low level
        "c",
        "zig"
      },
    },
  },
}

return plugins
