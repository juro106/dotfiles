-- Create/get autocommand group
local augroup = vim.api.nvim_create_augroup("fileTypeIndent", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- ファイルタイプごとのインデント設定
autocmd("BufNewFile", {
    group = augroup,
    pattern = { "*.c", "*.cpp", "*.css", "*.yml", "*.yaml", "*.md", "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.tf" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end,
})

autocmd("BufRead", {
    group = augroup,
    pattern = { "*.c", "*.cpp", "*.css", "*.yml", "*.yaml", "*.md", "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.tf" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end,
})

-- terraformファイルタイプの設定
autocmd("FileType", {
    group = augroup,
    pattern = "terraform",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end,
})

autocmd("BufNewFile", {
    group = augroup,
    pattern = "*.hs",
    callback = function()
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.softtabstop = 8
        vim.opt_local.expandtab = true
    end,
})

autocmd("BufRead", {
    group = augroup,
    pattern = "*.hs",
    callback = function()
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.softtabstop = 8
        vim.opt_local.expandtab = true
    end,
})

autocmd("FileType", {
    group = augroup,
    pattern = "sh",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end,
})

-- QuickFixCmdグループを作成し、grepに関連するコマンドでcwindowを表示
vim.api.nvim_create_augroup('QuickFixCmd', { clear = true })

vim.api.nvim_create_autocmd('QuickFixCmdPost', {
    group = 'QuickFixCmd',
    pattern = '*grep*',
    command = 'cwindow',
})

-- Qargsコマンドを定義
vim.api.nvim_create_user_command('Qargs', function()
    local quickfix_items = vim.fn.getqflist()
    local buffer_numbers = {}

    for _, item in ipairs(quickfix_items) do
        buffer_numbers[item.bufnr] = vim.fn.bufname(item.bufnr)
    end

    local filenames = {}
    for _, fname in pairs(buffer_numbers) do
        table.insert(filenames, vim.fn.fnameescape(fname))
    end

    return table.concat(filenames, ' ')
end, { nargs = 0, bar = true })

-- terminal mode を insert mode で始める
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = '*',
    callback = function()
        vim.cmd('startinsert')
    end,
})
