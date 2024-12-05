-- Linux用 日本語固定モード 
local current_ime = 0

-- 色設定用関数
-- local function set_cursor_color(active)
--   if active == 1 then
--     vim.api.nvim_set_hl(0, "Cursor", { fg = "NONE", bg = "#d10000" })
--   else
--     vim.api.nvim_set_hl(0, "CursorIM", { ctermbg = 15, fg = "#f6f3e8", bg = "#ff99ff", gui = "none" })
--   end
-- end

-- IMEモードの切り替え関数
local function ime_mode_change()
  if current_ime == 0 then
    current_ime = 1
  else
    current_ime = 0
  end
  -- set_cursor_color(current_ime)
  print("Japanese Fixed Mode: " .. current_ime)
end

-- IME制御用関数
local function ime_control(active)
  if active == 1 then
    os.execute("fcitx5-remote -s mozc")
  else
    os.execute("fcitx5-remote -c")
  end
end

-- IMEをオフにする関数
local function off_ime()
  os.execute("fcitx5-remote -c")
end

-- ノーマルモード等で 勝手に ime が off になる Autocommands グループ作成
vim.api.nvim_create_augroup("Ime", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
  group = "Ime",
  pattern = "*",
  callback = function() ime_control(current_ime) end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineEnter", "CmdlineLeave", "CmdwinEnter", "CmdwinLeave" }, {
  group = "Ime",
  pattern = "*",
  callback = off_ime,
})

-- keymaps
local map = vim.keymap.set
map("n", "<F2>", function()
    ime_mode_change()
end, { silent = true })

map("i", "<F2>", function()
  vim.cmd("stopinsert")
  ime_mode_change()
  vim.cmd("startinsert")
end, { silent = true })
