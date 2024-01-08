local bufnr = vim.api.nvim_get_current_buf()
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ timeout_ms = 200 })
  end,
  group = format_sync_grp,
})

vim.g.rustaceanvim = {
	server = {
		on_attach {
			vim.g.inlay_hints_visible = true
		vim.lsp.inlay_hint(bufnr, true)
	}
}
}
