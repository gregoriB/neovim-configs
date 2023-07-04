vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.wo.relativenumber = true

vim.keymap.set('n', '<leader>/', ':nohlsearch<CR>')
vim.keymap.set('n', 'lua require("startup").new_file()', '<leader>+')

-- Closing buffers
vim.keymap.set('n', '<leader>bk', ':bw!<CR>')
vim.keymap.set('n', '<leader>bK', ':qa!<CR>')

-- Windows
vim.keymap.set('n', '<leader>ws', ':split<CR>')
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>')
vim.keymap.set('n', '<leader>wmm', ':tabedit %<CR>')
--vim.keymap.set('n', '<leader>wl', '<C-w>l')
--vim.keymap.set('n', '<leader>wh', '<C-w>h')
--vim.keymap.set('n', '<leader>wj', '<C-w>j')
--vim.keymap.set('n', '<leader>wh', '<C-w>h')
vim.keymap.set('n', '<leader>wl', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>wk', ':wincmd k<CR>')
vim.keymap.set('n', '<leader>wh', ':wincmd h<CR>')
vim.keymap.set('n', '<leader>wj', ':wincmd j<CR>')
