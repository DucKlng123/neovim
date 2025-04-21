local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- 如果没有找到将自动安装 layz.nvim
if not vim.loop.fs_stat(lazypath) then
  print("Installing lazy.nvim....")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  print("Done.")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "embark-theme/vim",
        config = function()
            vim.cmd("colorscheme embark")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        requires = 'kyazdani42/nvim-web-devicons',
    },
    {
        'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons'},
    },
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
        require('dashboard').setup {
          -- config
        }
      end,
    },
    {
        "folke/which-key.nvim",
    },
    {
        "akinsho/toggleterm.nvim",
    },
    {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} , {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        }}
    },
    { 
        "nvim-telescope/telescope-file-browser.nvim" ,
    },
    {
        'rmagatti/auto-session',
        lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
        opts = {
          suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
          -- log_level = 'debug',
               }
    },
    {'easymotion/vim-easymotion'},
    { "nvim-treesitter/nvim-treesitter" },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
          require("ibl").setup {}
        end,
    },
    { 'nvim-treesitter/nvim-treesitter-context' },
    -- 光标位于一个词语时，页面上其他同一个词语加下划线
    { 'RRethy/vim-illuminate' },
    {'neovim/nvim-lspconfig'},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
    --m1 for mark use
})

-- 插件启动选项
-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        mode = "buffer",
        -- 显示id
        number = "ordinal",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
             }
         }
    }
}
--nvim-tree
require("nvim-tree").setup(
    {
        git = {
            enable = true
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
            update_root = {
                enable = true,
            },
        },
        sync_root_with_cwd = true,
    }
)
--lualine
require('lualine').setup()
--dashboard
local db = require("dashboard")
db.setup({
    config = {
         header = {
            '   ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣴⣶⣶⣶⣶⣶⠶⣶⣤⣤⣀⠀⠀⠀⠀⠀⠀ ',
            ' ⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⠁⠀⢀⠈⢿⢀⣀⠀⠹⣿⣿⣿⣦⣄⠀⠀⠀ ',
            ' ⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⠿⠀⠀⣟⡇⢘⣾⣽⠀⠀⡏⠉⠙⢛⣿⣷⡖⠀ ',
            ' ⠀⠀⠀⠀⠀⣾⣿⣿⡿⠿⠷⠶⠤⠙⠒⠀⠒⢻⣿⣿⡷⠋⠀⠴⠞⠋⠁⢙⣿⣄ ',
            ' ⠀⠀⠀⠀⢸⣿⣿⣯⣤⣤⣤⣤⣤⡄⠀⠀⠀⠀⠉⢹⡄⠀⠀⠀⠛⠛⠋⠉⠹⡇ ',
            ' ⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⣀⣠⣤⣤⣤⣤⣤⣤⣤⣼⣇⣀⣀⣀⣛⣛⣒⣲⢾⡷ ',
            ' ⢀⠤⠒⠒⢼⣿⣿⠶⠞⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⣼⠃ ',
            ' ⢮⠀⠀⠀⠀⣿⣿⣆⠀⠀⠻⣿⡿⠛⠉⠉⠁⠀⠉⠉⠛⠿⣿⣿⠟⠁⠀⣼⠃⠀ ',
            ' ⠈⠓⠶⣶⣾⣿⣿⣿⣧⡀⠀⠈⠒⢤⣀⣀⡀⠀⠀⣀⣀⡠⠚⠁⠀⢀⡼⠃⠀⠀ ',
            ' ⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣷⣤⣤⣤⣤⣭⣭⣭⣭⣭⣥⣤⣤⣤⣴⣟⠁    ',
         },
         center = {
                 {icon = "  ", desc = "Find Session                ", shortcut = "Leader f s", action = "<leader>fs"},
                 {icon = "  ", desc = "Find File                   ", shortcut = "leader f f", action = "<leader>ff"},
                 {icon = "  ", desc = "Find Pattern                ", shortcut = "leader f p", action = "<leader>fp"},
         }
    }
})
require("which-key").setup({})
--terminal
local opt = require("toggleterm").setup({
    open_mapping = [[<c-j>]],
    -- 打开新终端后自动进入插入模式
    start_in_insert = true,
    -- 在当前buffer的下方打开新终端
    direction = 'horizontal',
})
--telescope
require('telescope').load_extension "file_browser"
--session
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
require("auto-session").setup({
    log_level = "error",
    -- 打开这些目录里面的内容时，不加载会话
    auto_session_suppress_dirs = {"~/", "~/Projects", "~/Downloads", "/", "/ect", "/usr"},
    auto_session_enable_last_session = false,
    -- 保存session文件到 ~/.local/share/nvim/sessions目录
    auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = nil,
    auto_restore_enabled = nil,
    auto_session_use_git_branch = nil,
    -- the configs below are lua only
    bypass_session_save_file_types = nil
})
