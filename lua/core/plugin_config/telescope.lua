local builtin = require('telescope.builtin')
builtin.buffers({ sort_mru=true, ignore_current_buffer=true })

vim.keymap.set('n', '<C-leader>', builtin.find_files, {})
vim.keymap.set('n', '<leader><leader>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader><', builtin.buffers)
vim.keymap.set('n', '<leader>fp', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
