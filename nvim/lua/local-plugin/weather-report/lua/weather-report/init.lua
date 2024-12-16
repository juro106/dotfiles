local M = {}

local location = "東京"

local keys = {
    "date",
    "telop",
    "temperature.min.celsius",
    "temperature.max.celsius",
}

local icon_map = {
    ["晴"] = "🌤",
    ["曇"] = "🌥",
    ["雨"] = "☔",
    ["快"] = "☀️",
    ["霧"] = "🌫",
    ["雷"] = "⚡",
    ["雪"] = "⛄",
    ["大雨"] = "☔☔☔",
    ["大雪"] = "⛄⛄⛄",
    ["台風"] = "🌀",
    ["みぞれ"] = "🌧",
    ["暴風雪"] = "ミ⛄",
    ["暴風雨"] = "ミ☔",
}

-- 天気に対応するアイコンを追加する関数
local add_weather_icon = function(map, weatherText)
    -- 最初の3文字以内で天気情報があるかをチェック
    for k, icon in pairs(map) do
        -- 文字列の先頭から3文字以内で一致する天気情報を探してアイコンを追加
        -- map の key の長さに引数の文字列をカットしたものとを比較している
        -- string.sub(weatherText, 1 #k) と書いても同じ
        if weatherText:sub(1, #k) == k then
            return icon .. weatherText
        end
    end
    return weatherText
end

local process_key = function(k, v)
    if k == "telop" then
        return add_weather_icon(icon_map, v or "")
    end
    return tostring(v or "")
end

local get_nested_value = function(table, key_path)
    local value = table
    for key in key_path:gmatch("[^%.]+") do
        if value == nil or value[key] == nil then
            return ""
        end
        value = value[key]
    end
    -- 「今日」は 最低気温と最高気温が nil なので消す
    if value == vim.NIL then
        value = ""
    end
    return tostring(value or "")
end

local format_forecasts = function(day, ks)
    return vim
        .iter(ks)
        :map(function(k)
            local value = get_nested_value(day, k)
            return process_key(k, value)
        end)
        :join(" ")
end

local format_result = function(forecasts, ks)
    return vim
        .iter(forecasts)
        :map(function(day)
            return format_forecasts(day, ks)
        end)
        :join(", ")
        :gsub("%s*,", ",")
end

-- args = { '-s', 'https://weather.tsukumijima.net/api/forecast/city/130010' },
-- M.weather_report = function()
--     local job = vim.system({ "curl", "https://weather.tsukumijima.net/api/forecast/city/130010" }):wait()
--     local w = vim.json.decode(job.stdout)
--     print(location .. "の天気: " .. format_result(w.forecasts, keys))
-- end

M.weather_report = function()
    local job = vim.system({ "curl", "https://weather.tsukumijima.net/api/forecast/city/130010" }):wait()

    if job.code ~= 0 then
        print("Error: Failed to fetch weather data.")
        return
    end

    local ok, w = pcall(vim.json.decode, job.stdout)
    if not ok or w == nil or w.forecasts == nil then
        print("Error: Failed to parse weather data.")
        return
    end

    print(location .. "の天気: " .. format_result(w.forecasts, keys))
end

M.setup = function()
    vim.api.nvim_create_user_command("WeatherReport", M.weather_report, {})
end

return M
