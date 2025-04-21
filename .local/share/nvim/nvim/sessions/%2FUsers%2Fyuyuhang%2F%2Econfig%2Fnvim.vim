let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +14 ~/Documents/codec/xkvpu/venus3/venus3_dma_impl.cpp
badd +4 init.lua
badd +112 lua/plugins.lua
argglobal
%argdel
edit lua/plugins.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 30 + 70) / 140)
exe 'vert 2resize ' . ((&columns * 54 + 70) / 140)
exe 'vert 3resize ' . ((&columns * 54 + 70) / 140)
argglobal
enew
file NvimTree_1
balt lua/plugins.lua
setlocal foldmethod=manual
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal nofoldenable
lcd ~/.config/nvim
wincmd w
argglobal
balt ~/.config/nvim/init.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 112 - ((21 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 112
normal! 025|
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/Documents/codec/xkvpu/venus3/venus3_dma_impl.cpp", ":p")) | buffer ~/Documents/codec/xkvpu/venus3/venus3_dma_impl.cpp | else | edit ~/Documents/codec/xkvpu/venus3/venus3_dma_impl.cpp | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/codec/xkvpu/venus3/venus3_dma_impl.cpp
endif
balt ~/.config/nvim/init.lua
setlocal foldmethod=manual
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 13 - ((12 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 13
normal! 020|
lcd ~/Documents/codec/xkvpu/venus3
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 30 + 70) / 140)
exe 'vert 2resize ' . ((&columns * 54 + 70) / 140)
exe 'vert 3resize ' . ((&columns * 54 + 70) / 140)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
