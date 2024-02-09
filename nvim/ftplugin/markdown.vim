nnoremap <buffer> j gj
vnoremap <buffer> j gj
nnoremap <buffer> k gk
vnoremap <buffer> k gk
set spelllang=en_us spell
" let g:markdown_folding = 1

call vimtex#init()

nmap <silent><buffer><nowait> cse <plug>(vimtex-env-change)
nmap <silent><buffer><nowait> dse <plug>(vimtex-env-delete)
