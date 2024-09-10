-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
--
lspconfig.pyright.setup({
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
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

lspconfig.html.setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    filetypes = {"html", "mjml"},
})

lspconfig.jsonls.setup({})
