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

" PlugIns
"	`:PlugInstall` to install plugin
"	delete line & `:PlugClean` to uninstall plugin
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'sainnhe/sonokai'
	Plug 'scrooloose/nerdcommenter'
call plug#end()

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

"	Autocomplete

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Theme
set background=dark
colorscheme sonokai

" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" customize keymapping
let mapleader=","
map <Leader>cc <plug>NERDComToggleComment
map <Leader>c<space> <plug>NERDComComment
