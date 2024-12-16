Keywords = {
"",
"晴れ",
"曇り",
"雨",
"雪",
"雷",
"霧",
"晴れのち曇り",
"晴れのち雨",
"晴れのち雪",
"曇りのち晴れ",
"曇りのち雨",
"曇りのち雪",
"雨のち晴れ",
"雨のち曇り",
"雨のち雪",
"雪のち晴れ",
"雪のち曇り",
"雪のち雨",
"時々（交互に登場する場合）",
"晴れ時々曇り",
"晴れ時々雨",
"晴れ時々雪",
"曇り時々晴れ",
"曇り時々雨",
"曇り時々雪",
"雨時々晴れ",
"雨時々曇り",
"雨時々雪",
"雪時々晴れ",
"雪時々曇り",
"雪時々雨",
"一時（短時間だけ特定の天気が登場する場合）",
"晴れ一時曇り",
"晴れ一時雨",
"晴れ一時雪",
"曇り一時晴れ",
"曇り一時雨",
"曇り一時雪",
"雨一時晴れ",
"雨一時曇り",
"雨一時雪",
"雪一時晴れ",
"雪一時曇り",
"雪一時雨",
"その他の複合表現",
"晴れ後曇り時々雨",
"曇り後雨時々雪",
"晴れ一時曇り後雨",
"曇り時々雨後晴れ",
"雨時々曇り後雪",
"雪一時雨後曇り",
"特殊な表現",
"雷雨",
"みぞれ",
"あられ",
"台風",
"快晴",
"大雪",
"大雨",
"暴風雨",
"暴風雪",
}

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

-- 文字列の先頭に天気に対応するアイコンを追加する関数
local add_weather_icon = function(map, text)
    -- 最初の3文字以内で天気情報があるかをチェック
    for weather, icon in pairs(map) do
        -- 文字列の先頭から3文字以内で一致する天気情報を探してアイコンを追加
        if text:sub(1, #weather) == weather then
            text = icon .. text
            break  -- 最初の一致で処理を終了
        end
    end
    return text
end

function Test()
    for i = 1, #Keywords do
        print(add_weather_icon(icon_map, Keywords[i]))
    end
end

Answer = {
"🌤 晴れ",
"🌥 曇り",
"☔雨",
"⛄雪",
"⚡雷",
"🌫 霧",
"🌤晴れのち曇り",
"🌤晴れのち雨",
"🌤晴れのち雪",
"🌥曇りのち晴れ",
"🌥曇りのち雨",
"🌥曇りのち雪",
"☔雨のち晴れ",
"☔雨のち曇り",
"☔雨のち雪",
"⛄雪のち晴れ",
"⛄雪のち曇り",
"⛄雪のち雨",
"時々（交互に登場する場合）",
"🌤晴れ時々曇り",
"🌤晴れ時々雨",
"🌤晴れ時々雪",
"🌥曇り時々晴れ",
"🌥曇り時々雨",
"🌥曇り時々雪",
"☔雨時々晴れ",
"☔雨時々曇り",
"☔雨時々雪",
"⛄雪時々晴れ",
"⛄雪時々曇り",
"⛄雪時々雨",
"一時（短時間だけ特定の天気が登場する場合）",
"🌤晴れ一時曇り",
"🌤晴れ一時雨",
"🌤晴れ一時雪",
"🌥曇り一時晴れ",
"🌥曇り一時雨",
"🌥曇り一時雪",
"☔雨一時晴れ",
"☔雨一時曇り",
"☔雨一時雪",
"⛄雪一時晴れ",
"⛄雪一時曇り",
"⛄雪一時雨",
"その他の複合表現",
"🌤晴れ後曇り時々雨",
"🌥曇り後雨時々雪",
"🌤晴れ一時曇り後雨",
"🌥曇り時々雨後晴れ",
"☔雨時々曇り後雪",
"⛄雪一時雨後曇り",
"特殊な表現",
"⚡雷雨",
"🌧みぞれ",
"あられ",
"🌀台風",
}