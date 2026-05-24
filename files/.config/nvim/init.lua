require("config.lazy")

vim.opt.relativenumber = true

-- Split Window
vim.keymap.set('n', 'ss', ':split<CR><C-w>w', { remap = false, silent = true })
vim.keymap.set('n', 'sv', ':vsplit<CR><C-w>w', { remap = false, silent = true })

-- Move window
vim.keymap.set('', 'sn', '<C-w>w', { remap = false, silent = true })
vim.keymap.set('', 'sh', '<C-w>h', { remap = false, silent = true })
vim.keymap.set('', 'sk', '<C-w>k', { remap = false, silent = true })
vim.keymap.set('', 'sj', '<C-w>j', { remap = false, silent = true })
vim.keymap.set('', 'sl', '<C-w>l', { remap = false, silent = true })

