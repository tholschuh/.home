" .vimrc
"
" ------------------------------------------------------------------

" ------------------------------------------------------------------
" Plug initialization
call plug#begin('~/.local/share/nvim/site/autoload/')

""" Editing
Plug 'tpope/vim-surround'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-eunuch' "Vim sugar for the UNIX shell commands that need it the most.

""" VCS
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-git'

""" UI
Plug 'itchyny/lightline.vim'
Plug 'myusuf3/numbers.vim'
Plug 'roman/golden-ratio'
Plug 'moll/vim-bbye'

""" Navigation
Plug 'takac/vim-hardtime'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'justinmk/vim-sneak'

""" Search
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" Erlang
Plug 'tpope/vim-dispatch'     "  required by other vim-erlang plugins
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'

""" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

""" Terraform
Plug 'hashivim/vim-terraform'

""" GrpahViz
Plug 'liuchengxu/graphviz.vim'

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

set completeopt+=menuone,noinsert,noselect

" save when leaving insert mode
" http://blog.unixphilosopher.com/2015/02/a-more-betterer-autosave-in-vim.html
autocmd InsertLeave,TextChanged * if expand('%') != '' | update | endif

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

map <Leader>h <c-w>h
map <Leader>j <c-w>j
map <Leader>k <c-w>k
map <Leader>l <c-w>l

map q: :echo "you are not quitting, lol"<cr>

" ------------------------------------------------------------------
" NeoVim
" ------------------------------------------------------------------
" set inccommand=split

" ------------------------------------------------------------------
" color config
" ------------------------------------------------------------------
syntax enable

" UI
highlight VertSplit ctermbg=grey ctermfg=grey
highlight ColorColumn ctermbg=236
highlight IncSearch ctermbg=yellow ctermfg=black
highlight Search ctermbg=lightgreen ctermfg=black

" standard syntax
highlight Comment ctermfg=grey
highlight String ctermfg=lightblue
highlight Constant ctermfg=blue
highlight Statement ctermfg=yellow
" highlight Function ctermfg=white
" highlight Character
" highlight Identifier
" highlight Operator
" highlight PreProc
" highlight Include
" highlight Define
" highlight Macro
" highlight Type
" highlight Structure
" highlight Special
" highlight Underlined
" highlight Error
" highlight Todo
" highlight SpecialComment ctermfg=blue
" highlight Conditional ctermfg=3
" highlight SignColumn ctermbg=cyan

" line numbers
highlight CursorLineNr ctermbg=none ctermfg=lightgrey
highlight LineNr ctermbg=none ctermfg=darkgrey


" ------------------------------------------------------------------
" golden-ratio
" ------------------------------------------------------------------
let g:golden_ratio_exclude_nonmodifiable=1
let g:golden_ratio_wrap_ignored = 1
let g:golden_ratio_autocommand = 0

" ------------------------------------------------------------------
" filebeagle config
" ------------------------------------------------------------------
let filebeagle_show_hidden=1

" ------------------------------------------------------------------
" hardtime config
" ------------------------------------------------------------------
let g:hardtime_default_on = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2

" ------------------------------------------------------------------
" Erlang
" ------------------------------------------------------------------
autocmd FileType erlang setlocal expandtab tabstop=4 shiftwidth=4 textwidth=0

" ------------------------------------------------------------------
" Go
" ------------------------------------------------------------------
autocmd FileType go setlocal expandtab tabstop=4 shiftwidth=4 textwidth=0

" Change go defaults; save will do :GoImports
let g:go_auto_type_info = 1
let g:go_code_completion_enabled = 1
let g:go_def_mode='gopls'
let g:go_fmt_command = 'goimports'
let g:go_info_mode='gopls'
let g:go_jump_to_error = 0
let g:go_list_height = 3
let g:go_list_type = 'quickfix'
let g:go_metalinter_autosave = 1
let g:go_metalinter_command='golangci-lint'

" ------------------------------------------------------------------
" numbers.vim
" ------------------------------------------------------------------
nnoremap <F2> :NumbersToggle<CR>

" ------------------------------------------------------------------
" whitespace
" ------------------------------------------------------------------
map <F3> :StripWhitespace<CR>

" ------------------------------------------------------------------
" gitgutter
" ------------------------------------------------------------------
map <F4> :GitGutterToggle<cr>

" ------------------------------------------------------------------
" lightline
" ------------------------------------------------------------------
let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head'
            \ },
            \ }

" ------------------------------------------------------------------
" vim-surround
" ------------------------------------------------------------------
let g:surround_{char2nr('\\')} = "\\"


" ------------------------------------------------------------------
" terraform
" ------------------------------------------------------------------
let g:terraform_align=1
autocmd FileType terraform setlocal commentstring=#%s
autocmd FileType terraform set shiftwidth=2 softtabstop=2

" ------------------------------------------------------------------
" coc
" ------------------------------------------------------------------

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ------------------------------------------------------------------
" graphviz
" ------------------------------------------------------------------
let g:graphviz_viewer = 'open'
let g:graphviz_output_format = 'png'
