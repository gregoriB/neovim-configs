local telescope = require('telescope')
local builtin = require('telescope.builtin')

builtin.buffers({ sort_mru=true, ignore_current_buffer=true })

vim.keymap.set('n', '<C-leader>', builtin.find_files, {})
vim.keymap.set('n', '<leader><leader>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader><', builtin.buffers)
vim.keymap.set('n', '<leader>fp', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sp', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
vim.keymap.set('n', '<leader>cd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>cD', builtin.lsp_type_definitions, {})

telescope.setup{
  defaults = require('telescope.themes').get_ivy {
    theme = "ivy",
    layout_config = {
      vertical = { width = 0.5, height = 0.5 },
      horizontal = { width = 0.5, height = 0.5 }
    }
  }
}
