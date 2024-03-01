local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  root_dir = lspconfig.util.root_pattern("pyproject.toml"),
  settings = {
    pyright = {
      autoImportCompletion = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        -- exclude = {"**/.venv/", "**/venv/", ".venv", "venv"},
        diagnosticMode = 'workspace',
        useLibraryCodeForTypes = true,
        -- typeCheckingMode = 'off',
        diagnosticSeverityOverrides = {
          -- reportUnusedImport = "none",
          -- reportUnusedClass = "none",
          -- reportUnusedFunction = "none",
          -- reportUnusedVariable = "none",
          reportIncompatibleVariableOverride = "none",
        }
      }
    }
  }
})
