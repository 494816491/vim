set nu
map zq "+y
"set fileencoding=gb18030 
set fileencodings=utf-8,gb18030,utf-16,big5
set ts=4
set shiftwidth=4
"set autoindent
"set cindent
set dictionary=/usr/share/stardict/dic/langdao-ec-gb.dict
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
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
nmap <F9>1 :CtrlP /home/ln/Hi3520D_SDK_V1.0.2.2/<CR>
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_lazy_update = 500

"html tags % jump
runtime macros/matchit.vim 
filetype plugin on 
filetype plugin indent on

"minibuffer only one window
let g:miniBufExplorerMoreThanOne=0

"cscope config
"cs add /home/lining/src-rt/cscope.out /home/lining/src-rt/
nmap <F7>1 :set tags=/home/ln/hi3520d_050/tags,tags<CR>
"nmap <F7>1 :cs add /home/ln/hi3520d_050/cscope.out /home/ln/hi3520d_050/<CR> :set tags=/home/ln/hi3520d_050/tags,tags<CR>
set cst

map g<C-]> :cs find c <C-R>=expand("<cword>")<CR><CR> :cw<CR>
map g<C-\> :cs find s <C-R>=expand("<cword>")<CR><CR> :cw<CR>

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR> <CR> :cw<CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR> <CR> :cw<CR> 
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR> <CR> :cw<CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR> <CR> :cw<CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR> <CR> :cw<CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR> <CR> :cw<CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$ <CR> :cw<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR> <CR> :cw<CR>
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f- 
if has('python')
	py << EOF
import sys,os,vim
open_file_name = vim.buffers[1].name
open_file_path = open_file_name

find_cs_file = False
while find_cs_file == False:
	open_file_path = os.path.split(open_file_path)[0]
	if(open_file_path == '/'):
		break
	for file in os.listdir(open_file_path):
		if file == "cscope.out":
			find_cs_file = True
			break
if find_cs_file == True:
	print "find cscope file:%s/cscope.out"%open_file_path
	vim.command("cs add %s %s"%(open_file_path, open_file_path))
EOF
endif


"Tlist
let Tlist_Show_One_File=1
set path+=/home/lining/src-rt/**
set autochdir
set mouse=a
set hls
map <F12> :Tlist<CR>
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags


