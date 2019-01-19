set tabstop=4
set softtabstop=4
set shiftwidth=4
"代码补全
"filetype plugin indent on
set completeopt=longest,preview,menu
set pumheight=10
set scrolloff=4   "光标移动到buffer的底部和顶部时保持三行的距离
set history=1000   "设置命令历史上限


set nu
set rnu "设置相对行号

"执行查找前预览第一处匹配
set incsearch

"高亮当前行
set cursorline
"高亮当前列
set cursorcolumn

"windows 下自动缩进
set cindent
"按照C/C++风格自动缩进
syntax on

"开启折叠
set fdm=marker


colorscheme molokai


"====================VIM运行设置====================
nnoremap gp `[v`]

"加载当前工作目录下的vimrc文件
if filereadable("workspace.vim")
	source workspace.vim
endif

"=====================编译运行======================================
"
" C, C++ 按F9 编译运行
map <F9> : call CompileRunGcc()<CR>
map! <F9> <ESC>:call CompileRunGcc()<CR>

map <F7> : call Compile()<CR>
map! <F7> <ESC>:call Compile()<CR>

map <F8> : call Run()<CR>
map! <F8> <ESC>:call Run()<CR>

func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ -std=c++11 % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	elseif &filetype == 'python'
		exec "!python3 %"
	endif
endfunc

func! Compile()
	exec "w"
	exec "make"
endfunc

func! Run()
	exec "! ./%<"
endfunc

command Debug call Debug()

func! Debug()
	exec "w"
	exec "packadd termdebug"
	exec "let g:termdebug_wide = 163"
	exec "!g++ -g % -o%<_debug"
	exec "Termdebug %<_debug"
endfunc


"设置vim中make命令
if filereadable("makefile")
	set makeprg=make    "默认使用make命令
else 
	set makeprg=g++\ -o%<\ %    "没有makefile文件就使用g++命令编译当前文件
endif

map <F3> : call CopyToWindows()<CR> 
map! <F3> <ESC> : call CopyToWindows()<CR> 

func! CopyToWindows()
	exec "w"
	exec "!cat % |/mnt/c/Windows/System32/clip.exe"
endfunc

"========================编译运行end=====================================







"------------Plug config--------------------
call plug#begin('~/.vim/bundle')

Plug 'Valloric/YouCompleteMe' 
Plug 'SirVer/ultisnips' ", { 'for' : ['c', 'cpp', 'vim', 'hpp', 'h'] }
Plug 'honza/vim-snippets' ", { 'for' : ['c', 'cpp', 'vim', 'hpp', 'h'] }
Plug 'octol/vim-cpp-enhanced-highlight' ", { 'for' : ['c', 'cpp', 'vim', 'hpp', 'h'] }
Plug 'Shougo/echodoc.vim'
"Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'

call plug#end()


filetype plugin indent on

"============插件的配置文件====================================
source ~/.vim/vimrcs/YCM.vim
source ~/.vim/vimrcs/ultisnips.vim
source ~/.vim/vimrcs/echodoc.vim
source ~/.vim/vimrcs/ack.vim
