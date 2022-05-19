" Homebrew VIM setting
set backspace=indent,eol,start
set t_Co=256
set term=xterm-256color

" General
set nocompatible
set nobackup
set visualbell
set ruler
filetype indent on

" Syntax Highlighting
if has("syntax")
	syntax on
endif

" Indent option
set autoindent
set si
set cindent
set nu
set expandtab
set ts=4
set shiftwidth=4

" Search option
set hls
set ic

" Key mapping
"	Escape
:inoremap qq <ESC>
"	Remap <CR>
:noremap <CR> o<ESC>

"	Small move
"	Begin of word
":noremap <s-h> b
"	End of word
":noremap <s-l> w
"	Begin of page
:noremap <s-k> <c-u>
"	End of page
:noremap <s-j> <c-d>

"	Big move
"	Begin of line
":noremap <c-h> ^
"	End of line
":noremap <c-l> $
"	Begin of file
":noremap <c-k> gg
"	End of file
":noremap <c-j> <s-g>
