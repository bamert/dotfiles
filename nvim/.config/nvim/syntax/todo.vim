" Syntax file for .todo files
if exists("b:current_syntax")
    finish
endif

" Include Markdown syntax rules
runtime! syntax/markdown.vim

let b:current_syntax = "todo"
