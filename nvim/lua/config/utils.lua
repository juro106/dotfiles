-- ~/.config/nvim/lua/config/utils.lua
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
