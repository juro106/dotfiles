-- Colors abbrev
local vmode     = "gui"
local none      = "NONE"
local black     = "#0d1117"
local deep      = "#171a1f"
local dull      = "#40444a"
local grey      = "#a9a9a9"
local semiwhite = "#aeb9c2"
local white     = "#e4ecf3"
local purple    = "#dda0dd"

local bg_none      = " " .. vmode .. "bg=" .. none
local bg_black     = " " .. vmode .. "bg=" .. black
local bg_deep      = " " .. vmode .. "bg=" .. deep
local bg_dull      = " " .. vmode .. "bg=" .. dull
local bg_gray      = " " .. vmode .. "bg=" .. grey
local bg_semiwhite = " " .. vmode .. "bg=" .. semiwhite
local bg_white     = " " .. vmode .. "bg=" .. white

local fg_none      = " " .. vmode .. "fg=" .. none
local fg_black     = " " .. vmode .. "fg=" .. black
local fg_deep      = " " .. vmode .. "fg=" .. deep
local fg_dull      = " " .. vmode .. "fg=" .. dull
local fg_gray      = " " .. vmode .. "fg=" .. grey
local fg_semiwhite = " " .. vmode .. "fg=" .. semiwhite
local fg_white     = " " .. vmode .. "fg=" .. white

-- Format abbrev
local fmt_none   = " " .. vmode .. "=NONE"
local fmt_bold   = " " .. vmode .. "=NONE" .. ",bold"
local fmt_undr   = " " .. vmode .. "=NONE" .. ",underline"
local fmt_curl   = " " .. vmode .. "=NONE" .. ",undercurl"
local fmt_ital   = " " .. vmode .. "=NONE" .. ",italic"
local fmt_stnd   = " " .. vmode .. "=NONE" .. ",standout"
local fmt_revr   = " " .. vmode .. "=NONE" .. ",reverse"

-- Main colors
local normal    = fmt_none .. fg_white .. bg_black
local keyword   = fmt_none .. fg_semiwhite .. bg_none
local comment   = fmt_none .. fg_gray .. bg_none
local attention = fmt_undr .. fg_white .. bg_none

-- Basic highlights
vim.api.nvim_set_hl(0, 'Normal', {fg = white, bg = none})
vim.api.nvim_set_hl(0, 'Comment', {fg = grey, bg = none})
vim.api.nvim_set_hl(0, 'Constant', {fg = white, bg = none})
vim.api.nvim_set_hl(0, 'String', {fg = semiwhite, bg = none})
vim.api.nvim_set_hl(0, 'Character', {fg = semiwhite, bg = none})
vim.api.nvim_set_hl(0, 'Identifier', {fg = white, bg = none})
vim.api.nvim_set_hl(0, 'Statement', {fg = semiwhite, bg = none})
vim.api.nvim_set_hl(0, 'PreProc', {fg = semiwhite, bg = none})
vim.api.nvim_set_hl(0, 'Type', {fg = white, bg = none})
vim.api.nvim_set_hl(0, 'Function', {fg = purple, bg = none})
vim.api.nvim_set_hl(0, 'Special', {fg = white, bg = none})
vim.api.nvim_set_hl(0, 'Underlined', {fg = white, bg = none, underline = true})
vim.api.nvim_set_hl(0, 'Ignore', {fg = none, bg = none})
vim.api.nvim_set_hl(0, 'Error', {fg = white, bg = deep, underline = true})
vim.api.nvim_set_hl(0, 'Todo', {fg = white, bg = deep, bold = true})
-- Additional UI highlights
vim.api.nvim_set_hl(0, 'SpecialKey', {fg = dull, bg = none})
vim.api.nvim_set_hl(0, 'NonText', {fg = dull, bg = none})
vim.api.nvim_set_hl(0, 'StatusLine', {fg = white, bg = none})
vim.api.nvim_set_hl(0, 'StatusLineNC', {fg = grey, bg = deep})
vim.api.nvim_set_hl(0, 'StatusLineTerm', {fg = white, bg = dull})
vim.api.nvim_set_hl(0, 'StatusLineTermNC', {fg = grey, bg = deep})
vim.api.nvim_set_hl(0, 'Visual', {fg = none, bg = dull})
vim.api.nvim_set_hl(0, 'Directory', {fg = semiwhite, bg = none})
vim.api.nvim_set_hl(0, 'ErrorMsg', {fg = white, bg = deep})
vim.api.nvim_set_hl(0, 'IncSearch', {fg = grey, bg = none, reverse = true})
vim.api.nvim_set_hl(0, 'Search', {fg = white, bg = none, reverse = true})
vim.api.nvim_set_hl(0, 'MoreMsg', {fg = white, bg = none})
vim.api.nvim_set_hl(0, 'ModeMsg', {fg = white, bg = none})
vim.api.nvim_set_hl(0, 'LineNr', {fg = dull, bg = none})
vim.api.nvim_set_hl(0, 'CursorLineNr', {fg = white, bg = none})
vim.api.nvim_set_hl(0, 'Question', {fg = white, bg = deep})
vim.api.nvim_set_hl(0, 'VertSplit', {fg = deep, bg = none})
vim.api.nvim_set_hl(0, 'Title', {fg = white, bg = none})
vim.api.nvim_set_hl(0, 'VisualNOS', {fg = none, bg = dull})
vim.api.nvim_set_hl(0, 'WarningMsg', {fg = white, bg = deep})
vim.api.nvim_set_hl(0, 'WildMenu', {fg = white, bg = dull})
vim.api.nvim_set_hl(0, 'Folded', {fg = grey, bg = deep})
vim.api.nvim_set_hl(0, 'FoldColumn', {fg = white, bg = deep})

-- Links
vim.api.nvim_set_hl(0, 'CtrlPMatch', {fg = white, bg = dull})
vim.api.nvim_set_hl(0, 'LspErrorVirtualText', {fg = grey, bg = none})

-- Light mode check
if vim.o.background == 'light' then
    vim.api.nvim_set_hl(0, 'Visual', {fg = none, bg = deep})
end
