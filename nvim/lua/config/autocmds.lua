-- Create/get autocommand group
local augroup = vim.api.nvim_create_augroup("fileTypeIndent", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- ファイルタイプごとのインデント設定
-- 共通のインデント設定
local function set_indent(n)
    vim.opt_local.tabstop = n
    vim.opt_local.shiftwidth = n
    vim.opt_local.softtabstop = n
    vim.opt_local.expandtab = true
end

-- 共通設定を適用するファイルタイプ
autocmd({"BufNewFile", "BufRead"}, {
    group = augroup,
    pattern = { "*.c", "*.cpp", "*.css", "*.yml", "*.yaml", "*.md", "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.tf", "*.sh" },
callback = function()
    set_indent(2)
end,
})

-- Haskellファイルのインデント設定（異なる設定が必要）
autocmd({"BufNewFile", "BufRead"}, {
    group = augroup,
    pattern = "*.hs",
callback = function()
    set_indent(8)
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
