require("mason").setup({
    ensure_installed = {
        'jdtls',
        'gopls',
        'golines',
        'goimports',
        'eslint-lsp',
        'lua-language-server',
        'pyright',
        'python-lsp-server',
        'rust-analyzer',
        'typescript-language-server',
        'codelldb',
        'clang-format',
        'clangd',
        'neocmakelsp'
    },
    automatic_installation = true,
})
require("mason-lspconfig").setup()

-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspsaga').setup({
    -- code_action_icon = "💡",
    symbol_in_winbar = {
        in_custom = false,
        enable = true,
        separator = ' > ',
        show_file = true,
        file_formatter = ""
    },
    lightbulb = {
        enable = false,
        enable_in_insert = false,
        sign = true,
        sign_priority = 40,
        virtual_text = false,
    },
    hover = {
        open_link = 'O',
    },
})

vim.keymap.set("n", "<leader>mf", ":Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set('n', '<leader><A-k>', ':Lspsaga hover_doc<CR>', { silent = true })
vim.keymap.set("n", "<leader>mr", ":Lspsaga rename<CR>", { silent = true })
vim.keymap.set("n", "<leader>ma", ":Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<leader>ma", ":Lspsaga code_action<CR>", { silent = true })
vim.keymap.set({ "n", "t" }, "<A-CR>", ":Lspsaga term_toggle<CR>", { silent = true })

require("lspconfig").lua_ls.setup({
    capabilities = capabilities,
})
require("lspconfig").ts_ls.setup({
    capabilities = capabilities,
})
-- require("lspconfig").jdtls.setup({})
require("lspconfig").clangd.setup({
    capabilities = capabilities,
    cmd = { "clangd", "--background-index", "--compile-commands-dir=build", "--log=verbose" },
    root_dir = require("lspconfig").util.root_pattern("compile_commands.json", ".git"),
    filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
})
require("lspconfig").neocmake.setup({
    capabilities = capabilities,
});

require("lspconfig").gopls.setup({
    capabilities = capabilities,
    settings = {
        gopls = {
            completeUnimported = false,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        }
    },
})

