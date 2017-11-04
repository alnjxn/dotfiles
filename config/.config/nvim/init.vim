" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
call plug#begin('~/.nvim/plugged')

" Tim Pope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
" Javascript
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" User Interface
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Syntax
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'
Plug 'Raimondi/delimitMate'
Plug 'digitaltoad/vim-pug'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'

call plug#end()

" ----------------------------------------------------------------------------
" Core
" ----------------------------------------------------------------------------
let mapleader = " "
set termguicolors
set background=dark
colorscheme onedark
let g:onedark_termcolors=16

" Change cursor in insert mode
set guicursor=
      \n-v-c:block,
      \i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,
      \r-cr:hor20,
      \o:hor50,
      \sm:block-blinkwait175-blinkoff150-blinkon175
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use shift-tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

set relativenumber number
set completeopt-=preview
set wrap
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set hlsearch
set incsearch

" Move nvim directories
set backupdir=~/.nvim/backup_files//
set directory=~/.nvim/swap_files//
set undodir=~/.nvim/undo_files//

" Enable mouse support
set mouse=a
if &term =~ '^screen'
  set ttymouse=xterm2
endif

" highlight and remove trailing whitespace on save
highlight ExtraWhitespace ctermbg=1 guibg=#be5046
autocmd BufWritePre * StripWhitespace

" make the 81st column stand out
highlight ColorColumn ctermbg=1 guibg=#be5046
call matchadd('ColorColumn', '\%101v', 100)

" Enable spell checking for markdown files
 au BufRead *.md setlocal spell
 au BufRead *.markdown setlocal spell
set spelllang=en
set spellfile=$HOME/Documents/vim/spell/en.utf-8.add

" Goyo integration with LimeLight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Prettier integration
" autocmd FileType javascript set formatprg=prettier\ --stdin
" autocmd BufWritePre *.js :normal gggqG

" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv
nmap =j :%!python -m json.tool<CR><Paste>
nmap <leader>g :Goyo<CR>

" ----------------------------------------------------------------------------
" Motion and Movement
" ----------------------------------------------------------------------------
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------
set hidden
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline_theme='onedark'

" ----------------------------------------------------------------------------
" Tabline
" ----------------------------------------------------------------------------
set showtabline=2

nmap <leader>x :bp <BAR> bd #<CR>
nmap <leader>n :enew<CR>
nmap <leader>. :bnext<CR>
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
" DelimitMate
" ----------------------------------------------------------------------------
let delimitMate_expand_cr=1

" ----------------------------------------------------------------------------
" NERD Tree
" ----------------------------------------------------------------------------
map <leader>\ :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', '#a8ce93', 'none')
call NERDTreeHighlightFile('ini', 'yellow', 'none', '#dada93', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none', '#83afe5', 'none')
call NERDTreeHighlightFile('yml', 'yellow', 'none', '#dada93', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none', '#dada93', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none', '#dada93', 'none')
call NERDTreeHighlightFile('json', 'yellow', 'none', '#dada93', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none', '#dada93', 'none')
call NERDTreeHighlightFile('styl', 'cyan', 'none', '#7fc1ca', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', '#7fc1ca', 'none')
call NERDTreeHighlightFile('coffee', 'red', 'none', '#df8c8c', 'none')
call NERDTreeHighlightFile('js', 'red', 'none', '#df8c8c', 'none')
call NERDTreeHighlightFile('php', 'magenta', 'none', '#9a93e1', 'none')
call NERDTreeHighlightFile('ds_store', 'gray', 'none', '#6a7d89', 'none')
call NERDTreeHighlightFile('gitconfig', 'gray', 'none', '#6a7d89', 'none')
call NERDTreeHighlightFile('gitignore', 'gray', 'none', '#6a7d89', 'none')
call NERDTreeHighlightFile('bashrc', 'gray', 'none', '#6a7d89', 'none')
call NERDTreeHighlightFile('bashprofile', 'gray', 'none', '#6a7d89', 'none')

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" ----------------------------------------------------------------------------
" ALE
" ----------------------------------------------------------------------------
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '▵'
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" ----------------------------------------------------------------------------
" Deoplete
" ----------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'buffer', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" ----------------------------------------------------------------------------
" Fuzzy file finder
" ----------------------------------------------------------------------------
nnoremap <c-p> :FZF<cr>
let g:fzf_layout = { 'down': '~20%' }

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
" UltiSnips
" ----------------------------------------------------------------------------
let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" ----------------------------------------------------------------------------
" Tern
" ----------------------------------------------------------------------------
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
let g:tern_request_timeout = 1

" ----------------------------------------------------------------------------
" JSDoc
" ----------------------------------------------------------------------------
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_input_description = 1
nmap <silent> <leader>J <Plug>(jsdoc)

