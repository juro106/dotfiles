--  ~/.config/nvim/lua/plugins/lsp.lua
return {
    {
        'williamboman/mason.nvim',
        cmd = {
            'Mason',
            'MasonInstall',
            'MasonUninstall',
            'MasonUninstallAll',
            'MasonLog',
            'MasonUpdate',
        },
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        ft = {
            'lua',
            'go',
            'python',
            'terraform',
            'c',
        },
        event = 'BufRead',
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    'lua_ls',
                }
            })
            require("lsp.init") -- LSP の初期化をここで呼び出す
        end,
    },
    {
        'neovim/nvim-lspconfig',
        event = 'BufRead',
    },
}
