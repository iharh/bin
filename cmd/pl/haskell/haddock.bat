@echo off
setlocal
call vars-haskell-p.bat
haddock.exe %*
endlocal
