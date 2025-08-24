-- ~/.config/nvim/lua/plugins/init.lua
-- plugin のリスト
return {
    -- LSP 関連
    -- require('plugins.lsp'),
    -- require('plugins.cmp'),

    -- treesitter
    -- require('plugins.treesitter'),

    -- Telescope
    require('plugins.telescope'),

    -- color
    {
        'brenoprata10/nvim-highlight-colors',
        event = 'BufReadPre',
        ft = { 'lua' },
        config = function()
            require("nvim-highlight-colors").turnOn()
            require("nvim-highlight-colors").turnOff()
            require("nvim-highlight-colors").toggle()
        end,
    },

    -- filer
    -- {
    --     "mattn/vim-molder",
    --     lazy = false,
    --     config = function()
    --         vim.g.molder_show_hidden = 1
    --         vim.g.loaded_netrwPlugin = 1
    --
    --         -- キーマップ: molder バッファ専用
    --         vim.api.nvim_create_autocmd("FileType", {
    --             pattern = "molder",
    --             callback = function()
    --                 local opts = { buffer = true, silent = true }
    --                 vim.keymap.set("n", "l", "<Plug>(molder-open)", opts)
    --                 vim.keymap.set("n", "h", "<Plug>(molder-up)", opts)
    --             end,
    --         })
    --     end,
    -- },
    -- 便利
    { 'itchyny/vim-parenmatch', event = 'BufReadPost' },
    {
        'vim-jp/vimdoc-ja',
        keys = {
            { "h", mode = { "c" } },
        },
    },

    -- 自作
    { 'juro106/ftjpn',          event = { 'BufReadPost', 'InsertEnter' }, },
    {
        -- name = 'greet',
        dir = '~/.config/nvim/lua/local-plugin/greet',
        -- lazy = false,
        -- dev = {true},
        opts = {
            message = "Hi! ",
            first_name = "yamamoto",
            nickname = "jiro",
        },
        cmd = {
            "HelloName",
            "HelloNick",
            "HelloLoginuser",
        }
    },
    {
        dir = '~/.config/nvim/lua/local-plugin/weather-report',
        opts = {},
        cmd = {
            "WeatherReport",
        }
    },
}
