vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_var('mapleader'," ")
vim.api.nvim_set_var('timeout',true)
vim.api.nvim_set_var('timeoutlen',3000)
vim.api.nvim_set_var('ttimeoutlen',100)

vim.api.nvim_set_keymap("i","jj","<esc>",{noremap = true, silent = true})
vim.api.nvim_set_keymap("n","<C-s>",":w<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap("n","<C-5>",":w|source %<CR>",{noremap = true, silent = true})
-- gt 切换到下一个，gT切换到上一个
vim.api.nvim_set_keymap("n", "<C-f>", "10jzz", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-b>", "10kzz", {noremap = true, silent = true})
-- 多窗口的打开与关闭
vim.api.nvim_set_keymap("n", "<leader>sv", ":vsp<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>sh", ":sp<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>sc", ":close<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>so", ":only<CR>", {noremap = true, silent = true})
-- 多窗口跳转
vim.api.nvim_set_keymap("n", "<leader>h", "<C-w>h", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>l", "<C-w>l", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>j", "<C-w>j", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>k", "<C-w>k", {noremap = true, silent = true})
-- 其他有用的绑定
-- 使用 <C-u> 将光标所在单词转化为全大写
vim.api.nvim_set_keymap("i", "<C-u>", "<esc>viwUwa", {noremap = true, silent = true})
-- 使用 <C-l> 将光标所在单词转化为全小写
vim.api.nvim_set_keymap("i", "<C-l>", "<esc>viwuwa", {noremap = true, silent = true})
-- dw删除当前光标所在单词
vim.api.nvim_set_keymap("n", "dw", "diw", {noremap = true, silent = true})
-- 快速打开vimrc文件
vim.api.nvim_set_keymap("n", "<leader>ee", ":vs $MYVIMRC<CR>", {noremap = true, silent = true})
-- 快速启用 vimrc
vim.api.nvim_set_keymap("n", "<leader>ss", ":source $MYVIMRC<CR>", {noremap = true, silent = true})

-- 快速在buffer间跳转
vim.api.nvim_set_keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>bg", ":BufferLinePick", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "gt", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gT", ":BufferLineCyclePrev<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>c", ":bdelete %<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>C", ":bdelete! %<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>bp", ":BufferLinePickClose<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>bo", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>bl", ":BufferLineCloseLeft<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>br", ":BufferLineCloseRight<CR>", {noremap = true, silent = true})

--nvim-tree
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
--term
vim.api.nvim_set_keymap("t", "<jj>", "<C-\\><C-n>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<leader>l", "<Cmd> wincmd l<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<leader>h", "<Cmd> wincmd h<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<leader>j", "<Cmd> wincmd j<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<leader>k", "<Cmd> wincmd k<CR>", {noremap = true, silent = true})
--telescope
vim.api.nvim_set_keymap("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fp", "<Cmd>Telescope live_grep<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fm", "<Cmd>Telescope marks<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fj", "<Cmd>Telescope jumplist<CR>", {noremap = true, silent = true})
--session
vim.api.nvim_set_keymap("n", "<leader>fs", "<Cmd>SessionSearch<CR>", {noremap = true, silent = true})
--easymotion
vim.api.nvim_set_keymap("n","<leader>w","<Plug>(easymotion-bd-w)",{noremap = true, silent = true})
