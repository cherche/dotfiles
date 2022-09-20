"autocmd BufWritePost * !pdflatex <afile>
let b:autocompile=0
let b:autocompile_target=expand('%:F')
noremap <F2> :if b:autocompile \| let b:autocompile=0 \| else \| let b:autocompile=1 \| endif<CR><CR>
"noremap <F2> $
autocmd BufWritePost * if b:autocompile | execute '!pdflatex ' . b:autocompile_target | endif
