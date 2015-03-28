" This is the main plugin list, sourced by modules/plugins.vim
" Configuration goes in the appropriate modules/plugins/*.vim file.
" So configuration for tmux.vim would go in modules/plugins/tmux.vim.vim

" Make sure you use single quotes
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'Raimondi/delimitMate'
Plug 'helino/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'xolox/vim-misc'
Plug 'mustache/vim-mustache-handlebars'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'digitaltoad/vim-jade'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'luochen1990/rainbow'

" On-demand loading
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Lokaltog/vim-easymotion', { 'on': '<Plug>(easymotion-prefix)' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'walm/jshint.vim', { 'on': 'JSHint' }
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
