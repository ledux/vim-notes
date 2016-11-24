" File: templates.vim
" Author: Lukas Tanner <lukastanner@outlook.com>
" Description: makes a new note with different templates
" Last Modified: November 19, 2016
" URL:

function! xolox#notes#templates#next(bang, title)
    let l:index_file = '~/.vim/config/vim-notes/template_index'
    let l:next_index = readfile(glob(l:index_file))[0]
    let l:template = g:notes_new_note_template
    let g:notes_new_note_template = g:notes_templates[next_index]
    let l:next_index = l:next_index + 1
    call writefile([l:next_index], glob(l:index_file))
    let l:date = strftime("%c")
    call xolox#notes#edit('!', l:date)
    let g:notes_new_note_template = l:template

endfunction
