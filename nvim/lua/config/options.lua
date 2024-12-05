-- option
local options = {
    -- システムクリップボードを仕様
    clipboard = "unnamedplus",
    ignorecase = true,
    smartcase = true,
    -- インサートモードのときのカーソルの形状を□のままにする ("|"にしない)
    guicursor = "",
    cmdheight = 1,
    laststatus = 1,
    backup = false,
    undofile = false,
    swapfile = false,
    -- backspace = "indent,eol,start" -- default
    whichwrap = "<>,[],hl",  -- whichwrapの設定を追加
    ambiwidth = "double", -- 全角文字の幅を2文字。これをしないと一部の文字が消える

    -- グローバルなタブ設定
    expandtab = true,      -- タブをスペースに変換
    tabstop = 4,            -- 表示上のタブ幅を4に設定
    shiftwidth = 4,         -- 自動インデントの幅を4に設定

}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd("set matchpairs+=（:）,「:」,『:』,【:】,<:>")

vim.cmd('colorscheme mynvim')

-- 不要なプラグイン
vim.g.loaded_matchparen = 1
vim.g.parenmatch_highlight = 0
vim.g.loaded_gzip               = 1
vim.g.loaded_tar                = 1
vim.g.loaded_tarPlugin          = 1
vim.g.loaded_zip                = 1
vim.g.loaded_zipPlugin          = 1

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
	{'k', 'か'},
	{'a', 'な'},
	{'r', 'る'},
	{'o', 'と'},
	{'y', 'よ'},
	{'c', '（', '）'},
	{'q', '」', '』', '】'},
	{'(', '（', '）'},
	{')', '）'},
	{'{', '「', '」'},
	{'}', '」'},
	{'!', '！'},
	{'?', '？'},
}
