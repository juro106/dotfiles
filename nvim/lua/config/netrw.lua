-- lua/netrw_settings.lua
-- vim.g.netrw_sort_by = 'size'
-- vim.g.netrw_sort_option = 'i'
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_sizestyle = "H"
vim.g.netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S"
vim.g.netrw_preview = 1
vim.g.netrw_keepdir = 0

vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end

    bind('h', '-')
    bind('l', '<CR>')
  end
})
