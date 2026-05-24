local keymap = vim.keymap.set
local nor_s = { remap = false, silent = true}

keymap('n', '<Leader>w', "<cmd>w<CR>", nor_s)
vim.keymap.set('n', '<leader>q', function()
  -- 1つのバッファで開いてる場合は bd
  -- 2つ以上のバッファで開いている場合は close
  -- VS Code の挙動と同じにした
  local current_buf = vim.api.nvim_get_current_buf()
  local win_list = vim.api.nvim_list_wins()
  local usage_count = 0

  -- 現在のバッファがいくつのウィンドウで開かれているかカウント
  for _, win in ipairs(win_list) do
    if vim.api.nvim_win_get_buf(win) == current_buf then
      usage_count = usage_count + 1
    end
  end

  -- 条件分岐して実行
  if usage_count > 1 then
    vim.cmd('close')
  else
    vim.cmd('bdelete')
  end
end, { remap = false, silent = true, desc = 'Close window or delete buffer based on usage' })

-- Split Window
keymap('n', 'ss', '<cmd>split<CR><C-w>w', nor_s)
keymap('n', 'sv', '<cmd>vsplit<CR><C-w>w', nor_s)

-- Move window
keymap('', 'sn', '<C-w>w', nor_s)
keymap('', 'sh', '<C-w>h', nor_s)
keymap('', 'sk', '<C-w>k', nor_s)
keymap('', 'sj', '<C-w>j', nor_s)
keymap('', 'sl', '<C-w>l', nor_s)
