" Highlight searches.
set hlsearch

" Enable Color Column
set textwidth=80
set colorcolumn=+1

function! s:after_colorscheme()
  " Make spelling problems easier to read.
  highlight clear SpellBad
  highlight clear SpellCap
  highlight clear SpellLocal
  highlight clear SpellRare

  highlight SpellBad cterm=underline
  highlight SpellCap cterm=underline
  highlight SpellLocal cterm=underline
  highlight SpellRare cterm=underline

  " Highlight trailing whitespace.
  highlight SpecialKey ctermfg=white guifg=white
  highlight ExtraWhitespace ctermfg=white ctermbg=1 guifg=white guibg=magenta
  match ExtraWhitespace /\s\+$/

  " Highlight color column
  "highlight ColorColumn ctermbg=black guibg=black
endfunction

augroup after_colorscheme
  autocmd!
  autocmd ColorScheme * call s:after_colorscheme()
augroup END

" Markdown Settings
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
