" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------
" Required
call plug#begin('~/.vim/plugged')

" " Interface, Theme, Colorscheme
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'valloric/MatchTagAlways'

" File Explorer, Search
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'

" Motion, Movement
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'

" Syntax, Snippets, Code Completion
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'alnjxn/babel-vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ntpeters/vim-better-whitespace'

" Javascript, Node, React
Plug '1995eaton/vim-better-javascript-completion'
Plug 'moll/vim-node'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'heavenshell/vim-jsdoc'
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx'] }

" Git
Plug 'airblade/vim-gitgutter'

" Tim Pope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

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
set background=dark
colorscheme onedark

set hlsearch

" ----------------------------------------------------------------------------
" NERD Tree
" ----------------------------------------------------------------------------
map <leader>\ :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'NONE')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', 'NONE')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', 'NONE')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', 'NONE')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', 'NONE')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', 'NONE')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', 'NONE')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', 'NONE')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', 'NONE')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', 'NONE')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'NONE')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'NONE')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', 'NONE')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'NONE')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', 'NONE')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', 'NONE')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', 'NONE')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', 'NONE')

" ----------------------------------------------------------------------------
" Fugitive
" ----------------------------------------------------------------------------
nnoremap <silent> <leader>gs :<C-u>Gstatus<CR>
nnoremap <silent> <leader>gw :<C-u>Gwrite<CR>
nnoremap <silent> <leader>gc :<C-u>Gcommit<CR>
nnoremap <silent> <leader>gb :<C-u>Gblame<CR>
nnoremap <silent> <leader>gd :<C-u>Gdiff<CR>
nnoremap <silent> <leader>gj :<C-u>Gpull<CR>
nnoremap <silent> <leader>gk :<C-u>Gpush<CR>
nnoremap <silent> <leader>gf :<C-u>Gfetch<CR>

" ----------------------------------------------------------------------------
" Syntastic
" ----------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_javascript_checkers = ['jscs', 'eslint', 'jshint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_open = 0

let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = 'x'
let g:syntastic_style_warning_symbol = '!'

noremap <leader>t :SyntasticToggleMode<CR>

map <Leader>e :lnext<CR>
map <Leader>E :lprev<CR>

" ----------------------------------------------------------------------------
" Ctrlp & Grep
" ----------------------------------------------------------------------------
let g:ctrlp_user_command = 'ag %s -i --nogroup
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore "**/*.pyc"
  \ --ignore lib
  \ --ignore "\v[\/](node_modules|target|dist|undo|plugged|bower_components)$"
  \ --ignore "\v[\/](\.(swp|ico|git|svn))$"
  \ -g ""'
let g:ctrlp_regexp = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 0
let g:ackprg = 'ag --nogroup --column'
set grepprg=ag\ --nogroup\ --nocolor
nnoremap <leader>a :Ag<space>

" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------
set hidden
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1

" ----------------------------------------------------------------------------
" Tabline
" ----------------------------------------------------------------------------
" This replicates the idea of closing a tab
nmap <leader>x :bp <BAR> bd #<CR>
" This replaes :tabnew which is used to bind to this mapping
nmap <leader>n :enew<cr>
" Move to the next buffer
nmap <leader>. :bnext<CR>
" Move to the previous buffer
nmap <leader>, :bprevious<CR>
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8

" ----------------------------------------------------------------------------
" Highlighting
" ----------------------------------------------------------------------------
" Enables HTML/CSS syntax highlighting in your JavaScript file.
let g:javascript_enable_domhtmlcss=1
let g:jsx_ext_required = 0
let g:used_javascript_libs = 'jquery,underscore,backbone,react,flux,requirejs,handlebars'

highlight ExtraWhitespace ctermbg=1 guibg=magenta
" Remove all trailing whitespace on save
autocmd BufWritePre * StripWhitespace
" Enable proper vim-json behavior on insert mode
autocmd InsertEnter *.json setlocal concealcursor=
autocmd InsertLeave *.json setlocal concealcursor=inc

" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv
nmap =j :%!python -m json.tool<CR>

" ----------------------------------------------------------------------------
" JSDoc
" ----------------------------------------------------------------------------
nmap <silent> <C-l> :JsDoc<CR>
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_input_description = 1

" ----------------------------------------------------------------------------
" Motion and Movement
" ----------------------------------------------------------------------------
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" ----------------------------------------------------------------------------
" Code Completion
" ----------------------------------------------------------------------------
set completeopt-=preview

let g:ycm_min_num_of_chars_for_completion = 2
let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let delimitMate_expand_cr=1

" Emmet
let g:user_emmet_mode='n'
let g:user_emmet_install_global = 1
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-m>'

" Tern JS
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
let g:tern_request_timeout = 1
