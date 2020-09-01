call rpcnotify(1, 'Gui', 'Font', 'Fira Code, Retina 10')
hi Normal guibg=#181818
set title
augroup dirchange
    autocmd!
    autocmd DirChanged * let &titlestring=v:event['cwd']
augroup END
