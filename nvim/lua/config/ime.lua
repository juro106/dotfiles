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
    else
        os.execute("fcitx5-remote -c")
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
local map = vim.keymap.set
local NS = { noremap = true, silent = true }

map("n", "<F2>", function()
    toggle_jp_mode()
end, NS)

map("i", "<F2>", function()
    vim.api.nvim_input("<Esc>") -- Insertモードを終了（<Esc>相当）
    toggle_jp_mode() -- 関数を呼び出す
    vim.api.nvim_input("a") -- Insertモードに復帰（'a'でカーソル右に戻す）

    -- 別な方法
    -- vim.cmd('stopinsert')
    --
    -- toggle_jp_mode() -- 関数を呼び出す
    --
    -- vim.defer_fn(function()
    --     vim.cmd('startinsert')
    -- end, 0)

end, NS)

map("n", "<Esc>", ":lua Off_IME()<CR><Esc>", NS)

-- 色設定用関数
-- local function set_cursor_color(active)
--   if active == 1 then
--     vim.api.nvim_set_hl(0, "Cursor", { fg = "NONE", bg = "#d10000" })
--   else
--     vim.api.nvim_set_hl(0, "CursorIM", { ctermbg = 15, fg = "#f6f3e8", bg = "#ff99ff", gui = "none" })
--   end
-- end

