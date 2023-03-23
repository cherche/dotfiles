"autocmd BufWritePost * !pdflatex <afile>
let t:autocompile=0

let t:self=expand('%:rF')

try
  "main.txt should contain a file name and no extension
  let t:main=readfile(glob('./main.txt'))[0]
catch
  "%:r to ensure we *don't* capture the extension
  let t:main=t:self
endtry

set laststatus=2
set statusline=
set statusline+=%4*\ %<%F%*            "full path
set statusline+=%2*%m%*                "modified flag
set statusline+=\ &\ 
set statusline+=%{t:main}.tex
set statusline+=%1*%=%5l%*             "current line
set statusline+=%2*/%L%*               "total lines
set statusline+=%1*%4v\ %*             "virtual column number
set statusline+=%2*0x%04B\ %*          "character under cursor


function Open_main_pdf()
  execute '!open ' . t:main . '.pdf'
endfunction

noremap <F2> :if t:autocompile \| let t:autocompile=0 \| else \| let t:autocompile=1 \| endif<CR><CR>
noremap <F3> :call Open_main_pdf()<CR><CR>
"noremap <F2> $
autocmd BufWritePost * if t:autocompile | execute '!pdflatex ' . t:main . '.tex' | endif
