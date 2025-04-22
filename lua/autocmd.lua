local nvimrc = vim.api.nvim_create_augroup("NVIMRC",{clear = true})
vim.api.nvim_create_autocmd({"BufWritePost"},{
    pattern = {"init.lua","keybindings.lua"},
    group   = nvimrc,
    command = "source %"
})
vim.api.nvim_create_autocmd({"BufReadPost"},{
    pattern = "init.lua",
    group   = nvimrc,
    callback = function()
        vim.o.path = vim.o.path..",**/*"
    end
})
local custom_path = vim.api.nvim_create_augroup("CUSTOM_PATH",{clear = true})
vim.api.nvim_create_autocmd({"DirChanged","BufReadPost"}, {
    pattern = "*",
    group   = custom_path,
    callback = function()
        local cwd = vim.fn.getcwd()
        vim.o.path ='.,'.. cwd .. "/**/*"

        ---- 检查是否已经包含该路径
        --if not string.find(vim.o.path, new_path, 1, true) then
        --    vim.o.path = vim.o.path .. "," .. new_path
        --end
    end
})
local nvim_tree = vim.api.nvim_create_augroup("NVIM_TREE",{clear = true})
-- 退出时关闭 nvim-tree
vim.api.nvim_create_autocmd("VimLeavePre", {
    group = nvim_tree,
    callback = function()
        local nvim_tree = require("nvim-tree.api")
        if nvim_tree.tree.is_visible() then
            nvim_tree.tree.close()
        end
    end,
})

-- 启动时重新打开 nvim-tree
vim.api.nvim_create_autocmd("VimEnter", {
    group = nvim_tree,
    callback = function()
        vim.defer_fn(function()
            require("nvim-tree.api").tree.open()
        end, 50)
    end,
})
