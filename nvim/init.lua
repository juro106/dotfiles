-- color scheme
vim.cmd('colorscheme mycolor')

-- basic settigns
-- 不要なプラグイン
vim.g.loaded_gzip               = 1
vim.g.loaded_tar                = 1
vim.g.loaded_tarPlugin          = 1
vim.g.loaded_zip                = 1
vim.g.loaded_zipPlugin          = 1
vim.g.loaded_matchparen         = 1
-- vim.g.loaded_netrw         = 1

-- Indentation
vim.opt.expandtab = true      -- タブをスペースに変換
vim.opt.tabstop = 4            -- 表示上のタブ幅を4に設定
vim.opt.shiftwidth = 4         -- 自動インデントの幅を4に設定

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- インサートモードのときのカーソルの形状を□のままにする ("|"にしない)
vim.opt.guicursor = ""
vim.opt.cmdheight = 1
vim.opt.laststatus = 1
vim.opt.backup = false
vim.opt.undofile = false
vim.opt.swapfile = false
-- vim.opt.backspace = "indent,eol,start" -- nvim は default でオン
-- vim.opt.whichwrap = "<>,[],hl"  -- whichwrapの設定を追加
vim.opt.ambiwidth = "double" -- 全角文字の幅を2文字。これをしないと一部の文字が消える

-- 補完
vim.opt.pumheight = 10 -- 候補の表示数
vim.opt.completeopt = "menuone,noselect"

-- ステータスライン付近
vim.opt.ruler = false  -- 右下のline, column, All|Top|Bot(tom)

-- help
vim.opt.helplang = "ja,en"

-- errorformat
-- vim.opt.errorformat = "%f|%l col %c| %m"
-- Provides tab-copletion for all file-reloated tasks

-- behavior
vim.opt.path:append('**') -- include subdirectories in search
vim.opt.clipboard = "unnamedplus" -- システムクリップボードを仕様

vim.cmd("set matchpairs+=（:）,「:」,『:』,【:】,<:>")

-- parenmatchのデフォルトのhighlightを使わない
vim.g.parenmatch_highlight = 0

-- vimdoc-ja
-- local doc_path = vim.fn.stdpath("data") .. "/lazy/vimdoc-ja/doc"
-- if vim.fn.isdirectory(doc_path) == 1 then
--     vim.cmd("helptags " .. doc_path)
-- end

-- -----------------
-- key mappings
-- -----------------
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Ctrl + Space 抑止。これをやらないと直前に入力した文字列をペーストしてしまう
vim.keymap.set('i', '<Nul>', '<C-Space>')
vim.keymap.set('i', '<Nul>', '<A-Space>')
vim.keymap.set('n', '<C-Space>', '<Nop>')
vim.keymap.set('i', '<C-Space>', '<Nop>')
vim.keymap.set('v', '<C-Space>', '<Nop>')
vim.keymap.set('n', '<A-Space>', '<Nop>')
vim.keymap.set('i', '<A-Space>', '<Nop>')
vim.keymap.set('v', '<A-Space>', '<Nop>')

vim.keymap.set('n', '<Space>w', ':w<CR>', { noremap = true, silent = true })

-- filer
vim.keymap.set('n', '<Space>e', ':Explore<CR>', { noremap = true, desc = "Open file explorer" })
vim.keymap.set('n', '<Space>f', ':find ', { noremap = true })
-- map('n', '<Space>e .', ':e ', { noremap = true })
-- map('n', '<Space>f', ':Ex .<CR>', { noremap = true })

-- 置換
vim.keymap.set('n', '<Space>s', ':<C-u>%s///g<Left><Left>', { noremap = true })
vim.keymap.set('v', '<Space>s', ':s///g<Left><Left>', { noremap = true })

-- 全選択
vim.keymap.set('n', 'g<C-a>', 'ggVG', { noremap = true, silent = true })
vim.keymap.set('n', '<Space><C-a>', 'ggVG', { noremap = true, silent = true })

-- commandline mode コマンドラインモード
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true })
-- map('c', '<C-n>', '<Down>', { noremap = true })
-- map('c', '<C-p>', '<Up>', { noremap = true })

-- アクティブなファイルが含まれているディレクトリを素早く展開
-- map('c', '%%', [[getcmdtype() == ':' ? expand('%:h') .. '/' : '%%']], { noremap = true, expr = true })

-- Buffer
vim.keymap.set('n', '[b', ':<C-u>bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']b', ':<C-u>bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '[B', ':<C-u>bfirst<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']B', ':<C-u>blast<CR>', { noremap = true, silent = true })
vim.keymap.set("n", '<Space>b', ':ls<CR>:b ', { noremap = true })

-- Quickfix
vim.keymap.set('n', '[q', ':<C-u>cprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']q', ':<C-u>cnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '[Q', ':<C-u>cfirst<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']Q', ':<C-u>clast<CR>', { noremap = true, silent = true })

-- insert mode 日本語
-- map('i', '¨（', '（）<Left><C-r>"<Right><Right><Esc>', { noremap = true, silent = true })
-- map('i', '¨「', '「」<Left><C-r>"<Right><Right><Esc>', { noremap = true, silent = true })
-- map('i', '¨『', '『』<Left><C-r>"<Right><Right><Esc>', { noremap = true, silent = true })
-- map('i', '¨【', '【】<Left><C-r>"<Right><Right><Esc>', { noremap = true, silent = true })
vim.keymap.set('v', 'gp', 's（<C-r>"）<Esc><Right>', { noremap = true, silent = true })
vim.keymap.set('v', 'gk', 's「<C-r>"」<Esc><Right>', { noremap = true, silent = true })
vim.keymap.set('v', 'gw', 's『<C-r>"』<Esc><Right>', { noremap = true, silent = true })
vim.keymap.set('v', 'gs', 's【<C-r>"】<Esc><Right>', { noremap = true, silent = true })

-- 現在編集中のファイル名を挿入
vim.keymap.set('n', 'g<C-f>', ':execute "normal! i" . expand("%:t")<CR>', { noremap = true, silent = true })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e ~/.dotfiles/nvim/init.lua<CR>", { desc = "Edit config" })

--- -------------
--- FileType autocommand
--- -------------
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
  pattern = { "*.c", "*.cpp", "*.css", "*.yml", "*.yaml", "*.md", "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.tf", "*.sh", "*.lua" },
  callback = function()
    set_indent(2)
  end,
})

-- Haskellファイルのインデント設定（異なる設定が必要）
autocmd({"BufNewFile", "BufRead"}, {
  group = augroup,
  pattern = { "*.go", "*.hs" },
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
    if fname ~= "" then
      table.insert(filenames, vim.fn.fnameescape(fname))
    end
  end

  if #filenames > 0 then
    vim.cmd("args " .. table.concat(filenames, " "))
  else
    vim.notify("Qargs: quickfix is empty", vim.log.levels.WARN)
  end
end, { nargs = 0, bar = true })

-- terminal mode を insert mode で始める
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = '*',
  callback = function()
    vim.cmd('startinsert')
  end,
})

--- -----------------
--- IME 日本語モード
--- -----------------
-- Linux用 日本語固定モード
local FixedJPN = 0

-- IMEモードの切り替え関数
local function toggle_jp_mode()
  if FixedJPN == 0 then
    FixedJPN = 1
    vim.api.nvim_set_hl(0, "ModeMsg", {  underline = true, italic = true })
  else
    FixedJPN = 0
    vim.api.nvim_set_hl(0, "ModeMsg", { bold = true })
  end
  -- set_cursor_color(current_ime)
  local s = FixedJPN == 1 and "ON" or "OFF"
  print("Fixed in Japanese: " .. s)
end

-- IME制御用関数
local function ime_control(isActive)
  if isActive == 1 then
    os.execute("fcitx5-remote -s mozc")
    vim.api.nvim_command("set guicursor=n-v-c:block,i-ci-ve:ver50")
  else
    os.execute("fcitx5-remote -c")
    vim.api.nvim_command("set guicursor=n-v-c:block,i-ci-ve:block")
  end
end

-- IMEをオフにする関数
Off_IME = function()
  os.execute("fcitx5-remote -c")
end

-- インサートモードで 自動手的に IME が ON になる Autocommands グループ作成
vim.api.nvim_create_augroup("Ime", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
  group = "Ime",
  pattern = "*",
  callback = function()
    ime_control(FixedJPN)
  end,
})

-- ノーマルモード等で 勝手に ime が off になる Autocommands グループ作成
vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineEnter", "CmdlineLeave", "CmdwinEnter", "CmdwinLeave" }, {
  group = "Ime",
  pattern = "*",
  callback = Off_IME,
})

-- keymaps
local NS = { noremap = true, silent = true }

vim.keymap.set("n", "<F2>", function()
  toggle_jp_mode()
end, NS)

vim.keymap.set("i", "<F2>", function()
  vim.api.nvim_input("<Esc>") -- Insertモードを終了（<Esc>相当）
  toggle_jp_mode() -- 関数を呼び出す
  vim.api.nvim_input("a") -- Insertモードに復帰（'a'でカーソル右に戻す）
end, NS)

vim.keymap.set("n", "<Esc>", ":lua Off_IME()<CR><Esc>", NS)

--------------------------
--- markdown 現在時刻挿入
--------------------------
-- md ファイルで セーブするときに dateModified の中身を現在時刻に書き換え
local function update_date_modified()
  local current_time = os.date("%Y-%m-%dT%H:%M:%S+09:00")  -- ISO8601形式で+09:00
  local line_count = vim.api.nvim_buf_line_count(0)

  for i = 0, line_count - 1 do
    local line = vim.api.nvim_buf_get_lines(0, i, i+1, false)[1]
    if line:match("^dateModified:%s*'.-'") then
      local new_line = line:gsub(
        "^dateModified:%s*'.-'",
        "dateModified: '" .. current_time .. "'"
      )
      vim.api.nvim_buf_set_lines(0, i, i+1, false, { new_line })
      break -- 最初に見つけた1行だけ更新
    end
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.md",
  callback = update_date_modified,
})
-------------------------
--- session. Restart
-------------------------
local restart_cmd = "nvim"

vim.api.nvim_create_user_command("Restart", function()
  -- セッション保存
  local session_file = vim.fn.stdpath('data') .. '/session.vim'
  vim.cmd('mksession! ' .. session_file)

  -- すべてのバッファを閉じる
  vim.cmd [[silent! bufdo bwipeout]]

  -- 再起動フラグ
  vim.g.NVIM_RESTARTING = true

  -- nvim を再起動
  vim.cmd('silent! !' .. restart_cmd .. ' &')

  -- 現在の Neovim を終了
  vim.cmd [[qa!]]
end, {})

-- 起動時にセッション復元
vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  callback = function()
    if vim.g.NVIM_RESTARTING then
      vim.g.NVIM_RESTARTING = false
      local session_file = vim.fn.stdpath('data') .. '/session.vim'
      if vim.fn.filereadable(session_file) == 1 then
        vim.cmd('source ' .. session_file)
      end
    end
  end,
})

-------------------------------------------------------
--- LSP settings
-------------------------------------------------------

-- diagnostic (診断) 設定
-------------------------------------------------------
vim.diagnostic.config({
  -- サイン用カラムを使わず、コードの右側にサインとテキストを表示させる
  virtual_text = {
    prefix = function(diagnostic)
      -- severity と対応するプレフィックスをマップ
      local severity_map = {
        [vim.diagnostic.severity.ERROR] = "✘:",
        [vim.diagnostic.severity.WARN] = "⚠:",
        [vim.diagnostic.severity.INFO] = "ℹ:",
        [vim.diagnostic.severity.HINT] = "💡:"
      }

      -- プレフィックスを返す。存在しない場合は空文字を返す
      return severity_map[diagnostic.severity] or ""
    end,
    spacing = 1,
  },
  -- サイン用のカラム(左側のカラム)をつけない
  signs = false,
  update_in_insert = false,
  float = {
    border = "rounded",
  },
})

-- diagnostic 表示/非表示 のtoggle
local diagnostics_active = true

local function toggle_diagnostics()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.enable(true)  -- 現在バッファに有効化
    vim.notify("Diagnostics enable")
  else
    vim.diagnostic.enable(false)  -- 現在バッファに有効化
    vim.notify("Diagnostics disabled")
  end
end
--- コマンド登録
vim.api.nvim_create_user_command("ToggleDiagnostics", toggle_diagnostics, {})

-------------------------------------------------------
-- 言語毎の設定
-------------------------------------------------------

---
local servers = {
  go = {
    name = 'gopls',
    cmd = { 'gopls' },
    settings = {
      gopls = {
        analyses = { unusedparams = true, unreachable = true },
        staticcheck = true,
      },
    },
  },
  lua = {
    name = 'lua_ls',
    cmd = { 'lua-language-server' },
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
        diagnostics = { globals = { 'vim', 'describe', 'it', 'assert', 'before_each' } },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
            vim.fn.stdpath("config"),
          }
        },
      },
    },
  },
  python = {
    name = 'pyright',
    cmd = { 'pyright-langserver', '--stdio' },
    settings = {
      python = {
        analysis = {
          typeCheckingMode = 'strict',
          autoImportCompletions = true,
        },
      },
    },
  },
  bash = {
    name = 'bashls',
    cmd = { 'bash-language-server', 'start' },
    settings = {
      bashIde = {
        globPattern = "*@(.sh|.inc|.bash|.command)"
      }
    }
  },
  javascript = {
    name = 'tsserver',
    cmd = { 'typescript-language-server', '--stdio' },
  },
  typescript = {
    name = 'tsserver',
    cmd = { 'typescript-language-server', '--stdio' },
  },
  yaml = {
    name = 'yamlls',
    cmd = { 'yaml-language-server', '--stdio' },
  },
}

--- Function to find project root
local function get_root_dir(fname)
  -- 1. プロジェクトマーカーを探す
  local markers = {'.git', 'go.mod', 'pyproject.toml', 'package.json'}
  for _, marker in ipairs(markers) do
    local dir = vim.fn.finddir(marker .. '/..', fname .. ';')
    if dir ~= '' then
      return dir
    end
  end
  -- 2. 見つからなければファイルのあるディレクトリ
  return vim.fn.fnamemodify(fname, ':p:h')
end

-- 同じサーバーが同じ root_dir で既に起動していないか確認
local function already_running(name, root_dir)
  for _, client in pairs(vim.lsp.get_clients()) do
    if client.name == name and client.config.root_dir == root_dir then
      return true
    end
  end
  return false
end

-- 共通 on_attach 関数, keymap 設定
local function on_attach(_, bufnr)
  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)          -- 定義にジャンプ
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                -- シンボルの情報表示
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)      -- 実装にジャンプ
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- コードアクション
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)      -- リネーム
  vim.keymap.set('n', '\\f', vim.lsp.buf.format, opts)             -- フォーマット
  vim.keymap.set('n', '\\\\', vim.lsp.buf.format, opts)            -- フォーマット
  vim.keymap.set('n', '\\d', toggle_diagnostics, opts)
end

-- ファイルタイプごとの遅延ロード設定
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "lua", "python", "javascript", "typescript", "css", "sh", "bash", "yaml"},
  callback = function(args)
    local ft = args.match
    local cfg = servers[ft]
    if not cfg then return end

    local fname = vim.api.nvim_buf_get_name(args.buf)
    local root = get_root_dir(fname)

    if already_running(cfg.name, root) then return end

    -- LSP 起動
    vim.lsp.start({
      name = cfg.name,
      cmd = cfg.cmd,  -- 必要に応じて絶対パスに変更
      root_dir = root,
      settings = cfg.settings,
      on_attach = on_attach,
    })
  end,
})

local function showLspInfo()
  local clients = vim.lsp.get_clients()
  if #clients == 0 then
    print("No active LSP clients")
    return
  end

  for _, client in ipairs(clients) do
    print("-------------------------------------------------")
    print("Name:       " .. client.name)
    print("ID:         " .. client.id)

    local root = "N/A"
    if type(client.config.root_dir) == "string" then
      root = client.config.root_dir
    elseif type(client.config.root_dir) == "function" then
      -- fname を渡して実行してみる
      local bufname = vim.api.nvim_buf_get_name(0)
      local r = client.config.root_dir(bufname)
      if r then root = r end
    end
    print("Root dir:   " .. root)

    -- attached buffers
    local bufs = {}
    for k, _ in pairs(client.attached_buffers) do
      table.insert(bufs, tostring(k))
    end
    print("Attached buffers: " .. table.concat(bufs, ", "))

    -- Capabilitiesをざっくり表示
    if client.server_capabilities then
      local caps = vim.tbl_keys(client.server_capabilities)
      print("Capabilities: " .. table.concat(caps, ", "))
    end
  end
end

-- コマンドとして登録
vim.api.nvim_create_user_command("LspInfoS", showLspInfo, {})

--- -------------
--- Snippets
--- -------------
-- ~/.config/nvim/lua/config/snippets.lua
-- simple snippet
local snippets = {
  front = function()
    local current_time = os.date("%Y-%m-%dT%H:%M:%S+09:00")
    return {
      lines = {
        "---",
        "draft: true",
        "title: '$'",
        "description: ''",
        "datePublished: '" .. current_time .. "'",
        "dateModified: ''",
        "tags:",
        "---",
        "",
      }
    }
  end,
  ul = function()
    return {
      lines = { "<ul>", "\t<li>$</li>", "</ul>" }
    }
  end,
}

local function expand_snippet_ctrl_y()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()
  local before_cursor = line:sub(1, col)

  local word = before_cursor:match("(%S+)$")
  if not word then return end

  local snippet
  if snippets[word] then
    -- 登録済みスニペット
    snippet = snippets[word]()
  else
    -- fallback: 任意タグ
    snippet = {
      lines = { "<" .. word .. ">$</" .. word .. ">" }
    }
  end

  if not snippet or not snippet.lines then return end

  -- $ の位置を検出
  local cursor_row, cursor_col = 1, 0
  for i, l in ipairs(snippet.lines) do
    local col_pos = l:find("%$")
    if col_pos then
      cursor_row = i
      cursor_col = col_pos - 1
      snippet.lines[i] = l:gsub("%$", "")
      break
    end
  end
  if not cursor_row then
    cursor_row, cursor_col = 1, 0
  end

  -- 単語を置換する範囲
  local start_col = col - #word
  local end_col = col
  vim.api.nvim_buf_set_text(0, row - 1, start_col, row - 1, end_col, snippet.lines)

  -- カーソル移動
  local new_row = row - 1 + cursor_row
  local new_col = (cursor_row == 1) and (start_col + cursor_col) or cursor_col
  vim.api.nvim_win_set_cursor(0, { new_row, new_col })
end

-- Markdown/HTML専用 <C-y>, マッピング
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"markdown", "html"},
  callback = function()
    vim.keymap.set("i", "<C-y>,", expand_snippet_ctrl_y, { buffer = true })
  end,
})

--------------
-- plugins
--------------

--- netrw
-- vim.g.netrw_sort_by = 'size'
-- vim.g.netrw_sort_option = 'i'
vim.g.netrw_liststyle = 1
vim.g.netrw_banner = 0
vim.g.netrw_sizestyle = "H"
vim.g.netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S"
vim.g.netrw_preview = 1
-- vim.g.netrw_keepdir = 0

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
-- lazy.nvim より先に読み込みたいもの
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

-- lazy.nvim
require("config.lazy")
