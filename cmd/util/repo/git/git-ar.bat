@echo off
setlocal
call vars-git-p.bat
git.exe archive -o a.tar HEAD
endlocal
