@echo off
setlocal
call vars-haskell-p.bat
hoogle.exe %*
endlocal
