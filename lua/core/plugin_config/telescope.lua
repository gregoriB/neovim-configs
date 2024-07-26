local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
vim.keymap.set('n', '<leader><A-Space>', ':Telescope find_files hidden=true<CR>')
vim.keymap.set('n', '<leader><CR>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader><', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fp', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fp', ':Telescope live_grep_args<CR>', {})
vim.keymap.set('n', '<leader>sp', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
vim.keymap.set('n', '<leader>cd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>cD', builtin.lsp_type_definitions, {})

telescope.setup{
  defaults = require('telescope.themes').get_ivy {
    theme = "ivy",
    mappings = {
      i = {
        ['<C-p>'] = require('telescope.actions.layout').toggle_preview
      }
    },
    preview = {
      hide_on_startup = true
    }
  },
  pickers = {
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true,
   },
    current_buffer_fuzzy_find = {
      previewer = false
    }
  },
  extensions = {
    fzf = {
      fuzzy = false,                   -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case". the default case_mode is "smart_case"
    },
    ["ui-select"] = {
        require("telescope.themes").get_dropdown{}
    }
  }
}

-- Better grep
require("telescope").load_extension('live_grep_args')
-- Better fuzzy search
require('telescope').load_extension('fzf')
-- Get frequently edited files
require("telescope").load_extension('frecency')
-- Select UI options using telescope, eg code action
require("telescope").load_extension('ui-select')
-- Nice workspace selector
require("telescope").load_extension('project')


-- Workaround to perform actions when a project is selected using telescope-project
local function on_project_selected(prompt_bufnr)
    local project_actions = require'telescope._extensions.project.actions'
    project_actions.change_working_directory(prompt_bufnr, false)
    local neogit = require('neogit')
    neogit.open()
end

local function custom_project()
  telescope.extensions.project.project{
    attach_mappings = function(prompt_bufnr, map)
        map({'n', 'i'}, '<CR>', on_project_selected)
        return true
    end,
  }
end

vim.keymap.set('n', '<leader><TAB>', custom_project, {desc = "Find Project"})
