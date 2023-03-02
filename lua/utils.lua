M = {}

local function async_run(func)
    if type(func) ~= 'function' then
        print('callback should be a function! but not '.. type(func) .. '!')
        return
    end

    local async_task
    async_task = vim.loop.new_async(vim.schedule_wrap(function()
        func()
        async_task:close()
    end))
    async_task:send()

end
M.async_run = async_run

function M.async(func)
    return function()
        async_task(func)
    end
end

return M
