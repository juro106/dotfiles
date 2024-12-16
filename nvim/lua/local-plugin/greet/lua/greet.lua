local M = {}

M.config = {
    message = "Hello World!! this is lua/greet.lua",
    first_name = "yamada",
    nickname = "taro",
}

M.hello_name = function()
    print(M.config.message .. M.config.first_name)
end

M.hello_nick = function()
    print(M.config.message .. M.config.nickname)
end

M.hello_loginuser = function()
    local job1 = vim.system({ "who" }):wait()
    local job2 = vim.system({ "awk", "{print $1}" }, { stdin = job1.stdout }):wait()
    vim.iter(vim.gsplit(job2.stdout, "\n")):each(function(line)
        if line ~= "" then
            print(line .. " Hello")
        end
    end)
end


M.setup = function(args)
    M.config = vim.tbl_deep_extend("force", M.config, args or {})
    print(M.config.message)
    vim.api.nvim_create_user_command("HelloName", M.hello_name, {})
    vim.api.nvim_create_user_command("HelloNick", M.hello_nick, {})
    vim.api.nvim_create_user_command("HelloLoginuser", M.hello_loginuser, {})
end

return M
