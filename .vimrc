" vim: set filetype=vim : ~


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" switch syntax highlighting on
syntax on                                                                     
" ...
set copyindent
" ...
set preserveindent
" ...
set softtabstop=0
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" setting tab size into 4 spaces
set tabstop=4    
" setting indent size into 4 spaces
set shiftwidth=4    
" setting spaces instead of tabs
set expandtab
" set numbers/relative numbers
" set nu/rnu
" highlight the current line in every window
set cursorline
" show the cursor position all the time
set ruler		
" do incremental searching
set incsearch		
" switch on highlighting the last used search pattern
set hlsearch
" do not keep a backup file, use versions instead
set nobackup
" support embedded vim settings in file
set modeline
" https://github.com/webpack/webpack/issues/781#issuecomment-95523711
set backupcopy=yes

