@echo off
setlocal
call vars-haskell-p.bat
hscolour.exe %*
endlocal
