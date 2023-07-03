local fb_actions = require("telescope").extensions.file_browser.actions

require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
          ["+"] = fb_actions.create,
          ["R"] = fb_actions.rename,
          ["C"] = fb_actions.copy,
          ["X"] = fb_actions.remove,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["+"] = fb_actions.create,
          ["R"] = fb_actions.rename,
          ["C"] = fb_actions.copy,
          ["X"] = fb_actions.remove,
        },
      },
    },
  },
}


vim.api.nvim_set_keymap(
  "n",
  "<leader>>",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<leader>.",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

require("telescope").load_extension "file_browser"
