local M = {}

function M.test(str)
    if str ~= '' then
        print('I am ' .. str .. '!!')
    else
        print('please, input string')

    end
end

return M
