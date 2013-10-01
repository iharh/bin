@echo off
setlocal

call vars-git.bat

%GIT_ROOT%\git-cmd.bat %*
endlocal
