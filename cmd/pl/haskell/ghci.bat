@echo off
setlocal
call vars-haskell-p.bat
ghci.exe %*
endlocal
