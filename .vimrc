set nocompatible               " be iMproved
filetype off                   " required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc('~/.vim/bundle/')

NeoBundleFetch 'Shougo/neobundle.vim'

" ------------------------------------------------------------------
" Bundles Config
" ------------------------------------------------------------------

""" Editing
NeoBundle 'godlygeek/tabular'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'Raimondi/delimitMate'

""" VCS
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mhinz/vim-signify'

""" UI
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'myusuf3/numbers.vim'

""" Navigation  
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/EasyMotion'

""" Search
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'Shougo/neocomplcache.vim'

""" Shell
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell'

""" Erlang 
NeoBundle 'hcs42/vim-erlang-runtime'
NeoBundle 'jimenezrick/vimerl'
NeoBundle 'mbbx6spp/vim-rebar'

""" Haskell 
NeoBundle 'dag/vim2hs.git'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'eagletmt/ghcmod-vim'

" NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
NeoBundle 'taglist.vim'
" NeoBundle 'L9'
" NeoBundle 'FuzzyFinder'
" NeoBundle 'rails.vim'
" non github repos
" NeoBundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!

" Installation check.
NeoBundleCheck

" ------------------------------------------------------------------
" Config
" ------------------------------------------------------------------

set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent
set autoindent
set showmatch
set showcmd
set number 
set ruler
set textwidth=79
set colorcolumn=80

set laststatus=2   " Always show statusline

set encoding=utf-8 " Necessary to show unicode glyphs

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

autocmd FileType erlang setlocal expandtab tabstop=2 shiftwidth=2 textwidth=0
autocmd FileType haskell setlocal tabstop=8 expandtab softtabstop=2 
      \ shiftwidth=2 smarttab shiftround nojoinspaces    
autocmd FileType vimshell setlocal textwidth=0

""" some key mappings
nmap <space> :

" Open tag under cursor in new tab
map <c-\> :tab split<cr>:exec("tag ".expand("<cword>"))<CR>

" switch tabs
nmap <tab> gt
nmap <s-tab> gT

" buffer resize
map <c-h> 2<c-w><
map <c-l> 2<c-w>>
map <c-j> 2<c-w>+
map <c-k> 2<c-w>-

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
syntax enable
set background=dark

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=1
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_termcolors=256
" let g:solarized_visibility="normal"
" let g:solarized_menu=1

colorscheme solarized

highlight SpecialComment ctermfg=blue
highlight Conditional ctermfg=3
" highlight Operator ctermfg=darkmagenta


" ------------------------------------------------------------------
" EasyMotion Config
" ------------------------------------------------------------------
" change EasyMotion shading to something more readable with Solarized
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" ------------------------------------------------------------------
" Vimerl Config
" ------------------------------------------------------------------
set nofoldenable 		" disable folding
highlight SignColumn ctermbg=cyan
let erlang_show_errors = 1

" ------------------------------------------------------------------
" Erlang Tags
" ------------------------------------------------------------------
let g:erlang_tags_file = $HOME . '/dev/pugpharm/tags'
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr><c-w><c-w>
map <F8> :!$HOME/bin/pug_tags $HOME/dev/pugpharm/<CR>

set tags=tags;/

" ------------------------------------------------------------------
" numbers.vim
" ------------------------------------------------------------------
nnoremap <F2> :NumbersToggle<CR>

" ------------------------------------------------------------------
" NERDTree Config
" ------------------------------------------------------------------
map <F3> :NERDTreeToggle<cr>
" let NERDTreeShowLineNumbers=1

" ------------------------------------------------------------------
" Signify Config
" ------------------------------------------------------------------
map <F5> :SignifyToggle<cr>
let g:signify_disable_by_default = 1
let g:signify_sign_color_inherit_from_linenr = 1
"let g:signify_sign_weight = 'NONE'
highlight link SignifySignAdd    DiffAdd
highlight link SignifySignChange DiffChange
highlight link SignifySignDelete DiffDelete
highlight SignifySignAdd    cterm=bold ctermbg=14 ctermfg=5
highlight SignifySignDelete cterm=bold ctermbg=14 ctermfg=9
highlight SignifySignChange cterm=bold ctermbg=14 ctermfg=2

" ------------------------------------------------------------------
" ctrl-p 
" ------------------------------------------------------------------
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|deps$\|\.eunit$\|tmp$',
  \ 'file': '\.beam$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" ------------------------------------------------------------------
" Airline 
" ------------------------------------------------------------------
" let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

" ------------------------------------------------------------------
" vim-surround 
" ------------------------------------------------------------------
let g:surround_{char2nr('\\')} = "\\"

" ------------------------------------------------------------------
" bufferline 
" ------------------------------------------------------------------
let g:bufferline_echo = 0

" ------------------------------------------------------------------
" vimshell
" ------------------------------------------------------------------
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '


