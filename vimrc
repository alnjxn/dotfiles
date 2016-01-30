" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------
" Required
call plug#begin('~/.vim/plugged')

" Interface, Theme, Colorscheme
Plug 'mhartington/oceanic-next'
Plug 'gosukiwi/vim-atom-dark'
Plug 'chriskempson/base16-vim'
Plug 'alnjxn/base16-OceanicNext'
" Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'valloric/MatchTagAlways'
Plug 'ryanoasis/vim-devicons'

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
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ntpeters/vim-better-whitespace'

" Javascript, Node, React
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'moll/vim-node'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'othree/yajs.vim'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }

" Git
Plug 'airblade/vim-gitgutter'
" Plug 'Xuyuanp/nerdtree-git-plugin'

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
filetype plugin indent on

set encoding=utf8
set backspace=indent,eol,start
set relativenumber number
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set visualbell
set wildmenu
set wildmode=full
set incsearch

let mapleader = ","
" Load custom snippets directory
set runtimepath+=~/.nvim/snippets/
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
" Set Fonts for MacVim or GUI
if has('gui_running')
  set guifont=Meslo\ LG\ L\ Regular\ for\ Powerline\ Nerd\ Font\ Complete:h14
endif

" Set ColorScheme
syntax enable
set background=dark
set t_Co=256
colorscheme base16-oceanicnext

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

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

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
let g:syntastic_javascript_checkers = ['jscs', 'eslint']
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
let g:airline_theme='tomorrow'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1

" Powerline Symbols
let g:airline_powerline_fonts = 1

set ttimeoutlen=50
set laststatus=2

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

" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

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

" ----------------------------------------------------------------------------
" Reload Vimrc
" ----------------------------------------------------------------------------
map <leader>v :source ~/.vimrc<CR>
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
