-- ~/.config/nvim/lua/plugins/init.lua
-- plugin のリスト
return {
    -- LSP 関連
    require('plugins.lsp'),
    require('plugins.cmp'),
    -- treesitter
    require('plugins.treesitter'),
    -- Telescope
    require('plugins.telescope'),
    -- color
    {
        'brenoprata10/nvim-highlight-colors',
        event = 'BufRead',
        lazy = true,
        config = function()
            require("nvim-highlight-colors").turnOn()
            require("nvim-highlight-colors").turnOff()
            require("nvim-highlight-colors").toggle()
        end,
    },
    -- 便利
    { 'itchyny/vim-parenmatch', event = 'BufRead' },
    { 'glidenote/memolist.vim' },
    -- 自作
    { 'juro106/ftjpn', event = 'BufRead' },
}
