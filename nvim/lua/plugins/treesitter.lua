-- ~/.config/nvim/lua/plugins/nvim-treesitter.lua
return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufRead',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    'lua',
                    'go',
                    'python',
                    'markdown',
                },
                sync_install = false, -- 非同期インストール
                auto_install = true,
                ignore_install = {},
                modules = {},
                highlight = {
                    enable = true, -- ハイライトを有効化
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true, -- インデントを有効化
                },
                playground = {
                    enable = true,
                    updatetime = 25,         -- ハイライト更新のデバウンス時間
                    persist_queries = false, -- クエリの永続化
                    keybindings = {
                        toggle_query_editor = 'o',
                        toggle_hl_groups = 'i',
                        toggle_injected_languages = 't',
                        toggle_anonymous_nodes = 'a',
                        toggle_language_display = 'I',
                        focus_language = 'f',
                        unfocus_language = 'F',
                        update = 'R',
                        goto_node = '<cr>',
                        show_help = '?',
                    },
                },
            }
            vim.keymap.set('n', '<Space>hs', ':TSHighlightCapturesUnderCursor<CR>', { noremap = true })
        end,
    },
    {
        'nvim-treesitter/playground',
        lazy = true,
        cmd = {
            'TSPlaygroundToggle',
            'TSHighlightCapturesUnderCursor',
        }
    },
}
