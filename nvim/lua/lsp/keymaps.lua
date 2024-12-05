-- ~/.config/nvim/lua/lsp/keymaps.lua

local M = {}

-- LSP 由来のキーマップ設定
M.set_keymaps = function()
    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)        -- 定義にジャンプ
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)              -- シンボルの情報表示
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)     -- 実装にジャンプ
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)  -- コードアクション
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)      -- リネーム
    vim.keymap.set('n', '\\f', vim.lsp.buf.format, opts)       -- フォーマット
    vim.keymap.set('n', '\\\\', vim.lsp.buf.format, opts)       -- フォーマット
end

return M
