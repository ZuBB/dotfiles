" vim: set filetype=vim : ~


" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" https://tlvince.com/vim-respect-xdg
" Environment
set directory=/tmp
set backupdir=/tmp
set viminfo+=n~/.vim/viminfo
set runtimepath=~/.vim,~/.vim/after,$VIM,$VIMRUNTIME
" let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"


" some stuff that is kind of global/main
source ~/.vim/subrcs/global


" when the terminal has colors
if &t_Co > 2 || has("gui_running")
    source ~/.vim/subrcs/color-dependent
endif


" Autocommands are a way to tell Vim to run certain commands
" whenever certain events happen. Let's dive right into an example.
if has("autocmd")
    source ~/.vim/subrcs/autocmd
else
  " always set autoindenting on
  set autoindent
endif


" shortcuts
source ~/.vim/subrcs/shortcuts


" GUI
source ~/.vim/subrcs/gui


" powersave
source ~/.vim/subrcs/powersave


" handling of new file extentions
source ~/.vim/subrcs/ext-filetype


" set fileformats=unix,dos


set copyindent
set preserveindent
set softtabstop=0
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" setting tab size into 4 spaces
set tabstop=4    
" setting indent size into 4 spaces
set shiftwidth=4    
" setting spaces instead of tabs
set expandtab


" wrapping of lines are disabled
set nowrap


" set numbers
set nu
" set relative numbers
set rnu
" highlight the current line in every window
set cursorline
" show the cursor position all the time
set ruler		
" display incomplete commands
set showcmd		
" keep 50 lines of command line history
set history=50		
" do incremental searching
set incsearch		


" http://vi-improved.org/vimrc.html


if &diff
	"set t_Co=256
	"set background=dark
	"colorscheme peaksea
	colorscheme ron
else
	set t_Co=256
	"colorscheme candycode
	"colorscheme evening
	colorscheme torte
	hi Pmenu        ctermfg=red
	hi PmenuSel     ctermfg=red
endif


" http://www.mail-archive.com/vim@vim.org/msg01798.html
" set clipboard=


" set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ї],фa,іs,вd,аf,пg,рh,оj,лk,дl,ж\\;,є',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,’`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ї},ФA,ІS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Є\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,'~

" http://habrahabr.ru/post/183222/
"

setlocal synmaxcol=200
