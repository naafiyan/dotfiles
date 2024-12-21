require('lazy-setup') -- set up lazy
require('options') -- vim.opts and other settings
require('keybinds') -- keybindings (HAVE TO SET LEADER BEFORE PLUGINS)

require('plugins')
require('lsp')
require('diagnostics')
require('user_cmds')

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
