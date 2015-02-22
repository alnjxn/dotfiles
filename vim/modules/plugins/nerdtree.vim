" Disable netrw
let loaded_netrwPlugin = 1

" Start NERDTree when opening vim
" autocmd vimenter * NERDTree

map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
