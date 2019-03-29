Copy the files within colors to ~/.vim/colors

Some cool stuff

#Finding stuff
`set path+=**`
Will add subdirs to path (just open vim at root)
Then use the find command (also has autocomplete)

set wildmenu #enables wildcard menu
# Autocomplete
^x^n just in this file
^x^f filenames
^x s spelling (spell checking has to be enabled) 

# File Browsing
Help : help netrw-browse-maps
Within Netrw:
- mark/unmark files with mf/mF
- compress marked files: mz

# Built in make
- set makeprg command
- :make #builds it
- :cn :cp #jump through quickfix list

# Vim <-> System clipboard
"+y{motion}   
"+p 
Here + means use the plus register, which is linked to the system clipboard

