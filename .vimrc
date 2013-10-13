set nocompatible               " be iMproved
filetype off                   " required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc('~/.vim/bundle/')

NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles here:
"
" original repos on github
NeoBundle 'hcs42/vim-erlang-runtime'
NeoBundle 'jimenezrick/vimerl'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'godlygeek/tabular'
NeoBundle 'mbbx6spp/vim-rebar'
NeoBundle 'vim-scripts/EasyMotion'
NeoBundle 'vim-scripts/tComment'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/vimshell'
" haskell plugins
NeoBundle 'dag/vim2hs.git'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'eagletmt/ghcmod-vim.git'

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

set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent
set autoindent
set showmatch
set showcmd
set number 
set ruler
set tw=79
set colorcolumn=80
"set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

autocmd FileType erlang setlocal expandtab tabstop=2 shiftwidth=2 textwidth=0
autocmd FileType haskell setlocal tabstop=8 expandtab softtabstop=4 shiftwidth=4 smarttab shiftround nojoinspaces    

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

" change the default EasyMotion shading to something more readable with Solarized
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
" tComment Config
" ------------------------------------------------------------------
map <leader>c <c-_><c-_>

" ------------------------------------------------------------------
" ctrl-p Config
" ------------------------------------------------------------------
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|deps$\|\.eunit$\|tmp$',
  \ 'file': '\.beam$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" ------------------------------------------------------------------
" Config
" ------------------------------------------------------------------
nmap <space> :

" Open tag under cursor in new tab
map <c-\> :tab split<cr>:exec("tag ".expand("<cword>"))<CR>

nmap <tab> gt
nmap <s-tab> gT

" ------------------------------------------------------------------
" Tabs
" ------------------------------------------------------------------
" function MyTabLine()
"   let s = ''
"   for i in range(tabpagenr('$'))
"     " select the highlighting
"     if i + 1 == tabpagenr()
"       let s .= '%#TabLineSel#'
"     else
"       let s .= '%#TabLine#'
"     endif
" 
"     " set the tab page number (for mouse clicks)
"     let s .= '%' . (i + 1) . 'T'
" 
"     " the label is made by MyTabLabel()
"     let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
"   endfor
" 
"   " after the last tab fill with TabLineFill and reset tab page nr
"   let s .= '%#TabLineFill#%T'
" 
"   " right-align the label to close the current tab page
"   if tabpagenr('$') > 1
"     let s .= '%=%#TabLine#%999'
"   endif
" 
"   return s
" endfunction


" function MyTabLabel(n)
"   let buflist = tabpagebuflist(a:n)
"   let winnr = tabpagewinnr(a:n)
"   return bufname(buflist[winnr - 1])
" endfunction

" set tabline=%!MyTabLine()


" ------------------------------------------------------------------
" Powerline 
" ------------------------------------------------------------------

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

let Powerline_colorscheme="solarized"


" ------------------------------------------------------------------
" vim-surround 
" ------------------------------------------------------------------
let g:surround_{char2nr('\\')} = "\\"


" ------------------------------------------------------------------
" vimshell
" ------------------------------------------------------------------
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
