M = {}

function M.async_run(func)
    if type(func) ~= 'function' then
        return
    end

    local async_task
    async_task = vim.loop.new_async(vim.schedule_wrap(function()
        func()
        async_task:close()
    end))
    async_task:send()

end

return M
