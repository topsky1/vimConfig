set showcmd
set tabstop=4
set softtabstop=4
set shiftwidth=4
"代码补全
filetype plugin indent on
set completeopt=preview,menu
"set completeopt=longest,menu
set scrolloff=3   "光标移动到buffer的底部和顶部时保持三行的距离
set history=10000   "设置命令历史上限
set nu
"windows 下自动缩进
set cindent

"设置鼠标可用
set mouse=a

"执行查找前预览第一处匹配
set incsearch


"按照C/C++风格自动缩进
"syntax on
"colorscheme my
colorscheme darkblue

" C, C++ 按F9 编译运行
map <F9> : call CompileRunGcc()<CR>
map! <F9> <ESC>:call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
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

map <F2> : call CallOutThewindow()<CR>
map! <F2> <ESC> : call CallOutThewindow()<CR>
func! CallOutThewindow()
	exec "vsplit _ex"
	exec "vertical res 25"
	exec "Ex"
endfunc

"F3 全部复制
"map <F3> ggVG"+y
"map! <F3> <ESC>ggVG"+y
"win10 上
map <F3> : call CopyToWindows()<CR> 
map! <F3> <ESC> : call CopyToWindows()<CR> 
func! CopyToWindows()
	exec "w"
	exec "!cat % |/mnt/c/Windows/System32/clip.exe"
endfunc


""自动补全括号和引号
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i

set cursorline
hi cursorline cterm=NONE ctermbg=darkred


"x导入文件初始内容

autocmd BufNewFile *.cpp exec ":call ImportTemplate()"


func! ImportTemplate()
	call setline(1, "#include <iostream>")
	call append(1, "#include <cstdio>")
	call append(2, "")
	call append(3, "")
	call append(4, "using namespace std;")
	call append(5, "")
	call append(6, "int main()")
	call append(7, "{")
	call append(8, "")
	call append(9, "	return 0;")
	call append(10, "}")
	exec ":8"
endfunc

"加载当前工作目录下的vimrc文件
if filereadable("workspace.vim")
	source workspace.vim
endif

"execute project related configuration in current directory
if filereadable("workspace.vim")
	source workspace.vim
endif
