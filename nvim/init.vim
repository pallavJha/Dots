" To get the full path you can add this command
" https://unix.stackexchange.com/a/111560/176830
set statusline+=%F

" Make Ctrl-W a NOP in insert mode
" https://stackoverflow.com/a/69020234/2422530
inoremap <c-w> <nop>

" Colorscheme
colorscheme darkblue 
syntax enable
set background=dark

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


" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


" Enabling the mouse support
set mouse=a

" Enable folding the functions
set foldmethod=syntax
let javaScript_fold=1
set foldcolumn=0
set foldlevel=5
set foldlevelstart=8
set foldclose=all

" Enable copy directly to system clipboard
set clipboard=unnamedplus


" Autocompleting without any plugins
" Source -> https://www.youtube.com/watch?v=2f8h45YR494
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

" -> Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" -> Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"


" Setting up the statusline configuration
source ~/.config/nvim/statusline.vim


" Settings for Code format
" https://github.com/google/vim-codefmt#autoformatting
" https://stackoverflow.com/a/40275194/2422530
" NOTE: will require installation of the required dependencies
autocmd FileType rust setlocal equalprg=rustfmt
autocmd FileType go setlocal equalprg=gofmt

" https://stackoverflow.com/a/59719162/2422530
" NOTE: Needs the installation -> npm -g install js-beautify
autocmd FileType javascript setlocal equalprg=js-beautify\ -s\ 2\ -

" Setting the formatting for svelte to be same as html
au! BufNewFile,BufRead *.svelte set ft=html


call plug#begin()

  Plug 'preservim/nerdtree'
  Plug 'kien/ctrlp.vim'

call plug#end()


" Setting up the NerdTree configuration
source ~/.config/nvim/nerdtree.vim

" Setting up the ctrlp configuration
source ~/.config/nvim/ctrlp.vim
