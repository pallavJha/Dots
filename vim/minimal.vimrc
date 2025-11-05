" To get the full path you can add this command
" https://unix.stackexchange.com/a/111560/176830
set statusline+=%F

" Make Ctrl-W a NOP in insert mode
" https://stackoverflow.com/a/69020234/2422530
inoremap <c-w> <nop>

" For Mac only
set regexpengine=0

" Colorscheme
colorscheme retrobox
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

" Wrapping config
set textwidth=80
set colorcolumn=+1

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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Enabling the mouse support
set mouse=a

" Enable folding the functions
set foldmethod=syntax
let javaScript_fold=1
set foldcolumn=0
set foldlevel=5
set foldlevelstart=8
set foldclose=all

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

" Settings for tabline.vim
" https://github.com/mkitt/tabline.vim
" Found here -> https://github.com/drmingdrmer/vim-tabbar
" Previously using https://superuser.com/a/1203482/686983
hi TabLine      ctermfg=Green  ctermbg=Black     cterm=NONE
hi TabLineFill  ctermfg=Grey   ctermbg=Black     cterm=NONE
hi TabLineSel   ctermfg=Green  ctermbg=Black     cterm=NONE
  

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
