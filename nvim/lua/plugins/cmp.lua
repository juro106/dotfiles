-- ~/.config/nvim/lua/plugins/cmp.lua

return {
    {
        "hrsh7th/nvim-cmp",
        event = 'InsertEnter',
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ['<C-l>'] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                }),
            })
            vim.keymap.set('i', '<C-p>', '<C-p>', { noremap = true, silent = true })
            vim.keymap.set('i', '<C-n>', '<C-n>', { noremap = true, silent = true })
        end,
    },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
}
