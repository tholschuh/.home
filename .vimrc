set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/vundle.git/ 
call vundle#rc()

" My Bundles here:
"
" original repos on github
Bundle 'jimenezrick/vimerl'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
Bundle 'taglist.vim'
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" Bundle 'rails.vim'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!

set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent
set showmatch
set showcmd
set number 
set ruler
"set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
syntax enable
set background=dark
colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=1
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_termcolors=16
" let g:solarized_visibility="normal"
" let g:solarized_menu=1

" ------------------------------------------------------------------
" Vimerl Config
" ------------------------------------------------------------------
let g:erlangCompleteFile="~/.vim/bundle/vimerl/autoload/erlang_complete.erl"
let g:erlangCheckFile="~/.vim/bundle/vimerl/compiler/erlang_check.erl"
  
set nofoldenable 		" disable folding

" Erlang Tags
" let g:erlang_tags_file = $HOME . '/.home/erlang_tags'
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
