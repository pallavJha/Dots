" To get the full path you can add this command
" https://unix.stackexchange.com/a/111560/176830
set statusline+=%F

execute pathogen#infect()

" Uncomment the following line to start NERDTree on enter 
" autocmd vimenter * NERDTree

" Show hiddle files in NERDTree
let NERDTreeShowHidden=1

" Close vim if NERDTree is the only buffer present
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Map `Ctrl + N` for NERDTree
nmap <C-n><C-n> :NERDTreeToggle<CR>
nmap <C-n><C-m> :NERDTreeFind<CR>


" Colorscheme
colorscheme apprentice 
syntax enable
set background=dark

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


" ****************** Starting the vim script copied from https://github.com/neoclide/coc.nvim#example-vim-configuration

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

" ****************** Starting the vim script copied from https://github.com/kien/ctrlp.vim#basic-options 

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" ****************** Closing the vim script copied from https://github.com/kien/ctrlp.vim#basic-options


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


" Changes for the statusline
" Source -> https://stackoverflow.com/a/10416234/2422530
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

" Status line colors for a Terminal
" https://vi.stackexchange.com/a/15614
hi StatusLineTerm ctermbg=black ctermfg=green guibg=darkred guifg=black                                               
hi StatusLineTermNC ctermbg=black ctermfg=black guibg=black guifg=black

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



" Configurations for vim-lsc https://github.com/natebosch/vim-lsc
let g:lsc_server_commands = {'go': 'gopls'}

" Complete default mappings are:
let g:lsc_auto_map = {
    \ 'GoToDefinition': 'gd',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': 'g<C-n>',
    \ 'PreviousReference': 'g<C-p>',
    \ 'FindImplementations': 'gi',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}
    
    
" Settings for Code format
" https://github.com/google/vim-codefmt#autoformatting
" https://stackoverflow.com/a/40275194/2422530
" NOTE: will installation of the required dependencies
autocmd FileType rust setlocal equalprg=rustfmt
autocmd FileType go setlocal equalprg=gofmt

" Setting the formatting for svelte to be same as html
au! BufNewFile,BufRead *.svelte set ft=html
    
