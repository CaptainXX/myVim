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
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>0

"Ctags settings
map <F5> :!ctags -r --c++ -kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags        "add current directory's generated tags file
