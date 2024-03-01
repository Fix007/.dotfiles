local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local  null_ls = require('null-ls')

-- local cspell = require("cspell")
-- local cspell_config = {}


local opts = {
  sources = {
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.ruff,
    -- null_ls.builtins.diagnostics.mypy,
    -- null_ls.builtins.diagnostics.flake8,
    -- cspell.diagnostics.with({config=cspell_config}),
    -- cspell.code_actions.with({config=cspell_config}),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- vim.lsp.buf.formatting_sync()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}


return opts

