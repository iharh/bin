@echo off
setlocal
call vars-svn-p.bat
svn.exe %*
endlocal
