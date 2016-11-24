" File: templates.vim
" Author: Lukas Tanner <lukastanner@outlook.com>
" Description: makes a new note with different templates
" Last Modified: November 19, 2016
" URL:

function! xolox#notes#templates#next(bang, title)
    let l:templates = ["~/.vim/config/vim-notes/jft1", "~/.vim/config/vim-notes/jft2","~/.vim/config/vim-notes/jft3","~/.vim/config/vim-notes/jft4",]
    let l:next_index = readfile(glob('~/.vim/config/vim-notes/template_index'))[0]
    let l:template = g:notes_new_note_template
    let g:notes_new_note_template = l:templates[next_index]
    let l:date = strftime("%c")
    execute 'Note ' l:date
    call xolox#notes#edit('!', l:date)
    let g:notes_new_note_template = l:template
endfunction
