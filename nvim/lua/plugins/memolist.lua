return {
    'glidenote/memolist.vim',
    config = function()
        vim.g.memolist_path = "~/.memolist/memo"
        vim.g.memolist_memo_suffix = "md"
        vim.g.memolist_fzf = 1
        vim.g.memolist_template_dir_path = "~/.memolist/templates"

        -- vim.api.nvim_create_augroup("MemoAutoCommit", { clear = true })
        -- vim.api.nvim_create_autocmd("BufEnter", {
        --     group = "MemoAutoCommit",
        --     pattern = "*/.memolist/memo/*.md",
        --     callback = function()
        --         vim.api.nvim_buf_set_var(0, "auto_save", 0)
        --     end,
        -- })
        -- vim.api.nvim_create_autocmd("BufWritePost", {
        --     group = "MemoAutoCommit",
        --     pattern = "*/.memolist/memo/*.md",
        --     command = "!(memo commit)",
        -- })
    end
}
