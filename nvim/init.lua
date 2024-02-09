require('lazy-setup') -- set up lazy
require('options') -- vim.opts and other settings
require('plugins')
require('keybinds') -- keybindings
require('lsp')
require('diagnostics')
require('user_cmds')

require('mason').setup()
require('mason-lspconfig').setup()
local servers = {
  clangd = {
    cmd = {
      "clangd",
      "--function-arg-placeholders=0"
    }
  },
  gopls = {},
  pyright = {},
  tsserver = {},
  html = { filetypes = { 'html'} },
  texlab = {},
  lua_ls = {}
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}
