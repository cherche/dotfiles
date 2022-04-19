"autocmd BufWritePost * !pdflatex <afile>
let t:currenttex=expand('%:F')
autocmd BufWritePost * execute '!pdflatex ' . t:currenttex
