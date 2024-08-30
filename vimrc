set nocompatible

" ===========================
" U S A B I L I T Y
" ===========================

" Vim-Plug plugins
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rakr/vim-one'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'kien/rainbow_parentheses.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'hotwatermorning/auto-git-diff'
call plug#end()

" Map ctrl+G to toggle git blame.
map <C-g> :Git blame<CR>

" Map ctrl+P to run fzf find
map <C-p> :Files<CR>
map <C-a> :Files<CR>

" Map ctrl+B to show Git commit history
map <C-b> :Commits<CR>

set hlsearch
nnoremap <C-_> :nohlsearch<CR><C-_>

" GoTo code navigation.
let g:coc_disable_transparent_cursor = 1
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gg <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rr <Plug>(coc-rename)

" Use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" NerdTree
" "If you are using vim-plug, you'll also need to add these lines to avoid
"  crashes when calling vim-plug functions while the cursor is on the NERDTree
"  window:"
let g:plug_window = 'noautocmd vertical topleft new'
" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
" Map ctrl+N to the toggle.
map <C-n> :NERDTreeToggle<CR>

" Rainbow Parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Command-Completion
set path=$PWD/**                " Allow file search within $PWD e.g. `:e relative/path`
set wildmenu                    " Turn on enhanced mode for command-completion
set wildmode=longest,list,full  " Command-completion matches longest substring first

" Spacing
set shiftwidth=2
set shiftround
set colorcolumn=101
set softtabstop=2
set tabstop=4
set expandtab
set nosmarttab    " 'smarttab' with YMC causes an extra tab on newlines in Python
set autoindent
set smartindent
set backspace=indent,eol,start

" Splits
set splitbelow    " Create new splits below and to the right
set splitright    " Feels more natural this way

" ===========================
" A E S T H E T I C S
" ===========================

" Numbers and readability
set number
set ruler
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅ " Strings to use in 'list' mode.
set ls=2                            " Show path in title
syntax on

" Theme
set t_Co=256
colorscheme one
set background=dark
call one#highlight('PMenu', 'aaaaaa', '1b5263', 'none') " Autocomplete background color
call one#highlight('PMenuSel', 'aaaaaa', '', 'none')    " Autocomplete selection background color
call one#highlight('ColorColumn', '', '333333', 'none') " 101-char mark color
