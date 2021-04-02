" Start NERDTree on enter 
autocmd vimenter * NERDTree

" Close vim if NERDTree is the only buffer present
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

# Map `Ctrl + N` for NERDTree
nmap <C-n> :NERDTreeToggle<CR>
