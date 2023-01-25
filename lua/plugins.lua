local packer = require("packer")

local function module_from_file(file)
    return file:gmatch("config/[^/]+.lua$")():gsub("/", ".", 1):gsub(".lua$", "")
end

return packer.startup({
    function(use)
        use "wbthomason/packer.nvim"

        local packer_group = vim.api.nvim_create_augroup("packer_user_config", { clear = true })

        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = "{lua/plugins.lua}",
            callback = function(args)
                print("reloading " .. args.file)
                vim.cmd([[ luafile ]] .. args.file)
                packer.compile()
            end,
            group = packer_group,
        })


        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = "{lua/config/*.lua}",
            callback = function(args)
                print("reloading " .. args.file)
                local module_name = module_from_file(args.file)
                package.loaded[module_name] = nil
                require(module_name).load(use)

                packer.compile()
            end,
            group = packer_group,
        })

        -- load all lua files under config directory.
        for _, file in ipairs(vim.fn.glob("~/.config/nvim/lua/config/*.lua", false, true)) do
            require(module_from_file(file)).load(use)
        end
    end,
    config = {
        display = {
            open_fn = require("packer.util").float,
        },
    },
})
