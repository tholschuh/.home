" .vimrc
"
" ------------------------------------------------------------------

" ------------------------------------------------------------------
" Plug initialization
call plug#begin('~/.vim/plugged')

""" Editing
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-jdaddy'
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/DeleteTrailingWhitespace'

""" VCS
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-git'

""" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/powerline-fonts'
Plug 'myusuf3/numbers.vim'
Plug 'roman/golden-ratio'
Plug 'moll/vim-bbye'
" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'trapd00r/neverland-vim-theme'
Plug 'Pychimp/vim-luna'
Plug 'ciaranm/inkpot'
Plug 'w0ng/vim-hybrid'

""" Navigation
Plug 'takac/vim-hardtime'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'Lokaltog/vim-easymotion'

""" Search
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

""" Erlang
Plug 'tpope/vim-dispatch'     "  required by other vim-erlang plugins
Plug 'vim-erlang/erlang-motions.vim'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-dialyzer'
Plug 'vim-erlang/vim-erlang-skeletons'
Plug 'vim-erlang/vim-erlang-tags'

""" Go
Plug 'fatih/vim-go'

""" Haskell
Plug 'dag/vim2hs'
Plug 'ujihisa/neco-ghc'
Plug 'eagletmt/ghcmod-vim'

" Pony
Plug 'dleonard0/pony-vim-syntax'

" Rust
Plug 'rust-lang/rust.vim'

""" Elixir
Plug 'elixir-lang/vim-elixir'

""" Markdown
Plug 'plasticboy/vim-markdown'

call plug#end()

filetype plugin indent on

" ------------------------------------------------------------------

" ------------------------------------------------------------------
" Config
" ------------------------------------------------------------------

set expandtab     " expand tabs to spaces
set shiftwidth=4
set softtabstop=4
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

set completeopt-=preview " disable the stupid preview window

" save when leaving insert mode
" http://blog.unixphilosopher.com/2015/02/a-more-betterer-autosave-in-vim.html
autocmd InsertLeave,TextChanged * if expand('%') != '' | update | endif

autocmd FileType erlang setlocal expandtab tabstop=4 shiftwidth=4 textwidth=0
autocmd FileType haskell setlocal tabstop=8 expandtab softtabstop=2
      \ shiftwidth=2 smarttab shiftround nojoinspaces
autocmd FileType vimshell setlocal textwidth=0
autocmd FileType yaml set shiftwidth=2 softtabstop=2
autocmd FileType pony set shiftwidth=2 softtabstop=2
autocmd FileType ruby set shiftwidth=2 softtabstop=2

""" map leader to space
let mapleader = "\<Space>"

" ------------------------------------------------------------------
" key mappings
" ------------------------------------------------------------------
" delete buffer on space-q (bbye)
nnoremap <Leader>q :Bdelete<CR>
" vertical split on space-v
nnoremap <Leader>v :vsplit<CR>
" edit file on space-e
nnoremap <Leader>e :e<SPACE>
" switch buffers
nmap <Leader>l :bnext<CR>
nmap <Leader>k :bprevious<CR>

" indent whole buffer
nnoremap g= gg=Gg``

" ctrl-p like remap to fzf
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>

" region expanding
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" open tag under cursor in new tab
map <c-\> :tab split<cr>:exec("tag ".expand("<cword>"))<CR>

" resizing windows
map <c-h> 2<c-w><
map <c-l> 2<c-w>>
map <c-j> 2<c-w>+
map <c-k> 2<c-w>-

" ------------------------------------------------------------------
" colorscheme config
" ------------------------------------------------------------------
syntax enable
set background=dark
" set background=light

colorscheme solarized
"colorscheme inkpot
"colorscheme neverland-darker
"colorscheme luna
" colorscheme hybrid

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=1
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
let g:solarized_termcolors=256
" let g:solarized_visibility="normal"
" let g:solarized_menu=1

highlight SpecialComment ctermfg=blue
highlight Conditional ctermfg=3
highlight SignColumn ctermbg=cyan

" ------------------------------------------------------------------
" filebeagle config
" ------------------------------------------------------------------
let filebeagle_show_hidden=1

" ------------------------------------------------------------------
" unite config
" ------------------------------------------------------------------
nnoremap <space>s :Unite -quick-match buffer<cr>

if executable('ack')
    let g:unite_source_grep_command = 'ack'
endif
if executable('ack-grep')
    let g:unite_source_grep_command = 'ack'
endif
if executable('ack') || executable('ack-grep')
    let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <space>/ :Unite grep:.<cr>

" ------------------------------------------------------------------
" EasyMotion Config
" ------------------------------------------------------------------
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s)
" change EasyMotion shading to something more readable with Solarized
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" ------------------------------------------------------------------
" hardtime config
" ------------------------------------------------------------------
let g:hardtime_default_on = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:hardtime_allow_different_key = 1

" ------------------------------------------------------------------
" Erlang
" ------------------------------------------------------------------

" vim-erlang-tags
set runtimepath^='$HOME/.vim/bundle/vim-erlang-tags'
nnoremap <space>] <c-]>
" set tags^='$HOME/.vim/bundle/vim-erlang-tags'

" vim-erlang-skeletons
let g:erl_author="Tilman Holschuh <tilman@heroku.com>"
let g:erl_company="Heroku, Inc."
let g:erl_replace_buffer=1
let g:hardtime_maxcount = 2

" ------------------------------------------------------------------
" Go
" ------------------------------------------------------------------
let g:go_metalinter_autosave = 1

" ------------------------------------------------------------------
" numbers.vim
" ------------------------------------------------------------------
nnoremap <F2> :NumbersToggle<CR>

" ------------------------------------------------------------------
" gitgutter
" ------------------------------------------------------------------
map <F4> :GitGutterToggle<cr>
highlight clear SignColumn

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
" whitespace
" ------------------------------------------------------------------
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'ask'

" ------------------------------------------------------------------
" markdown
" ------------------------------------------------------------------
let g:vim_markdown_folding_disabled=1
