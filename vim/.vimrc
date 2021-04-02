" Start NERDTree on enter 
autocmd vimenter * NERDTree

" Close vim if NERDTree is the only buffer present
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Map `Ctrl + N` for NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" Colorscheme
colorscheme monokai

" Settings
"  Set it to show Line numbers
se nu
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:¬
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set noswapfile
