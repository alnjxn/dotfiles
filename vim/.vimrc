" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------
" Required
call plug#begin('~/.vim/plugged')

" Interface, Theme, Colorscheme
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'

" File Explorer, Search

" Motion, Movement

" Syntax, Snippets, Code Completion

" Javascript, Node, React
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/html5.vim'

" Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Git

" Tim Pope

" Required
call plug#end()

" ----------------------------------------------------------------------------
" Core
" ----------------------------------------------------------------------------
set nocompatible

" START Sensible config
filetype plugin indent on
syntax enable
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal
set ttimeout
set ttimeoutlen=100
set incsearch
set laststatus=2
set wildmenu
set scrolloff=1
set sidescrolloff=5
set display+=lastline
set encoding=utf8
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set formatoptions+=j
setglobal tags-=./tags tags-=./tags; tags^=./tags;
set autoread
set history=1000
set tabpagemax=50
set sessionoptions-=options
" END Sensible config

set relativenumber number
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set visualbell
set wildmode=full

let mapleader = " "
" Load custom snippets directory
set runtimepath+=~/.vim/snippets/
" Move Vim directories
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//
" Enable mouse support
set mouse=a
if &term =~ '^screen'
  set ttymouse=xterm2
endif

" Change cursor shape between insert and normal mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" ----------------------------------------------------------------------------
" Theme
" ----------------------------------------------------------------------------

" Set ColorScheme
set termguicolors
colorscheme OceanicNext

set hlsearch

" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------
set hidden
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''


let g:used_javascript_libs = 'jquery,underscore,react,flux,jasmine,chai,d3'
