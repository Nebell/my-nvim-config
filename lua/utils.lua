M = {}

local function async_run(func)
    if type(func) ~= 'function' then
        print('callback should be a function! but not ' .. type(func) .. '!')
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

local function async(func)
    return function()
        async_run(func)
    end
end
M.async = async

function M.source_files_from_dir(directory)
    for _, file in pairs(vim.fn.readdir(directory)) do
        local f = directory .. '/' .. file
        if vim.fn.filereadable(f) then
            -- vim.fn.execute('source ' .. f)
            vim.cmd.source(f)
        end
    end
end

-- toggler returns a toggler
-- two params are function callback
-- when first toggled, the first param of function will be called
-- and the next time will call the other
function M.toggler(on, off)
    if type(on) ~= "function" or type(off) ~= "function" then
        vim.notify("make sure that the callbacks of toggler are functions!", vim.log.levels.ERROR)
        return
    end

    return {
        sw = false,
        on = on,
        off = off,
        -- lock = vim.loop.new_mutex()
        toggle = function(self)
            if self.sw then
                self.off()
            else
                self.on()
            end

            self.sw = not self.sw
        end
    }
end

return M
