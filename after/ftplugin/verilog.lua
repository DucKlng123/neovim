-- ~/.config/nvim/after/ftplugin/v.lua

-- 设置 .v 文件的 gf 行为
vim.keymap.set("n", "gf", function()
    local word = vim.fn.expand("<cfile>")  -- 获取光标下的单词（模块名）
    local file = word .. ".v"              -- 添加 .v 后缀

    -- 在 path 中搜索文件
    for path in string.gmatch(vim.o.path, "[^,]+") do
        -- 替换 `./` 为当前工作目录（兼容性处理）
        path = path:gsub("^%.%//*", vim.fn.getcwd() .. "/")
        -- 拼接完整路径
        local full_path = path .. "/" .. file

-- 使用 vim.fn.glob() 查找所有匹配文件
        local files = vim.split(vim.fn.glob(full_path), "\n")
        
        if #files > 0 then
            for _, f in ipairs(files) do
                print(f)
                vim.cmd("edit "..vim.fn.fnameescape(f))
            end
        else
            vim.notify("File not found: " .. file, vim.log.levels.WARN)
        end
    end

    -- 如果未找到文件，提示错误
end, { noremap = true, buffer = true })  -- buffer=true 表示仅当前缓冲区生效

