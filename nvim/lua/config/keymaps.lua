-- keymap

local map = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Ctrl + Space 抑止。これをやらないと直前に入力した文字列をペーストしてしまう
map('i', '<Nul>', '<C-Space>')
map('n', '<C-Space>', '<Nop>')
map('i', '<C-Space>', '<Nop>')
map('v', '<C-Space>', '<Nop>')

map('n', '<Space>w', ':w<CR>', { noremap = true, silent = true })
map('n', '<Space>e', ':e ', { noremap = true })
map('n', '<Space>f', ':Ex .<CR>', { noremap = true })

-- 置換
map('n', '<Space>s', ':<C-u>%s///g<Left><Left>', { noremap = true })
map('v', '<Space>s', ':s///g<Left><Left>', { noremap = true })

-- 全選択
map('n', 'g<C-a>', 'ggVG', { noremap = true, silent = true })
map('n', '<Space><C-a>', 'ggVG', { noremap = true, silent = true })

-- commandline mode コマンドラインモード
map('c', '<C-a>', '<Home>', { noremap = true })
map('c', '<C-b>', '<Left>', { noremap = true })
map('c', '<C-e>', '<End>', { noremap = true })
-- map('c', '<C-n>', '<Down>', { noremap = true })
-- map('c', '<C-p>', '<Up>', { noremap = true })

-- アクティブなファイルが含まれているディレクトリを素早く展開
-- map('c', '%%', [[getcmdtype() == ':' ? expand('%:h') .. '/' : '%%']], { noremap = true, expr = true })

-- Buffer
map('n', '[b', ':<C-u>bprevious<CR>', { noremap = true, silent = true })
map('n', ']b', ':<C-u>bnext<CR>', { noremap = true, silent = true })
map('n', '[B', ':<C-u>bfirst<CR>', { noremap = true, silent = true })
map('n', ']B', ':<C-u>blast<CR>', { noremap = true, silent = true })
map("n", '<Space>b', ':ls<CR>:b ', { noremap = true })

-- Quickfix
map('n', '[q', ':<C-u>cprevious<CR>', { noremap = true, silent = true })
map('n', ']q', ':<C-u>cnext<CR>', { noremap = true, silent = true })
map('n', '[Q', ':<C-u>cfirst<CR>', { noremap = true, silent = true })
map('n', ']Q', ':<C-u>clast<CR>', { noremap = true, silent = true })

-- fazzy finder
map('n', '<Space>zf', ':Telescope find_files<CR>', { noremap = true })
