-- ~/.config/nvim/lua/plugins/cmp.lua

return {
    {
        "hrsh7th/nvim-cmp",
        event = 'BufRead',
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ['<C-l>'] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                }),
            })
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        lazy = true,
        event = 'BufRead',
    },
}
