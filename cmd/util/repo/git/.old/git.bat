@echo off
setlocal
call vars-git-p.bat
git.exe %*
endlocal
