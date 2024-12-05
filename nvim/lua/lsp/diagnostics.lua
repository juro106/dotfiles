-- ~/.config/nvim/lua/lsp/diagnostic.lua

-- 診断設定
vim.diagnostic.config({
    -- サイン用カラムを使わず、コードの右側にサインとテキストを表示させる
    virtual_text = {
        prefix = function(diagnostic)
            -- severity と対応するプレフィックスをマップ
            local severity_map = {
                [vim.diagnostic.severity.ERROR] = "E:",
                [vim.diagnostic.severity.WARN] = "W:",
                [vim.diagnostic.severity.INFO] = "I:",
                [vim.diagnostic.severity.HINT] = "H:"
            }

            -- プレフィックスを返す。存在しない場合は空文字を返す
            return severity_map[diagnostic.severity] or ""
        end,
        spacing = 1,
    },
    -- サイン用のカラム(左側のカラム)をつけない
    signs = false,
    update_in_insert = false,
    float = {
        border = "rounded",
    },
})
