-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"

-- local capabilities = require("mini.completion").completefunc_lsp()
local vue_language_server_path = vim.fn.exepath "vue-language-server" .. "/node_modules/@vue/language-server"

local servers = {
  "bicep",
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  "gopls",
  "gradle_ls",
  "html",
  "jsonls",
  "kotlin_lsp",
  "marksman",
  "pyright",
  "ruff",
  "ts_ls",
  "yamlls",
}

vim.lsp.config("pyright", {
  settings = {
    pyright = {
      autoImportCompletion = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        -- exclude = {"**/.venv/", "**/venv/", ".venv", "venv"},
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        -- typeCheckingMode = 'off',
        diagnosticSeverityOverrides = {
          -- reportUnusedImport = "none",
          -- reportUnusedClass = "none",
          -- reportUnusedFunction = "none",
          -- reportUnusedVariable = "none",
          reportIncompatibleVariableOverride = "none",
        },
      },
    },
  },
})

vim.lsp.config("html", {
  filetypes = { "html", "mjml" },
})

vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

local bicep_language_server_path = "/usr/local/bin/bicep-langserver/Bicep.LangServer.dll"

vim.lsp.config("bicep", {
  cmd = { "dotnet", bicep_language_server_path },
})

vim.cmd [[ autocmd BufNewFile,BufRead *.bicep set filetype=bicep ]]

vim.lsp.config("yamlls", {
  yaml = {
    schemas = {
      ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      ["https://raw.githubusercontent.com/compose-spec/compose-spec/main/schema/compose-spec.json"] = {
        "/docker-compose*.yml",
      },
    },
    customTags = {
      "!reference sequence",
    },
  },
})

vim.lsp.enable(servers)
