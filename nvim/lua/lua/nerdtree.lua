vim.cmd([[
" Uncomment the following line to start NERDTree on enter 
" autocmd vimenter * NERDTree

" Show hiddle files in NERDTree
let NERDTreeShowHidden=1

" Close vim if NERDTree is the only buffer present
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Map `Ctrl + N` for NERDTree
nmap <C-n><C-n> :NERDTreeToggle<CR>
nmap <C-n><C-m> :NERDTreeFind<CR>

" Make Ctrl-W a NOP in insert mode
" https://stackoverflow.com/a/69020234/2422530
inoremap <c-w> <nop>
]])
