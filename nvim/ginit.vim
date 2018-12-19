Guifont Fira Code:h9
hi Normal guibg=black
set title
augroup dirchange
    autocmd!
    autocmd DirChanged * let &titlestring=v:event['cwd']
augroup END
