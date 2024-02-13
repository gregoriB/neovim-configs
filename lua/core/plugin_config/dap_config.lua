require("dapui").setup()

local dap = require("dap")
local dapui, dapgo = require("dapui"), require('dap-go')

dap.adapters.codelldb = {
  type = "server",
  port = 13000,
  executable = {
    command = vim.fn.expand('~/.local/share/nvim/mason/bin/codelldb'),
    args = { "--port", "13000" },
  },
}

dap.configurations.c = {
  {
    type = "codelldb",
    request = "launch",
    program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/main', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  }
}

dap.configurations.cpp = dap.configurations.c

local function widgets()
  local widgets = require('dap.ui.widgets');
  local sidebar = widgets.sidebar(widgets.scopes);
  sidebar.open();
end

dapgo.setup({
  plugin = true
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set("n", "<leader>db", ':DapToggleBreakpoint<CR>')
vim.keymap.set("n", "<leader>dx", ':DapTerminate<CR>')
vim.keymap.set("n", "<leader>dq", ':DapTerminate<CR>')
vim.keymap.set("n", "<leader>ds", ':DapStepOver<CR>')
vim.keymap.set("n", "<leader>d<CR>", ':DapStepOver<CR>')
vim.keymap.set("n", "<leader>dui", widgets)
vim.keymap.set("n", "<leader>dgo", dap.continue)
