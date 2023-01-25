local M = {}

function M.export(f)
    local m = {}
    m.load = function(use)
        f(function(args)
            if type(args) ~= "table" then
                use(args)
                return
            end

            local config = args.config

            if args ~= nil then
                args["config"] = nil
            end

            use(args)

            -- force the excution of the config function
            if config ~= nil then
                config()
            end
        end)
    end
    return m
end

function M.load(_)
end

return M
