-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"

local capabilities = require("mini.completion").completefunc_lsp()
local util = require "lspconfig.util"
local mason_registry = require "mason-registry"
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
  .. "/node_modules/@vue/language-server"

local servers = {
  "html",
  "cssls",
  "ruff",
  "ruff_lsp",
}
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
lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
  root_dir = lspconfig.util.root_pattern "pyproject.toml",
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
}

lspconfig.html.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "html", "mjml" },
}

lspconfig.jsonls.setup {}

lspconfig.volar.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- js, ts
lspconfig.ts_ls.setup {
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
}
-- vue
local function get_vue_version()
  local root_dir = util.find_git_ancestor(vim.fn.getcwd()) or vim.fn.getcwd()
  local package_json = root_dir .. "/package.json"

  if vim.fn.filereadable(package_json) == 1 then
    local package_data = vim.fn.json_decode(vim.fn.readfile(package_json))
    local vue_version = package_data["dependencies"] and package_data["dependencies"]["vue"]
      or package_data["devDependencies"] and package_data["devDependencies"]["vue"]

    if vue_version then
      -- Strip any non-numeric characters like ^ or ~ from the version string
      local cleaned_version = vim.fn.matchstr(vue_version, [[\v\d+]])
      local version = tonumber(cleaned_version)
      return version
    end
  end
  return nil
end

local vue_version = get_vue_version()

if vue_version == 3 then
  -- use volar for vue 3
  lspconfig.volar.setup {
    capabilities = capabilities,
  }
else
  -- use vetur (vuels) for vue 2
  lspconfig.vuels.setup {
    capabilities = capabilities,
    filetypes = { "vue" },
    root_dir = lspconfig.util.root_pattern("package.json", ".git"),
  }
end
