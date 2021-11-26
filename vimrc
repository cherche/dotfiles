filetype plugin indent on

set nocompatible
syntax on
set number
highlight clear Conceal

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'

call plug#end()

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'

setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

set encoding=utf-8
