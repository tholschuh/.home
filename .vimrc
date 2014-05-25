" .vimrc
"
" ------------------------------------------------------------------

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
NeoBundle 'tpope/vim-surround'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-repeat'
"NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-jdaddy'
NeoBundle 'terryma/vim-expand-region'
" NeoBundle 'tpope/sleuth'

""" VCS
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mhinz/vim-signify'

""" UI
NeoBundle 'bling/vim-airline'
NeoBundle 'Lokaltog/powerline-fonts'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'roman/golden-ratio'
" colorschemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'trapd00r/neverland-vim-theme'
NeoBundle 'Pychimp/vim-luna'
NeoBundle 'ciaranm/inkpot'

""" Navigation
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/vim-easymotion'

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
NeoBundle 'tpope/vim-dispatch.git'     "  required by other vim-erlang plugins
NeoBundle 'vim-erlang/erlang-motions.vim.git'
NeoBundle 'vim-erlang/vim-erlang-runtime.git'
NeoBundle 'vim-erlang/vim-erlang-compiler.git'
NeoBundle 'vim-erlang/vim-dialyzer.git'
NeoBundle 'fishcakez/rebar_vim_plugin.git'
NeoBundle 'vim-erlang/vim-rebar.git'
NeoBundle 'vim-erlang/vim-erlang-skeletons.git'
NeoBundle 'vim-erlang/vim-erlang-omnicomplete.git'
NeoBundle 'vim-erlang/vim-erlang-tags.git'

" NeoBundle 'hcs42/vim-erlang-runtime'
" NeoBundle 'jimenezrick/vimerl'
" NeoBundle 'mbbx6spp/vim-rebar'

""" Haskell
NeoBundle 'dag/vim2hs.git'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'eagletmt/ghcmod-vim'

" Scala
NeoBundle 'derekwyatt/vim-scala'

""" Elixir
NeoBundle 'elixir-lang/vim-elixir'

""" Markdown
NeoBundle 'plasticboy/vim-markdown'

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

set expandtab     " expand tabs to spaces
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
set splitbelow     " horizontal split new window below current window
set splitright     " vertical split new window right of current window
set nofoldenable   " disable folding
set laststatus=2   " always show statusline
set encoding=utf-8 " necessary to show unicode glyphs
set t_Co=256       " Explicitly tell vim that the terminal supports 256 colors


autocmd FileType erlang setlocal expandtab tabstop=2 shiftwidth=2 textwidth=0
autocmd FileType haskell setlocal tabstop=8 expandtab softtabstop=2
      \ shiftwidth=2 smarttab shiftround nojoinspaces
autocmd FileType vimshell setlocal textwidth=0


""" map leader to space bar
let mapleader = "\<Space>"

""" some key mappings
" save on space-w
nnoremap <Leader>w :w<CR>
" delete buffer on space-q
nnoremap <Leader>q :bd<CR>
" vertical split on space-v
nnoremap <Leader>v :vsplit<CR>
" edit file on space-e
nnoremap <Leader>e :e<SPACE>

" region expanding
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" open tag under cursor in new tab
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
" colorscheme config
" ------------------------------------------------------------------
syntax enable
set background=dark

colorscheme solarized
"colorscheme inkpot
"colorscheme neverland-darker
"colorscheme luna

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


highlight SpecialComment ctermfg=blue
highlight Conditional ctermfg=3
" highlight Operator ctermfg=darkmagenta
highlight SignColumn ctermbg=cyan


" ------------------------------------------------------------------
" NERDTree config
" ------------------------------------------------------------------
let NERDTreeShowHidden=1

" ------------------------------------------------------------------
" EasyMotion Config
" ------------------------------------------------------------------
" change EasyMotion shading to something more readable with Solarized
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" ------------------------------------------------------------------
" Erlang
" ------------------------------------------------------------------

" vim-erlang-tags
set runtimepath^='$HOME/.vim/bundle/vim-erlang-tags'
" set tags^='$HOME/.vim/bundle/vim-erlang-tags'

" vim-erlang-skeletons
let g:erl_author="Tilman Holschuh <tholschuh@pugpharm.com>"
let g:erl_company="Pug Pharm Productions, Inc."
let g:erl_replace_buffer=1

" ------------------------------------------------------------------
" numbers.vim
" ------------------------------------------------------------------
nnoremap <F2> :NumbersToggle<CR>

" ------------------------------------------------------------------
" NERDTree Config
" ------------------------------------------------------------------
map <F3> :NERDTreeToggle<cr>
let NERDTreeShowLineNumbers=1

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
" airline
" ------------------------------------------------------------------
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

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

" ------------------------------------------------------------------
" whitespace
" ------------------------------------------------------------------
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

highlight MixedWhitespace ctermbg=red guibg=red
match MixedWhitespace /^\t\+/

function! TrimTrailingWhiteSpace()
  %s/\s\+$//e
endfunction

" automatically trim trailing whitespace for certain file types
autocmd FileType erlang,haskell,python,ruby,java,scala,vim,cpp,c,md
  \ autocmd BufWritePre <buffer> :call TrimTrailingWhiteSpace()
" ------------------------------------------------------------------

" ------------------------------------------------------------------
" scala
" ------------------------------------------------------------------

function! s:start_sbt()
  if !has_key(t:, 'sbt_cmds')
    "let t:sbt_cmds = [input('t:sbt_cmds[0] = ')]
    let t:sbt_cmds = ['compile']
    echo "let t:sbt_cmd = 'compile'"
  endif
  execute 'VimShellInteractive sbt'
  stopinsert
  let t:sbt_bufname = bufname('%')
  wincmd H
  wincmd p
endfunction

command! -nargs=0 StartSBT call <SID>start_sbt()"])]"

" ------------------------------------------------------------------
" markdown
" ------------------------------------------------------------------
let g:vim_markdown_folding_disabled=1
