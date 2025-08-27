local overrides = require "configs.overrides"

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvchad/ui",
    branch = "v3.0",
    config = function()
      require "nvchad"
    end,
  },
  {
    "nvchad/base46",
    lazy = true,
    branch = "v3.0",
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvchad/volt",
  },
  {
    import = "nvchad.blink.lazyspec",
  },
  {
    "junegunn/fzf.vim",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
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
      require "configs.telescope"
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
    opts = require "configs.trouble",
  },
  {
    "Aasim-A/scrollEOF.nvim",
    event = "LspAttach",
    config = function()
      require("scrollEOF").setup()
    end,
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
        "java",
        "kotlin",
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
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      -- vim.g.mkdp_auto_start = 1
      vim.g.mkdp_auto_close = 0
    end,
    ft = { "markdown" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require "configs.todo-comments",
    lazy = false,
  },
  {
    "justinmk/vim-sneak",
    lazy = false,
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = require "configs.floaterm",
    cmd = "FloatermToggle",
  },
}
