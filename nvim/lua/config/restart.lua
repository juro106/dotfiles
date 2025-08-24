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
