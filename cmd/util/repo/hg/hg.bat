@echo off
setlocal
call vars-hg-p.bat
hg.exe %*
endlocal
