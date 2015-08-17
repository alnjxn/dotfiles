" Highlight searches.
set hlsearch
" Enable Color Column
" set colorcolumn=80

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
  highlight SpecialKey ctermfg=white
  highlight ExtraWhitespace ctermfg=white ctermbg=1
  match ExtraWhitespace /\s\+$/

  " Highlight color column
  "highlight ColorColumn ctermbg=0
endfunction

augroup after_colorscheme
  autocmd!
  autocmd ColorScheme * call s:after_colorscheme()
augroup END

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
