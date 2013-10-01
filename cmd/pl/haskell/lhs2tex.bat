@echo off
setlocal
call vars-miktex-p.bat
call vars-haskell-p.bat
lhs2tex.exe %*
endlocal
