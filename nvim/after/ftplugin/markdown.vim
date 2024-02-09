call vimtex#init()

nmap <silent><buffer><nowait> cse <plug>(vimtex-env-change)
nmap <silent><buffer><nowait> dse <plug>(vimtex-env-delete)
nmap <silent><nowait> <localleader>li> <plug>(vimtex-info)
