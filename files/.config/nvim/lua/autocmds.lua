-- カーソル下のシンボルハイライト設定
vim.api.nvim_create_augroup('LspDocumentHighlight', { clear = true })
vim.api.nvim_create_autocmd('CursorHold', {
  group = 'LspDocumentHighlight',
  pattern = '*',
  callback = function()
    local client = vim.lsp.get_active_clients()[1]
    if client and client.server_capabilities.documentHighlightProvider then
      vim.lsp.buf.document_highlight()
    end
  end,
})

vim.api.nvim_create_autocmd('CursorMoved', {
  group = 'LspDocumentHighlight',
  pattern = '*',
  callback = vim.lsp.buf.clear_references,
})
vim.opt.updatetime = 500
