"autocmd BufWritePost * !pdflatex <afile>
let b:autocompile=0
let b:autotex=expand('%:F')
noremap <F2> :if b:autocompile \| let b:autocompile=0 \| else \| let b:autocompile=1 \| endif<CR><CR>
"noremap <F2> $
autocmd BufWritePost * if b:autocompile | execute '!pdflatex ' . b:autotex | endif
