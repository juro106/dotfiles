-- ~/.config/nvim/lua/config/snippets.lua
-- simple snippet
local snippets = {
    front = function()
        local current_time = os.date("%Y-%m-%dT%H:%M:%S+09:00")
        return {
            lines = {
                "---",
                "title: '$'",
                "description: ''",
                "datePublished: '" .. current_time .. "'",
                "dateModified: ''",
                "tags:",
                "draft: 1",
                "---",
                "",
            }
        }
    end,
    div = function()
        return {
            lines = { "<div>$</div>" }
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
    local cursor_row, cursor_col
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
    vim.api.nvim_win_set_cursor(0, { row - 1 + cursor_row, cursor_col })
end

-- Markdown/HTML専用 <C-y>, マッピング
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"markdown", "html"},
    callback = function()
        vim.keymap.set("i", "<C-y>,", expand_snippet_ctrl_y, { buffer = true })
    end,
})

