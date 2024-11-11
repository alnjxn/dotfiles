" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
call plug#begin('~/.nvim/plugged')

" Tim Pope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" User Interface
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
" Typescript
Plug 'sheerun/vim-polyglot'

call plug#end()

" " ----------------------------------------------------------------------------
" " Core
" " ----------------------------------------------------------------------------
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
set cursorline
set colorcolumn=120

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

" change colorcolumn highlight color
highlight ColorColumn guibg=#24272e

" Enable spell checking for markdown files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell
set spelllang=en
set spellfile=$HOME/Documents/vim/spell/en.utf-8.add

" Use homebrew python3
let g:python3_host_prog = '/usr/local/bin/python3'

" ----------------------------------------------------------------------------
""  Mappings
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
call NERDTreeHighlightFile('ts', 'green', 'none', '#a8ce93', 'none')
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
      \   'typescript': ['tslint'],
      \}
let g:ale_lint_delay=200
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_fix_on_save = 1

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
" let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" ----------------------------------------------------------------------------
" Indent Guides
" ----------------------------------------------------------------------------
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2

" ----------------------------------------------------------------------------
" Coc
" ----------------------------------------------------------------------------
let g:coc_global_extensions = ['coc-json', 'coc-prettier', 'coc-pairs', 'coc-tsserver', 'coc-html']

" Better display for messages
set cmdheight=2

" Always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
