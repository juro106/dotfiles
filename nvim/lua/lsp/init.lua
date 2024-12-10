-- ~/.config/nvim/lua/lsp/init.lua

-- mason を使っていたときの設定 ~2024-12-06

-- LSP Handlersを読み込む。Handlers は LSP サーバーを動的に設定するもの
require("lsp.handlers")
-- すべての LSP 設定をまとめて読み込む
require("lsp.servers")
-- 診断設定
require("lsp.diagnostics")

-- init.lua や lsp_config.lua で LSP サーバーがアタッチされたときにキーマップを設定
local lsp_keymaps = require('lsp.keymaps')

-- LSP サーバーがアタッチされたときにキーマップを設定
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        lsp_keymaps.set_keymaps()  -- LSP キーマップをセット
    end,
})
