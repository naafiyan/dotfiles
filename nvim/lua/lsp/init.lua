-- See :help lspconfig-global-defaults
local lspconfig = require('lspconfig')

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
  lspconfig.pyright.setup({})
  lspconfig.clangd.setup ( {
	  cmd = {
	    "clangd",
	    "--offset-encoding=utf-16",
	  }
	} )
  lspconfig.gopls.setup{}
  lspconfig.lua_ls.setup{}
end

local on_attach = function(client, bufnr)
	--- toggle inlay hints
	vim.g.inlay_hints_visible = false
	local function toggle_inlay_hints()
		if vim.g.inlay_hints_visible then
			vim.g.inlay_hints_visible = false
			vim.lsp.inlay_hint(bufnr, false)
		else
			if client.server_capabilities.inlayHintProvider then
				vim.g.inlay_hints_visible = true
				vim.lsp.inlay_hint(bufnr, true)
			else
				print("no inlay hints available")
			end
		end
	end
end
