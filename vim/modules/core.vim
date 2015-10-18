" Set Fonts
if has('gui_running')
  set guifont=Hack:h12
endif

" Disable scrollbars in gui
:set guioptions-=L
:set guioptions-=R

" Enable relative line numbers.
set relativenumber

" Backspace is managed by vim-sensible, but I need it here too because some
" plugins depend on it during start up.
set backspace=indent,eol,start

" Use fource spaces as indentation.
" This is just a default, filetypes may override.
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Show invisible characters.
set listchars=tab:▸\ ,trail:·
set list

" More natural splitting.
set splitbelow
set splitright

" Enable mouse in normal mode. Great for resizing windows.
set mouse=a

" Make session files minimal.
set sessionoptions=blank,curdir,folds,help,tabpages,winsize

" Stop completion engines popping windows up.
set completeopt-=preview

" Disable error bells.
set noerrorbells visualbell t_vb=
augroup GUIBell
  autocmd!
  autocmd GUIEnter * set visualbell t_vb=
augroup END

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Remove all trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Disable right side scroll bar in mvim
set guioptions-=r
