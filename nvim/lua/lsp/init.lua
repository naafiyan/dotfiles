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
 --  lspconfig.svelte.setup({
	-- filetypes = {"svelte", "html"}
 --  })

  lspconfig.pyright.setup({})

  -- -- systems language
  -- lspconfig.clangd.setup ( {
  -- cmd = {
  --   "clangd",
  --   "--offset-encoding=utf-16",
  -- },
  -- } )
  -- lspconfig.cmake.setup({
	 --  settings = {
		--   cmd = {"cmake-language-server"},
		--   filetypes = {"cmake", "CMakeLists.txt"}
	 --  }
  -- })
  lspconfig.texlab.setup({})
  
  -- -- swift
  -- lspconfig.sourcekit.setup({})

  -- golang
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
