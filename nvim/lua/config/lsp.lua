-- ~/.config/nvim/lua/config/lsp.lua

-------------------------------------------------------
-- diagnostic (診断) 設定
-------------------------------------------------------
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

-- diagnostic 表示/非表示 のtoggle
local diagnostics_active = true

local function toggle_diagnostics()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.enable(true)  -- 現在バッファに有効化
        vim.notify("Diagnostics enable")
    else
        vim.diagnostic.enable(false)  -- 現在バッファに有効化
        vim.notify("Diagnostics disabled")
    end
end
--- コマンド登録
vim.api.nvim_create_user_command("ToggleDiagnostics", toggle_diagnostics, {})

-------------------------------------------------------
-- LSP キーマップ設定
-------------------------------------------------------
local opts = { noremap = true, silent = true }

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)          -- 定義にジャンプ
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                -- シンボルの情報表示
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)      -- 実装にジャンプ
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- コードアクション
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)      -- リネーム
        vim.keymap.set('n', '\\f', vim.lsp.buf.format, opts)             -- フォーマット
        vim.keymap.set('n', '\\\\', vim.lsp.buf.format, opts)            -- フォーマット
        vim.keymap.set('n', '\\d', toggle_diagnostics, opts)
    end,
})

-------------------------------------------------------
-- 言語毎の設定
-------------------------------------------------------
local lspconfig = require('lspconfig')

-- server リスト
local servers = {
    go = {
        name = 'gopls',
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                    unreachable = true,
                },
                staticcheck = true,
            },
        },
        autostart = false,
    },
    lua = {
        name = 'lua_ls',
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    path = vim.split(package.path, ';'),
                },
                diagnostics = {
                    globals = {
                        'vim',
                        'describe',
                        'it',
                        'assert',
                        'before_each',
                    },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                }
            },
        },
    },
    python = {
        name = 'pyright',
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = 'strict',
                    autoImportCompletions = true,
                },
            },
        },
    },
    terraform = { name = 'terraformls', },
    typescript = { name = 'ts_ls' },
    yaml = { name = 'yamlls' },
}

for lang, config in pairs(servers) do
    lspconfig[config.name].setup({
        autostart = config.autostart,
        on_attach = function()
            print(lang .. " LSP started")
        end,
        flags = {
            debounce_text_changes = 150,
        },
        settings = config.settings,
    })
end

-- lspconfig なしで設定する場合
-- go
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd('FileType', {
--     pattern = 'go',
--     callback = function()
--         local root_dir = vim.fs.dirname(
--             vim.fs.find({ 'go.mod', 'go.work', '.git' }, { upward = true })[1]
--         )
--         local client = vim.lsp.start({
--             name = 'gopls',
--             cmd = { 'gopls' },
--             root_dir = root_dir,
--         })
--         vim.lsp.buf_attach_client(0, client)
--     end,
-- })

-- terraform

-- autocmd('FileType', {
--     pattern = 'terraform',
--     callback = function()
--         local root_dir = vim.fs.dirname(
--             vim.fs.find({ '.terraform', '.git' }, { upward = true })[1]
--         )
--         local client = vim.lsp.start({
--             name = 'terraform-ls',
--             cmd = { 'terraform-ls', 'serve' },
--             root_dir = root_dir,
--         })
--         vim.lsp.buf_attach_client(0, client)
--     end,
-- })

-- 現在のバッファのファイルタイプに基づき LSP を起動
-- function _G.start_lsp_for_filetype()
--     local filetype = vim.bo.filetype
--     if not lsp_servers[filetype] then
--         print("No LSP configure for filetype: " .. filetype)
--         return
--     end
--
--     -- LSP サーバーが非アクティブであれば起動する
--     if not active_clients[filetype] then
--         local client_id = vim.lsp.start_client({
--             name = lsp_servers[filetype].name,
--             cmd = lsp_servers[filetype].cmd,
--             root_dir = vim.fn.getcwd(),
--         })
--         active_clients[filetype] = client_id
--         print("Started LSP for filetype: " .. filetype)
--     else
--         print("LSP already running for filetype: " .. filetype)
--     end
-- end
--
-- -- 現在のバッファのファイルタイプに基づき LSP を停止
-- function _G.stop_lsp_for_filetype()
--     local filetype = vim.bo.filetype
--     if active_clients[filetype] then
--         vim.lsp.stop_client(active_clients[filetype])
--         active_clients[filetype] = nil
--         print("Stopped LSP for filetype:" .. filetype)
--     else
--         print("No active LSP to stop for filetype: " .. filetype)
--     end
-- end
