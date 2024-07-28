local dap = require("dap")
local dapui = require("dapui")

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
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/main', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    }
}

dap.configurations.cpp = dap.configurations.c

dap.adapters.delve = {
    type = 'server',
    port = 38697,
    executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:38697' },
    }
}

dap.adapters.go = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/vscode-go/extension/dist/debugAdapter.js' },
}

local function filtered_pick_process()
    local opts = {}
    vim.ui.input(
        { prompt = "Search by process name (lua pattern), or hit enter to select from the process list: " },
        function(input)
            opts["filter"] = input or ""
        end
    )
    return require("dap.utils").pick_process(opts)
end

local function get_debug_process_id()
    local pid = vim.fn.system("pidof 'app_debug'")
    if tonumber(pid) == nil then
        return require("dap.utils").pick_process()
    else
        return tonumber(pid)
    end
end

local function get_file()
    os.execute("./debug")
    local isApp = vim.fn.executable("./app_debug")
    if isApp == 0 then
        return require("dap.utils").pick_file()
    else
        return "${file}"
    end
end

dap.configurations.go = {
    {
        type = "delve",
        name = "Attach to process",
        request = "attach",
        mode = "local",
        processId = get_debug_process_id
    },
    {
        type = "delve",
        name = "Run (generated from 'debug' script)",
        request = "launch",
        program = get_file,

    }
}

local function widgets()
    local widgets = require('dap.ui.widgets');
    local sidebar = widgets.sidebar(widgets.scopes);
    sidebar.open();
end

dapui.setup()

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
