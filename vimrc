set nocompatible

" ===========================
" U S A B I L I T Y
" ===========================

" Install vim-plug if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Add the plugin directory
if empty(glob('~/.vim/plugged'))
  !mkdir ~/.vim/plugged
endif

" Vim-Plug plugins
call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --racer-completer' }
Plug 'wincent/command-t', {'do': 'cd ruby/command-t && ruby extconf.rb && make' }
Plug 'rakr/vim-one'
Plug 'kien/rainbow_parentheses.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rust-lang/rust.vim'
call plug#end()

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0                        " No confirmation toast at startup for C++
let g:ycm_autoclose_preview_window_after_completion = 1 " No buffer popup on completion
let g:ycm_min_num_of_chars_for_completion = 1
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoTo<CR>

" Command-T
let g:CommandTFileScanner = 'find'    " Use find command to scan
let g:CommandTTraverseSCM = 'pwd'     " Use pwd as search root
let g:CommandTMaxDepth = 5

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
set smarttab
set autoindent
set smartindent

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
