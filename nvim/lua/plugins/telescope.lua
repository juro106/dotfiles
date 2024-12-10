-- ~/.config/nvim/lua/plugins/telescope.lua
return {
    { 'nvim-lua/plenary.nvim' },
    { 'delphinus/telescope-memo.nvim' },
    {
        'nvim-telescope/telescope.nvim',
        cmd = { 'Telescope' },
        config = function()
            require('telescope').setup({
                pickers = {
                    buffers = {
                        initial_mode = "normal",
                    }
                },
            })

            require('telescope').load_extension('memo')
        end,
    }
}

