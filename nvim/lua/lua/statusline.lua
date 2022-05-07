vim.cmd([[
" Keep this file at ~/.vim/statusline.vim

" https://gist.github.com/meskarune/57b613907ebd1df67eb7bdb83c6e6641
" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e


" Changes for the statusline
" Source -> https://stackoverflow.com/a/10416234/2422530
" set statusline=
" set statusline+=%7*\[%n]                                  "buffernr
" set statusline+=%1*\ %<%F\                                "File+path
" set statusline+=%2*\ %y\                                  "FileType
" set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
" set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
" set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
" set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
" set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
" set statusline+=%9*\ col:%03c\                            "Colnr
" set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
" 
" function! HighlightSearch()
"   if &hls
"     return 'H'
"   else
"     return ''
"   endif
" endfunction
" 
" hi User1 guifg=#ffdad8  guibg=#880c0e ctermfg=black ctermbg=darkgrey
" hi User2 guifg=#000000  guibg=#F4905C ctermfg=black ctermbg=darkgrey  
" hi User3 guifg=#292b00  guibg=#f4f597 ctermfg=black ctermbg=darkgrey
" hi User4 guifg=#112605  guibg=#aefe7B ctermfg=black ctermbg=darkgrey
" hi User5 guifg=#051d00  guibg=#7dcc7d ctermfg=black ctermbg=darkgrey
" hi User7 guifg=#ffffff  guibg=#880c0e ctermfg=black ctermbg=darkgrey gui=bold
" hi User8 guifg=#ffffff  guibg=#5b7fbb ctermfg=black ctermbg=darkgrey 
" hi User9 guifg=#ffffff  guibg=#810085 ctermfg=black ctermbg=darkgrey
" hi User0 guifg=#ffffff  guibg=#094afe ctermfg=black ctermbg=darkgrey

" Status line colors for a Terminal
" https://vi.stackexchange.com/a/15614
hi StatusLineTerm ctermbg=grey ctermfg=green guibg=darkred guifg=black
hi StatusLineTermNC ctermbg=grey ctermfg=black guibg=black guifg=black
]])
