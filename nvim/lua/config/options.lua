-- option

-- 不要なプラグイン
vim.g.loaded_gzip               = 1
vim.g.loaded_tar                = 1
vim.g.loaded_tarPlugin          = 1
vim.g.loaded_zip                = 1
vim.g.loaded_zipPlugin          = 1
vim.g.loaded_matchparen         = 1

local options = {
    -- システムクリップボードを仕様
    clipboard = "unnamedplus",
    -- search
    ignorecase = true,
    smartcase = true,
    -- インサートモードのときのカーソルの形状を□のままにする ("|"にしない)
    guicursor = "",
    cmdheight = 1,
    laststatus = 1,
    backup = false,
    undofile = false,
    swapfile = false,
    -- backspace = "indent,eol,start" -- nvim は default でオン
    -- whichwrap = "<>,[],hl",  -- whichwrapの設定を追加
    ambiwidth = "double", -- 全角文字の幅を2文字。これをしないと一部の文字が消える

    -- グローバルなタブ設定
    expandtab = true,      -- タブをスペースに変換
    tabstop = 4,            -- 表示上のタブ幅を4に設定
    shiftwidth = 4,         -- 自動インデントの幅を4に設定

    -- 補完
    pumheight = 10, -- 候補の表示数
    completeopt = "menuone,noselect",

    -- ステータスライン付近
    ruler = false,  -- 右下のline, column, All|Top|Bot(tom)

    -- help
    helplang = "ja,en",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- errorformat
-- vim.opt.errorformat = "%f|%l col %c| %m"
-- Provides tab-copletion for all file-reloated tasks
vim.opt.path:append('**')

vim.cmd("set matchpairs+=（:）,「:」,『:』,【:】,<:>")

vim.cmd('colorscheme mynvim')

-- parenmatchのデフォルトのhighlightを使わない
vim.g.parenmatch_highlight = 0

-- vimdoc-ja
-- local doc_path = vim.fn.stdpath("data") .. "/lazy/vimdoc-ja/doc"
-- if vim.fn.isdirectory(doc_path) == 1 then
--     vim.cmd("helptags " .. doc_path)
-- end

vim.g.ftjpn_key_list = {
	{'.', '。', '．'},
	{',', '、', '，'},
	{'g', 'が'},
	{'t', 'て'},
	{'i', 'に'},
	{'w', 'を'},
	{'h', 'は'},
	{'n', 'の'},
	{'d', 'で'},
	{'u', 'く'},
	{'a', 'な'},
	{'r', 'る'},
	{'o', 'と'},
	{'y', 'よ'},
	{'k', '「', '」'},
	{'[', ']', '{', '}'},
	{'!', '！'},
	{'?', '？'},
}
