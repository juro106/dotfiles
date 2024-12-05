-- ~/.config/nvim/lua/lsp/handlers.lua

-- lspのハンドラーに設定 ※要 nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Mason-LSPconfigのハンドラ設定
require("mason-lspconfig").setup_handlers({
    -- LSP サーバーを動的に設定する
    function(server_name)
        local success, custom_config = pcall(require, "lsp.servers." .. server_name)
        if success then
            -- 補完なしの場合
            -- require("lspconfig")[server_name].setup(custom_config)

            -- ※要 nvim-cmp 
            -- サーバー設定が成功した場合、capabilitiesを含む設定を適用
            require("lspconfig")[server_name].setup(vim.tbl_deep_extend("force", custom_config, {
                capabilities = capabilities,  -- capabilitiesを各サーバー設定に追加
                on_attach = function(client)
                    vim.notify("LSP attathed: " .. client.name)
                end,
            }))
        else
            require("lspconfig")[server_name].setup({})
        end
    end,
})

-- -- 例) Mason を使わない場合
-- local servers = { "pyright", "tsserver" }
--
-- for _, server_name in ipairs(servers) do
--     local success, custom_config = pcall(require, "lsp.servers." .. server_name)
--     if success then
--         require("lspconfig")[server_name].setup(custom_config)
--     else
--         require("lspconfig")[server_name].setup({})
--     end
-- end
