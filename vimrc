filetype plugin indent on

set nocompatible

"""""
" Input
"""""

set encoding=utf-8
"setlocal spell
"set spelllang=en_us
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

set expandtab
set tabstop=8
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set backspace=indent,eol,start


"""""
" Appearance
"""""

syntax on
"colorscheme monokai
colorscheme onedark
" Make whitespace invisibles less annoying
hi SpecialKey cterm=NONE ctermfg=239 ctermbg=none
set number
set ruler
set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
highlight clear Conceal


"""""
" Plugins
"""""

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

call plug#end()

