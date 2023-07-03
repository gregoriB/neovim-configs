local builtin = require('telescope.builtin')
builtin.buffers({ sort_mru=true, ignore_current_buffer=true })

vim.keymap.set('n', '<Space><Space>', builtin.find_files, {})
--vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space><', builtin.buffers)
vim.keymap.set('n', '<Space>fp', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
