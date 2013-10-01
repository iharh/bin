@echo off
setlocal
call vars-miktex-p.bat
pdflatex.exe %*
endlocal
