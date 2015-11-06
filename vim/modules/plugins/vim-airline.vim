let g:airline_theme="jellybeans"

if has('gui_running')
  " Enable powerline symbols
  let g:airline_powerline_fonts = 1
else
  let g:airline_left_sep=''
  let g:airline_right_sep=''
endif

let g:airline#extensions#tabline#enabled = 1
set laststatus=2
