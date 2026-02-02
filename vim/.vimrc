call plug#begin()

" List your plugins here
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf.vim'


call plug#end()


" Uncomment the following line to start NERDTree on enter
" autocmd vimenter * NERDTree

" Show hiddle files in NERDTree
let NERDTreeShowHidden=1

" Close vim if NERDTree is the only buffer present
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Map `Ctrl + N` for NERDTree
nmap <C-n><C-n> :NERDTreeToggle<CR>
nmap <C-n><C-m> :NERDTreeFind<CR>


" fzf.vim specific config
set rtp+=/opt/homebrew/opt/fzf " only for mac silicon
nnoremap <C-p> :Files<Cr>

" To get the full path you can add this command
" https://unix.stackexchange.com/a/111560/176830
set statusline+=%F
set regexpengine=0


" Colorscheme
set t_Co=256
" set termguicolors
syntax enable
" let g:solarized_termcolors=256
" let g:solarized_termtrans = 1
set background=dark
" colorscheme apprentice
colorscheme wildcharm


" Settings
"  Set it to show Line numbers
se nu
set incsearch
set hlsearch
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:¬
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set noswapfile

" Wrapping config
" set textwidth=80
" set colorcolumn=+1


" ****************** Starting the vim script copied from https://github.com/neoclide/coc.nvim#example-vim-configuration

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" vim-airlime-theme configuration
" let g:airline_theme='dark'



" Enabling the mouse support
set mouse=a


" Setting the formatting for svelte to be same as html
au! BufNewFile,BufRead *.svelte set ft=html

" Setting the formatting for the python files
au BufNewFile,BufRead *.py set tabstop=4
     \ softtabstop=4
     \ shiftwidth=4
     \ textwidth=79
     \ expandtab
     \ autoindent
     \ fileformat=unix

au BufNewFile,BufRead *.js,*.ts,*.html,*.svelte,*.css,*.scss set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Settings for fold
" https://vi.stackexchange.com/a/43208
set foldmethod=indent
set foldlevelstart=99
" https://stackoverflow.com/a/19441565
autocmd FileType go setlocal foldmethod=syntax


" augroup statusline
"     autocmd!
"     autocmd WinEnter,BufEnter * setlocal statusline=%!statusline#active()
"     autocmd WinLeave,BufLeave * setlocal statusline=%!statusline#inactive()
" augroup end
