-- See :help lspconfig-global-defaults
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)

if vim.g.lsp_setup_ready == nil then
  vim.g.lsp_setup_ready = true

  -- web stack
  lspconfig.html.setup({})
  lspconfig.cssls.setup({})
  lspconfig.eslint.setup({})
  lspconfig.tsserver.setup({
    settings = {
      completions = {
        completeFunctionCalls = true
      }
    },
  })
  lspconfig.svelte.setup({
	filetypes = {"svelte", "html"}
  })

  lspconfig.pyright.setup({})

  -- systems language
  lspconfig.clangd.setup {}
  lspconfig.texlab.setup({})
end
