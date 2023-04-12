"autocmd BufWritePost * !pdflatex <afile>
"
let t:autocompile=get(t:, 'autocompile', 0)
"%:r to ensure we *don't* capture the extension
let t:self=expand('%:rF')

try
  "main.txt should contain a file name and no extension
  let t:main=readfile(glob('./main.txt'))[0]
catch
  let t:main=t:self
endtry

" borrowed/stolen from https://stackoverflow.com/a/9121083
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Black ctermfg=0 guifg=Cyan ctermbg=6
  elseif a:mode == 'r'
    hi statusline guibg=Black ctermfg=5 guifg=Purple ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=White ctermfg=15 guifg=DarkGrey ctermbg=8

hi statusline guibg=White ctermfg=15 guifg=DarkGrey ctermbg=8
set laststatus=2
set statusline=
set statusline+=%0*\ %<%F%*            "full path
set statusline+=%0*%m%*                "modified flag
set statusline+=%1*%=%*                "spacer
set statusline+=%1*%{t:autocompile}\ %* "autocompile indicator
set statusline+=%1*(%{t:main}.tex)%*   "main tex file (doc to be autocompiled)
set statusline+=%1*%5l%*               "current line
set statusline+=%2*/%L%*               "total lines
set statusline+=%1*%4v\ %*             "virtual column number
"set statusline+=%2*0x%04B\ %*          "character under cursor


function Open_main_pdf()
  execute '!open ' . t:main . '.pdf'
endfunction

noremap <F2> :if t:autocompile \| let t:autocompile=0 \| else \| let t:autocompile=1 \| endif<CR>
noremap <F3> :call Open_main_pdf()<CR><CR>
"noremap <F2> $

augroup compile
  au!
  autocmd BufWritePost * if t:autocompile | execute '!pdflatex ' . t:main . '.tex' | endif
augroup END
