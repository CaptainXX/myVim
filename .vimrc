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
autocmd FileType markdown inoremap <F1> ---<CR>layout: post<CR>title: [TITLE]<CR>date: <c-r>=strftime("%y-%m-%d %H:%M:%S +0800")<CR><CR>categories: [CATEGORY]<CR>---<CR>
autocmd FileType markdown nnoremap <F2> :!cd /home/bw/Documents/blogs/StarPlatinum-blog.github.io && git add --all && git commit -am "update" && git push<CR>

"Key mapping for cpp
"F2 == build && run
"F3 == generate generic head of c++ files
autocmd FileType cpp inoremap < <
autocmd FileType cpp nnoremap <buffer> <F2> :!g++ -o test % -std=c++11 -g -Wall && ./test <CR>
autocmd FileType cpp nnoremap <F3> i#include <iostream> <CR>using namespace std; <CR><CR>int main() { <CR><CR>return 0;<CR>}<CR> <ESC>5Gi<TAB>

"Ctags settings
map <F5> :!ctags -r --c++ -kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags        "add current directory's generated tags file
