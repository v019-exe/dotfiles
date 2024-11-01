-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
lspconfig.pyright.setup{}
lspconfig.bashls.setup{}
lspconfig.eslint.setup{}
lspconfig.jsonls.setup{}
lspconfig.powershell_es.setup{}
lspconfig.phpactor.setup{}
lspconfig.sqlls.setup{}
lspconfig.sqls.setup{}

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "pyright", "eslint", "bashls", "jsonls", "powershell_es", "phpactor", "sqlls", "sqls" }
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
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
