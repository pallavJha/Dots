vim.cmd([[
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
]])
