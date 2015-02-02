set nu

" 状态栏获得当前正在编辑文件的路径
set laststatus=2      " 总是显示状态栏
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
" 获取当前路径，将$HOME转化为~
function! CurDir()
let curdir = substitute(getcwd(), $HOME, "~", "g")
return curdir
endfunction
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\

"ctrlp config
nmap <F9> :CtrlP ~/src-rt<CR>
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_lazy_update = 500

"html tags % jump
runtime macros/matchit.vim 
filetype plugin on 

"minibuffer only one window
let g:miniBufExplorerMoreThanOne=0

"cscope config
cs add /home/lining/src-rt/cscope.out /home/lining/src-rt/
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR> <CR> :cw<CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR> <CR> :cw<CR> 
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR> <CR> :cw<CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR> <CR> :cw<CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR> <CR> :cw<CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR> <CR> :cw<CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$ <CR> :cw<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR> <CR> :cw<CR>
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f- 

"Tlist
let Tlist_Show_One_File=1
set tags=/home/lining/src-rt/tags,tags;
set path+=/home/lining/src-rt/**
set autochdir
set mouse=a
set hls
map <F12> :Tlist<CR>
set ts=4
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags
