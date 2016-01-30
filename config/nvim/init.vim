" NeoBundle Start (Required) --------------{{{

let bundleExists = 1
if (!isdirectory(expand("$HOME/.nvim/bundle/neobundle.vim")))
   call system(expand("mkdir -p $HOME/.nvim/bundle"))
   call system(expand("git clone https://github.com/Shougo/neobundle.vim ~/.nvim/bundle/neobundle.vim"))
   let bundleExists = 0
endif

if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.nvim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.nvim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
  
" }}}

" Bundles ---------------------------------{{{

" Syntax
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle '1995eaton/vim-better-javascript-completion'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'moll/vim-node'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundleLazy 'elzr/vim-json', {'autoload':{'filetypes':['json']}}
NeoBundle 'tpope/vim-markdown'
NeoBundle 'suan/vim-instant-markdown'

" Typescript
NeoBundle 'HerringtonDarkholme/yats.vim'
NeoBundleLazy 'Quramy/tsuquyomi', {'autoload':{'filetypes':['typescript']}}

" Colorscheme & Highlighting
NeoBundle 'mhartington/oceanic-next'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'valloric/MatchTagAlways'
  
 " Git 
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'jreybert/vimagit'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

" Utilities
NeoBundle 'benekastah/neomake'
NeoBundle 'scrooloose/syntastic'
NeoBundleLazy 'ternjs/tern_for_vim', {
      \ 'build' : {
      \     'mac' : 'npm install',
      \     'linux' : 'npm install',
      \     'unix' : 'npm install',
      \    },
      \ 'autoload' : {
      \     'filetypes' : 'javascript',
      \    },
      \ }
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'gorodinskiy/vim-coloresque'

" Shougo
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }
NeoBundle 'Shougo/neco-vim'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'Shougo/deoplete.nvim'

" Snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'alnjxn/babel-vim-snippets'

" Rando
NeoBundle 'wincent/terminus'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf' }
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'ashisha/image.vim'
NeoBundle 'mhinz/vim-sayonara'
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'rhysd/github-complete.vim'
NeoBundle 'junegunn/limelight.vim'

" }}}

" NeoBundle End (Required) ----------------{{{

call neobundle#end()

filetype plugin indent on
NeoBundleCheck
if bundleExists == 0
  echo "Installing Bundles, ignore errors"
endif

" }}}

" System ----------------------------------{{{

" Load custom snippets directory
set runtimepath+=~/.nvim/snippets/
" Neovim Settings
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set clipboard+=unnamedplus
" Currently needed for neovim paste issue
set pastetoggle=<f6>
" Let airline tell me my status
set noshowmode
set noswapfile
filetype on
set relativenumber number
set tabstop=2 shiftwidth=2 expandtab
set conceallevel=0
" block select not limited by shortest line
set virtualedit=
set wildmenu
set laststatus=2
"set colorcolumn=100
set wrap linebreak nolist
set wildmode=full
" leader is ,
let mapleader = ','
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"

" Remember cursor position between vim sessions
autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
" center buffer around cursor when opening files
autocmd BufRead * normal zz

let g:jsx_ext_required = 1
set complete=.,w,b,u,t,k
let g:gitgutter_max_signs = 1000  " default value
autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
let delimitMate_expand_cr=1

" }}}

" Mappings --------------------------------{{{

" No need for ex mode
nnoremap Q <nop>
" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi
" Navigate between display lines
noremap  <silent> <Up>   gk
noremap  <silent> <Down> gj
noremap  <silent> k gk
noremap  <silent> j gj
noremap  <silent> <Home> g<Home>
noremap  <silent> <End>  g<End>
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End>  <C-o>g<End>
" copy current files path to clipboard
nmap cp :let @+ = expand("%") <cr>
" Neovim terminal mapping
" terminal 'normal mode'
tmap <esc> <c-\><c-n><esc><cr>
" ,f to format code, requires formatters: read the docs
noremap <leader>f :Autoformat<CR>
" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k
nnoremap ; :
inoremap <c-f> <c-x><c-f>
" Copy to osx clipboard
vnoremap <C-c> "*y<CR>
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <c-/> :TComment<cr>
map <esc> :noh<cr>
autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>

nnoremap <leader>e :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"}}}"

" Themes ----------------------------------{{{

" Theme
syntax enable
colorscheme OceanicNext
set background=dark
" highlight the current line number
hi CursorLineNR guifg=#ffffff
" no need to fold things in markdown all the time
let g:vim_markdown_folding_disabled = 1
" turn on spelling for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
" highlight bad words in red
hi SpellBad guibg=#ff2929 guifg=#ffffff" ctermbg=224
" Keep my termo window open when I navigate away
autocmd TermOpen * set bufhidden=hide

"}}}

" Folds -----------------------------------{{{

function! MyFoldText() " {{{
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}

set foldtext=MyFoldText()
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
autocmd FileType vim setlocal fdc=1
set foldlevel=99
" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0
autocmd FileType html setlocal foldmethod=marker
autocmd FileType html setlocal fdl=3
autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99
autocmd FileType javascript,typescript,css,scss,json setlocal foldmethod=marker
autocmd FileType javascript,typescript,css,scss,json setlocal foldmarker={,}
au FileType html nnoremap <buffer> <leader>F zfat

" }}}

" Fugitive --------------------------------{{{

nnoremap <silent> <leader>gs :<C-u>Gstatus<CR>
nnoremap <silent> <leader>gw :<C-u>Gwrite<CR>
nnoremap <silent> <leader>gc :<C-u>Gcommit<CR>
nnoremap <silent> <leader>gb :<C-u>Gblame<CR>
nnoremap <silent> <leader>gd :<C-u>Gdiff<CR>
nnoremap <silent> <leader>gj :<C-u>Gpull<CR>
nnoremap <silent> <leader>gk :<C-u>Gpush<CR>
nnoremap <silent> <leader>gf :<C-u>Gfetch<CR>

" }}}

" NERDTree --------------------------------{{{

map <C-\> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

" NERDTree Highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none', '#6699CC', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('scss', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', 'none')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitconfig', 'black', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#7F7F7F', 'none')

"}}}

" Snipppets -------------------------------{{{

let g:deoplete#enable_at_startup = 1
" ignore snipmate directories
let g:UltiSnipsEnableSnipMate = 1

" Tab completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"}}}

" Typescript & Javascript Omnicomplete ----{{{

let g:vimjs#casesensistive = 1
let g:vimjs#smartcomplete = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
set completeopt-=preview
let g:typescript_indent_disable = 1
let g:tsuquyomi_disable_quickfix = 1
let g:vim_json_syntax_conceal = 0

"}}}

" Emmet -----------------------------------{{{

" Enable Emmet in all modes
let g:user_emmet_mode='a'
" Enable Emmet in all filetypes
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" Remap Emmet leader
let g:user_emmet_leader_key='<C-m>'

"}}}

" FZF -------------------------------------{{{

" Brew install fzf
map <c-p> :FZF<CR>
tmap <c-p> <c-\><c-n>:FZF<CR>
map <leader>a :Ag<CR>
tmap <leader>a <c-\><c-n>:Ag<CR>

vmap <leader>aw y:Ag <C-r>0<CR>
map <leader>h :History<CR>
tmap <leader>h <c-\><c-n>:History<CR>
map <leader>l :Lines<CR>

"}}}

" Vim Buffers and Tmux Panels -------------{{{

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>

tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
tmap <C-;> <C-\><C-n>:TmuxNavigatePrevious<cr>

"}}}

" Airline ---------------------------------{{{

let g:airline#extensions#tabline#enabled = 1
set hidden
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'

" Close the current buffer and move to the previous one
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
tmap <leader>x <c-\><c-n>:bp! <BAR> bd! #<CR>
" This replaes :tabnew which I used to bind to this mapping
nmap <leader>t :term<cr>
" Move to the next buffer
nmap <leader>. :bnext<CR>
tmap <leader>. <C-\><C-n>:bnext<cr>
" Move to the previous buffer
nmap <leader>, :bprevious<CR>
tmap <leader>, <C-\><C-n>:bprevious<CR>

let g:airline#extensions#tabline#buffer_idx_mode = 1

tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"}}}

" Linting ---------------------------------{{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['jscs', 'eslint']
let g:syntastic_check_on_open = 0

let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '!'

noremap <leader>t :SyntasticToggleMode<CR>

function! JscsFix()
    let l:winview = winsaveview()
    % ! jscs -x
    call winrestview(l:winview)
endfunction
command JscsFix :call JscsFix()

noremap <leader>j :JscsFix<CR>

"}}}
