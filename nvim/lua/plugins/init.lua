-- ~/.config/nvim/lua/plugins/init.lua
-- plugin のリスト
return {
    -- LSP 関連
    require('plugins.lsp'),
    -- require('plugins.cmp'),

    -- treesitter
    require('plugins.treesitter'),

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
