"Switches
syntax on               "open syntax
filetype on             "detect filetype
filetype plugin on      "use filetype plugins

"Settings
set nu                  "show line number
set ruler               "show cursor position on downright
set tabstop=4           "1 tab == 4 spaces
set shiftwidth=4
set softtabstop=4
set expandtab           "transfer tab to spaces
set smarttab
set cursorline          "focus on current line
set hlsearch            "highlight search characters
"set showmatch           "show matched brackets
set autoindent          "auto indent
set smartindent         "smart indent
set mouse=a             "use mouse?
set background=dark     "background color
set ignorecase          "ignore upper/lower case in search mod
set smartcase           "if search mod has upper case then dont ignore
set autowrite           "automatic save
set whichwrap=b,s,<,>,[,]   "cursor can move between preline and nextline
set nobackup            "no temp files
set noswapfile          "no swap files
set hidden              "hide buffers when they are abandoned
set laststatus=1        "set status bar size=1 line
set showcmd             "show input commands
set showmode            "show vim mode
set incsearch           "ultra search mode
set nocompatible        "no vi 
set encoding=utf-8      "encoding
set gdefault            "substitute all things in a line not the first


"Key mapping
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
imap ( ()<LEFT>
imap [ []<LEFT>
imap { {}<LEFT>
imap < <><LEFT>
imap ` ``<LEFT>

"Key mapping for markdown
"F1 == generate blog head
autocmd FileType markdown inoremap <F3> ---<CR>layout: post<CR>title: [TITLE]<CR>date: <c-r>=strftime("%y-%m-%d %H:%M:%S +0800")<CR><CR>categories: [CATEGORY]<CR>---<CR>
autocmd FileType markdown nnoremap <F2> :!cd /home/bw/Documents/Blogs/StarPlatinum-blog.github.io && git add --all && git commit -am "update" && git push<CR>

"Key mapping for cpp
"F2 == build && run
"F3 == generate generic head of c++ files
autocmd FileType cpp inoremap < <
autocmd FileType cpp nnoremap <buffer> <F2> :!g++ -o test % -std=c++11 -g -Wall && ./test <CR>
autocmd FileType cpp nnoremap <F3> i#include <iostream> <CR>using namespace std; <CR><CR>int main() { <CR><CR>return 0;<CR>}<CR> <ESC>5Gi<TAB>

"Ctags settings
map <F5> :!ctags -r --c++ -kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=./.tags;,.tags

"Vim plug
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/ludovicchabant/vim-gutentags.git'
Plug 'dense-analysis/ale'

call plug#end()

"vim-gutentags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"ale
""let g:ale_linters_explicit = 1
""let g:ale_completion_delay = 500
""let g:ale_echo_delay = 20
""let g:ale_lint_delay = 500
""let g:ale_echo_msg_format = '[%linter%] %code: %%s'
""let g:ale_lint_on_text_changed = 'normal'
""let g:ale_lint_on_insert_leave = 1
""let g:airline#extensions#ale#enabled = 1
""
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
""let g:ale_c_cppcheck_options = ''
""let g:ale_cpp_cppcheck_options = ''
