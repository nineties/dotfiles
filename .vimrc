" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set background=dark
set visualbell t_vb=
set expandtab
set noswapfile
set nohlsearch

syntax on

set shiftwidth=4
set tabstop=4
set softtabstop=4

if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!

  autocmd FileType text setlocal textwidth=80
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
endif

let g:changelog_username = "Koichi Nakamura <koichi@idein.jp>"
