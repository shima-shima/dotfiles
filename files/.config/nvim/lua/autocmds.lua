-- LSP 有効時にカーソル下のシンボルハイライト設定
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

-- インサートモードを抜けた（InsertLeave）タイミングで IME をオフにする
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    -- OSに応じたデフォルトの英字入力を指定（Mac: com.apple.keylayout.ABC, Windows: 1033 など）
    -- ここでは例として Mac の標準英字レイアウトを指定
    vim.fn.system({ "im-select", "com.apple.keylayout.ABC" })
  end,
})
