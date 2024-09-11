local overrides = require "configs.overrides"

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "junegunn/fzf.vim",
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  --
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function()
  --     local dap = require "dap"
  --     local dapui = require "dapui"
  --     dapui.setup()
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated["dapui_config"] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_existed["dapui_config"] = function()
  --       dapui.close()
  --     end
  --   end,
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   -- config = function(_, opts)
  --   --   require("core.utils").load_mappings "dap"
  --   -- end,
  -- },
  -- {
  --   "mfussenegger/nvim-dap-python",
  --   ft = "python",
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --     "rcarriga/nvim-dap-ui",
  --   },
  --   config = function(_, opts)
  --     local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  --     require("dap-python").setup(path)
  --     -- require("core.utils").load_mappings "dap_python"
  --   end,
  -- },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {
      "python",
      "mjml",
      "html",
    },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "junegunn/fzf.vim",
    },
    config = function()
      local telescope = require "telescope"
      telescope.setup {
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
          },
          sorting_strategy = "ascending",
        },
        pickers = {
          live_grep = {
            file_ignore_patterns = { "node_modules", ".git", ".venv" },
            additional_args = function(_)
              return { "--hidden" }
            end,
          },
          find_files = {
            file_ignore_patterns = { "node_modules", ".git", ".venv" },
            hidden = true,
          },
        },
        -- extensions = {
        --   "fzf",
        -- },
      }
      -- telescope.load_extension "fzf"
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "folke/trouble.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      severity = vim.diagnostic.severity.ERROR,
      modes = {
        mydiag_errors = {
          mode = "diagnostics",
          -- preview = {
          --   type = "split",
          --   relative = "win",
          --   position = "right",
          --   size = 0.5,
          -- },
          -- filter = {
          --   any = {
          --     buf = 0, -- current buffer
          --     {
          --       severity = vim.diagnostic.severity.ERROR, -- errors only
          --       -- limit to files in the current project
          --       function(item)
          --         return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
          --       end,
          --     },
          --   },
          -- },
          filter = function(items)
            local severity = vim.diagnostic.severity.HINT
            for _, item in ipairs(items) do
              severity = math.min(severity, item.severity)
            end
            return vim.tbl_filter(function(item)
              return item.severity == severity
            end, items)
          end,
        },
      },
    },
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
      require("nvim-test").setup()
    end,
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
        "zig",
      },
    },
  },
  {
    "amadeus/vim-mjml",
    ft = "mjml",
  },
  {
    "glench/vim-jinja2-syntax",
    ft = {
      "mjml",
      "html",
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
