vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.ignorecase = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.keymap.set('i', '<C-H>', '<C-W>', { noremap = true })

vim.keymap.set('n', '<escape>', ':nohlsearch<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bn', ':tabnew<CR>')

-- Closing buffers
vim.keymap.set('n', '<leader>bk', ':bw!<CR>')
vim.keymap.set('n', '<leader>bK', ':qa!<CR>')
vim.keymap.set('n', '<leader>q!', ':qa!<CR>')
vim.keymap.set('n', '<leader>Q', ':qa!<CR>')

-- Windows
vim.keymap.set('n', '<leader>ws', ':split<CR>')
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>')
vim.keymap.set('n', '<leader>wmm', ':tabedit %<CR>')
vim.keymap.set('n', '<leader>wl', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>wk', ':wincmd k<CR>')
vim.keymap.set('n', '<leader>wh', ':wincmd h<CR>')
vim.keymap.set('n', '<leader>wj', ':wincmd j<CR>')

-- Git
vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', {})
-- vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>')

-- Formatting
local saveAndFormatCmd = 'lua vim.lsp.buf.format()'
-- vim.api.nvim_create_autocmd("BufWritePre", { command = saveAndFormatCmd })
