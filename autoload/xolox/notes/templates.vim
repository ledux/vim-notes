" File: templates.vim
" Author: Lukas Tanner <lukastanner@outlook.com>
" Description: makes a new note with different templates
" Last Modified: November 19, 2016
" URL:

function! xolox#notes#templates#next(bang, title)
    if !exists("g:notes_templates")
        echoerr 'g:notes_templates is not set'
        return
    elseif type(g:notes_templates) != type([])
        echoerr 'g:notes_templates has to be a list'
        return
    elseif len(g:notes_templates) == 0
        echoerr 'g:notes_templates has no entries'
        return
    endif

    let l:index_file = '~/.vim/config/vim-notes/template_index'
    let l:next_index = readfile(glob(l:index_file))[0]

    if exists("g:notes_debug") && g:notes_debug
        echomsg 'next index: '.l:next_index
        echomsg 'len templates: '.len(g:notes_templates)
    endif

    if len(g:notes_templates) - 1 < l:next_index
        let l:next_index = 0
    endif

    let l:template = g:notes_new_note_template
    "let g:notes_new_note_template = get(g:notes_templates, l:next_index)
    let g:notes_new_note_template = g:notes_templates[l:next_index]
    let l:next_index += 1

    if exists("g:notes_debug") && g:notes_debug
        echomsg 'old template: '.l:template
        echomsg 'new template: '.g:notes_new_note_template
        echomsg 'new next index: '.l:next_index
    endif

    call writefile([l:next_index], glob(l:index_file))
    let l:date = strftime("%c")
    call xolox#notes#edit('!', l:date)
    let g:notes_new_note_template = l:template
endfunction
