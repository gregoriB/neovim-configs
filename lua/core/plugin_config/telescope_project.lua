--require("telescope").extensions.project.project{}
require("telescope").load_extension('project')

vim.api.nvim_set_keymap(
        'n',
        '<leader><Tab>',
        ":lua require'telescope'.extensions.project.project{}<CR>",
        {noremap = true, silent = true}
)
