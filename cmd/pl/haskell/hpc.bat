@echo off
setlocal
call vars-haskell-p.bat
hpc.exe %*
endlocal
