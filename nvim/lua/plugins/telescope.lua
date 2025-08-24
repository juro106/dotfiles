-- ~/.config/nvim/lua/plugins/telescope.lua
return {
    { 'nvim-lua/plenary.nvim' },
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
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
}

